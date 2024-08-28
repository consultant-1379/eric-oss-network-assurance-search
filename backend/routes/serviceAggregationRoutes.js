import express from 'express';
import { createRequire } from 'module';
import CONSTANTS from '../config/constants.js';

const require = createRequire(import.meta.url);
const apiConfig = require('../config/api-config.json');

const router = express.Router();

export default () => {
  // ROUTE: /internal-api/ui
  router.get(apiConfig.serviceAggregationApi.routes.ui, (_req, res) => res.sendStatus(200));

  // to prevent the invalid favicon request error
  router.get(CONSTANTS.FAVICON_ROUTE, (_req, res) => res.sendStatus(404));

  return router;
};
