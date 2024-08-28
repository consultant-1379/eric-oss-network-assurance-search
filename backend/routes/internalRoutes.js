import express from 'express';
import { createRequire } from 'module';
import { responseBuilder } from '../utils/responseBuilder.js';
import { getUiConfiguration } from '../services/internal/uiConfiguration.js';

const require = createRequire(import.meta.url);
const apiConfig = require('../config/api-config.json');

const router = express.Router();

export default () => {
  // ROUTE: /ui/configuration
  router.get(apiConfig.internal.routes.configuration, async (_req, res, next) => {
    try {
      responseBuilder(res, getUiConfiguration());
    } catch (err) {
      next(err);
    }
  });

  return router;
};
