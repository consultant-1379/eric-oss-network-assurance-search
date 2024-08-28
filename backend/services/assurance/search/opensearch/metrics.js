import {
  getSearchDoc,
  cleanDoc,
  makeContextKey,
  createContextKeys,
  valuesMatchForKeys,
} from './utils.js';
import client from '../../../../utils/openSearchConnectionUtil.js';
import { validateOpenSearchResponseBody } from '../../../../utils/openSearchValidationUtil.js';
import { getLogger } from '../../../logging.js';
import { buildSearchMetricsQ1Query, buildSearchMetricsQ2Query } from './query.js';

const logger = getLogger('search-metrics');

/**
 * @description Creates context value inside results for transformStitchedSearchMetricsData()
 * @param {object} row
 * @returns {object}
 * @example { name: 'NF_SNSSAI', aggregation: [{ type: 'SNSSAI' }, { type: 'NF' }]}
 */
function createContext(row = {}) {
  const aggregatedContext = {
    type: {
      id: row?.full_context || 'Unknown',
      contextFields: [],
    },
    contextFields: [],
  };

  // Filling the contextFields array with Entity objects
  row.context?.forEach((contextType) => {
    const cKey = makeContextKey(contextType) || '';
    const name = row[cKey] || 'Unknown';
    aggregatedContext.contextFields.push({
      id: `${contextType}_${name}`,
      name,
      type: { id: cKey },
    });
  });

  // Filling the type.contextFields array with EntityType objects
  row.context?.forEach((contextType) => {
    aggregatedContext.type.contextFields.push({ id: contextType });
  });

  return aggregatedContext;
}

/**
 * @description This function extracts the beginning and end timestamp of the metric
 * collection period from the row object. There are multiple possibilites for the
 * timestamp keys within the row object, therefore extra logic is required to extract them.
 * @param {object} row
 * @returns {object} An object which contains the beginning and end timestamp of the metric
 * which has been extracted from the row object.
 * @example { beginTimestamp: 1676241825, endTimestamp: 1676242825 }
 */
function extractTimestampProperties(row) {
  // Helper function which returns either the first or second timestamp provided,
  // depending on which one is not undefined. Preference is given to the first timestamp.
  const toIntTimestamp = (firstTimestamp, secondTimestamp) => {
    const timestampString = firstTimestamp || secondTimestamp;
    let timestamp = timestampString ? parseInt(timestampString, 10) : null;
    if (Number.isNaN(timestamp)) {
      logger.warning(
        `Unable to parse this OpenSearch timestamp field into a number: ${timestampString}`,
      );
      timestamp = null;
    }
    return timestamp;
  };

  const beginTimestampString = row.ft_begin_timestamp ?? row.fk_begin_timestamp;
  const endTimestampString = row.ft_end_timestamp ?? row.fk_end_timestamp;

  return {
    beginTimestamp: toIntTimestamp(beginTimestampString, endTimestampString),
    endTimestamp: toIntTimestamp(endTimestampString, beginTimestampString),
  };
}

/**
 * @description Creates metrics value inside results for transformStitchedSearchMetricsData()
 * @param {object} row
 * @param {object} metricTypes
 * @returns {Array}
 * @example [{ name: 'AMFMeanRegNbr', value: 10 },{ name: 'vi_PDUSessionEstSR', value: 30 }]
 */
function createMetrics(row, metricTypes = []) {
  const { beginTimestamp, endTimestamp } = extractTimestampProperties(row);
  return metricTypes.map((metricType) => ({
    type: metricType,
    value: row[metricType.id],
    beginTimestamp,
    endTimestamp,
    metadata: [
      {
        key: 'csac_table',
        value: row.csac_table,
      },
      {
        key: 'csac_column',
        value: 'csac_column' in row ? row.csac_column : row[`csac_column_${metricType.id}`],
      },
    ],
  }));
}

/**
 * @description Transforms stitched data from API open search to match API spec response
 * @param {Array} stitchedData
 * @param {object} query
 * @param {Integer} total
 * @returns {object}
 * @example {start:0, count:3, total:3, results:[{context:{name:"NF_SNSSAI", aggregation: [{type:"SNSSAI"}, {type:"NF"}]}, metrics:[{name:'vi_AMFMeanRegNbr, value:10}, {name:"vi_PDUSessionEstSR", value:30}]},{context:{name:"NF_SNSSAI", aggregation: [{type:"SNSSAI"}, {type:"NF"}]}, metrics:[{name:'vi_AMFMeanRegNbr, value:34}, {name:"vi_PDUSessionEstSR", value:77}]}
 */
function transformStitchedSearchMetricsData(
  stitchedData,
  { metricTypes, offset, length },
  total = 0,
) {
  if (total < length) {
    length = total - offset;
  }

  const results = [];
  stitchedData.forEach((row) => {
    const result = {
      context: createContext(row),
      metrics: createMetrics(row, metricTypes),
    };
    results.push(result);
  });
  return {
    offset,
    length,
    total,
    results,
  };
}

/**
 * @description Stitch together the a second set of docs to the first, with values returned for each kpi
 * @param {*{}} docs1
 * @param {*{}} docs2
 * @param {*{}} metricTypes
 * @returns {*[]}
 * @example [{ full_context: 'NF_SNSSAI', context: ['SNSSAI', 'NF'], c_SNSSAI: '1A1', c_NF: 'AMF_BC', vi_AMFMeanRegNbr: 10, vi_PDUSessionEstSR: 30 }]
 */
function stitchSearchMetrics(docs1, docs2, metricTypes) {
  // Merge docs from docsQ2 into docsQ1 if they are for the same row context
  const cleanDocs1 = getSearchDoc(docs1).map((row) => cleanDoc(row, metricTypes));
  const cleanDocs2 = getSearchDoc(docs2).map((row) => cleanDoc(row, metricTypes));

  return cleanDocs1.map((doc1Row) => {
    const contextKeys = createContextKeys(doc1Row.context);
    return cleanDocs2.reduce(
      (acc, doc2Row) => {
        if (valuesMatchForKeys(doc1Row, doc2Row, contextKeys)) {
          return { ...acc, ...doc2Row };
        }
        return { ...acc };
      },
      { ...doc1Row },
    );
  });
}

/**
 * @const getSearchMetrics
 * @description Formulates a response given a proper request query
 * @param params
 * @param query
 * @returns {*{}}
 */
const getSearchMetrics = async ({ params, query }) => {
  const res1 = await client.search(buildSearchMetricsQ1Query(params.index, query));
  validateOpenSearchResponseBody(res1.body);
  const total = res1.body.hits.total.value;
  const res2 = await client.search(buildSearchMetricsQ2Query(params.index, query, res1.body));
  validateOpenSearchResponseBody(res2.body);
  return transformStitchedSearchMetricsData(
    stitchSearchMetrics(res1.body, res2.body, query.metricTypes),
    query,
    total,
  );
};

export {
  createContext,
  extractTimestampProperties,
  createMetrics,
  transformStitchedSearchMetricsData,
  stitchSearchMetrics,
  getSearchMetrics,
};
