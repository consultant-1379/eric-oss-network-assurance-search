from typing import List, Union
import requests

from utils.schemas import EntityType, MetricType, EntityFilter, MetricFilter, SortOrder
from utils.constants.victoriametrics import (
    VM_QUERY_URL,
)


class VictoriaMetricsQuery:
    def __init__(
        self,
        full_context: str,
        metric_types: List[MetricType],
        filters: List[Union[EntityFilter, MetricFilter]],
        sort_by: Union[EntityType, MetricType],
        sort_order: SortOrder,
        offset: int = 0,
        length: int = 20,
    ) -> None:
        self.full_context = full_context
        self.metric_types = metric_types
        self.filters = filters
        self.sorting_by = sort_by.id if sort_by.id != None else metric_types[0].id
        self.sort_order = sort_order
        self.offset = offset
        self.length = length

    def build_full_context_filter_expression(self):
        return 'context=~"%s"' % (self.full_context)

    def build_entity_filters_expression(self):
        entity_filters = list(filter(lambda f: f.type == "entity", self.filters))
        return ",".join(
            '%s=~"%s"' % (entity_filter.entityType.id, entity_filter.searchPattern)
            for entity_filter in entity_filters
        )

    def must_apply_metric_filter(self, metric_id):
        metric_filters = list(filter(lambda f: f.type == "metric", self.filters))
        return next(
            (
                metric_filter
                for metric_filter in metric_filters
                if metric_filter.metricType.id == metric_id
            ),
            None,
        )

    def build_metric_timeseries_expressions(self):
        metric_timeseries_expressions = []
        for i in range(len(self.metric_types)):
            metric_type = self.metric_types[i]
            timeseries_variable_name = "k%s" % (i + 1)

            metric_filter = self.must_apply_metric_filter(metric_type.id)
            metric_timeseries_expressions.append(
                "%s%s = last_over_time(%s{context_filter}[15m])"
                % (
                    timeseries_variable_name,
                    "_0" if metric_filter else "",
                    metric_type.id,
                )
            )

            if metric_filter:
                metric_filter_expression = " AND ".join(
                    list(
                        filter(
                            lambda expression: expression != None,
                            [
                                (
                                    "%s_0 >= %0.1f"
                                    % (timeseries_variable_name, metric_filter.from_)
                                    if metric_filter.from_
                                    else None
                                ),
                                (
                                    "%s_0 <= %0.1f"
                                    % (timeseries_variable_name, metric_filter.to_)
                                    if metric_filter.to_
                                    else None
                                ),
                            ],
                        )
                    )
                )
                metric_timeseries_expressions.append(
                    "%s = %s" % (timeseries_variable_name, metric_filter_expression)
                )

        return ",\n    ".join(metric_timeseries_expressions)

    def build_metric_count_expressions(self):
        return ",\n    ".join(
            [
                'c%s = count("%s", k%s)' % (i + 1, self.metric_types[i].id, i + 1)
                for i in range(len(self.metric_types))
            ]
        )

    def build_metric_aggregation_expression(self):
        return "".join(
            [
                (
                    "c1"
                    if i == 0
                    else " * on(%s) group_left(%s) c%s"
                    % (self.full_context, self.metric_types[i].id, i + 1)
                )
                for i in range(len(self.metric_types))
            ]
        )

    def determine_sorting_function(self):
        return (
            "sort_by_label_numeric_desc"
            if self.sort_order == SortOrder.DESC
            else "sort_by_label_numeric"
        )

    def build(self):
        return """with(
    context_filter = {context="%s",%s},
    %s,
    count(l, k) = count_values without() (l, k),
    %s,
    aggregated = %s,
    limited = limit_offset(%d, %d, aggregated)
)(
    %s(limited, "%s")
)
        """ % (
            self.full_context,
            self.build_entity_filters_expression() if len(self.filters) > 0 else "",
            self.build_metric_timeseries_expressions(),
            self.build_metric_count_expressions(),
            self.build_metric_aggregation_expression(),
            self.length,
            self.offset,
            self.determine_sorting_function(),
            self.sorting_by,
        )

    def execute(self, query: str):
        try:
            res = requests.post(VM_QUERY_URL, params={"query": query})
            return res.json()
        except Exception as e:
            print("Unable to reach vmselect:", e)
