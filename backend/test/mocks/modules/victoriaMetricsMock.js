import { createRequire } from 'module';
import nock from 'nock';
import configManager from '../../../config/configManager.js';
import EXTERNAL_API_ROUTES from '../../../config/external-api-config.js';

const require = createRequire(import.meta.url);
const path = require('path');

const victoriaMetricsUrl =
  process.env.VICTORIA_METRICS_URL || configManager.getVictoriaMetricsUrl();

/**
 * This function takes a MetricsQL query and returns it as a URL-safe encoded string.
 *
 * @param {string} victoriaMetricsQuery - MetricsQL expression
 * @returns {string} The URL-safe encoded query expression
 */
function stringifyVictoriaMetricsUri(victoriaMetricsQuery) {
  const url = new URL(
    path.join(
      victoriaMetricsUrl,
      `${EXTERNAL_API_ROUTES.VICTORIA_METRICS_QUERY}?query=${encodeURIComponent(
        victoriaMetricsQuery,
      )}`,
    ),
  ).toString();
  return url.replace(victoriaMetricsUrl, '');
}

/**
 * This function creates a new nock interceptor that will mock
 * the VictoriaMetrics HTTP request that matches the provided
 * MetricsQL query with the provided mock data.
 *
 * @param {string} victoriaMetricsQuery - MetricsQL expression
 * @param {*} mockData - The data that will be returned
 */
function addMock(victoriaMetricsQuery, mockData) {
  // Building the stringified URI
  const uri = stringifyVictoriaMetricsUri(victoriaMetricsQuery);
  // Adding mock
  nock(victoriaMetricsUrl).get(uri).reply(200, mockData);
}

export { addMock };
