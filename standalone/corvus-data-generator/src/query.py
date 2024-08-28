from pprint import pprint

from models.data_config import DataConfig
from models.victoriametrics_query import VictoriaMetricsQuery
from utils.schemas import EntityType, MetricType, EntityFilter, MetricFilter, SortOrder

data_config = DataConfig()

full_context = "nf,snssai"

metric_types = [
    MetricType(id="vi_AMFMeanRegNbr"),
    MetricType(id="vd_PDUSessEstSR"),
    MetricType(id="vd_PDUSessModSR"),
    MetricType(id="vi_AMFMaxRegNbr"),
]

filters = [
    MetricFilter(
        type="metric", metricType=MetricType(id="vi_AMFMeanRegNbr"), from_=100, to_=200
    ),
]

sort_by = metric_types[0]

sort_order = SortOrder.ASC

victoriaMetricsQuery = VictoriaMetricsQuery(
    full_context=full_context,
    metric_types=metric_types,
    filters=filters,
    sort_by=sort_by,
    sort_order=sort_order,
)

q = victoriaMetricsQuery.build()
print(q)

res = victoriaMetricsQuery.execute(q)
pprint(res)
