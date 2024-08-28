import { expect } from 'chai';
import { createRequire } from 'module';
import factory from './factory.js';
import CONSTANTS from '../../config/constants.js';
import { commonMockList } from './app.test.js';

const require = createRequire(import.meta.url);
const apiConfig = require('../../config/api-config.json');

const checkEndpoint = async (request, endpoint, httpCode, responseCheck) =>
  request
    .get(`${apiConfig.serviceAggregationApi.prefix}${endpoint}`)
    .set('Accept', 'application/json')
    .expect(httpCode)
    .expect(responseCheck);

const uiResponseCheck = (response) => {
  const { body } = response;
  expect(body).to.be.empty;
};

const faviconResponseCheck = (response) => {
  const { body } = response;
  expect(body).to.be.empty;
};

// the first test case's before hook will load app.js and its dependencies
// not all dependencies are mocked, as app.test is also kind of integration test
// the first import of some non-mocked 3pp libs can take up to 5 seconds
// see ADPRS-415 for more details
const INITAL_LOAD_TIMEOUT = 120_000;

describe('Component tests for serviceAggregationApi API endpoints', () => {
  const { loadServer, closeServer } = factory();

  let request;

  // eslint-disable-next-line func-names
  before(async function () {
    this.timeout(INITAL_LOAD_TIMEOUT);
    request = await loadServer(...commonMockList);
  });

  after(async () => {
    await closeServer();
  });

  it('should return a proper response on the /internal-api/ui request', async () => {
    await checkEndpoint(request, apiConfig.serviceAggregationApi.routes.ui, 200, uiResponseCheck);
  });

  it('should return a proper response on the /internal-api/favicon.ico request', async () => {
    await checkEndpoint(request, CONSTANTS.FAVICON_ROUTE, 404, faviconResponseCheck);
  });
});
