import fetch from 'node-fetch';
import CONSTANTS from '../config/constants.js';
import certificateManager from '../services/certificateManager.js';
import { AppError } from './appError.js';
import { getLogger } from '../services/logging.js';

const logger = getLogger();

const normalizeURLEnding = (urlSegment) => {
  if (urlSegment && urlSegment.endsWith('/')) {
    urlSegment = urlSegment.slice(0, -1);
  }
  return urlSegment;
};

const normalizeURLSegment = (urlSegment) => {
  urlSegment = normalizeURLEnding(urlSegment);

  if (urlSegment && !urlSegment.startsWith('/')) {
    urlSegment = '/'.concat(urlSegment);
  }
  return urlSegment || '';
};

/**
 *
 * @param {string} protocol
 * @param {string} url
 * @returns
 */
const fetchResponsesForProtocol = (protocol, url) => {
  let fetched;
  try {
    if (protocol === 'https') {
      const httpsAgent = certificateManager.getTLSOptions(
        CONSTANTS.TLS_TYPE_INTERNAL_GUI,
      )?.tlsAgent;
      if (!httpsAgent) {
        logger.error(`https Agent is not found!`);
      }
      fetched = fetch(`https://${url}`, { agent: httpsAgent });
    } else {
      fetched = fetch(`http://${url}`);
    }
    return fetched;
  } catch (err) {
    logger.error(`Fetch error: ${err}`);
    throw new AppError(
      503,
      'The service which a request was made to is unavailable',
      503,
      'Service Unavailable',
    );
  }
};

/**
 * Function to make a Fetch call using TLS Agent.
 * @param url - API URL
 * @param serviceName - TLS service name
 * @returns {Promise<Object>}
 */
const fetchResponse = async (url, serviceName) => {
  const agent = certificateManager.getTLSOptions(serviceName)?.tlsAgent;
  const headers = { 'Content-Type': 'application/json' };
  let response;
  try {
    response = await fetch(url, { agent, headers, method: 'get' });
    if (response?.ok) {
      return response.json();
    }
    // There was a response from the target service but the request was invalid.
    logger.error(`Fetch error: ${response?.status}`);
    return {
      code: response?.status,
      message: response?.statusText,
    };
  } catch (err) {
    // The was no response from the target service - assuming it is unavailable.
    logger.error(`Fetch error: ${err}`);
    throw new AppError(
      503,
      'The service which a request was made to is unavailable',
      503,
      'Service Unavailable',
    );
  }
};

export { normalizeURLEnding, normalizeURLSegment, fetchResponsesForProtocol, fetchResponse };
