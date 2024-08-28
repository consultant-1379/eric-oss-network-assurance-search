/**
 * This is a Opensearch test driver that can be used for unit testing.
 *
 * This test driver allows develoopers to specify opensearch queries
 * and return a mocked result.
 *
 * for more information, please see the following NPM package
 * https://www.npmjs.com/package/@short.io/opensearch-mock
 */

import { Client } from '@opensearch-project/opensearch';
import Mock from '@short.io/opensearch-mock';

const nodeEndpoint = 'http://localhost:9200';

const mock = new Mock();
const client = new Client({
  node: nodeEndpoint,
  Connection: mock.getConnection(),
});

/**
 * This function creates a mock endpoint that takes the opensearch query and outputs data defined by the tester
 * (see examples below)
 * @parameter opensearchQuery: mock query that we want to mimic
 * @parameter mockData: data for response fro above query
 */

function addMock(opensearchQuery, mockData) {
  mock.add(
    {
      method: 'POST',
      path: `/${opensearchQuery.index}/_search`,
      body: opensearchQuery.body,
    },
    () => mockData,
  );
}

function clearMocks() {
  mock.clearAll();
}

/**
 * @example: how to import the cient into a test:
 *
 * import * as opensearchMock from '../mocks/modules/opensearchMock.js';
 *
 * const client = opensearchMock.client;
 */

/**
 * Examples on how to use the opensearch mock service
 * @example: querying for {match_all: {}}
 *
 *  import * as opensearchMock from '../mocks/modules/opensearchMock.js';
 *
 *  describe('Unit tests for openSearch', () => {
 *
 *  const  client  = opensearchMock.client;
 *
 *  // sample query
 *  let mockQuery = {match_all:{}}
 *
 *  // creating mock data
 *  let mockData = {
 *    hits: {
 *      total: { value: 0, relation: 'eq' },
 *      hits: [],
 *    },
 *  }
 *
 *  opensearchMock.addMock(mockQuery, mockData)
 *
 *  client.search(
 *    {
 *     body: {query: mockQuery}
 *    }).then(res =>{
 *      console.log(res.body);
 *   });
 * });
 *
 */
export default client;
export { addMock, clearMocks };
