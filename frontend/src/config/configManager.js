import { ConfigManager as AdpConfigManager } from '@adp/ui-common';
import { createUrlFromObject } from '../utils/url.js';
import { getStaticPath } from '../utils/helper.js';
import deploymentConfigSchema from '../schemas/ui.deployment.config.json';
import defaultConfig from './defaultConfig.js';
import constants from '../utils/constants.js';

const { CONFIG_LOCATION } = constants;

class ConfigManager extends AdpConfigManager {
  constructor() {
    super({
      defaultConfig,
      schema: deploymentConfigSchema,
      path: `${getStaticPath()}${CONFIG_LOCATION}`,
    });
  }

  getLoggerConfig() {
    return this.config.logging;
  }

  getLogLevel() {
    return this.getLoggerConfig().logLevel;
  }

  getUserAccountURL() {
    return this.config.userAccountURL;
  }

  getLogoutUrl() {
    return createUrlFromObject(this.config.authnConfig);
  }

  getFrontendRoutePrefix() {
    return this.config.frontendRoutePrefix;
  }

  getFeatureFlags() {
    return this.config.featureFlags;
  }

  getCnomUrl() {
    const cnomUrl = this.config.localMode
      ? this.config.cnomConfig
      : {
          host: `${window.location.protocol}//${window.location.hostname}`,
          port: window.location.port,
          path: `/cnom${this.config.cnomConfig?.path}`,
        };
    return createUrlFromObject(cnomUrl);
  }

  getCnomDataSourceType() {
    return this.config.cnomDataSourceType;
  }

  getExponentialBackoffRetryAttempts() {
    return this.config.exponentialBackoffRetryAttempts;
  }
}

export const loadConfig = async () => {
  const configManager = new ConfigManager();
  await configManager.initConfig();
  window.nasConfigManager = configManager;
};

export const getConfig = () => window?.nasConfigManager;
