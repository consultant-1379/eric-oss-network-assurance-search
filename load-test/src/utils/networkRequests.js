import http from 'k6/http';

import { BASE_API_URL, ENDPOINTS, GET_REQUEST_HEADERS } from './constants.js';
import { randomElementFromArray } from './helper.js';
import {
  metadataRelationsQueryParameters,
  metadataMetricsQueryParameters,
  searchMetricsQueryParameters,
  searchContextsQueryParameters,
  searchRelatedContextsFacetsQueryParameters,
} from './queryParameters.js';

function getRequest(url) {
  return http.get(url, {
    headers: GET_REQUEST_HEADERS,
  });
}

function objectToQueryString(obj, prefix) {
  const str = [];
  let p;
  for (p in obj) {
    if (Object.prototype.hasOwnProperty.call(obj, p)) {
      const k = prefix ? `${prefix}[${p}]` : p;
      const v = obj[p];
      str.push(
        v !== null && typeof v === 'object'
          ? objectToQueryString(v, k)
          : `${encodeURIComponent(k)}=${encodeURIComponent(v)}`,
      );
    }
  }
  return str.join('&');
}

function buildUrl(uri, searchIndex, queryParameters) {
  if (searchIndex) {
    uri = uri.replace(':index', searchIndex);
  }

  if (queryParameters) {
    uri = `${uri}?${objectToQueryString(queryParameters)}`;
  }

  return BASE_API_URL + uri;
}

function getUiConfiguration() {
  const url = buildUrl(ENDPOINTS.UI_CONFIGURATION);
  return getRequest(url);
}

function getMetadataIndexes() {
  const url = buildUrl(ENDPOINTS.METADATA_INDEXES);
  return getRequest(url);
}

function getMetadataRelations(searchIndex) {
  const queryParameters = randomElementFromArray(metadataRelationsQueryParameters);
  const url = buildUrl(ENDPOINTS.METADATA_RELATIONS, searchIndex, queryParameters);
  return getRequest(url);
}

function getMetadataContexts(searchIndex) {
  return getRequest(buildUrl(ENDPOINTS.METADATA_CONTEXTS, searchIndex));
}

function getMetadataMetrics(searchIndex) {
  const queryParameters = randomElementFromArray(metadataMetricsQueryParameters);
  const url = buildUrl(ENDPOINTS.METADATA_METRICS, searchIndex, queryParameters);
  return getRequest(url);
}

function getMetadataAll(searchIndex) {
  return getRequest(buildUrl(ENDPOINTS.METADATA_ALL, searchIndex));
}

function getSearchMetrics(searchIndex) {
  const queryParameters = randomElementFromArray(searchMetricsQueryParameters);
  const url = buildUrl(ENDPOINTS.SEARCH_METRICS, searchIndex, queryParameters);
  return getRequest(url);
}
function getSearchContexts(searchIndex) {
  const queryParameters = randomElementFromArray(searchContextsQueryParameters);
  const url = buildUrl(ENDPOINTS.SEARCH_CONTEXTS, searchIndex, queryParameters);
  return getRequest(url);
}
function getSearchRelatedContextsFacets(searchIndex) {
  const queryParameters = randomElementFromArray(searchRelatedContextsFacetsQueryParameters);
  const url = buildUrl(ENDPOINTS.SEARCH_RELATED_CONTEXTS_FACETS, searchIndex, queryParameters);
  return getRequest(url);
}

export {
  getUiConfiguration,
  getMetadataIndexes,
  getMetadataRelations,
  getMetadataContexts,
  getMetadataMetrics,
  getMetadataAll,
  getSearchMetrics,
  getSearchContexts,
  getSearchRelatedContextsFacets,
};
