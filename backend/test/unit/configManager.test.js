import { expect } from 'chai';
import { createRequire } from 'module';
import * as td from 'testdouble';
import * as loggingMock from '../mocks/modules/logging.mock.js';
import configManagerInst from '../../config/configManager.js';

const require = createRequire(import.meta.url);
const defaultConfig = require('../../config/backend-service-config-default.json');

describe('Unit test ConfigManager instance', () => {
  it('configManager instance should not be undefined', () => {
    expect(configManagerInst).to.be.not.undefined;
  });

  it('configManager\'s default persistenceEngine should be OpenSearch "os"', async () => {
    // default property is 'false', replace it if default change.
    expect(
      await configManagerInst.getPersistenceEngine(),
      'persistence Engine should be os',
    ).to.equal('os');
  });

  it('configManager should have getVictoriaMetricsUrl property', async () => {
    expect(await configManagerInst.getVictoriaMetricsUrl()).to.be.exist;
  });
});

describe.skip('Unit tests for configManager.js', () => {
  let configManager;
  const mockModules = async () => {
    await td.replaceEsm('../../services/logging.js', loggingMock);
    await td.replaceEsm('../services/uiConfigService.js', null, {
      instantiateUiConfig: () => null,
    });
    configManager = (await import('../../config/configManager.js')).default;
    td.reset();
  };

  before(async () => {
    await mockModules();
  });

  after(() => {
    configManager.stopAllConfigWatch();
  });

  it('configManager instance should not be undefined', () => {
    expect(configManager).to.be.not.undefined;
  });

  it('configManager should have required methods', () => {
    expect(configManager.on).to.be.not.undefined;
    expect(configManager.get).to.be.not.undefined;
    expect(configManager.startConfigWatch).to.be.not.undefined;
    expect(configManager.stopAllConfigWatch).to.be.not.undefined;
  });

  it('can successfully read the default configuration', () => {
    const verifyCertDefault = defaultConfig.verifyClientCertificate === 'required';
    expect(configManager.verifyClientCertificate()).to.eq(verifyCertDefault);
    expect(configManager.getServicePort()).to.eq(defaultConfig.servicePort);
  });

  it('getLoggingConfig() should return the merged logging config with logtransformer config', () => {
    const loggingConf = configManager.getLoggingConfig();
    expect(loggingConf.syslogHost).to.exist;
    expect(loggingConf.defaultLogLevel).to.exist;
    expect(loggingConf.tls.enabled).to.exist;
  });

  it('can successfully read the K8S service configuration', () => {
    const k8sConfig = configManager.getK8sQueryServiceConfig();
    expect(k8sConfig.labelName).to.exist;
    expect(k8sConfig.configFetch.configFetchMaxTry).to.exist;
  });
});
