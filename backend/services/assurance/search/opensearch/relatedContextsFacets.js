import { getMetrics } from '../../indexerInfo.js';
import client from '../../../../utils/openSearchConnectionUtil.js';
import { validateOpenSearchResponseBody } from '../../../../utils/openSearchValidationUtil.js';
import { buildSearchRelatedContextsFacetsQuery } from './query.js';
import ContextFacet from '../../../../model/ContextFacet.js';
import ContextType from '../../../../model/ContextType.js';

import configManager from '../../../../config/configManager.js';
import { AppError } from '../../../../utils/appError.js';
import { getRelationsByContextTypeId } from '../../metadata/index.js';

const persistenceEngine = configManager.getPersistenceEngine();

// TODO: Replace with actual function
function getVictoriaMetrics() {
  throw new AppError(501, 'CSAC/VM functionality is not yet implemented.', 501, 'Not Implemented');
}

/**
 * @async
 * @function getMetricIdOfContextTypeId
 * @description Returns a `MetricId` associated with the `ContextTypeId`
 * that is provided. This metricId will be used to query the related context facet count.
 * @param {String} searchIndex - The OpenSearch index that will be queried
 * @example "soa"
 * @param {String} contextTypeId - The contextTypeId (sometimes referred to as the `full_context`)
 * @example "NF_SNSSAI"
 * @returns {Promise<String>} A `MetricId`
 * @example "vi_NF_SNSSAI_AMFMeanRegNbr"
 */
async function getMetricIdOfContextTypeId(searchIndex, contextTypeId) {
  const metadataMetrics =
    persistenceEngine === 'vm'
      ? getVictoriaMetrics()
      : await getMetrics({
          params: { index: searchIndex },
          query: { contextTypeId },
        });
  return metadataMetrics.value[0].valueDocumentName;
}

/**
 * @description Returns an array of the relevant `Entity` objects for the related
 * contexts facets OpenSearch query. The original HTTP request query parameters may contain
 * multiple different `Entity` filters, some of which are not relevant to a specific `ContextTypeId`.
 * @param {Array.<Entity>} entityContextFields - An array of `Entity` objects
 * @example [ { id: 'AMF_BC', type: { id: 'c_NF' } }, { id: 'Slice1', type: { id: 'c_NSI' } } ]
 * @param {Array.<EntityType>} entityTypeContextFields - An array of `EntityType` objects
 * @example [  { id: 'c_Site', name: 'My Site', description: 'Site' }, { id: 'c_NSI', name: 'My NSI', description: 'No Sharks Inside' } ]
 * @returns {Array} An array of relevant `Entity` objects for the related contexts facets OpenSearch query
 * @example [ { id: 'Slice1', type: { id: 'c_NSI' } } ]
 */
function getRelevantContextFieldsForQuery(entityContextFields, entityTypeContextFields) {
  return entityContextFields.filter((entityObj) =>
    entityTypeContextFields.some((entityTypeObj) => entityTypeObj.id === entityObj.type.id),
  );
}
/**
 * @async
 * @function getRelatedContextsQueryData
 * @description Returns an array of objects that contain parameters required to query for the facet count of a specific `full_context`
 * @param {String} searchIndex - The OpenSearch index that will be queried
 * @example "soa"
 * @param {Array<Entity>} entityContextFields - An array of `Entity` objects which will be used to create
 * filters in the OpenSearch query
 * @example [ { id: 'AMF_BC', type: { id: 'c_NF' } } ]
 * @param {Array<Relation>} relatedContexts - An array of `Relation` objects which represent all the related
 * contexts of a given `ContextTypeId` (sometimes referred to as a `full_context`)
 * @example [ { "relationType": "RELATED_TO", "related": { "id": "NSI_Site", "contextFields": [ { "id": "c_Site", "name": "My Site", "description": "Site" }, { "id": "c_NSI", "name": "My NSI", "description": "No Sharks Inside" } ] } }, { "relationType": "RELATED_TO", "related": { "id": "NSI", "contextFields": [ { "id": "c_NSI", "name": "My NSI", "description": "No Sharks Inside" } ] } } ]
 * @returns {Promise<Array<Object>>} An array of objects that contain parameters required to query for the facet count of a specific `full_context`
 * @example [ { "contextType": { "id": "NF_SNSSAI", "contextFields": [ { "id": "c_SNSSAI", "name": "My SNSSAI", "description": "Soup Network Slice Selection Assistance Information" }, { "id": "c_NF", "name": "My NF", "description": "New Finger" } ] }, "contextFields": [ { "id": "AMF_BC", "type": { "id": "c_NF" } } ], "metricId": "vi_NF_SNSSAI_AMFMeanRegNbr" }, { "contextType": { "id": "NF", "contextFields": [ { "id": "c_NF", "name": "My NF", "description": "New Finger" } ] }, "contextFields": [ { "id": "AMF_BC", "type": { "id": "c_NF" } } ], "metricId": "vi_NF_AMFMeanRegNbr" } ]
 */
async function getRelatedContextsQueryData(searchIndex, entityContextFields, relatedContexts) {
  const relatedContextsQueryData = [];
  await Promise.all(
    relatedContexts.map(async (relationObj) => {
      relatedContextsQueryData.push({
        contextType: relationObj.related,
        contextFields: getRelevantContextFieldsForQuery(
          entityContextFields,
          relationObj.related.contextFields,
        ),
        metricId: await getMetricIdOfContextTypeId(searchIndex, relationObj.related.id),
      });
    }),
  );
  return relatedContextsQueryData;
}

/**
 * @async
 * @function getSearchRelatedContextFacetCount
 * @description Returns the facet count of a related context by performing an OpenSearch query.
 * @param {String} searchIndex - The OpenSearch index that will be queried
 * @example "soa"
 * @param {String} fullContext - The `full_context` of the OpenSearch query
 * @example "NF_SNSSAI"
 * @param {Array<Entity>} contextFields - An array of `Entity` objects which will be used to create
 * filters in the OpenSearch query
 * @example [ { id: 'AMF_BC', type: { id: 'c_NF' } } ]
 * @param {String} metricId - A `MetricId` to query for within the given `full_context`
 * @example "vi_NF_SNSSAI_AMFMeanRegNbr"
 * @returns {Promise<Number>} A number which represents the facet count of a related context
 * @example 1
 */
async function getSearchRelatedContextFacetCount(
  searchIndex,
  fullContext,
  contextFields,
  metricId,
) {
  const query = buildSearchRelatedContextsFacetsQuery(
    searchIndex,
    fullContext,
    contextFields,
    metricId,
  );
  const res = await client.search(query);
  validateOpenSearchResponseBody(res.body);
  return res.body.hits.total.value;
}

/**
 * @function getContextFacetObject
 * @description Returns a `ContextFacet` object
 * @param {ContextType} contextType - The `full_context` of the OpenSearch query
 * @example "NF_SNSSAI"
 * @param {Integer} count - The total number of rows of the given `full_context` and the filters applied
 * @example 3
 * @returns {ContextFacet} A `ContextFacet` object
 * @example { "contextType": { "id": "NF", "contextFields": [ { "id": "c_NF", "name": "My NF", "description": "New Finger" } ] }, "count": 1 }
 */
function getContextFacetObject(contextType, count) {
  try {
    ContextType.validateJSON(contextType);
    return ContextFacet.constructFromObject({
      contextType,
      count,
    });
  } catch {
    console.log('The `contextType` input argument must be a valid `ContextType` object.');
    return {};
  }
}

/**
 * @async
 * @function getFacetCounts
 * @description Returns an array of `ContextFacet` objects given a search index and valid related contexts OpenSearch query data.
 * @param {String} searchIndex - The OpenSearch index that will be queried
 * @example "soa"
 * @param {Array} relatedContextsQueryData - An array of objects that contain parameters required to query for the facet count of a specific `full_context`
 * @example [ { "contextType": { "id": "NF_SNSSAI", "contextFields": [ { "id": "c_SNSSAI", "name": "My SNSSAI", "description": "Soup Network Slice Selection Assistance Information" }, { "id": "c_NF", "name": "My NF", "description": "New Finger" } ] }, "contextFields": [ { "id": "AMF_BC", "type": { "id": "c_NF" } } ], "metricId": "vi_NF_SNSSAI_AMFMeanRegNbr" }, { "contextType": { "id": "NF", "contextFields": [ { "id": "c_NF", "name": "My NF", "description": "New Finger" } ] }, "contextFields": [ { "id": "AMF_BC", "type": { "id": "c_NF" } } ], "metricId": "vi_NF_AMFMeanRegNbr" } ]
 * @returns {Promise<Array<ContextFacet>>} An array of `ContextFacet` objects
 * @example [ { "contextType": { "id": "NF", "contextFields": [ { "id": "c_NF", "name": "My NF", "description": "New Finger" } ] }, "count": 1 }, { "contextType": { "id": "NF_SNSSAI", "contextFields": [ { "id": "c_SNSSAI", "name": "My SNSSAI", "description": "Soup Network Slice Selection Assistance Information" }, { "id": "c_NF", "name": "My NF", "description": "New Finger" } ] }, "count": 3 } ]
 */
async function getFacetCounts(searchIndex, relatedContextsQueryData) {
  const facetCounts = [];
  await Promise.all(
    relatedContextsQueryData.map(async (facet) => {
      facetCounts.push(
        getContextFacetObject(
          facet.contextType,
          await getSearchRelatedContextFacetCount(
            searchIndex,
            facet.contextType.id,
            facet.contextFields,
            facet.metricId,
          ),
        ),
      );
    }),
  );
  return facetCounts;
}

/**
 * @async
 * @function getSearchRelatedContextsFacets
 * @description Formulates a response given a proper request query to the `/:index/search/related-contexts-facets` endpoint
 * @param params
 * @param query
 * @returns {Promise<Array<ContextFacet>>} An array of `ContextFacet` objects
 * @example [ { "contextType": "NF_SNSSAI", "count": 3 }, { "contextType": "NSI_Site", "count": 1 } ]
 */
async function getSearchRelatedContextsFacets(req) {
  const relatedContexts = await getRelationsByContextTypeId(req);
  const relatedContextsQueryData = await getRelatedContextsQueryData(
    req.params.index,
    req.query.contextId.contextFields,
    relatedContexts,
  );
  return getFacetCounts(req.params.index, relatedContextsQueryData);
}

export {
  getMetricIdOfContextTypeId,
  getRelevantContextFieldsForQuery,
  getRelatedContextsQueryData,
  getSearchRelatedContextFacetCount,
  getContextFacetObject,
  getFacetCounts,
  getSearchRelatedContextsFacets,
};
