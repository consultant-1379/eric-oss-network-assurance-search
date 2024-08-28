import { logger } from '@adp/base';
import CONSTANTS from '../config/constants.js';

const { configureLogger, LOG_LEVELS, getLogger } = logger;

const loggingService = logger;

const SYSLOG_SERVICE = 'logtransformer';
const SYSLOG_POD_NAME = process.env.K8S_POD || 'N/A';
const SYSLOG_METADATA = {
  namespace: process.env.K8S_NAMESPACE || 'N/A',
  node_name: process.env.K8S_NODE_NAME || 'N/A',
  container_name: process.env.K8S_CONTAINER || 'N/A',
  service_version: process.env.K8S_CHART_VERSION || 'N/A',
};

let configManager;
let certificateManager;

function getFullLogginConfig() {
  const loggerConfig = configManager.getLoggingConfig();
  const tlsOptions = certificateManager && certificateManager.getTLSOptions(SYSLOG_SERVICE);
  const protocolOptions = tlsOptions
    ? {
        secureContext: tlsOptions.secureContext,
        ...tlsOptions.tlsAgent.options,
      }
    : undefined;
  loggerConfig.syslog.tls = { ...loggerConfig?.tls, protocolOptions };
  loggerConfig.syslog.metadata = SYSLOG_METADATA;
  loggerConfig.syslog.podName = SYSLOG_POD_NAME;

  return loggerConfig;
}

function addConfigListener(configManagerReference) {
  configManager = configManagerReference;
  configureLogger(getFullLogginConfig());
  configManager.on('config-changed', ({ name }) => {
    const consoleLogger = getLogger('local');
    consoleLogger.info(
      `Network Assurance Search Microservice configuration: ${name} has been changed.`,
    );
    if (name === CONSTANTS.CONTAINER_CONFIG_NAME || name === CONSTANTS.LOG_CONTROL_NAME) {
      configureLogger(getFullLogginConfig());
    }
  });
}

function addCertificateListener(certificateManagerRef) {
  certificateManager = certificateManagerRef;
  configureLogger(getFullLogginConfig());
  certificateManager.on('certificates-changed', (serviceName) => {
    if (configManager && serviceName === SYSLOG_SERVICE) {
      configureLogger(getFullLogginConfig());
    }
  });
}

export { loggingService, getLogger, addConfigListener, addCertificateListener, LOG_LEVELS };
