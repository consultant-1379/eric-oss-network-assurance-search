import { createRequire } from 'module';
import * as td from 'testdouble';
import qs from 'qs';

import factory from './factory.js';
import fsMock from '../mocks/modules/fsMock.js';
import { addMock, clearMocks } from '../mocks/modules/opensearchMock.js';
import { commonMockList, checkEndpoint, errorResponseCheck } from './app.test.js';
import { isSearchMetricsPayload } from './responseValidation.js';

const require = createRequire(import.meta.url);
const apiConfig = require('../../config/api-config.json');

const testingConstants = {
  testingResultString1: 'should return 400 due to no query parameters being sent.',
  testingResultString2:
    'Invalid search object: the payload is not a valid search metrics response object',
};

const orderByEnum = ['asc', 'desc'];

const loadConfigMock = {
  libName: 'fs',
  isDefault: false,
  impl: fsMock({ uiServiceConfig: { persistenceEngine: 'os' } }),
};

// the first test case's before hook will load app.js and its dependencies
// not all dependencies are mocked, as app.test is also kind of integration test
// the first import of some non-mocked 3pp libs can take up to 5 seconds
// see ADPRS-415 for more details
const INITAL_LOAD_TIMEOUT = 120_000;

const searchResponseCheck = (response) => {
  const { body } = response;
  if (!isSearchMetricsPayload(body)) {
    throw new Error(testingConstants.testingResultString2);
  }
};

const expectedErrorResponseCheck = async (request, parameters) => {
  await checkEndpoint(
    request,
    apiConfig.api.routes.searchMetrics,
    400,
    errorResponseCheck,
    qs.stringify(parameters),
  );
};

const expectedPassResponseCheck = async (request, parameters) => {
  await checkEndpoint(
    request,
    apiConfig.api.routes.searchMetrics,
    200,
    searchResponseCheck,
    qs.stringify(parameters),
  );
};

const { loadServer, closeServer } = factory();

describe(`OpenSearch ${apiConfig.api.routes.searchMetrics} unit tests`, () => {
  let request;

  // eslint-disable-next-line func-names
  before(async function () {
    this.timeout(INITAL_LOAD_TIMEOUT);
    request = await loadServer(...commonMockList, loadConfigMock);
  });

  beforeEach(() => {
    clearMocks();
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
      contextTypeId: ['NF_SNSSAI'],
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
      contextTypeId: 'NF_SNSSAI',
      metricTypes: 'InvalidMetricTypesValue',
    });
  });

  // Sending `metricTypes` query parameter as an array of invalid MetricType objects
  it('should return 400 due to the `metricTypes` query parameter being an array of invalid MetricType objects.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        { invalid: 'vi_NF_SNSSAI_AMFMeanRegNbr' },
        { test: 'vi_NF_SNSSAI_sessionModificationReqRcvd' },
      ],
    });
  });

  // Sending `metricTypes` query parameter as an array of two valid MetricType objects and one invalid MetricType object
  it('should return 400 due to the `metricTypes` query parameter being an array of two valid MetricType objects and one invalid MetricType object.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        { id: 'vi_NF_SNSSAI_AMFMeanRegNbr' },
        { id: 'vi_NF_SNSSAI_sessionModificationReqRcvd' },
        { invalid: 'vi_NF_SNSSAI_sessionModificationReqRcvd' },
      ],
    });
  });

  // Sending `metricTypes` query parameter as an array of two valid MetricType objects
  it('should return 200 due to the valid `contextTypeId` and `metricTypes` query parameters.', async () => {
    const tc2Query1 = require('../mocks/opensearch/search/metrics/basic/query1.json');
    const tc2Query2 = require('../mocks/opensearch/search/metrics/basic/query2.json');
    const tc2Query1Response = require('../mocks/opensearch/search/metrics/basic/query1Response.json');
    const tc2Query2Response = require('../mocks/opensearch/search/metrics/basic/query2Response.json');

    addMock(tc2Query1, tc2Query1Response);
    addMock(tc2Query2, tc2Query2Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
        },
        {
          id: 'vi_NF_SNSSAI_sessionModificationReqRcvd',
        },
      ],
    });
  });

  // Sending `filters` query parameter as a string
  it('should return 400 due to the `filters` query parameter being a string.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
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
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
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
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      filters: [
        {
          type: 'entity',
          not: true,
          entityType: { name: 'c_SNSSAI' },
        },
      ],
    });
  });

  // Sending `filters` query parameter as an array with a valid MetricFilter object
  it('should return 200 due to the valid `contextTypeId`, `metricTypes`, and `filters` (one valid MetricFilter object) query parameters.', async () => {
    const tc3Query1 = require('../mocks/opensearch/search/metrics/metricFilter/query1.json');
    const tc3Query2 = require('../mocks/opensearch/search/metrics/metricFilter/query2.json');
    const tc3Query1Response = require('../mocks/opensearch/search/metrics/metricFilter/query1Response.json');
    const tc3Query2Response = require('../mocks/opensearch/search/metrics/metricFilter/query2Response.json');

    addMock(tc3Query1, tc3Query1Response);
    addMock(tc3Query2, tc3Query2Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
        },
      ],
      filters: [
        {
          type: 'metric',
          metricType: {
            id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
          },
          from: 8.3,
          to: 42.78,
        },
      ],
    });
  });

  // Sending `filters` query parameter as an array with a valid EntityFilter object
  it('should return 200 due to the valid `contextTypeId`, `metricTypes`, and `filters` (one valid EntityFilter object) query parameters.', async () => {
    const tc4Query1 = require('../mocks/opensearch/search/metrics/entityFilter/query1.json');
    const tc4Query2 = require('../mocks/opensearch/search/metrics/entityFilter/query2.json');
    const tc4Query1Response = require('../mocks/opensearch/search/metrics/entityFilter/query1Response.json');
    const tc4Query2Response = require('../mocks/opensearch/search/metrics/entityFilter/query2Response.json');

    addMock(tc4Query1, tc4Query1Response);
    addMock(tc4Query2, tc4Query2Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
        },
      ],
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
    });
  });

  // Sending `filters` query parameter as an array with a valid MetricFilter object and a valid EntityFilter object
  it('should return 200 due to the valid `contextTypeId`, `metricTypes`, and `filters` (one valid MetricFilter object and one valid EntityFilter object) query parameters.', async () => {
    const tc5Query1 = require('../mocks/opensearch/search/metrics/multiFilter/query1.json');
    const tc5Query2 = require('../mocks/opensearch/search/metrics/multiFilter/query2.json');
    const tc5Query1Response = require('../mocks/opensearch/search/metrics/multiFilter/query1Response.json');
    const tc5Query2Response = require('../mocks/opensearch/search/metrics/multiFilter/query2Response.json');

    addMock(tc5Query1, tc5Query1Response);
    addMock(tc5Query2, tc5Query2Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
        },
      ],
      filters: [
        {
          type: 'metric',
          metricType: {
            id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
          },
          from: 10.3,
          to: 30.78,
        },
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
    });
  });

  // Sending invalid `sortBy` query parameter (string)
  it('should return 400 due to `sortBy` query parameter being a string.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
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
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
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
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
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
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
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
    const tc6Query1 = require('../mocks/opensearch/search/metrics/metricTypeSortBy/query1.json');
    const tc6Query2 = require('../mocks/opensearch/search/metrics/metricTypeSortBy/query2.json');
    const tc6Query1Response = require('../mocks/opensearch/search/metrics/metricTypeSortBy/query1Response.json');
    const tc6Query2Response = require('../mocks/opensearch/search/metrics/metricTypeSortBy/query2Response.json');

    addMock(tc6Query1, tc6Query1Response);
    addMock(tc6Query2, tc6Query2Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
        },
      ],
      sortBy: {
        id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
      },
    });
  });

  // Sending valid `contextTypeId` query parameter and a valid `sortBy` query parameter (valid EntityType object)
  it('should return 200 with valid payload due to valid `contextTypeId` and `sortBy` (valid EntityType object) query parameters.', async () => {
    const tc7Query1 = require('../mocks/opensearch/search/metrics/entitySortBy/query1.json');
    const tc7Query2 = require('../mocks/opensearch/search/metrics/entitySortBy/query2.json');
    const tc7Query1Response = require('../mocks/opensearch/search/metrics/entitySortBy/query1Response.json');
    const tc7Query2Response = require('../mocks/opensearch/search/metrics/entitySortBy/query2Response.json');

    addMock(tc7Query1, tc7Query1Response);
    addMock(tc7Query2, tc7Query2Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      sortBy: { id: 'c_SNSSAI' },
    });
  });

  // Sending valid `contextTypeId` and `sortBy` query parameters and an invalid `sortOrder` query parameter (array)
  it('should return 400 due to `sortOrder` query parameter being a array.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      sortBy: { id: 'vi_NF_SNSSAI_AMFMeanRegNbr' },
      sortOrder: ['asc'],
    });
  });

  // Sending valid `contextTypeId` and `sortBy` query parameters and an invalid `sortOrder` query parameter
  it('should return 400 due to `sortOrder` query parameter containing an invalid enum value.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
          name: 'AMFMeanReg',
          valueType: 'integer',
          description: 'AMF Mean',
        },
      ],
      sortBy: { id: 'vi_NF_SNSSAI_AMFMeanRegNbr' },
      sortOrder: 'ascend',
    });
  });

  // Sending valid `contextTypeId`, `sortBy`, and `sortOrder` query parameters
  it('should return 200 with valid payload due to valid `contextTypeId`, `metricTypes`, `sortBy`, and `sortOrder` query parameters.', async () => {
    const tc8Query1 = require('../mocks/opensearch/search/metrics/sortOrder/query1.json');
    const tc8Query2 = require('../mocks/opensearch/search/metrics/sortOrder/query2.json');
    const tc8Query1Response = require('../mocks/opensearch/search/metrics/sortOrder/query1Response.json');
    const tc8Query2Response = require('../mocks/opensearch/search/metrics/sortOrder/query2Response.json');

    addMock(tc8Query1, tc8Query1Response);
    addMock(tc8Query2, tc8Query2Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
        },
      ],
      sortBy: { id: 'vi_NF_SNSSAI_AMFMeanRegNbr' },
      sortOrder: orderByEnum[0],
    });
  });

  // Sending an invalid `offset` query parameter (a string)
  it('should return 400 due to the `offset` query parameter being a string.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
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
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
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
    const tc9Query1 = require('../mocks/opensearch/search/metrics/offset/query1.json');
    const tc9Query2 = require('../mocks/opensearch/search/metrics/offset/query2.json');
    const tc9Query1Response = require('../mocks/opensearch/search/metrics/offset/query1Response.json');
    const tc9Query2Response = require('../mocks/opensearch/search/metrics/offset/query2Response.json');

    addMock(tc9Query1, tc9Query1Response);
    addMock(tc9Query2, tc9Query2Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
        },
      ],
      offset: 1,
    });
  });

  // Sending an invalid `length` query parameter (a string)
  it('should return 400 due to the `length` query parameter being a string.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
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
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
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
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
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
    const tc10Query1 = require('../mocks/opensearch/search/metrics/length/query1.json');
    const tc10Query2 = require('../mocks/opensearch/search/metrics/length/query2.json');
    const tc10Query1Response = require('../mocks/opensearch/search/metrics/length/query1Response.json');
    const tc10Query2Response = require('../mocks/opensearch/search/metrics/length/query2Response.json');

    addMock(tc10Query1, tc10Query1Response);
    addMock(tc10Query2, tc10Query2Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
        },
      ],
      length: 0,
    });
  });

  // Sending a valid `length` query parameter (testing upper boundary)
  it('should return 200 due to the `length` query parameter being 100.', async () => {
    const tc11Query1 = require('../mocks/opensearch/search/metrics/length_upperBoundary/query1.json');
    const tc11Query2 = require('../mocks/opensearch/search/metrics/length_upperBoundary/query2.json');
    const tc11Query1Response = require('../mocks/opensearch/search/metrics/length_upperBoundary/query1Response.json');
    const tc11Query2Response = require('../mocks/opensearch/search/metrics/length_upperBoundary/query2Response.json');

    addMock(tc11Query1, tc11Query1Response);
    addMock(tc11Query2, tc11Query2Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
        },
      ],
      length: 100,
    });
  });

  // Sending valid `offset` and `length` query parameters
  it('should return 200 with valid payload due to valid `offset` and `length` query parameters being sent.', async () => {
    const tc12Query1 = require('../mocks/opensearch/search/metrics/offset_and_length/query1.json');
    const tc12Query2 = require('../mocks/opensearch/search/metrics/offset_and_length/query2.json');
    const tc12Query1Response = require('../mocks/opensearch/search/metrics/offset_and_length/query1Response.json');
    const tc12Query2Response = require('../mocks/opensearch/search/metrics/offset_and_length/query2Response.json');

    addMock(tc12Query1, tc12Query1Response);
    addMock(tc12Query2, tc12Query2Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
        },
      ],
      offset: 1,
      length: 100,
    });
  });

  // Sending all query parameters at the same time with valid formats
  it('should return 200 with valid payload due to all query parameters being sent with valid formats.', async () => {
    const tc13Query1 = require('../mocks/opensearch/search/metrics/all/query1.json');
    const tc13Query2 = require('../mocks/opensearch/search/metrics/all/query2.json');
    const tc13Query1Response = require('../mocks/opensearch/search/metrics/all/query1Response.json');
    const tc13Query2Response = require('../mocks/opensearch/search/metrics/all/query2Response.json');

    addMock(tc13Query1, tc13Query1Response);
    addMock(tc13Query2, tc13Query2Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'NF_SNSSAI',
      metricTypes: [
        {
          id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
        },
      ],
      filters: [
        {
          type: 'metric',
          metricType: {
            id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
          },
          from: 2,
          to: 60.78,
        },
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      sortBy: { id: 'vi_NF_SNSSAI_AMFMeanRegNbr' },
      sortOrder: orderByEnum[0],
      offset: 0,
      length: 100,
    });
  });
});

export { searchResponseCheck, expectedErrorResponseCheck, expectedPassResponseCheck };
