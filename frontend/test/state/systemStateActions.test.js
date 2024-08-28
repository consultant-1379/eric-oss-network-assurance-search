import { expect } from '@open-wc/testing';
import sinon from 'sinon';
import { SystemApi } from '../../src/index';
import { systemState } from '../../src/state/systemStateActions';

describe('System state test', () => {
  let sandbox;

  beforeEach(() => {
    sandbox = sinon.createSandbox();
  });

  afterEach(() => {
    sandbox.restore();
  });

  it('should set error property in app state for ErrorState', async () => {
    let actual = {};
    const initState = {};
    const getSystemStateResponse = {
      status: 'error',
      message: 'Error 501 CSAC service is not available.',
    };
    const result = {
      error: { type: 'SYSTEM_STATE', message: 'Error 501 CSAC service is not available.' },
      systemState: '',
    };

    sandbox.stub(SystemApi.prototype, 'getSystemState').resolves(getSystemStateResponse);

    const stateAccessor = {
      getState: () => initState,
      updateState(s) {
        actual = { ...s };
      },
    };

    await systemState(stateAccessor);
    expect(actual.error).to.deep.eql(result.error);
  });

  it('should set systemStateReady property in app state for ReadyState', async () => {
    let actual = {};
    const initState = {};
    const getSystemStateResponse = {
      status: 'ready',
      message: '',
    };
    const result = {
      systemStateReady: true,
    };

    sandbox.stub(SystemApi.prototype, 'getSystemState').resolves(getSystemStateResponse);

    const stateAccessor = {
      getState: () => initState,
      updateState(s) {
        actual = { ...s };
      },
    };

    await systemState(stateAccessor);
    expect(actual.systemStateReady).to.equal(result.systemStateReady);
  });

  it('should set loading property in app state for InitializingState', async () => {
    let actual = {};
    const initState = {};
    const getSystemStateResponse = {
      status: 'initializing',
      message: 'Waiting for configurations to be available.',
    };
    const result = {
      loading: true,
    };

    sandbox.stub(SystemApi.prototype, 'getSystemState').resolves(getSystemStateResponse);

    const stateAccessor = {
      getState: () => initState,
      updateState(s) {
        actual = { ...s };
      },
    };

    await systemState(stateAccessor);
    expect(actual.loading).to.equal(result.loading);
  });
});
