import { expect } from 'chai';
import * as td from 'testdouble';
import { createRequire } from 'module';
import ConfigManagerMock from '../../mocks/modules/configManagerMock.js';
import * as loggingMock from '../../mocks/modules/logging.mock.js';
import {
  callSystemStateApi,
  transformSystemStateResponse,
  getKpis,
  getMetadataContexts,
} from '../../../services/assurance/csacInfo.js';

const require = createRequire(import.meta.url);
const systemStateMockReady = require('../../../../mock/csac/state.json');

const networkUtilPath = '../../../utils/NetworkUtil.js';
const configManagerPath = '../../config/configManager.js';

describe('Unit tests for csac Info', () => {
  after(async () => {
    td.reset();
  });

  it('should return api response promise for callSystemStateApi', async () => {
    await td.replaceEsm(configManagerPath, null, new ConfigManagerMock());
    const { fetchResponse } = await td.replaceEsm(networkUtilPath);

    callSystemStateApi().then((done) => {
      expect(fetchResponse).to.be.calledWith('/v1/runtime/status/current', 'testServiceName');
      done();
    });
  });

  it('should return ready state of system status', async () => {
    const result = { status: 'ready', message: '' };
    const systemStateResponse = { provisioningState: 'COMPLETED' };

    const actual = transformSystemStateResponse(systemStateResponse);
    expect(actual).to.deep.equal(result);
  });

  it('should return error state of system status', async () => {
    const result = {
      status: 'error',
      message: 'Configurator service returned error',
    };
    const systemStateResponse = { provisioningState: 'ERROR' };
    const actual = transformSystemStateResponse(systemStateResponse);
    expect(actual).to.deep.equal(result);
  });

  it('should return initializing state of system status', async () => {
    const result = {
      status: 'initializing',
      message: 'Waiting for configurator service to be ready',
    };
    const systemStateResponse = { provisioningState: 'INITIAL' };
    const actual = await transformSystemStateResponse(systemStateResponse);
    expect(actual).to.deep.equal(result);
  });
});

describe('Unit tests for System state with csac', () => {
  let _csacInfo;
  const mockedAddCertificateListener = td.func();
  const mockModules = async () => {
    await td.replaceEsm('../../../services/logging.js', {
      ...loggingMock,
      addCertificateListener: mockedAddCertificateListener,
    });
    await td.replaceEsm(configManagerPath, null, new ConfigManagerMock());
    _csacInfo = await td.replaceEsm('../../../services/assurance/csacInfo.js');
  };

  after(async () => {
    _csacInfo = {};
    td.reset();
  });

  before(async () => {
    await mockModules();
  });

  it('should return provisioningState of csac system/state api', async () => {
    const result = {
      id: 2,
      provisioningEndTime: 1705509200,
      provisioningStartTime: 1705508200,
      provisioningState: 'COMPLETED',
    };

    td.when(_csacInfo.callSystemStateApi()).thenReturn(systemStateMockReady);

    const actual = _csacInfo.callSystemStateApi();
    expect(actual).to.deep.equal(result);
  });
});

describe('Unit tests for Metadata', () => {
  after(async () => {
    td.reset();
  });

  it('should return api response promise for getKpis', async () => {
    await td.replaceEsm(configManagerPath, null, new ConfigManagerMock());
    const { fetchResponse } = await td.replaceEsm(networkUtilPath);

    getKpis({ contextTypeId: 'contextTypeA' }).then((done) => {
      expect(fetchResponse).to.be.calledWith(
        '/v1/runtime/metadata/contextTypeA/kpis',
        'testServiceName',
      );
      done();
    });
  });
});

describe('Unit tests for getMetadataContexts', () => {
  it('should return api response promise for getMetadataContexts', async () => {
    await td.replaceEsm(configManagerPath, null, new ConfigManagerMock());
    const { fetchResponse } = await td.replaceEsm(networkUtilPath);

    getMetadataContexts().then((done) => {
      expect(fetchResponse).to.be.calledWith('/v1/runtime/metadata/contexts', 'testServiceName');
      done();
    });
  });
});
