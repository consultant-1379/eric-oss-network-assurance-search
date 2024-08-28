import { expect } from 'chai';
import { createRequire } from 'module';
import pick from 'lodash/pick.js';
import factory from './factory.js';
import CONSTANTS from '../../config/constants.js';
import { commonMockList } from './app.test.js';

const require = createRequire(import.meta.url);
const apiConfig = require('../../config/api-config.json');
const customizationFile = require('../../config/backend-service-config/customization-service-config.json');

const checkInternalEndpoint = async (request, endpoint, httpCode, responseCheck) =>
  request
    .get(`${apiConfig.internal.prefix}${endpoint}`)
    .set('Accept', 'application/json')
    .expect(httpCode)
    .expect(responseCheck);

const uiConfigResponseCheck = (response) => {
  const { body } = response;
  const expectedResponse = pick(
    customizationFile,
    CONSTANTS.CUSTOMIZATION_DASHBOARD_METADATA_FIELDS,
  );
  expect(body).to.be.eql(expectedResponse);
};

// the first test case's before hook will load app.js and its dependencies
// not all dependencies are mocked, as app.test is also kind of integration test
// the first import of some non-mocked 3pp libs can take up to 5 seconds
// see ADPRS-415 for more details
const INITAL_LOAD_TIMEOUT = 120_000;

describe('Component tests for internal API endpoints', () => {
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

  describe(`${
    apiConfig.internal.prefix + apiConfig.internal.routes.configuration
  } unit tests`, () => {
    it(`should return a proper response on the ${apiConfig.internal.routes.configuration} request`, async () => {
      await checkInternalEndpoint(
        request,
        apiConfig.internal.routes.configuration,
        200,
        uiConfigResponseCheck,
      );
    });
  });
});
