import { createRequire } from 'module';
import * as td from 'testdouble';
import * as fs from 'fs';

import factory from './factory.js';
import k8sClientMock from '../mocks/modules/k8s.client.mock.js';
import admZipMock from '../mocks/modules/admZip.mock.js';
import fsMock from '../mocks/modules/fsMock.js';
import { addMock } from '../mocks/modules/victoriaMetricsMock.js';
import { checkEndpoint, errorResponseCheck } from './app.test.js';
import { expectedErrorResponseCheck, expectedPassResponseCheck } from './searchMetrics.test.js';

const require = createRequire(import.meta.url);
const apiConfig = require('../../config/api-config.json');

const testingConstants = {
  testingResultString1: 'should return 400 due to no query parameters being sent.',
  testingResultString2:
    'Invalid search object: the payload is not a valid search metrics response object',
};

const orderByEnum = ['asc', 'desc'];

const PARAMS = {
  k8Client: '@kubernetes/client-node',
  admZip: 'adm-zip',
};

const loadServerK8sClient = { libName: PARAMS.k8Client, isDefault: true, impl: k8sClientMock };
const loadServerAdmZip = { libName: PARAMS.admZip, isDefault: true, impl: admZipMock };
const loadConfigMock = {
  libName: 'fs',
  isDefault: false,
  impl: fsMock({ uiServiceConfig: { persistenceEngine: 'vm' } }),
};
const commonMockList = [loadServerK8sClient, loadServerAdmZip, loadConfigMock];

// the first test case's before hook will load app.js and its dependencies
// not all dependencies are mocked, as app.test is also kind of integration test
// the first import of some non-mocked 3pp libs can take up to 5 seconds
// see ADPRS-415 for more details
const INITAL_LOAD_TIMEOUT = 120_000;

const importFileAsString = (path) => fs.readFileSync(require.resolve(path), { encoding: 'utf8' });

const { loadServer, closeServer } = factory();

describe(`VictoriaMetrics ${apiConfig.api.routes.searchMetrics} unit tests`, async () => {
  let request;

  // eslint-disable-next-line func-names
  before(async function () {
    this.timeout(INITAL_LOAD_TIMEOUT);
    request = await loadServer(...commonMockList);
  });

  after(async () => {
    await closeServer();
    td.reset();
  });

  // Not sending any query parameters
  it(testingConstants.testingResultString1, async () => {
    await checkEndpoint(request, apiConfig.api.routes.searchMetrics, 400, errorResponseCheck);
  });

  // Only sending `contextTypeId` query parameter as an array
  it('should return 400 due to the `contextTypeId` query parameter being an array.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: ['nf,snssai'],
    });
  });

  // Only sending `contextTypeId` query parameter as an empty string
  it('should return 400 due to the `contextTypeId` query parameter being an empty string.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: '',
    });
  });

  // Sending `metricTypes` query parameter as a string
  it('should return 400 due to the `metricTypes` query parameter being a string.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: 'InvalidMetricTypesValue',
    });
  });

  // Sending `metricTypes` query parameter as an array of invalid MetricType objects
  it('should return 400 due to the `metricTypes` query parameter being an array of invalid MetricType objects.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [{ invalid: 'vi_AMFMeanRegNbr' }, { test: 'vi_AMFMaxRegNbr' }],
    });
  });

  // Sending `metricTypes` query parameter as an array of two valid MetricType objects and one invalid MetricType object
  it('should return 400 due to the `metricTypes` query parameter being an array of two valid MetricType objects and one invalid MetricType object.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        { id: 'vi_AMFMeanRegNbr' },
        { id: 'vi_AMFMaxRegNbr' },
        { invalid: 'vi_AMFMaxRegNbr2' },
      ],
    });
  });

  // Sending `metricTypes` query parameter as an array of two valid MetricType objects
  it('should return 200 due to the valid `contextTypeId` and `metricTypes` query parameters.', async () => {
    const tc1Query = importFileAsString('../mocks/victoriametrics/search/metrics/basic/query.prom');
    const tc1Response = require('../mocks/victoriametrics/search/metrics/basic/response.json');

    addMock(tc1Query, tc1Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
        },
        {
          id: 'vi_AMFMaxRegNbr',
        },
      ],
    });
  });

  // Sending `filters` query parameter as a string
  it('should return 400 due to the `filters` query parameter being a string.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      filters: 'InvalidFilterValue',
    });
  });

  // Sending `filters` query parameter as an array with an invalid MetricFilter object
  it('should return 400 due to the `filters` query parameter being an array with an invalid MetricFilter object.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      filters: [
        {
          type: 'metric',
          from: 10,
        },
      ],
    });
  });

  // Sending `filters` query parameter as an array with an invalid EntityFilter object
  it('should return 400 due to the `filters` query parameter being an array with an invalid EntityFilter object.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      filters: [
        {
          type: 'entity',
          not: true,
          entityType: { name: 'snssai' },
        },
      ],
    });
  });

  // Sending `filters` query parameter as an array with a valid MetricFilter object
  it('should return 200 due to the valid `contextTypeId`, `metricTypes`, and `filters` (one valid MetricFilter object) query parameters.', async () => {
    const tc2Query = importFileAsString(
      '../mocks/victoriametrics/search/metrics/metricFilter/query.prom',
    );
    const tc2Response = require('../mocks/victoriametrics/search/metrics/metricFilter/response.json');

    addMock(tc2Query, tc2Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
        },
      ],
      filters: [
        {
          type: 'metric',
          metricType: {
            id: 'vi_AMFMeanRegNbr',
          },
          from: 108.3,
          to: 122.78,
        },
      ],
    });
  });

  // Sending `filters` query parameter as an array with a valid EntityFilter object
  it('should return 200 due to the valid `contextTypeId`, `metricTypes`, and `filters` (one valid EntityFilter object) query parameters.', async () => {
    const tc3Query = importFileAsString(
      '../mocks/victoriametrics/search/metrics/entityFilter/query.prom',
    );
    const tc3Response = require('../mocks/victoriametrics/search/metrics/entityFilter/response.json');

    addMock(tc3Query, tc3Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
        },
      ],
      filters: [
        {
          type: 'entity',
          entityType: { id: 'snssai' },
          searchPattern: '1-*',
        },
      ],
    });
  });

  // Sending `filters` query parameter as an array with a valid MetricFilter object and a valid EntityFilter object
  it('should return 200 due to the valid `contextTypeId`, `metricTypes`, and `filters` (one valid MetricFilter object and one valid EntityFilter object) query parameters.', async () => {
    const tc4Query = importFileAsString(
      '../mocks/victoriametrics/search/metrics/multiFilter/query.prom',
    );
    const tc4Response = require('../mocks/victoriametrics/search/metrics/multiFilter/response.json');

    addMock(tc4Query, tc4Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
        },
      ],
      filters: [
        {
          type: 'metric',
          metricType: {
            id: 'vi_AMFMeanRegNbr',
          },
          from: 110.3,
          to: 130.78,
        },
        {
          type: 'entity',
          entityType: { id: 'snssai' },
          searchPattern: '1-*',
        },
      ],
    });
  });

  // Sending invalid `sortBy` query parameter (string)
  it('should return 400 due to `sortBy` query parameter being a string.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      sortBy: 'invalid',
    });
  });

  // Sending invalid `sortBy` query parameter (array)
  it('should return 400 due to `sortBy` query parameter being an array.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      sortBy: ['invalid'],
    });
  });

  // Sending invalid `sortBy` query parameter (invalid MetricType object)
  it('should return 400 due to `sortBy` query parameter being an invalid MetricType object.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      sortBy: { name: 'AMFMeanReg', valueType: 'integer', description: 'AMF Mean' },
    });
  });

  // Sending invalid `sortBy` query parameter (invalid EntityType object)
  it('should return 400 due to `sortBy` query parameter being an invalid EntityType object.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      sortBy: { name: 'My SNSSAI' },
    });
  });

  // Sending valid `contextTypeId` query parameter and a valid `sortBy` query parameter (valid MetricType object)
  it('should return 200 with valid payload due to valid `contextTypeId`, `metricTypes`, and `sortBy` (valid MetricType object) query parameters.', async () => {
    const tc5Query = importFileAsString(
      '../mocks/victoriametrics/search/metrics/metricTypeSortBy/query.prom',
    );
    const tc5Response = require('../mocks/victoriametrics/search/metrics/metricTypeSortBy/response.json');

    addMock(tc5Query, tc5Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
        },
      ],
      sortBy: {
        id: 'vi_AMFMeanRegNbr',
      },
    });
  });

  // Sending valid `contextTypeId` query parameter and a valid `sortBy` query parameter (valid EntityType object)
  it('should return 200 with valid payload due to valid `contextTypeId` and `sortBy` (valid EntityType object) query parameters.', async () => {
    const tc6Query = importFileAsString(
      '../mocks/victoriametrics/search/metrics/entitySortBy/query.prom',
    );
    const tc6Response = require('../mocks/victoriametrics/search/metrics/entitySortBy/response.json');

    addMock(tc6Query, tc6Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      sortBy: { id: 'snssai' },
    });
  });

  // Sending valid `contextTypeId` and `sortBy` query parameters and an invalid `sortOrder` query parameter (array)
  it('should return 400 due to `sortOrder` query parameter being a array.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      sortBy: { id: 'vi_AMFMeanRegNbr' },
      sortOrder: ['asc'],
    });
  });

  // Sending valid `contextTypeId` and `sortBy` query parameters and an invalid `sortOrder` query parameter
  it('should return 400 due to `sortOrder` query parameter containing an invalid enum value.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      sortBy: { id: 'vi_AMFMeanRegNbr' },
      sortOrder: 'ascend',
    });
  });

  // Sending valid `contextTypeId`, `sortBy`, and `sortOrder` query parameters
  it('should return 200 with valid payload due to valid `contextTypeId`, `metricTypes`, `sortBy`, and `sortOrder` query parameters.', async () => {
    const tc7Query = importFileAsString(
      '../mocks/victoriametrics/search/metrics/sortOrder/query.prom',
    );
    const tc7Response = require('../mocks/victoriametrics/search/metrics/sortOrder/response.json');

    addMock(tc7Query, tc7Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
        },
      ],
      sortBy: { id: 'vi_AMFMeanRegNbr' },
      sortOrder: orderByEnum[0],
    });
  });

  // Sending an invalid `offset` query parameter (a string)
  it('should return 400 due to the `offset` query parameter being a string.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      offset: 'invalid',
    });
  });

  // Sending an invalid `offset` query parameter (number less than 0)
  it('should return 400 due to the `offset` query parameter being a number less than 0.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      offset: -1,
    });
  });

  // Sending a valid `offset` query parameter (number greater than 0)
  it('should return 200 with valid payload due to the `offset` query parameter being a number greater than 0.', async () => {
    const tc8Query = importFileAsString(
      '../mocks/victoriametrics/search/metrics/offset/query.prom',
    );
    const tc8Response = require('../mocks/victoriametrics/search/metrics/offset/response.json');

    addMock(tc8Query, tc8Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
        },
      ],
      offset: 1,
    });
  });

  // Sending an invalid `length` query parameter (a string)
  it('should return 400 due to the `length` query parameter being a string.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      length: 'invalid',
    });
  });

  // Sending an invalid `length` query parameter (number less than 0)
  it('should return 400 due to the `length` query parameter being less than 0.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      length: -1,
    });
  });

  // Sending an invalid `length` query parameter (number greater than 100)
  it('should return 400 due to the `length` query parameter being greater than 100.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      length: 101,
    });
  });

  // Sending a valid `length` query parameter (testing lower boundary)
  it('should return 200 due to the `length` query parameter being 0.', async () => {
    const tc9Query = importFileAsString(
      '../mocks/victoriametrics/search/metrics/length/query.prom',
    );

    addMock(tc9Query, []);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
        },
      ],
      length: 0,
    });
  });

  // Sending a valid `length` query parameter (testing upper boundary)
  it('should return 200 due to the `length` query parameter being 100.', async () => {
    const tc10Query = importFileAsString(
      '../mocks/victoriametrics/search/metrics/length_upperBoundary/query.prom',
    );
    const tc10Response = require('../mocks/victoriametrics/search/metrics/length_upperBoundary/response.json');

    addMock(tc10Query, tc10Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
        },
      ],
      length: 100,
    });
  });

  // Sending valid `offset` and `length` query parameters
  it('should return 200 with valid payload due to valid `offset` and `length` query parameters being sent.', async () => {
    const tc11Query = importFileAsString(
      '../mocks/victoriametrics/search/metrics/offset_and_length/query.prom',
    );
    const tc11Response = require('../mocks/victoriametrics/search/metrics/offset_and_length/response.json');

    addMock(tc11Query, tc11Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
        },
      ],
      offset: 1,
      length: 2,
    });
  });

  // Sending all query parameters at the same time with valid formats
  it('should return 200 with valid payload due to all query parameters being sent with valid formats.', async () => {
    const tc12Query = importFileAsString('../mocks/victoriametrics/search/metrics/all/query.prom');
    const tc12Response = require('../mocks/victoriametrics/search/metrics/all/response.json');

    addMock(tc12Query, tc12Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'nf,snssai',
      metricTypes: [
        {
          id: 'vi_AMFMeanRegNbr',
        },
      ],
      filters: [
        {
          type: 'metric',
          metricType: {
            id: 'vi_AMFMeanRegNbr',
          },
          from: 102,
          to: 160.78,
        },
        {
          type: 'entity',
          entityType: { id: 'snssai' },
          searchPattern: '1-*',
        },
      ],
      sortBy: { id: 'vi_AMFMeanRegNbr' },
      sortOrder: orderByEnum[0],
      offset: 0,
      length: 5,
    });
  });
});
