// update the backend-service-mock.js file too
import apiConfig from './api-config.json';

/**
 * Currently supported CNOM data source types
 */
const CnomDataSourceType = {
  FAKE: 'fake',
  PM_STATS_QUERY_SERVICE: 'pmStatsQueryService',
};

const localhostUrl = 'http://localhost';

export default {
  localMode: true,
  logging: {
    logLevel: 'info',
  },
  frontendRoutePrefix: '',
  routes: { ...apiConfig },
  // This value should not be greater than 11 (would result in over 2 hours of retry delay)
  exponentialBackoffRetryAttempts: 6,
  authnConfig: {
    host: localhostUrl,
    port: 3000,
    path: '/sec/authn/v1/logout',
  },
  cnomConfig: {
    host: localhostUrl,
    port: 8081,
    path: '/?embedded=true#service-assurance-viewer',
  },
  cnomDataSourceType: CnomDataSourceType.PM_STATS_QUERY_SERVICE,
};
