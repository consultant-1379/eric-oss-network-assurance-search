import CONSTANTS from '../../../../config/constants.js';
import {
  extractContext,
  convertToContextMap,
  getContextObject,
  getEntityFilterObject,
  getKpiExact,
  getKpiRange,
  getSearchDoc,
  cleanDoc,
  getContextFacetMustQueryObjects,
} from './utils.js';

/**
 * @const buildSearchMetricsQ1Query
 * @description Creates a specific query for use with opensearch based on request query
 * @param indexName
 * @param query
 * @returns {*{}}
 */
const buildSearchMetricsQ1Query = (
  indexName,
  { contextTypeId, metricTypes, filters = [], sortBy = {}, sortOrder, offset, length },
) => {
  const sortingBy = sortBy.id || metricTypes[0].id;
  let filterBy = sortingBy;
  const metricIds = metricTypes.map((m) => m.id);
  if (!metricIds.includes(sortingBy)) {
    filterBy = metricTypes[0].id;
  }

  let musts = [
    {
      match: {
        full_context: contextTypeId,
      },
    },
  ];

  let mustNots = [];

  const entityFilters = filters.filter((f) => f.type === 'entity');
  const entityMusts = entityFilters.filter((f) => !f.not);
  const entityMustNots = entityFilters.filter((f) => f.not);

  if (entityMusts.length > 0) {
    musts = musts.concat(getEntityFilterObject(entityMusts));
  }

  if (entityMustNots.length > 0) {
    mustNots = mustNots.concat(getEntityFilterObject(entityMustNots));
  }

  const metricFilters = filters.filter((f) => f.type === 'metric' && (f?.from || f?.to));
  filterBy = metricFilters[0]?.name || filterBy;

  let filterMusts = getKpiRange([filterBy], []);
  let filterMustNots = [];
  const filterObj = {};

  const metricRanges = metricFilters.filter((f) => f?.from !== f?.to);
  const metricRangesCount = metricRanges.length;
  if (metricRangesCount > 0) {
    filterObj.should = getKpiRange([filterBy], metricFilters);
    filterObj.minimum_should_match = metricRangesCount;
  }

  const metricExacts = metricFilters.filter((f) => f?.from === f?.to && !f?.not);
  const metricExactNots = metricFilters.filter((f) => f?.from === f?.to && f?.not);
  if (metricExacts.length > 0) {
    filterMusts = filterMusts.concat(getKpiExact([filterBy], metricExacts));
  }
  if (metricExactNots.length > 0) {
    filterMustNots = filterMustNots.concat(getKpiExact([filterBy], metricExactNots));
  }

  if (filterMusts.length > 0) {
    filterObj.must = filterMusts;
  }

  if (filterMustNots.length > 0) {
    filterObj.must_not = filterMustNots;
  }

  const queryBoolObj = {
    must: musts,
    filter: {
      bool: filterObj,
    },
  };
  if (mustNots.length > 0) {
    queryBoolObj.must_not = mustNots;
  }

  return {
    index: indexName,
    body: {
      from: offset,
      size: length,
      query: {
        bool: queryBoolObj,
      },
      sort: [
        {
          [sortingBy]: {
            order: sortOrder,
            unmapped_type: 'long',
          },
        },
      ],
    },
  };
};

/**
 * @const buildSearchMetricsQ2Query
 * @description Creates a specific query for use with opensearch based on a request query and docsFromQ1
 * @param indexName
 * @param query
 * @param docsFromQ1
 * @returns {*{}}
 */
const buildSearchMetricsQ2Query = (
  indexName,
  { contextTypeId, metricTypes = [], filters = [] },
  docsFromQ1,
) => {
  const kpiList = metricTypes.map((metric) => metric.id);
  const metricFilters = filters.filter((f) => f.type === 'metric');

  const cleanDocs = getSearchDoc(docsFromQ1).map((row) => cleanDoc(row, []));
  const contextList = cleanDocs.map((doc) => extractContext(doc));
  const contextMap = convertToContextMap(contextList);
  const contextShouldObject = getContextObject(contextMap);

  return {
    index: indexName,
    body: {
      from: 0,
      size: CONSTANTS.OPENSEARCH_QUERY_SIZE_LIMIT,
      query: {
        bool: {
          must: [
            {
              match: {
                full_context: contextTypeId,
              },
            },
          ],
          should: contextShouldObject,
          minimum_should_match: Object.keys(contextMap).length,
          filter: {
            bool: {
              should: getKpiRange(kpiList, metricFilters),
              minimum_should_match: 1,
            },
          },
        },
      },
    },
  };
};

/**
 * @const buildSearchRelatedContextsFacetsQuery
 * @description Creates a specific query for use with opensearch based on a request query and docsFromQ1
 * @param {String} indexName
 * @example "soa"
 * @param {String} fullContext
 * @example "NF_SNSSAI"
 * @param {Array.<Entity>} contextFields - An array of `Entity` objects
 * @example [ { "id": "AMF_BC", "type": { "id": "c_NF" } } ]
 * @param {String} metricId
 * @example "vi_NF_SNSSAI_AMFMeanRegNbr"
 * @returns {*{}}
 */
const buildSearchRelatedContextsFacetsQuery = (indexName, fullContext, contextFields, metricId) => {
  let contextMusts = [
    {
      match: {
        full_context: fullContext,
      },
    },
  ];

  if (contextFields.length > 0) {
    contextMusts = contextMusts.concat(getContextFacetMustQueryObjects(contextFields));
  }

  return {
    index: indexName,
    body: {
      from: 0,
      size: 0,
      query: {
        bool: {
          must: contextMusts,
          filter: {
            bool: {
              must: [
                {
                  range: {
                    [metricId]: {
                      gte: 0,
                    },
                  },
                },
              ],
            },
          },
        },
      },
    },
  };
};

/**
 * @const buildSearchContextsQuery
 * @description Creates a specific query for use with opensearch based on request query
 * @param indexName
 * @param query
 * @returns {*{}}
 */
const buildSearchContextsQuery = (
  indexName,
  { filters = [], contextTypeId, sortBy = {}, sortOrder, offset, length },
) => {
  const sortingBy = sortBy.id;

  let musts = [];
  let mustNots = [];

  if (contextTypeId) {
    musts.push({
      match: {
        full_context: contextTypeId,
      },
    });
  }

  const entityMusts = filters.filter((f) => !f.not);
  const entityMustNots = filters.filter((f) => f.not);

  if (entityMusts.length > 0) {
    musts = musts.concat(getEntityFilterObject(entityMusts));
  }

  if (entityMustNots.length > 0) {
    mustNots = mustNots.concat(getEntityFilterObject(entityMustNots));
  }

  const queryBoolObj = {
    must: musts,
  };
  if (mustNots.length > 0) {
    queryBoolObj.must_not = mustNots;
  }

  const searchQuery = {
    index: indexName,
    body: {
      from: offset,
      size: length,
      query: {
        bool: queryBoolObj,
      },
    },
  };

  if (sortingBy) {
    searchQuery.body.sort = [
      {
        [sortingBy]: {
          order: sortOrder,
          unmapped_type: 'long',
        },
      },
    ];
  }

  return searchQuery;
};

export {
  buildSearchMetricsQ1Query,
  buildSearchMetricsQ2Query,
  buildSearchContextsQuery,
  buildSearchRelatedContextsFacetsQuery,
};
