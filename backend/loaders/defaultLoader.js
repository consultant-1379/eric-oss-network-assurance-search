import { createRequire } from 'module';
import {
  getServiceAggregationRoutes,
  getInternalRoutes,
  getInvalidRoutes,
  getAssuranceRoutes,
} from '../routes/index.js';
import loadMiddleware from '../middleware/index.js';

const require = createRequire(import.meta.url);
const apiConfig = require('../config/api-config.json');

// Loads the express module, initializes routes and settings.

export default (app) => {
  app.get('/status', (req, res) => {
    res.status(200).end();
  });
  app.head('/status', (req, res) => {
    res.status(200).end();
  });

  // Load Middleware module
  loadMiddleware(app);

  app.get('/', (req, res) => {
    res.send('Microservices is started');
  });

  // Load API routes
  app.use(apiConfig.serviceAggregationApi.prefix, getServiceAggregationRoutes());
  app.use(apiConfig.internal.prefix, getInternalRoutes());
  app.use(apiConfig.api.prefix, getAssuranceRoutes());

  // It should be at end, no routes will call after this method.
  app.use(getInvalidRoutes());

  // Return the express app
  return app;
};
