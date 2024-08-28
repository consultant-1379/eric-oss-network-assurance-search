import { createRequire } from 'module';
import qs from 'qs';
import { addMock, clearMocks } from '../mocks/modules/opensearchMock.js';
import { commonMockList, checkEndpoint, errorResponseCheck } from './app.test.js';
import factory from './factory.js';
import { isSearchRelatedContextsFacetsPayload } from './responseValidation.js';

const require = createRequire(import.meta.url);
const apiConfig = require('../../config/api-config.json');

const testingConstants = {
  testingResultString1: 'should return 400 due to no query parameters being sent.',
  testingResultString2:
    'Invalid search object: the payload is not a valid search related contexts facets response object',
};

// the first test case's before hook will load app.js and its dependencies
// not all dependencies are mocked, as app.test is also kind of integration test
// the first import of some non-mocked 3pp libs can take up to 5 seconds
// see ADPRS-415 for more details
const INITAL_LOAD_TIMEOUT = 120_000;

const searchResponseCheck = (response) => {
  const { body } = response;
  if (!isSearchRelatedContextsFacetsPayload(body)) {
    throw new Error(testingConstants.testingResultString2);
  }
};

const expectedErrorResponseCheck = async (request, parameters) => {
  await checkEndpoint(
    request,
    apiConfig.api.routes.searchRelatedContextsFacets,
    400,
    errorResponseCheck,
    qs.stringify(parameters),
  );
};

const expectedPassResponseCheck = async (request, parameters) => {
  await checkEndpoint(
    request,
    apiConfig.api.routes.searchRelatedContextsFacets,
    200,
    searchResponseCheck,
    qs.stringify(parameters),
  );
};

const { loadServer, closeServer } = factory();

describe(`${apiConfig.api.routes.searchRelatedContextsFacets} unit tests`, () => {
  let request;

  // eslint-disable-next-line func-names
  before(async function () {
    this.timeout(INITAL_LOAD_TIMEOUT);
    request = await loadServer(...commonMockList);
  });

  after(async () => {
    await closeServer();
  });

  beforeEach(() => {
    clearMocks();
  });

  // Not sending any query parameters
  it(testingConstants.testingResultString1, async () => {
    await expectedErrorResponseCheck(request, {});
  });

  // Sending valid `contextTypeId` and `contextId` query parameters
  it('should return 200 due to sending valid `contextTypeId` and `contextId` query parameters.', async () => {
    const tc1Query1 = require('../mocks/opensearch/search/relatedContextsFacets/all/q1.json');
    const tc1Query2 = require('../mocks/opensearch/search/relatedContextsFacets/all/q2.json');
    const tc1Query3 = require('../mocks/opensearch/search/relatedContextsFacets/all/q3.json');
    const tc1Query4 = require('../mocks/opensearch/search/relatedContextsFacets/all/q4.json');
    const tc1Query5 = require('../mocks/opensearch/search/relatedContextsFacets/all/q5.json');
    const tc1Query1Response = require('../mocks/opensearch/search/relatedContextsFacets/all/r1.json');
    const tc1Query2Response = require('../mocks/opensearch/search/relatedContextsFacets/all/r2.json');
    const tc1Query3Response = require('../mocks/opensearch/search/relatedContextsFacets/all/r3.json');
    const tc1Query4Response = require('../mocks/opensearch/search/relatedContextsFacets/all/r4.json');
    const tc1Query5Response = require('../mocks/opensearch/search/relatedContextsFacets/all/r5.json');

    addMock(tc1Query1, tc1Query1Response);
    addMock(tc1Query2, tc1Query2Response);
    addMock(tc1Query3, tc1Query3Response);
    addMock(tc1Query4, tc1Query4Response);
    addMock(tc1Query5, tc1Query5Response);

    await expectedPassResponseCheck(request, {
      contextTypeId: 'NF_NSI',
      contextId: {
        type: {
          id: 'NF_NSI',
          contextFields: [{ id: 'c_NF' }, { id: 'c_NSI' }],
        },
        contextFields: [
          {
            id: 'AMF_BC',
            type: {
              id: 'c_NF',
            },
          },
          {
            id: 'Slice1',
            type: {
              id: 'c_NSI',
            },
          },
        ],
      },
    });
  });

  // Only sending a valid `contextTypeId` query parameter
  it('should return 400 due to only sending a valid `contextTypeId` query parameter.', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'NF_NSI',
    });
  });

  // Only sending a valid `contextId` query parameter
  it('should return 400 due to only sending a valid `contextId` query parameter.', async () => {
    await expectedErrorResponseCheck(request, {
      contextId: {
        type: {
          id: 'NF_NSI',
          contextFields: [{ id: 'c_NF' }, { id: 'c_NSI' }],
        },
        contextFields: [
          {
            id: 'AMF_BC',
            type: {
              id: 'c_NF',
            },
          },
          {
            id: 'Slice1',
            type: {
              id: 'c_NSI',
            },
          },
        ],
      },
    });
  });

  // Sending an invalid `contextTypeId` query parameter and a valid `contextId` query parameter
  it('should return 400 due to sending an invalid `contextTypeId` query parameter (array).', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: ['NF_NSI'],
      contextId: {
        type: {
          id: 'NF_NSI',
          contextFields: [{ id: 'c_NF' }, { id: 'c_NSI' }],
        },
        contextFields: [
          {
            id: 'AMF_BC',
            type: {
              id: 'c_NF',
            },
          },
          {
            id: 'Slice1',
            type: {
              id: 'c_NSI',
            },
          },
        ],
      },
    });
  });

  // Sending a valid `contextTypeId` query parameter and an invalid `contextId` query parameter
  it('should return 400 due to sending an invalid `contextId` query parameter .', async () => {
    await expectedErrorResponseCheck(request, {
      contextTypeId: 'NF_NSI',
      contextId: {
        type: {
          id: 'NF_NSI',
          contextFields: [{ id: 'c_NF' }, { id: 'c_NSI' }],
        },
        contextFields: [
          {
            id: 'AMF_BC',
            type: {
              invalidProperty: 'c_NF',
            },
          },
          {
            id: 'Slice1',
            type: {
              id: 'c_NSI',
            },
          },
        ],
      },
    });
  });
});
