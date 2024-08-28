import express from 'express';
import * as path from 'path';
import v8 from 'v8';
import { fileURLToPath } from 'url';
import { queryLimit } from './middleware/queryLimit.js';
import configManager from './config/configManager.js';
import { load } from './loaders/index.js';
import { getLogger } from './services/logging.js';
import k8sQueryService from './services/k8sQueryService.js';
import manualServiceConfigHandler from './services/manualServiceConfigHandler.js';
import certificateManager from './services/certificateManager.js';
import CONSTANTS from './config/constants.js';
import pmService from './services/pmService.js';

const app = express();

app.set('query parser', queryLimit);

const logger = getLogger();
const __dirname = path.dirname(fileURLToPath(import.meta.url));

logger.info(
  `The current configs are as follows:\n ${JSON.stringify(configManager.getConfig(), null, 4)}`,
);
logger.info(
  `The current customization configs are as follows:\n ${JSON.stringify(
    configManager.getCustomizationConfig(),
    null,
    4,
  )}`,
);

const heapStatistics = v8.getHeapStatistics();
logger.info(
  `Memory limit is set to ${Math.round(heapStatistics.total_available_size / 1024 / 1024)}MB.`,
);

pmService.applyPromMiddleware(app);

if (process.env.NODE_ENV === 'production') {
  app.use(CONSTANTS.FRONTEND_ROUTE, express.static(path.join(__dirname, '../frontend')));
}

if (process.env.NODE_ENV === 'development') {
  app.use(CONSTANTS.FRONTEND_ROUTE, express.static(path.join(__dirname, '../frontend/build')));
}

if (process.env.NODE_ENV === 'bridge') {
  // eslint-disable-next-line global-require, import/no-extraneous-dependencies
  const { createProxyMiddleware } = require('http-proxy-middleware');
  app.use(
    CONSTANTS.FRONTEND_ROUTE,
    createProxyMiddleware({
      target: 'http://localhost:8080',
      followRedirects: true,
      logLevel: 'debug',
      pathRewrite: {
        [`${CONSTANTS.FRONTEND_ROUTE}`]: '',
      },
    }),
  );
}

// Run Loaders
load(app);

const startK8sService = async () => {
  if (configManager.getConfig().k8sQueryServiceEnabled) {
    await k8sQueryService.startWatching();
  } else {
    logger.info('K8S Service is disabled.');
  }
  manualServiceConfigHandler.triggerInitialEvents();
};

startK8sService();

// needed to close the app gracefully in tests
app.close = () => {
  pmService.shutDown();
  k8sQueryService.stopWatching();
  configManager.stopAllConfigWatch();
  certificateManager.stopCertificateWatch();
  certificateManager.stopServerCertificateWatch();
};

export default app;
