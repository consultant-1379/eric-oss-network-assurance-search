import { fetchResponse } from '../../../../utils/NetworkUtil.js';
import EXTERNAL_API_ROUTES from '../../../../config/external-api-config.js';
import CONSTANTS from '../../../../config/constants.js';
import { DEFAULT_OFFSET, DEFAULT_LENGTH, buildSearchMetricsQuery } from './query.js';
import { extractTimestampProperties, createVmUrlFromPath } from './utils.js';

const fallbackString = 'unknown';

/**
 * Function to create context
 * @param metricData
 * @returns {{contextFields: *[], type: {contextFields: *[], id: (*|string)}}}
 */
function createContext(metricData = {}) {
  const fullContext = metricData?.metric?.context;
  const aggregatedContext = {
    type: {
      id: fullContext ?? fallbackString,
      contextFields: [],
    },
    contextFields: [],
  };

  if (fullContext) {
    // Splitting the full context up into its individual contexts
    const contexts = fullContext.split(',');

    // Filling the contextFields array with Entity objects
    contexts.forEach((contextType) => {
      /**
       * If the metric data does not contain a context property, it will
       * be assigned the fallback string
       */
      const name = metricData?.metric
        ? metricData.metric[contextType] ?? fallbackString
        : fallbackString;

      aggregatedContext.contextFields.push({
        id: `${contextType}_${name}`,
        name,
        type: { id: contextType },
      });
    });

    // Filling the type.contextFields array with EntityType objects
    contexts.forEach((contextType) => {
      aggregatedContext.type.contextFields.push({ id: contextType });
    });
  }

  return aggregatedContext;
}

/**
 * Function to create Metrics
 * @param metricData
 * @param metricTypes
 * @returns {{metadata: [], beginTimestamp: *, type: *, value: *, endTimestamp: *}[]}
 */

function createMetrics(metricData, metricTypes = []) {
  const { beginTimestamp, endTimestamp } = extractTimestampProperties(metricData);
  return metricTypes.map((metricType) => ({
    type: metricType,
    value: metricData?.metric[metricType.id],
    beginTimestamp,
    endTimestamp,
    metadata: [],
  }));
}

/**
 * Function to transform Victoria metrics search response in to API response.
 * @param victoriaMetricsResponse
 * @param metricTypes
 * @param offset
 * @param length
 * @param total
 * @returns {{total: number, offset: number, length: number, results: *[]}}
 */
const transformSearchMetricsData = (
  victoriaMetricsResponse,
  { metricTypes, offset = DEFAULT_OFFSET, length = DEFAULT_LENGTH },
  total = 0,
) => {
  if (total < length) {
    length = total - offset;
  }

  const results =
    victoriaMetricsResponse.data?.result.map((metricData) => ({
      context: createContext(metricData),
      metrics: createMetrics(metricData, metricTypes),
    })) || [];

  return {
    offset,
    length,
    total,
    results,
  };
};

/**
 * @const getSearchMetrics
 * @description Formulates a response given a proper request query
 * @param query
 * @returns {*}
 */
const getVmSearchMetrics = async ({ query }) => {
  const vmQuery = buildSearchMetricsQuery(query);
  const res = await fetchResponse(
    createVmUrlFromPath(
      `${EXTERNAL_API_ROUTES.VICTORIA_METRICS_QUERY}?query=${encodeURIComponent(vmQuery)}`,
    ),
    CONSTANTS.TLS_TYPE_HTTP_CLIENT,
  );
  const total = res.data?.result?.length;
  return transformSearchMetricsData(res, query, total);
};

export { createContext, createMetrics, transformSearchMetricsData, getVmSearchMetrics };
