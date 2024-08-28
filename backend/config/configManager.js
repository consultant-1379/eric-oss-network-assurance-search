import { createRequire } from 'module';
import { ConfigManager } from '@adp/base';
import CONSTANTS from './constants.js';
import { getLogger, addConfigListener } from '../services/logging.js';

const require = createRequire(import.meta.url);
const defaultBackendConfig = require('./backend-service-config-default.json');
const customizationServiceConfigSchema = require('../schemas/customizationServiceConfig.schema');
const defaultCustomizationConfig = require('./customization-service-config-default.json');

const logger = getLogger();

class BackendConfigManager extends ConfigManager {
  getConfig() {
    return this.get(CONSTANTS.CONTAINER_CONFIG_NAME);
  }

  getManualServiceConfig() {
    return this.get(CONSTANTS.MANUAL_SERVICE_CONFIG_NAME)?.serviceList;
  }

  discoverIngress() {
    return this.getConfig().discoverIngress;
  }

  useHttps() {
    return this.getConfig().useHttps;
  }

  verifyClientCertificate() {
    return this.getConfig().verifyClientCertificate === 'required';
  }

  getCertificatePath() {
    return CONSTANTS.CERTIFICATES_DIR;
  }

  getDependenciesConfig() {
    return this.getConfig().dependencies;
  }

  getLoggingConfig() {
    if (!this.getConfig().logging) {
      return undefined;
    }
    return {
      ...this.getConfig().logging,
      ...this.getConfig().dependencies?.logtransformer,
      ...{ tls: { enabled: this.useHttps() } },
    };
  }

  getPromConfig() {
    return this.getConfig().dependencies?.prometheus || {};
  }

  getFaultManagerConfig() {
    return {
      ...this.getConfig().faultIndications,
      ...this.getConfig().dependencies?.faultHandler,
      tls: {
        ...this.getConfig().dependencies?.faultHandler?.tls,
        enabled: this.useHttps(),
      },
    };
  }

  getServicePort() {
    return this.getConfig().servicePort;
  }

  getK8sQueryServiceConfig() {
    return {
      labelName: this.getConfig().k8sLabelPropertyName,
      labelValue: this.getConfig().k8sLabelValue,
      configFetch: {
        configFetchTlsOption: CONSTANTS.TLS_TYPE_INTERNAL_GUI,
        configFetchMaxTry: CONSTANTS.CONFIG_FETCH_MAX_TRY,
        configFetchRetryPeriod: CONSTANTS.CONFIG_FETCH_RETRY_PERIOD,
      },
      queryProtocolAnnotation: this.getConfig().configQueryProtocolAnnotation,
      queryPortAnnotation: this.getConfig().configQueryPortAnnotation,
      extraAnnotations: {},
      appNameLabel: this.getConfig().appNameLabel,
      appVersionLabel: this.getConfig().appVersionLabel,
      uiContentConfigContextAnnotation: this.getConfig().uiContentConfigContextAnnotation,
      discoverIngress: this.discoverIngress(),
      ingressTlsPort: CONSTANTS.INGRESS_TLS_PORT,
      ingressHttpPort: CONSTANTS.INGRESS_HTTP_PORT,
      nodeEnvironment: process.env.NODE_ENV,
      bridge: {
        kubernetesServiceHost: process.env.KUBERNETES_SERVICE_HOST,
        kubernetesServicePort: process.env.KUBERNETES_SERVICE_PORT,
      },
      useHttps: this.getConfig().useHttps,
    };
  }

  getSynchronizationConfig() {
    return {
      headlessServiceName: this.getConfig().headlessServiceName,
      servicePort: this.getConfig().servicePort,
      useHttps: this.getConfig().useHttps,
    };
  }

  getPersistenceEngine() {
    return process.env.PERSISTENCE_ENGINE || this.getConfig().persistenceEngine || 'os';
  }

  getVictoriaMetricsUrl() {
    return this.getConfig().victoriaMetricsUrl;
  }

  getCsacUrl() {
    return this.getConfig().csacUrl;
  }

  getIndexerUrl() {
    return this.getConfig().indexerUrl;
  }

  getCustomizationConfig() {
    return this.get(CONSTANTS.CUSTOMIZATION_CONFIG_FILE_NAME);
  }
}

const configManager = new BackendConfigManager(
  [
    {
      name: CONSTANTS.CONTAINER_CONFIG_NAME,
      filePath: CONSTANTS.CONTAINER_CONFIG_FILE,
      defaultValue: defaultBackendConfig,
    },
    {
      name: CONSTANTS.MANUAL_SERVICE_CONFIG_NAME,
      filePath: CONSTANTS.MANUAL_SERVICE_CONFIG_FILE,
    },
    {
      name: CONSTANTS.CUSTOMIZATION_CONFIG_FILE_NAME,
      filePath: CONSTANTS.CUSTOMIZATION_CONFIG_FILE,
      schema: customizationServiceConfigSchema,
      defaultValue: defaultCustomizationConfig,
    },
  ],
  logger,
);

addConfigListener(configManager);

export default configManager;
