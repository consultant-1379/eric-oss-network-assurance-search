import express from 'express';
import { createRequire } from 'module';
import { validateRequest, responseBuilder } from '../utils/responseBuilder.js';
import {
  searchMetricsRouteValidationSchema,
  searchContextsRouteValidationSchema,
  searchRelatedContextsFacetsRouteValidationSchema,
  metadataRelationsRouteValidationSchema,
  metadataContextsRouteValidationSchema,
  metadataMetricsRouteValidationSchema,
  metadataAllRouteValidationSchema,
} from './route-validation-schemas/assuranceRouteSchemas.js';
import { getSearchMetrics } from '../services/assurance/search/opensearch/metrics.js';
import { getSearchContexts } from '../services/assurance/search/opensearch/contexts.js';
import { getSearchRelatedContextsFacets } from '../services/assurance/search/opensearch/relatedContextsFacets.js';
import { getIndexerList } from '../services/assurance/indexerInfo.js';
import { errorHandler } from '../utils/errorHandler.js';
import configManager from '../config/configManager.js';
import { AppError } from '../utils/appError.js';
import CONSTANTS from '../config/constants.js';
import { getVmSearchMetrics } from '../services/assurance/search/victoriametrics/metrics.js';
import {
  getContexts,
  getMetadata,
  getMetricsByContextTypeId,
  getRelationsByContextTypeId,
} from '../services/assurance/metadata/index.js';
import { getSystemState } from '../services/assurance/csacInfo.js';

const require = createRequire(import.meta.url);
const apiConfig = require('../config/api-config.json');

const router = express.Router();

// TODO: define actual function
function getCsacIndexerList() {
  throw new AppError(501, 'CSAC/VM functionality is not yet implemented.', 501, 'Not Implemented');
}

/**
 * @function
 * to return boolean flag based on the persistence engine
 * @returns {boolean}
 */
const isPersistenceEngineVictoriaMetrics = () => {
  const persistenceEngine = configManager.getPersistenceEngine();
  return persistenceEngine === CONSTANTS.PERSISTENCE_ENGINE_VICTORIA_METRICS;
};

export default () => {
  // ROUTE: /:index/search/metrics
  router.get(
    apiConfig.api.routes.searchMetrics,
    validateRequest(searchMetricsRouteValidationSchema),
    async (req, res, next) => {
      try {
        responseBuilder(
          res,
          isPersistenceEngineVictoriaMetrics()
            ? await getVmSearchMetrics(req)
            : await getSearchMetrics(req),
        );
      } catch (err) {
        next(err);
      }
    },
  );

  // ROUTE: /:index/search/contexts
  router.get(
    apiConfig.api.routes.searchContexts,
    validateRequest(searchContextsRouteValidationSchema),
    async (req, res, next) => {
      try {
        responseBuilder(res, await getSearchContexts(req));
      } catch (err) {
        next(err);
      }
    },
  );

  // ROUTE: /:index/search/related-contexts-facets.
  router.get(
    apiConfig.api.routes.searchRelatedContextsFacets,
    validateRequest(searchRelatedContextsFacetsRouteValidationSchema),
    async (req, res, next) => {
      try {
        responseBuilder(res, await getSearchRelatedContextsFacets(req));
      } catch (err) {
        next(err);
      }
    },
  );

  // ROUTE: /:index/metadata/relations
  router.get(
    apiConfig.api.routes.metadataRelations,
    validateRequest(metadataRelationsRouteValidationSchema),
    async (req, res, next) => {
      try {
        responseBuilder(res, await getRelationsByContextTypeId(req));
      } catch (error) {
        next(error);
      }
    },
  );

  // ROUTE: /:index/metadata/contexts
  router.get(
    apiConfig.api.routes.metadataContexts,
    validateRequest(metadataContextsRouteValidationSchema),
    async (req, res, next) => {
      try {
        responseBuilder(res, await getContexts(req));
      } catch (err) {
        next(err);
      }
    },
  );

  // ROUTE: /:index/metadata/metrics
  router.get(
    apiConfig.api.routes.metadataMetrics,
    validateRequest(metadataMetricsRouteValidationSchema),
    async (req, res, next) => {
      try {
        responseBuilder(res, await getMetricsByContextTypeId(req));
      } catch (err) {
        next(err);
      }
    },
  );

  // ROUTE: /:index/metadata
  router.get(
    apiConfig.api.routes.metadataAll,
    validateRequest(metadataAllRouteValidationSchema),
    async (req, res, next) => {
      try {
        responseBuilder(res, await getMetadata(req));
      } catch (error) {
        next(error);
      }
    },
  );

  // ROUTE: /metadata/indexes
  router.get(apiConfig.api.routes.metadataIndexes, async (req, res, next) => {
    try {
      responseBuilder(
        res,
        isPersistenceEngineVictoriaMetrics() ? getCsacIndexerList() : await getIndexerList(),
      );
    } catch (error) {
      next(error);
    }
  });

  // ROUTE: /system/state
  router.get(apiConfig.api.routes.systemState, async (_req, res, next) => {
    try {
      responseBuilder(res, await getSystemState());
    } catch (error) {
      next(error);
    }
  });

  router.use(errorHandler);

  return router;
};
