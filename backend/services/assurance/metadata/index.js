import { getIndexerFullContexts, getMetrics } from '../indexerInfo.js';
import { transformMetadataMetrics } from './metrics.js';
import { transformMetadataContexts } from './contexts.js';
import { getFromRelatedMapByContextId, makeRelatedToMap } from './relations.js';
import { getKpis, getMetadataContexts } from '../csacInfo.js';
import configManager from '../../../config/configManager.js';
import CONSTANTS from '../../../config/constants.js';

/**
 * @function
 * to return boolean flag based on the persistence engine
 * @returns {boolean}
 */
const isPersistenceEngineVictoriaMetrics = () => {
  const persistenceEngine = configManager.getPersistenceEngine();
  return persistenceEngine === CONSTANTS.PERSISTENCE_ENGINE_VICTORIA_METRICS;
};

/**
 * @function getContexts
 * @param req
 * @returns {Promise<Array>}
 */
async function getContexts(req) {
  return transformMetadataContexts(
    isPersistenceEngineVictoriaMetrics()
      ? await getMetadataContexts()
      : await getIndexerFullContexts(req),
  );
}

/**
 * @function getMetricsByContextTypeId
 * @param req
 * @returns {Promise<Array>}
 */
async function getMetricsByContextTypeId(req) {
  return transformMetadataMetrics(
    isPersistenceEngineVictoriaMetrics() ? await getKpis(req) : await getMetrics(req),
  );
}

/**
 * @function getMetadata
 * @description Formulates a response given a proper request query
 * @returns {*}
 * @param req
 */
async function getMetadata(req) {
  const fullContextList = await getContexts(req);
  const relatedToMap = makeRelatedToMap(fullContextList);

  return Promise.all(
    fullContextList.map(async (fullContext) => {
      const contextTypeId = fullContext.id;
      const reqByContextTypeId = { ...req, query: { contextTypeId } };
      const metricTypes = await getMetricsByContextTypeId(reqByContextTypeId);

      return {
        contextType: fullContext,
        relations: getFromRelatedMapByContextId(reqByContextTypeId, relatedToMap),
        metricTypes,
      };
    }),
  )
    .then((datas) => datas)
    .catch((error) => {
      throw new Error(error);
    });
}

/**
 * Make the API call to `/:index/metadata/relations' to get relations by `contextTypeId'.
 * @function getRelationsByContextTypeId
 * @param req
 * @returns {Promise<Array<Relation>>}
 */
async function getRelationsByContextTypeId(req) {
  const fullContextList = await getContexts(req);
  return getFromRelatedMapByContextId(req, makeRelatedToMap(fullContextList));
}

export { getMetricsByContextTypeId, getContexts, getMetadata, getRelationsByContextTypeId };
