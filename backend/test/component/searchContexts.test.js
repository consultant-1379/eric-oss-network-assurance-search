import { createRequire } from 'module';
import qs from 'qs';
import { addMock, clearMocks } from '../mocks/modules/opensearchMock.js';

import { commonMockList, checkEndpoint, errorResponseCheck } from './app.test.js';
import factory from './factory.js';
import { isSearchContextsPayload } from './responseValidation.js';

const require = createRequire(import.meta.url);
const apiConfig = require('../../config/api-config.json');

const testingConstants = {
  testingResultString1: 'should return 400 due to no query parameters being sent.',
  testingResultString2:
    'Invalid search object: the payload is not a valid search contexts response object',
  fakeContextId: '1a2b3c4d5e',
};

// the first test case's before hook will load app.js and its dependencies
// not all dependencies are mocked, as app.test is also kind of integration test
// the first import of some non-mocked 3pp libs can take up to 5 seconds
// see ADPRS-415 for more details
const INITAL_LOAD_TIMEOUT = 120_000;

const searchResponseCheck = (response) => {
  const { body } = response;
  if (!isSearchContextsPayload(body)) {
    throw new Error(testingConstants.testingResultString2);
  }
};

const expectedErrorResponseCheck = async (request, parameters) => {
  await checkEndpoint(
    request,
    apiConfig.api.routes.searchContexts,
    400,
    errorResponseCheck,
    qs.stringify(parameters),
  );
};

const expectedPassResponseCheck = async (request, parameters) => {
  await checkEndpoint(
    request,
    apiConfig.api.routes.searchContexts,
    200,
    searchResponseCheck,
    qs.stringify(parameters),
  );
};

const { loadServer, closeServer } = factory();

describe(`${apiConfig.api.routes.searchContexts} unit tests`, () => {
  let request;

  // eslint-disable-next-line func-names
  before(async function () {
    this.timeout(INITAL_LOAD_TIMEOUT);
    request = await loadServer(...commonMockList);
  });

  after(async () => {
    await closeServer();
  });
  const orderByEnum = ['asc', 'desc'];

  beforeEach(() => {
    clearMocks();
  });

  // Not sending any query parameters
  it(testingConstants.testingResultString1, async () => {
    await checkEndpoint(request, apiConfig.api.routes.searchContexts, 400, errorResponseCheck);
  });

  // Sending `filters` query parameter as a string
  it('should return 400 due to the `filters` query parameter being a string.', async () => {
    await expectedErrorResponseCheck(request, {
      filters: 'InvalidFilterValue',
    });
  });

  // Sending `filters` query parameter as an array with an invalid EntityFilter object
  it('should return 400 due to the `filters` query parameter being an array with an invalid EntityFilter object.', async () => {
    await expectedErrorResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          not: true,
          entityType: { name: 'c_SNSSAI' },
        },
      ],
    });
  });

  // Sending `filters` query parameter as an array with a valid EntityFilter object
  it('should return 200 due to the valid `filters` query parameters.', async () => {
    const tc1Query1 = require('../mocks/opensearch/search/contexts/entityFilter/query1.json');
    const tc1Query1Response = require('../mocks/opensearch/search/contexts/entityFilter/query1Response.json');

    addMock(tc1Query1, tc1Query1Response);

    await expectedPassResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
    });
  });

  // Sending a `contextTypeId` query parameter as an array
  it('should return 400 due to the `contextTypeId` query parameter being an array.', async () => {
    await expectedErrorResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      contextTypeId: ['NF_SNSSAI'],
    });
  });

  // Sending `contextTypeId` query parameter as an empty string
  it('should return 400 due to the `contextTypeId` query parameter being an empty string.', async () => {
    await expectedErrorResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      contextTypeId: '',
    });
  });

  // Sending valid `filters` and `contextTypeId` query parameters
  it('should return 200 due to the valid `filters` and `contextTypeId` query parameters.', async () => {
    const tc2Query1 = require('../mocks/opensearch/search/contexts/contextTypeId/query1.json');
    const tc2Query1Response = require('../mocks/opensearch/search/contexts/contextTypeId/query1Response.json');

    addMock(tc2Query1, tc2Query1Response);

    await expectedPassResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      contextTypeId: 'SNSSAI_Site',
    });
  });

  // Sending invalid `sortBy` query parameter (string)
  it('should return 400 due to `sortBy` query parameter being a string.', async () => {
    await expectedErrorResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      sortBy: 'invalid',
    });
  });

  // Sending invalid `sortBy` query parameter (array)
  it('should return 400 due to `sortBy` query parameter being an array.', async () => {
    await expectedErrorResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      sortBy: ['invalid'],
    });
  });

  // Sending invalid `sortBy` query parameter (invalid MetricType object)
  it('should return 400 due to `sortBy` query parameter being an invalid MetricType object.', async () => {
    await expectedErrorResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      sortBy: { name: 'AMFMeanReg', valueType: 'integer', description: 'AMF Mean' },
    });
  });

  // Sending invalid `sortBy` query parameter (invalid EntityType object)
  it('should return 400 due to `sortBy` query parameter being an invalid EntityType object.', async () => {
    await expectedErrorResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      sortBy: { name: 'My SNSSAI' },
    });
  });

  // Sending valid `filters` query parameter and a valid `sortBy` query parameter (valid MetricType object)
  it('should return 200 with valid payload due to valid `filters`, and `sortBy` (valid MetricType object) query parameters.', async () => {
    const tc3Query1 = require('../mocks/opensearch/search/contexts/metricTypeSortBy/query1.json');
    const tc3Query1Response = require('../mocks/opensearch/search/contexts/metricTypeSortBy/query1Response.json');

    addMock(tc3Query1, tc3Query1Response);

    await expectedPassResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      sortBy: {
        id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
      },
    });
  });

  // Sending valid `filters` query parameter and a valid `sortBy` query parameter (valid EntityType object)
  it('should return 200 with valid payload due to valid `filters` and `sortBy` (valid EntityType object) query parameters.', async () => {
    const tc4Query1 = require('../mocks/opensearch/search/contexts/entitySortBy/query1.json');
    const tc4Query1Response = require('../mocks/opensearch/search/contexts/entitySortBy/query1Response.json');

    addMock(tc4Query1, tc4Query1Response);

    await expectedPassResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      sortBy: { id: 'c_SNSSAI' },
    });
  });

  // Sending valid `filters` and `sortBy` query parameters and an invalid `sortOrder` query parameter (array)
  it('should return 400 due to `sortOrder` query parameter being a array.', async () => {
    await expectedErrorResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      sortBy: { id: 'vi_NF_SNSSAI_AMFMeanRegNbr' },
      sortOrder: ['asc'],
    });
  });

  // Sending valid `filters` and `sortBy` query parameters and an invalid `sortOrder` query parameter
  it('should return 400 due to `sortOrder` query parameter containing an invalid enum value.', async () => {
    await expectedErrorResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      sortBy: { id: 'vi_NF_SNSSAI_AMFMeanRegNbr' },
      sortOrder: 'ascend',
    });
  });

  // Sending valid `filters`, `sortBy`, and `sortOrder` query parameters
  it('should return 200 with valid payload due to valid `filters`, `sortBy`, and `sortOrder` query parameters.', async () => {
    const tc5Query1 = require('../mocks/opensearch/search/contexts/sortOrderAsc/query1.json');
    const tc5Query1Response = require('../mocks/opensearch/search/contexts/sortOrderAsc/query1Response.json');

    addMock(tc5Query1, tc5Query1Response);

    await expectedPassResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      sortBy: { id: 'c_SNSSAI' },
      sortOrder: orderByEnum[0],
    });
  });

  // Sending valid `filters`, `sortBy`, and `sortOrder` query parameters
  it('should return 200 with valid payload due to valid `filters`, `sortBy`, and `sortOrder` query parameters.', async () => {
    const tc6Query1 = require('../mocks/opensearch/search/contexts/sortOrderDesc/query1.json');
    const tc6Query1Response = require('../mocks/opensearch/search/contexts/sortOrderDesc/query1Response.json');

    addMock(tc6Query1, tc6Query1Response);

    await expectedPassResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      sortBy: { id: 'c_SNSSAI' },
      sortOrder: orderByEnum[1],
    });
  });

  // Sending an invalid `offset` query parameter (a string)
  it('should return 400 due to the `offset` query parameter being a string.', async () => {
    await expectedErrorResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      offset: 'invalid',
    });
  });

  // Sending an invalid `offset` query parameter (number less than 0)
  it('should return 400 due to the `offset` query parameter being a number less than 0.', async () => {
    await expectedErrorResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      offset: -1,
    });
  });

  // Sending a valid `offset` query parameter (number greater than 0)
  it('should return 200 with valid payload due to the `offset` query parameter being a number greater than 0.', async () => {
    const tc7Query1 = require('../mocks/opensearch/search/contexts/offset/query1.json');
    const tc7Query1Response = require('../mocks/opensearch/search/contexts/offset/query1Response.json');

    addMock(tc7Query1, tc7Query1Response);

    await expectedPassResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      offset: 1,
    });
  });

  // Sending an invalid `length` query parameter (a string)
  it('should return 400 due to the `length` query parameter being a string.', async () => {
    await expectedErrorResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      length: 'invalid',
    });
  });

  // Sending an invalid `length` query parameter (number less than 0)
  it('should return 400 due to the `length` query parameter being less than 0.', async () => {
    await expectedErrorResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      length: -1,
    });
  });

  // Sending an invalid `length` query parameter (number greater than 100)
  it('should return 400 due to the `length` query parameter being greater than 100.', async () => {
    await expectedErrorResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      length: 101,
    });
  });

  // Sending a valid `length` query parameter (testing lower boundary)
  it('should return 200 due to the `length` query parameter being 0.', async () => {
    const tc8Query1 = require('../mocks/opensearch/search/contexts/length_lowerBoundary/query1.json');
    const tc8Query1Response = require('../mocks/opensearch/search/contexts/length_lowerBoundary/query1Response.json');

    addMock(tc8Query1, tc8Query1Response);

    await expectedPassResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      length: 0,
    });
  });

  // Sending a valid `length` query parameter (testing upper boundary)
  it('should return 200 due to the `length` query parameter being 100.', async () => {
    const tc9Query1 = require('../mocks/opensearch/search/contexts/length_upperBoundary/query1.json');
    const tc9Query1Response = require('../mocks/opensearch/search/contexts/length_upperBoundary/query1Response.json');

    addMock(tc9Query1, tc9Query1Response);

    await expectedPassResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      length: 100,
    });
  });

  // Sending valid `offset` and `length` query parameters
  it('should return 200 with valid payload due to valid `offset` and `length` query parameters being sent.', async () => {
    const tc10Query1 = require('../mocks/opensearch/search/contexts/offset_and_length/query1.json');
    const tc10Query1Response = require('../mocks/opensearch/search/contexts/offset_and_length/query1Response.json');

    addMock(tc10Query1, tc10Query1Response);

    await expectedPassResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      offset: 1,
      length: 100,
    });
  });

  // Sending all query parameters at the same time with valid formats
  it('should return 200 with valid payload due to all query parameters being sent with valid formats.', async () => {
    const tc11Query1 = require('../mocks/opensearch/search/contexts/all/query1.json');
    const tc11Query1Response = require('../mocks/opensearch/search/contexts/all/query1Response.json');

    addMock(tc11Query1, tc11Query1Response);

    await expectedPassResponseCheck(request, {
      filters: [
        {
          type: 'entity',
          entityType: { id: 'c_SNSSAI' },
          searchPattern: '1:*',
        },
      ],
      contextTypeId: 'SNSSAI_Site',
      sortBy: { id: 'c_SNSSAI' },
      sortOrder: orderByEnum[1],
      offset: 1,
      length: 5,
    });
  });
});
