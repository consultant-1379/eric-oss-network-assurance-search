import express from 'express';
import serviceAggregationRoutes from './serviceAggregationRoutes.js';
import internalRoutes from './internalRoutes.js';
import invalidRoutes from './invalidRoutes.js';
import assuranceRoutes from './assuranceRoutes.js';

const router = express.Router();

const getServiceAggregationRoutes = () => {
  router.use(serviceAggregationRoutes());
  return router;
};

const getInternalRoutes = () => {
  router.use(internalRoutes());
  return router;
};

const getInvalidRoutes = () => {
  router.use(invalidRoutes());
  return router;
};

const getAssuranceRoutes = () => {
  router.use(assuranceRoutes());
  return router;
};

export { getServiceAggregationRoutes, getInternalRoutes, getInvalidRoutes, getAssuranceRoutes };
