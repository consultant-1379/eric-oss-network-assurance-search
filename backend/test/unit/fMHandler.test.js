import { expect } from 'chai';
import { EventEmitter } from 'events';
import td from '../testdouble.js';
import CONSTANTS from '../../config/constants.js';

let fMHandler;
const baseFaultManagerConfig = {
  enabled: false,
  tls: {
    enabled: false,
  },
  clientId: 'temp-id',
  brokerHostname: 'temp-hostname',
  brokerPort: '3030',
  producerTopic: 'tempProducerTopic',
  serviceName: 'service-name',
};

const configManagerMock = new EventEmitter();
configManagerMock.getFaultManagerConfig = () => baseFaultManagerConfig;

const getTLSOptionsSpy = td.func();
const certificateManagerMock = new EventEmitter();
certificateManagerMock.getTLSOptions = getTLSOptionsSpy;

const loggingServiceMock = new EventEmitter();
const loggerMock = {
  loggingService: loggingServiceMock,
  getLogger: () => ({
    error: () => true,
    info: () => true,
    debug: () => true,
  }),
};

describe.skip('Unit tests for fMHandler.js', () => {
  let produceFaultIndicationSpy;
  let setFaultManagerConfigSpy;
  let getFaultManagerConfigSpy;
  const mockModules = async () => {
    await td.replaceEsm('../../config/configManager.js', null, configManagerMock);
    await td.replaceEsm('../../services/logging.js', loggerMock);
    await td.replaceEsm('../../services/certificateManager.js', null, certificateManagerMock);
    fMHandler = (await import('../../services/faultHandler/fMHandler.js')).default;
    td.reset();
  };

  // eslint-disable-next-line func-names
  beforeEach(async function () {
    this.timeout(10_000);
    td.when(getTLSOptionsSpy(), { ignoreExtraArgs: true }).thenReturn(true);

    await mockModules();

    produceFaultIndicationSpy = td.replace(fMHandler, 'produceFaultIndication');
    getFaultManagerConfigSpy = td.spyProp(configManagerMock, 'getFaultManagerConfig');
    setFaultManagerConfigSpy = td.replace(fMHandler, 'setFaultManagerConfig');
  });

  afterEach(() => {
    td.reset();
  });

  it('should listen to "config-changed" event', () => {
    configManagerMock.emit('config-changed', { name: CONSTANTS.CONTAINER_CONFIG_NAME });

    expect(td.explain(getFaultManagerConfigSpy).callCount > 0).to.be.true;

    td.verify(
      setFaultManagerConfigSpy({
        config: configManagerMock.getFaultManagerConfig(),
        certData: certificateManagerMock.getTLSOptions(),
      }),
      {
        times: 1,
      },
    );
  });

  it('should listen to certificate changes', () => {
    certificateManagerMock.emit('certificates-changed', 'faultHandler');

    expect(td.explain(getFaultManagerConfigSpy).callCount > 0).to.be.true;

    td.verify(
      setFaultManagerConfigSpy({
        config: configManagerMock.getFaultManagerConfig(),
        certData: certificateManagerMock.getTLSOptions(),
      }),
      {
        times: 1,
      },
    );

    td.verify(getTLSOptionsSpy(), {
      ignoreExtraArgs: true,
    });
  });

  it('should produce fault indication on reading service certificate error', () => {
    const certDir = 'path/to/certificate';
    const fmHandlerArg = {
      fault: 'CERTIFICATE_ERROR',
      customConfig: {
        description: `Service certificate missing. Could not read certificate files for ${certDir}.`,
      },
    };
    certificateManagerMock.emit('certificates-read-error', certDir);

    td.verify(produceFaultIndicationSpy(fmHandlerArg), { times: 1 });
  });

  it('should produce fault indication on reading server certificate error', () => {
    const certDir = 'path/to/certificate';
    const fmHandlerArg = {
      fault: 'CERTIFICATE_ERROR',
      customConfig: {
        description: `Server certificate missing. Could not read certificate files for ${certDir}.`,
      },
    };
    certificateManagerMock.emit('server-certificates-read-error', certDir);

    td.verify(produceFaultIndicationSpy(fmHandlerArg), { times: 1 });
  });

  it('should produce fault indication on logging terminate connection', () => {
    const errorMessage = 'Syslog Error, connection terminated.';
    const fmHandlerArg = {
      fault: 'LOG_TRANSFORMER_ERROR',
      customConfig: {
        description: errorMessage,
      },
    };
    loggerMock.loggingService.emit('syslog-error', new Error(errorMessage));

    td.verify(produceFaultIndicationSpy(fmHandlerArg), { times: 1 });
  });
});
