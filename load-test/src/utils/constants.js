const BASE_API_URL = __ENV.BASE_API_URL ? __ENV.BASE_API_URL : 'http://localhost:3000';

const ENDPOINTS = {
  // Internal Endpoints
  UI_CONFIGURATION: '/ui/configuration',

  // Metadata endpoints
  METADATA_INDEXES: '/metadata/indexes',
  METADATA_RELATIONS: '/:index/metadata/relations',
  METADATA_CONTEXTS: '/:index/metadata/contexts',
  METADATA_METRICS: '/:index/metadata/metrics',
  METADATA_ALL: '/:index/metadata',

  // Search endpoints
  SEARCH_METRICS: '/:index/search/metrics',
  SEARCH_CONTEXTS: '/:index/search/contexts',
  SEARCH_RELATED_CONTEXTS_FACETS: '/:index/search/related-contexts-facets',
};

const GET_REQUEST_HEADERS = {
  Accept: 'application/json',
};

const RANDOM_SLEEP_SECONDS_LIMIT = 5;
const MAX_VUS = __ENV.MAX_VUS ? __ENV.MAX_VUS : 50;

export { BASE_API_URL, ENDPOINTS, GET_REQUEST_HEADERS, RANDOM_SLEEP_SECONDS_LIMIT, MAX_VUS };
