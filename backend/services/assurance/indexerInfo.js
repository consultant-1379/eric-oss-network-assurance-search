import { createRequire } from 'module';
import { fetchResponse } from '../../utils/NetworkUtil.js';
import configManager from '../../config/configManager.js';
import CONSTANTS from '../../config/constants.js';
import EXTERNAL_API_ROUTES from '../../config/external-api-config.js';

const require = createRequire(import.meta.url);
const path = require('path');

/**
 *Function to construct Indexer url using path
 * @param urlPath
 * @returns {String}
 */
const createIndexerUrlFromPath = (urlPath) => {
  const indexerUrl = process.env.INDEXER_URL || configManager.getIndexerUrl();
  return new URL(path.join(indexerUrl, urlPath)).toString();
};

/**
 * Function to make API call to Indexer service to get indexes list
 * @returns {Promise<{Object}>}
 */
const getIndexerList = async () =>
  fetchResponse(
    createIndexerUrlFromPath(EXTERNAL_API_ROUTES.INDEXER_LIST),
    CONSTANTS.TLS_TYPE_HTTP_CLIENT,
  );

/**
 * Function to make API call to Indexer service to get indexes full context info
 * @returns {Promise<{Object}>}
 */
const getIndexerFullContexts = async ({ params }) =>
  fetchResponse(
    createIndexerUrlFromPath(
      `${EXTERNAL_API_ROUTES.INDEXER_FULLCONTEXTS}?searchEngineIndexName=${params.index}`,
    ),
    CONSTANTS.TLS_TYPE_HTTP_CLIENT,
  );

/**
 * Function to make API call to Indexer service to get available metrics for a given full context
 * @returns {Promise<{Object}>}
 */
const getMetrics = async ({ params, query }) =>
  fetchResponse(
    createIndexerUrlFromPath(
      `${EXTERNAL_API_ROUTES.INDEXER_VALUES_FOR_FULLCONTEXT}?searchEngineIndexName=${params.index}&fullContextName=${query.contextTypeId}`,
    ),
    CONSTANTS.TLS_TYPE_HTTP_CLIENT,
  );

export { getIndexerList, getIndexerFullContexts, getMetrics };
