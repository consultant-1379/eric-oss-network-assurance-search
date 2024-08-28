import * as td from 'testdouble';
import * as loggingMock from '../mocks/modules/logging.mock.js';
import CONSTANTS from '../../config/constants.js';

import k8sClientMock from '../mocks/modules/k8s.client.mock.js';
import nodeFetchMock from '../mocks/modules/nodeFetch.mock.js';

const SERVICE_1 = {
  name: 'Service 1',
  version: '1.0',
  URL: 'http://localhost',
};

const SERVICE_2 = {
  name: 'Service 2',
  version: '1.0',
  URL: 'http://localhost:4000',
};

const SERVICES = [SERVICE_1, SERVICE_2];

const configManagerMock = {
  on(eventType, callback) {
    if (eventType === 'config-changed') {
      this.triggerManualServiceConfigChanged = callback.bind(this, {
        name: CONSTANTS.MANUAL_SERVICE_CONFIG_NAME,
      });
    }
  },

  getManualServiceConfig() {
    return SERVICES;
  },
};

describe.skip('Unit tests for ManualServiceConfigHandler', () => {
  let manualServiceConfigHandler;

  const mockModules = async () => {
    // These packages are invoked by the K8sQueryService of the @adp/kubernetes module
    await td.replaceEsm('node-fetch', null, nodeFetchMock);
    await td.replaceEsm('@kubernetes/client-node', null, k8sClientMock);
    await td.replaceEsm('lodash', null, {});

    await td.replaceEsm('../../config/configManager.js', null, configManagerMock);
    await td.replaceEsm('../../services/logging.js', loggingMock);
    manualServiceConfigHandler = (await import('../../services/manualServiceConfigHandler.js'))
      .default;
  };

  before(async () => {
    await mockModules();
  });

  afterEach(() => {
    td.reset();
  });

  it('will call handleServiceConfigChange when the configuration has changed', () => {
    const spy = td.func();
    manualServiceConfigHandler.handleServiceConfigChange = spy;
    SERVICES.pop();
    configManagerMock.triggerManualServiceConfigChanged();
    td.verify(spy(SERVICES), { times: 1 });
  });
});
