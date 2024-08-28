import { expect } from 'chai';
import * as td from 'testdouble';
import { createRequire } from 'module';
import qs from 'qs';
import k8sClientMock from '../mocks/modules/k8s.client.mock.js';
import nodeFetchMock from '../mocks/modules/nodeFetch.mock.js';
import admZipMock from '../mocks/modules/admZip.mock.js';
import service1ObjectHelpApp from '../mocks/serviceobjects/service-1-app.serviceobject.js';
import service2ObjectHelpApp from '../mocks/serviceobjects/service-2-app.serviceobject.js';
import annotationApp from '../mocks/serviceobjects/annotation.serviceobject.js';
import * as loggingMock from '../mocks/modules/logging.mock.js';
import ConfigManagerMock from '../mocks/modules/configManagerMock.js';
import client from '../mocks/modules/opensearchMock.js';

import Utils from '../Utils.js';
import factory from './factory.js';
import {
  isMetadataContextsPayload,
  isMetadataRelationsPayload,
  isMetadataMetricsPayload,
  isMetadataAllPayload,
  isMetadataIndexesPayload,
} from './responseValidation.js';

import { METADATA_RELATIONS_DOCS } from '../mocks/mock-api-responses/mock-data/index_metadata_relations/constants.js';

const require = createRequire(import.meta.url);
const apiConfig = require('../../config/api-config.json');
const helpPackageMetadataService1Pkg1 = require('../mocks/config-files/help-package-metadata-service-1-pkg-1.json');
const helpPackageMetadataService1Pkg2 = require('../mocks/config-files/help-package-metadata-service-1-pkg-2.json');
const helpPackageMetadataService2Pkg1 = require('../mocks/config-files/help-package-metadata-valid-service-pkg-1.json');

const { requestDomainService, getMergedPackageData } = Utils;

const PARAMS = {
  k8Client: '@kubernetes/client-node',
  nodeFetch: 'node-fetch',
  fs: 'fs',
  admZip: 'adm-zip',
  ContentType: 'Content-Type',
  chokidar: 'chokidar',
  openSearch: '../../utils/openSearchConnectionUtil.js',
};

// the first test case's before hook will load app.js and its dependencies
// not all dependencies are mocked, as app.test is also kind of integration test
// the first import of some non-mocked 3pp libs can take up to 5 seconds
// see ADPRS-415 for more details
const INITAL_LOAD_TIMEOUT = 120_000;

const URLS = ['/metadata/relations', '/metadata/contexts', '/metadata/metrics', '/metadata'];

const endpointURIs = {
  status: '/status',
};

const testingConstants = {
  testingResultString1: 'should return 400 due to no query parameters being sent.',
  testingResultString2: 'Invalid search object: the payload is not a valid search response object',
  fakeContextId: '1a2b3c4d5e',
};

const responseContentCheck = (response, contentLength, expectedContent) => {
  const content = response.body;
  expect(content).to.have.lengthOf(contentLength);
  expect(content).to.deep.eq(expectedContent);
};

const checkEndpoint = async (request, endpoint, httpCode, responseCheck, queryParameters = {}) =>
  request
    .get(`${apiConfig.api.prefix}${endpoint.replace('/:index', '/soa')}`)
    .query(queryParameters)
    .set('Accept', 'application/json')
    .expect(httpCode)
    .expect(responseCheck);

const errorResponseCheck = (response) => {
  const { body } = response;
  try {
    expect(body.code).exist;
    expect(body.message).exist;
  } catch {
    throw new Error('Invalid error message format');
  }
};

const metadataRelationsResponseCheck = (response) => {
  const { body } = response;
  if (!isMetadataRelationsPayload(body)) {
    throw new Error(
      'Invalid /metadata/relations response object: the payload is not a valid /metadata/relations response object',
    );
  }
};

const metadataContextsResponseCheck = (response) => {
  const { body } = response;
  if (!isMetadataContextsPayload(body)) {
    throw new Error(
      'Invalid /metadata/context response object: the payload is not a valid /metadata/context response object',
    );
  }
};

const metadataMetricsResponseCheck = (response) => {
  const { body } = response;
  if (!isMetadataMetricsPayload(body)) {
    throw new Error(
      'Invalid /metadata/metrics response object: the payload is not a valid /metadata/metrics response object',
    );
  }
};

const metadataAllResponseCheck = (response) => {
  const { body } = response;
  if (!isMetadataAllPayload(body)) {
    throw new Error(
      'Invalid /metadata response object: the payload is not a valid /metadata response object',
    );
  }
};

const metadataIndexesResponseCheck = (response) => {
  const { body } = response;
  if (!isMetadataIndexesPayload(body)) {
    throw new Error(
      'Invalid /metadata/indexes response object: the payload is not a valid /metadata/indexes response object',
    );
  }
};

const fsMock = {
  promises: {
    mkdir: () => true,
  },
  writeFileSync: () => true,
  existsSync: () => true,
  readFileSync: () => true,
};

const service1PackageData = getMergedPackageData({
  packageList: [
    {
      packageData: helpPackageMetadataService1Pkg1,
      packageName: 'doc-1',
      serviceUid: 'help-content-service-1-1.0.2-2',
    },
    {
      packageData: helpPackageMetadataService1Pkg2,
      packageName: 'doc-2',
      serviceUid: 'help-content-service-1-1.0.2-2',
    },
  ],
});

const service12PackageData = getMergedPackageData({
  existingDocuments: [...service1PackageData.documents],
  existingGroups: [...service1PackageData.groups],
  packageList: [
    {
      packageData: helpPackageMetadataService2Pkg1,
      packageName: 'service-doc-1',
      serviceUid: 'help-content-service-2-1.0',
    },
  ],
});

const loadServerK8sClient = { libName: PARAMS.k8Client, isDefault: true, impl: k8sClientMock };
const loadServerNodeFetch = { libName: PARAMS.nodeFetch, isDefault: true, impl: nodeFetchMock };
const loadServerAdmZip = { libName: PARAMS.admZip, isDefault: true, impl: admZipMock };
const loadOpenSearchMock = { libName: PARAMS.openSearch, isDefault: true, impl: client };
const loadServerFs = { libName: PARAMS.fs, impl: fsMock };
const commonMockList = [
  loadServerK8sClient,
  loadServerNodeFetch,
  loadServerAdmZip,
  loadServerFs,
  loadOpenSearchMock,
];

describe('Component tests for app.js', () => {
  const { loadServer, closeServer } = factory();

  let request;

  describe('Testing parameter validation', () => {
    // eslint-disable-next-line func-names
    before(async function () {
      this.timeout(INITAL_LOAD_TIMEOUT);
      request = await loadServer(...commonMockList);
    });

    after(async () => {
      await closeServer();
    });

    describe(`${apiConfig.api.routes.metadataRelations} unit tests`, () => {
      // Not sending any query parameters
      it(testingConstants.testingResultString1, async () => {
        await checkEndpoint(
          request,
          apiConfig.api.routes.metadataRelations,
          400,
          errorResponseCheck,
        );
      });

      // Only sending `contextTypeId' query parameter as an array
      it('should return 400 due to the `contextTypeId` query parameter being an array', async () => {
        const parameters = {
          contextTypeId: ['Invalid ContextTypeId'],
        };
        await checkEndpoint(
          request,
          apiConfig.api.routes.metadataRelations,
          400,
          errorResponseCheck,
          qs.stringify(parameters),
        );
      });

      // Only sending `contextTypeId' query parameter as an object
      it("should return 400 due to the `contextTypeId' query parameter being an object", async () => {
        const parameters = {
          contextTypeId: { id: 'Invalid ContextTypeId' },
        };
        await checkEndpoint(
          request,
          apiConfig.api.routes.metadataRelations,
          400,
          errorResponseCheck,
          qs.stringify(parameters),
        );
      });

      // Missing the `contextTypeId' query parameter
      it("should return 400 due to missing the `contextTypeId' query parameter", async () => {
        const parameters = {
          contextTypeIds: 'My ContextType ABC',
        };
        await checkEndpoint(
          request,
          apiConfig.api.routes.metadataRelations,
          400,
          errorResponseCheck,
          qs.stringify(parameters),
        );
      });

      // Only sending `contextTypeId' query parameter as an empty string
      it("should return 400 due to the `contextTypeId' query parameter being an empty string", async () => {
        const parameters = {
          contextTypeId: '',
        };
        await checkEndpoint(
          request,
          apiConfig.api.routes.metadataRelations,
          400,
          errorResponseCheck,
          qs.stringify(parameters),
        );
      });

      // Only sending the `contextTypeId' query parameter
      it("should return 200 due to the `contextTypeId' query parameter", async () => {
        await Promise.all(
          Array.from(METADATA_RELATIONS_DOCS.keys()).map(async (contextTypeId) => {
            const parameters = { contextTypeId };
            await checkEndpoint(
              request,
              apiConfig.api.routes.metadataRelations,
              200,
              metadataRelationsResponseCheck,
              qs.stringify(parameters),
            );
          }),
        );
      });
    });

    describe(`${apiConfig.api.routes.metadataContexts} unit tests`, () => {
      it('should return 200 with a valid array of ContextType objects as the payload.', async () => {
        await checkEndpoint(
          request,
          apiConfig.api.routes.metadataContexts,
          200,
          metadataContextsResponseCheck,
        );
      });
    });

    describe(`${apiConfig.api.routes.metadataMetrics} unit tests`, () => {
      // Not sending any query parameters
      it(testingConstants.testingResultString1, async () => {
        await checkEndpoint(request, apiConfig.api.routes.metadataMetrics, 400, errorResponseCheck);
      });

      // Only sending `contextTypeId` query parameter as an array
      it('should return 400 due to the `contextTypeId` query parameter being an array.', async () => {
        const parameters = {
          contextTypeId: ['NF_SNSSAI'],
        };
        await checkEndpoint(
          request,
          apiConfig.api.routes.metadataMetrics,
          400,
          errorResponseCheck,
          qs.stringify(parameters),
        );
      });

      // Only sending `contextTypeId` query parameter as an empty string
      it('should return 400 due to the `contextTypeId` query parameter being an empty string.', async () => {
        const parameters = {
          contextTypeId: '',
        };
        await checkEndpoint(
          request,
          apiConfig.api.routes.metadataMetrics,
          400,
          errorResponseCheck,
          qs.stringify(parameters),
        );
      });

      // Sending `contextTypeId` query parameter as a valid string
      it('should return 200 due to the valid `contextTypeId` query parameter.', async () => {
        const parameters = {
          contextTypeId: 'SNSSAI_NSI',
        };
        await checkEndpoint(
          request,
          apiConfig.api.routes.metadataMetrics,
          200,
          metadataMetricsResponseCheck,
          qs.stringify(parameters),
        );
      });
    });

    describe(`${apiConfig.api.routes.metadataAll} unit tests`, () => {
      it('should return 200 with a valid metadata payload.', async () => {
        await checkEndpoint(
          request,
          apiConfig.api.routes.metadataAll,
          200,
          metadataAllResponseCheck,
        );
      });
    });

    describe(`${apiConfig.api.routes.metadataIndexes} unit tests`, () => {
      it('should return 200 with a valid metadata/indexes payload.', async () => {
        await checkEndpoint(
          request,
          apiConfig.api.routes.metadataIndexes,
          200,
          metadataIndexesResponseCheck,
        );
      });
    });

    describe(`${endpointURIs.status} unit tests`, () => {
      it('should return 200.', (done) => {
        request.get(endpointURIs.status).expect(200, done);
      });
    });
  });

  describe.skip('Testing empty state', () => {
    // eslint-disable-next-line func-names
    before(async function () {
      this.timeout(INITAL_LOAD_TIMEOUT);
      request = await loadServer(loadServerK8sClient);
    });

    after(async () => {
      await closeServer();
    });

    URLS.forEach((url) =>
      it(`should return an empty array for /${url}`, (done) => {
        request.get(`/soa${url}`).expect(400, done);
      }),
    );
  });

  describe.skip('Testing state with one valid client', () => {
    before(async () => {
      request = await loadServer(...commonMockList);
    });

    after(async () => {
      await closeServer();
    });

    URLS.forEach((url) =>
      it(`should return a single client's list for /${url}`, async () => {
        await requestDomainService(service1ObjectHelpApp);
        await request
          .get(`'/soa'${url}`)
          .expect(PARAMS.ContentType, /application\/json/)
          .expect((response) => {
            responseContentCheck(
              response,
              service1PackageData[url].length,
              service1PackageData[url],
            );
          });
      }),
    );
  });

  describe.skip('Testing state with two valid clients', () => {
    before(async () => {
      request = await loadServer(...commonMockList);
    });

    after(async () => {
      await closeServer();
    });

    URLS.forEach((url) =>
      it(`should return merged list from two clients for /${url}`, async () => {
        await requestDomainService(service1ObjectHelpApp);
        await requestDomainService(service2ObjectHelpApp);
        await request
          .get(`'/soa'${url}`)
          .expect(PARAMS.ContentType, /application\/json/)
          .expect((response) => {
            responseContentCheck(
              response,
              service12PackageData[url].length,
              service12PackageData[url],
            );
          });
      }),
    );
  });

  describe.skip('Refresh endpoint tests', () => {
    let synchronizationService;
    const INVALID_SERVICE_NAME = 'test_service';
    const URL = '/help-meta/v1/services';
    const CONTENT_TYPE = 'Content-type';
    const CONTENT_VALUE = 'application/json';
    const K8S_LABEL = 'app.kubernetes.io/name';
    const VALID_NAME = annotationApp.metadata.labels[K8S_LABEL];

    // eslint-disable-next-line func-names
    before(async function () {
      this.timeout(INITAL_LOAD_TIMEOUT);

      await td.replaceEsm('../../services/logging.js', loggingMock);
      await td.replaceEsm('../../config/configManager.js', null, new ConfigManagerMock());
      synchronizationService = (await import('../../services/synchronizationService.js')).default;
      td.reset();

      request = await loadServer(loadServerK8sClient, loadServerNodeFetch, {
        libName: '../../services/synchronizationService.js',
        isDefault: true,
        impl: synchronizationService,
      });
    });
    after(async () => {
      await closeServer();
    });

    it(`should return 400 if body required prop is not present`, async () => {
      await requestDomainService(annotationApp);
      await request
        .put(`${URL}/${INVALID_SERVICE_NAME}`)
        .set(CONTENT_TYPE, CONTENT_VALUE)
        .send({ value: INVALID_SERVICE_NAME })
        .expect(400);
    });

    it(`should return 400 if required param is not present`, async () => {
      await requestDomainService(annotationApp);
      await request
        .put(URL)
        .set(CONTENT_TYPE, CONTENT_VALUE)
        .send({ value: INVALID_SERVICE_NAME })
        .expect(400);
    });

    it(`should return 404 for not valid service refresh`, async () => {
      await requestDomainService(annotationApp);
      await request
        .put(`${URL}/${INVALID_SERVICE_NAME}`)
        .set(CONTENT_TYPE, CONTENT_VALUE)
        .send({ name: INVALID_SERVICE_NAME })
        .expect(404);
    });

    it(`should return 400 if param and body value not the same`, async () => {
      await requestDomainService(annotationApp);
      await request
        .put(`${URL}/${INVALID_SERVICE_NAME}`)
        .set(CONTENT_TYPE, CONTENT_VALUE)
        .send({ name: VALID_NAME })
        .expect(400);
    });

    describe('Refresh propagation tests', () => {
      afterEach(() => {
        td.reset();
      });

      it(`should return 202 for valid and available service refresh`, async () => {
        await requestDomainService(annotationApp);
        await request
          .put(`${URL}/${VALID_NAME}`)
          .set(CONTENT_TYPE, CONTENT_VALUE)
          .send({ name: VALID_NAME })
          .expect(202);
      });

      it(`should propagate refresh to other pods`, async () => {
        const _getLocalIPFake = td.replace(synchronizationService, '_getLocalIP');
        const _getClusterIPsFake = td.replace(synchronizationService, '_getClusterIPs');
        td.when(_getLocalIPFake()).thenReturn(['1']);
        td.when(_getClusterIPsFake()).thenReturn(['1', '2', '3', '4']);
        const propagateSpy = td.replace(
          synchronizationService,
          'propagateRefresh',
          synchronizationService.propagateRefresh.bind(synchronizationService),
        );
        const requestSpy = td.replace(synchronizationService, '_sendRequest');

        await requestDomainService(annotationApp);
        await request
          .put(`${URL}/${VALID_NAME}`)
          .set(CONTENT_TYPE, CONTENT_VALUE)
          .send({ name: VALID_NAME })
          .expect(202);
        td.verify(propagateSpy(), { times: 1, ignoreExtraArgs: true });
        td.verify(requestSpy(), { times: 3, ignoreExtraArgs: true });
      });

      it(`returns 500 and error if dns lookup fails`, async () => {
        const ERROR_TEXT = 'TEST_ERROR';

        const _getIPFor = td.replace(synchronizationService, '_getIPFor');
        td.when(_getIPFor(td.matchers.anything())).thenThrow({ name: ERROR_TEXT });

        await requestDomainService(annotationApp);
        await request
          .put(`${URL}/${VALID_NAME}`)
          .set(CONTENT_TYPE, CONTENT_VALUE)
          .send({ name: VALID_NAME })
          .expect(500)
          .expect((response) => {
            expect(response.text).to.be.eq(JSON.stringify({ errors: { name: ERROR_TEXT } }));
          });
      });
    });
  });
});

export { commonMockList, checkEndpoint, errorResponseCheck };
