import { expect } from 'chai';
import { createRequire } from 'module';
import * as td from 'testdouble';
import * as fs from 'fs';
import {
  createContext,
  transformSearchMetricsData,
  getVmSearchMetrics,
} from '../../../../../services/assurance/search/victoriametrics/metrics.js';
import { addMock } from '../../../../mocks/modules/victoriaMetricsMock.js';
import ConfigManagerMock from '../../../../mocks/modules/configManagerMock.js';

const require = createRequire(import.meta.url);

const importFileAsString = (path) => fs.readFileSync(require.resolve(path), { encoding: 'utf8' });

describe('Unit tests for VictoriaMetrics search functions', () => {
  afterEach(async () => {
    td.reset();
  });

  describe('tests for createContext', () => {
    it('should return a Context object when a valid metric data object is passed in', () => {
      const metricData = {
        metric: {
          context: 'nf',
          nf: 'AMF_ON2',
          vd_DTSNSI: '209',
          vd_N3DownstreamThr: '248',
          vd_PDUSesMeanNbr: '279',
          vd_PDUSessEstSR: '121',
          vi_AMFMaxRegNbr: '143',
          vi_AMFMeanRegNbr: '92',
        },
        value: [1715965212, '1'],
      };
      const expected = {
        type: {
          id: 'nf',
          contextFields: [
            {
              id: 'nf',
            },
          ],
        },
        contextFields: [
          {
            id: 'nf_AMF_ON2',
            name: 'AMF_ON2',
            type: {
              id: 'nf',
            },
          },
        ],
      };
      const actual = createContext(metricData);
      expect(actual).to.deep.equal(expected);
    });

    it('should return an empty Context object when an empty object is passed in', () => {
      const expected = {
        type: {
          id: 'unknown',
          contextFields: [],
        },
        contextFields: [],
      };
      const actual = createContext({});
      expect(actual).to.deep.equal(expected);
    });

    it('should return a semi-empty Context object when a semi-empty object is passed in', () => {
      const metricData = {
        metric: {
          context: 'nf',
        },
      };
      const expected = {
        type: {
          id: 'nf',
          contextFields: [
            {
              id: 'nf',
            },
          ],
        },
        contextFields: [
          {
            id: 'nf_unknown',
            name: 'unknown',
            type: {
              id: 'nf',
            },
          },
        ],
      };
      const actual = createContext(metricData);
      expect(actual).to.deep.equal(expected);
    });
  });

  describe('tests for transformSearchMetricsData', () => {
    it('should return an empty search response when the input data is empty', () => {
      expect(
        transformSearchMetricsData(
          {
            data: {
              result: [],
            },
          },
          {},
        ),
      ).to.deep.equal({ length: 0, offset: 0, results: [], total: 0 });
    });
  });

  describe('tests for getVmSearchMetrics', () => {
    const query = {
      contextTypeId: 'nf',
      metricTypes: [
        { id: 'vi_AMFMeanRegNbr' },
        { id: 'vi_AMFMaxRegNbr' },
        { id: 'vd_DTSNSI' },
        { id: 'vd_N3DownstreamThr' },
        { id: 'vd_PDUSesMeanNbr' },
        { id: 'vd_PDUSessEstSR' },
      ],
      offset: 0,
      length: 2,
    };

    it('should call victoria metrics API', async () => {
      await td.replaceEsm('../../config/configManager.js', null, new ConfigManagerMock());
      const { fetchResponse } = await td.replaceEsm('../../../../../utils/NetworkUtil.js');
      getVmSearchMetrics({ query }).then((done) => {
        expect(fetchResponse).to.be.calledWith('/api/v1/query', 'testServiceName');
        done();
      });
    });

    it('should return a response object with the expected properties', async () => {
      // Setting up the mocked response from VictoriaMetrics
      const expectedVmQuery = importFileAsString(
        '../../../../mocks/services/assurance/search/victoriametrics/metrics/getVmSearchMetrics/query.prom',
      );
      const mockedVmResponse = require('../../../../mocks/services/assurance/search/victoriametrics/metrics/getVmSearchMetrics/response.json');
      addMock(expectedVmQuery, mockedVmResponse);

      const { offset, length, total, results } = await getVmSearchMetrics({ query });

      /**
       * Expecting the property values of the response object to be equal to
       * certain query parameter values.
       */
      expect(offset).to.equal(query.offset);
      expect(length).to.equal(query.length);

      // Expecting the `results` property value to be an array
      expect(Array.isArray(results)).to.be.true;

      /**
       * Expecting the length of the `results` property value to be equal to the
       * `total` property value.
       */
      expect(results.length).to.equal(total);
    });
  });
});
