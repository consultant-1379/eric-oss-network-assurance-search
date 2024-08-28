let configMapDir = 'config/backend-service-config';
let serviceAccountDir = '/var/run/secrets/kubernetes.io/serviceaccount';

if (process.env.NODE_ENV === 'bridge') {
  configMapDir = process.env.UI_SERVICE_CONFIG;
  serviceAccountDir = process.env.KUBERNETES_SERVICE_ACCOUNT;
}

export default {
  CONTAINER_CONFIG_NAME: 'config',
  MANUAL_SERVICE_CONFIG_NAME: 'manualServiceConfig',
  CONTAINER_CONFIG_FILE: `${configMapDir}/backend-service-config.json`,
  MANUAL_SERVICE_CONFIG_FILE: `${configMapDir}/manual-service-config.json`,
  CERTIFICATES_DIR: 'certificates',
  NAMESPACE_FILE: `${serviceAccountDir}/namespace`,
  TOKEN_FILE: `${serviceAccountDir}/token`,
  FRONTEND_ROUTE: '/ui',
  DEFAULT_NAMESPACE: 'default',
  INGRESS_TLS_PORT: 443,
  INGRESS_HTTP_PORT: 80,
  CONFIG_FETCH_RETRY_PERIOD: 1000,
  CONFIG_FETCH_MAX_RETRY_PERIOD: 64000,
  CONFIG_FETCH_MAX_TRY: 50,
  LOGGING_CATEGORY_DEFAULT: 'default',
  LOGGING_CATEGORY_UI: 'ui',
  LOGGING_CATEGORY_KAFKA: 'kafkajs',
  CERT_WATCH_DEBOUNCE_TIME: 1000,
  METADATA_ID: 'kubernetes@170619', // unique id of the metadata structure, format follows RFC 5424
  RESOURCE_CHANGE_TYPE: {
    ADD: 'ADDED',
    DELETE: 'DELETED',
    MODIFY: 'MODIFIED',
  },
  RESOURCE_TYPE: {
    SERVICE: 'service',
    POD: 'pod',
    ENDPOINT: 'endpoint',
  },
  TLS_TYPE_INTERNAL_GUI: 'internalUi',
  TLS_TYPE_HTTP_CLIENT: 'httpClient',
  FAVICON_ROUTE: '/favicon.ico',
  VIA_HEADER_VALUE: '1.1 eric-oss-network-assurance-search',
  MAX_LOOP_ID: 1000,
  CONFIG_QUERY_NAME: 'service-config',
  CONFIG_QUERY_FILE_NAME: 'help-content-metadata.json',
  PACKAGE_CONFIG_FILE_NAME: 'help-package-meta-data.json',
  HELPCONTENT_BASEDIR: 'help_content',
  OPENSEARCH_QUERY_SIZE_LIMIT: 1000,
  VICTORIAMETRICS_QUERY_LOOK_BACK_TIME_DURATION: '15m',
  CUSTOMIZATION_CONFIG_FILE_NAME: 'customizationServiceConfig',
  CUSTOMIZATION_CONFIG_FILE: `${configMapDir}/customization-service-config.json`,
  CUSTOMIZATION_DASHBOARD_METADATA_FIELDS: ['families', 'groups', 'categories'],
  PERSISTENCE_ENGINE_VICTORIA_METRICS: 'vm',
};
