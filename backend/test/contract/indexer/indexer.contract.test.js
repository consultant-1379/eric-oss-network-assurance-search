import { expect } from 'chai';
import { MatchersV3 } from '@pact-foundation/pact';
import {
  getIndexerList,
  getIndexerFullContexts,
  getMetrics,
} from '../../../services/assurance/indexerInfo.js';
import { provider } from './pact.js';
import externalApiConfig from '../../../config/external-api-config.js';

const { eachLike } = MatchersV3;

const queryParameters = {
  validIndexName: 'assurance-searchEngineIndexName',
  invalidIndexName: 'invalidSearchEngineIndexName',
  validFullContextName: 'Context4_c1',
  invalidFullContextName: 'invalidContext',
};
const headers = {
  'Content-Type': 'application/json',
};
const invalidRequestResponse = {
  code: 404,
  message: 'Not Found',
};
const testDescriptions = {
  invalidRequestTestDescription: 'will receive a Bad Request response',
  valuesForFullContext: 'there are values for a full context',
};

describe('Contract tests on Assurance Indexer API', () => {
  describe('given there are search engine indexes', () => {
    describe('when a call to the search-engine-index-list endpoint of the Assurance Indexer API is made', () => {
      const expectedSearchEngineIndex = {
        name: 'soa',
        displayName: 'soa_DisplayName',
        indexDescription: 'Description of soa',
      };
      before(async () => {
        provider
          .given('there are search engine indexes')
          .uponReceiving('a request for search engine indexes')
          .withRequest({
            method: 'GET',
            path: externalApiConfig.INDEXER_LIST,
            headers,
          })
          .willRespondWith({
            status: 200,
            headers,
            body: eachLike(expectedSearchEngineIndex),
          });
      });
      it('will receive the list of search engine indexes', async () =>
        provider.executeTest(async (mockserver) => {
          process.env.INDEXER_URL = mockserver.url;
          return expect(await getIndexerList()).to.deep.equals([expectedSearchEngineIndex]);
        }));
    });
  });

  describe('given there are full contexts', () => {
    describe('when a call to the fullcontexts endpoint of the Assurance Indexer API is made', () => {
      const expectedFullContextDocument = {
        documentName: 'full_context',
        fullContext: [
          {
            name: 'Context4_c1',
            context: [
              {
                name: 'c1',
                displayName: 'Context1_DisplayName',
                documentName: 'c_c1',
                description: 'Context1_Description',
              },
              {
                name: 'Context4',
                displayName: 'Context2_DisplayName',
                documentName: 'c_Context4',
                description: null,
              },
            ],
          },
          {
            name: 'Context0_c1',
            context: [
              {
                name: 'c1',
                displayName: 'Context1_DisplayName',
                documentName: 'c_c1',
                description: 'Context1_Description',
              },
              {
                name: 'Context0',
                displayName: 'Context2_DisplayName',
                documentName: 'c_Context0',
                description: null,
              },
            ],
          },
        ],
      };
      before(async () => {
        provider
          .given('there are full contexts')
          .uponReceiving('a request for full contexts')
          .withRequest({
            method: 'GET',
            path: externalApiConfig.INDEXER_FULLCONTEXTS,
            query: {
              searchEngineIndexName: queryParameters.validIndexName,
            },
            headers,
          })
          .willRespondWith({
            status: 200,
            headers,
            body: eachLike(expectedFullContextDocument),
          });
      });

      it('will receive the list of full context documents', async () =>
        provider.executeTest(async (mockserver) => {
          process.env.INDEXER_URL = mockserver.url;
          return expect(
            await getIndexerFullContexts({ params: { index: queryParameters.validIndexName } }),
          ).to.deep.equals([expectedFullContextDocument]);
        }));
    });

    describe('when a call to the fullcontexts endpoint of the Assurance Indexer API is made with an invalid `searchEngineIndexName` query parameter', () => {
      before(async () => {
        provider
          .given('there are full contexts')
          .uponReceiving(
            'a request for full contexts with an invalid `searchEngineIndexName` query parameter',
          )
          .withRequest({
            method: 'GET',
            path: externalApiConfig.INDEXER_FULLCONTEXTS,
            query: {
              searchEngineIndexName: queryParameters.invalidIndexName,
            },
            headers,
          })
          .willRespondWith({
            status: 404,
            headers,
          });
      });

      it(testDescriptions.invalidRequestTestDescription, async () =>
        provider.executeTest(async (mockserver) => {
          process.env.INDEXER_URL = mockserver.url;
          return expect(
            await getIndexerFullContexts({ params: { index: queryParameters.invalidIndexName } }),
          ).to.deep.equals(invalidRequestResponse);
        }),
      );
    });
  });

  describe('given there are values for a full context', () => {
    describe('when a call to the values-for-fullcontext endpoint of the Assurance Indexer API is made', () => {
      const expectedValueObject = {
        name: 'valueFieldX-name',
        type: 'float',
        valueContextDocumentName: 'value_context',
        valueDocumentName: 'vd_ContextA_ContextB_valueFieldX-name',
        description: 'valueFieldX Description',
      };

      const expectedValuesForFullContext = {
        value: eachLike(expectedValueObject),
      };

      before(async () => {
        provider
          .given(testDescriptions.valuesForFullContext)
          .uponReceiving('a request for values for a full context')
          .withRequest({
            method: 'GET',
            path: externalApiConfig.INDEXER_VALUES_FOR_FULLCONTEXT,
            query: {
              searchEngineIndexName: queryParameters.validIndexName,
              fullContextName: queryParameters.validFullContextName,
            },
            headers,
          })
          .willRespondWith({
            status: 200,
            body: expectedValuesForFullContext,
            headers,
          });
      });

      it('will receive the list of value documents for a full context', async () =>
        provider.executeTest(async (mockserver) => {
          process.env.INDEXER_URL = mockserver.url;
          const response = await getMetrics({
            params: { index: queryParameters.validIndexName },
            query: { contextTypeId: queryParameters.validFullContextName },
          });
          expect(response.value).to.deep.equals([expectedValueObject]);
        }));
    });

    describe('when a call to the values-for-fullcontext endpoint of the Assurance Indexer API is made with an invalid `searchEngineIndexName` query parameter', () => {
      before(async () => {
        provider
          .given(testDescriptions.valuesForFullContext)
          .uponReceiving(
            'a request for values for a full context with an invalid `searchEngineIndexName` query parameter',
          )
          .withRequest({
            method: 'GET',
            path: externalApiConfig.INDEXER_VALUES_FOR_FULLCONTEXT,
            query: {
              searchEngineIndexName: queryParameters.invalidIndexName,
              fullContextName: queryParameters.validFullContextName,
            },
            headers,
          })
          .willRespondWith({
            status: 404,
            headers,
          });
      });

      it(testDescriptions.invalidRequestTestDescription, async () =>
        provider.executeTest(async (mockserver) => {
          process.env.INDEXER_URL = mockserver.url;
          return expect(
            await getMetrics({
              params: { index: queryParameters.invalidIndexName },
              query: { contextTypeId: queryParameters.validFullContextName },
            }),
          ).to.deep.equals(invalidRequestResponse);
        }),
      );
    });

    describe('when a call to the values-for-fullcontext endpoint of the Assurance Indexer API is made with an invalid `fullContextName` query parameter', () => {
      before(async () => {
        provider
          .given(testDescriptions.valuesForFullContext)
          .uponReceiving(
            'a request for values for a full context with an invalid `fullContextName` query parameter',
          )
          .withRequest({
            method: 'GET',
            path: externalApiConfig.INDEXER_VALUES_FOR_FULLCONTEXT,
            query: {
              searchEngineIndexName: queryParameters.validIndexName,
              fullContextName: queryParameters.invalidFullContextName,
            },
            headers,
          })
          .willRespondWith({
            status: 404,
            headers,
          });
      });

      it(testDescriptions.invalidRequestTestDescription, async () =>
        provider.executeTest(async (mockserver) => {
          process.env.INDEXER_URL = mockserver.url;
          return expect(
            await getMetrics({
              params: { index: queryParameters.validIndexName },
              query: { contextTypeId: queryParameters.invalidFullContextName },
            }),
          ).to.deep.equals(invalidRequestResponse);
        }),
      );
    });
  });
});
