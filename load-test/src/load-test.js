import { check } from 'k6';
import { Rate } from 'k6/metrics';

import { sleepForRandomTime } from './utils/helper.js';
import {
  getMetadataIndexes,
  getMetadataRelations,
  getMetadataContexts,
  getMetadataMetrics,
  getMetadataAll,
  getSearchMetrics,
  getSearchContexts,
  getSearchRelatedContextsFacets,
} from './utils/networkRequests.js';
import { ENDPOINTS, MAX_VUS } from './utils/constants.js';

export const options = {
  insecureSkipTLSVerify: true,
  stages: [
    { duration: '10s', target: Math.ceil(MAX_VUS / 2) },
    { duration: '20s', target: MAX_VUS },
    { duration: '10s', target: MAX_VUS },
    { duration: '20s', target: 0 },
  ],
  thresholds: {
    http_req_duration: ['p(95)<150'],
  },
};

export const errorRate = new Rate('errors');

function checkResponse(endpoint, response) {
  if (
    !check(response, {
      [`${endpoint} status was 200`]: (r) => r.status === 200,
    })
  ) {
    errorRate.add(1);
  }
}

export default function () {
  // Get metadata indexes
  let res = getMetadataIndexes();
  if (
    !check(res, {
      [`${ENDPOINTS.METADATA_INDEXES} status was 200`]: (r) => r.status === 200,
      [`${ENDPOINTS.METADATA_INDEXES} response body is a non-empty array`]: (r) =>
        r.json().length > 0,
    })
  ) {
    errorRate.add(1);
  }
  const searchIndex = res.json()[0].name;
  sleepForRandomTime();

  // Get metadata relations
  res = getMetadataRelations(searchIndex);
  checkResponse(ENDPOINTS.METADATA_RELATIONS, res);
  sleepForRandomTime();

  // Get metadata contexts
  res = getMetadataContexts(searchIndex);
  checkResponse(ENDPOINTS.METADATA_CONTEXTS, res);
  sleepForRandomTime();

  // Get metadata metrics
  res = getMetadataMetrics(searchIndex);
  checkResponse(ENDPOINTS.METADATA_METRICS, res);
  sleepForRandomTime();

  // Get metadata all
  res = getMetadataAll(searchIndex);
  checkResponse(ENDPOINTS.METADATA_ALL, res);
  sleepForRandomTime();

  // Get search metrics
  res = getSearchMetrics(searchIndex);
  checkResponse(ENDPOINTS.SEARCH_METRICS, res);
  sleepForRandomTime();

  // Get search contexts
  res = getSearchContexts(searchIndex);
  checkResponse(ENDPOINTS.SEARCH_CONTEXTS, res);
  sleepForRandomTime();

  // Get search related contexts facets
  res = getSearchRelatedContextsFacets(searchIndex);
  checkResponse(ENDPOINTS.SEARCH_RELATED_CONTEXTS_FACETS, res);
  sleepForRandomTime();
}

export function handleSummary(data) {
  return {
    '/report/load-test-report.json': JSON.stringify(data, null, 2),
  };
}
