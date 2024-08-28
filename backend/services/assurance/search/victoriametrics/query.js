import { getEntityFilters, getMetricTimeSeriesExpressions, getSortFunction } from './utils.js';

const DEFAULT_OFFSET = 0;
const DEFAULT_LENGTH = 20;

/**
 * Function to create a VM search query based on the input from the REST API request.
 * @param contextTypeId
 * @param metricTypes
 * @param filters
 * @param sortBy
 * @param sortOrder
 * @param offset
 * @param length
 * @returns String
 * `with(
  context_filter = {${string},${*|string}},
  ${*},
  count(l, k) = count_values without() (l, k),
  ${*},
  aggregated = ${*},
  limited = limit_offset(20, 0, aggregated)
)(
  ${string}(limited, "${*}")
)`
 */
const buildSearchMetricsQuery = ({
  contextTypeId,
  metricTypes,
  filters = [],
  sortBy = {},
  sortOrder,
  offset = DEFAULT_OFFSET,
  length = DEFAULT_LENGTH,
}) => {
  const sortingBy = sortBy.id || metricTypes[0].id;

  const contextFilterExpression = `context=~"${contextTypeId}"`;

  const entityFilters = filters.filter((f) => f.type === 'entity');
  const metricFilters = filters.filter((f) => f.type === 'metric');
  const entityFiltersExpression = getEntityFilters(entityFilters);

  const mustApplyMetricFilter = (metricId) =>
    metricFilters.find((metricFilter) => metricFilter.metricType.id === metricId);

  const metricTimeSeriesExpressions = getMetricTimeSeriesExpressions(
    metricTypes,
    mustApplyMetricFilter,
  );

  const metricCountExpressions = metricTypes
    .map((metricType, index) => `c${index + 1} = count('${metricType.id}',k${index + 1})`)
    .join(',\n  ');

  const metricAggregationExpression = metricTypes
    .map((metricType, index) =>
      index === 0 ? 'c1' : ` * on(${contextTypeId}) group_left(${metricType.id}) c${index + 1}`,
    )
    .join('');

  const sortFunction = getSortFunction(metricTypes, sortingBy, sortOrder);

  return `with(
  context_filter = {${contextFilterExpression},${
    entityFilters.length > 0 ? entityFiltersExpression : ''
  }},
  ${metricTimeSeriesExpressions},
  count(l, k) = count_values without() (l, k),
  ${metricCountExpressions},
  aggregated = ${metricAggregationExpression},
  limited = limit_offset(${length ?? DEFAULT_LENGTH}, ${offset ?? DEFAULT_OFFSET}, aggregated)
)(
  ${sortFunction()}(limited, '${sortingBy}')
)`;
};

export { DEFAULT_OFFSET, DEFAULT_LENGTH, buildSearchMetricsQuery };
