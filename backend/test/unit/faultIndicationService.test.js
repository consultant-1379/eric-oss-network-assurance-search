import { expect } from 'chai';
import * as td from 'testdouble';
import { createRequire } from 'module';

const require = createRequire(import.meta.url);
let faultIndicationMap = require('../mocks/dummy-files/fault-indication-map.json');

faultIndicationMap = JSON.parse(JSON.stringify(faultIndicationMap));

const FAULT_KEY = 'SAMPLE';

const loggingMock = {
  getLogger() {
    return {
      error(message) {
        return message;
      },
      info(message) {
        return message;
      },
    };
  },
};

const configManagerMock = {
  getFaultManagerConfig: () => ({
    clientId: 'eric-oss-network-assurance-search',
    brokerHostname: 'eric-data-message-bus-kf',
    brokerPort: '9092',
    producerTopic: 'AdpFaultIndication',
    serviceName: 'eric-oss-network-assurance-search',
    tls: {
      enabled: false,
    },
  }),
};

const schemaValidator = {
  validateFaultIndication: () => ({ valid: true }),
};

describe.skip('Unit tests for faultIndicationService', () => {
  describe('Testing faultIndication', () => {
    let faultIndication;
    const mockModules = async () => {
      await td.replaceEsm('../../utils/schemaValidator.js', { schemaValidator });
      await td.replaceEsm('../../services/logging.js', loggingMock);
      await td.replace(
        '../../services/faultHandler/faultIndicationDefaultsMap.json',
        faultIndicationMap,
      );
      await td.replaceEsm('../../config/configManager.js', null, configManagerMock);

      const { getFaultIndication } = await import(
        '../../services/faultHandler/faultIndicationService.js'
      );
      td.reset();
      return { getFaultIndication };
    };

    before(async () => {
      faultIndication = await mockModules();
    });

    it('should return correct fault indication', () => {
      const faultInd = faultIndication.getFaultIndication({ fault: FAULT_KEY });
      const defaultFI = faultIndicationMap[FAULT_KEY];
      const { faultName } = faultIndicationMap[FAULT_KEY];
      const { serviceName } = configManagerMock.getFaultManagerConfig();
      expect(faultInd.key).to.be.equal(`${serviceName}.${faultName}`);
      expect(faultInd.value).to.be.equal(JSON.stringify(defaultFI));
    });
    it('should apply custom config for fault indication', () => {
      const defaultFI = faultIndicationMap[FAULT_KEY];
      const customConfig1 = {
        version: 1,
      };
      const customConfig2 = {
        faultName: 'test',
        version: 2,
      };
      const defaultFaultInd = faultIndication.getFaultIndication({ fault: FAULT_KEY });
      expect(defaultFaultInd.value).to.be.equal(JSON.stringify(defaultFI));
      const faultInd1 = faultIndication.getFaultIndication({
        fault: FAULT_KEY,
        customConfig: customConfig1,
      });
      const conf1 = JSON.stringify(Object.assign(defaultFI, customConfig1));
      expect(faultInd1.value).to.be.equal(conf1);
      const faultInd2 = faultIndication.getFaultIndication({
        fault: FAULT_KEY,
        customConfig: customConfig2,
      });
      const conf2 = JSON.stringify(Object.assign(defaultFI, { version: 2 }));
      expect(faultInd2.value).to.be.equal(conf2);
    });
  });
});
