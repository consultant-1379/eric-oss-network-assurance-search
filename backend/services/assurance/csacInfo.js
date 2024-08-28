import path from 'path';
import configManager from '../../config/configManager.js';
import { fetchResponse } from '../../utils/NetworkUtil.js';
import EXTERNAL_API_ROUTES from '../../config/external-api-config.js';
import CONSTANTS from '../../config/constants.js';

/**
 * Function to construct CSAC url using path
 * @param urlPath
 * @returns {String}
 */
const createUrlFromPath = (urlPath) => {
  const csacUrl = configManager.getCsacUrl();
  return new URL(path.join(csacUrl, urlPath)).toString();
};

/**
 * Function to make API call to get CSAC system state
 */
const callSystemStateApi = async () =>
  fetchResponse(
    createUrlFromPath(EXTERNAL_API_ROUTES.CSAC_SYSTEM_STATE),
    CONSTANTS.TLS_TYPE_HTTP_CLIENT,
  );

/**
 * Function to transform CSAC state response in to API response.
 * @param systemStatusResponse
 */
const transformSystemStateResponse = (systemStatusResponse) => {
  const systemStateObject = {
    INITIAL: {
      status: 'initializing',
      message: 'Waiting for configurator service to be ready',
    },
    STARTED: {
      status: 'initializing',
      message: 'Waiting for configurations from the configurator service',
    },
    RESET: {
      status: 'initializing',
      message: 'Configurator was reset, Waiting for configurator to be ready',
    },
    COMPLETED: {
      status: 'ready',
      message: '',
    },
    ERROR: {
      status: 'error',
      message: 'Configurator service returned error',
    },
  };

  // eslint-disable-next-line no-prototype-builtins
  if (systemStateObject.hasOwnProperty(systemStatusResponse.provisioningState)) {
    return systemStateObject[systemStatusResponse.provisioningState];
  }
  throw systemStatusResponse;
};

/**
 * This function get the status of CSAC and return into json format
 */
const getSystemState = async () => transformSystemStateResponse(await callSystemStateApi());

/**
 * Function to make API call for Metadata contexts
 * @returns {Promise<Object>}
 */
const getMetadataContexts = async () =>
  fetchResponse(
    createUrlFromPath(EXTERNAL_API_ROUTES.CSAC_METADATA_CONTEXTS),
    CONSTANTS.TLS_TYPE_HTTP_CLIENT,
  );

/**
 * Function to make API call for Metadata KPI's
 * @returns {Promise<Object>}
 */
const getKpis = async ({ query }) =>
  fetchResponse(
    createUrlFromPath(
      EXTERNAL_API_ROUTES.CSAC_METADATA_KPIS.replace(':context-id', query.contextTypeId),
    ),
    CONSTANTS.TLS_TYPE_HTTP_CLIENT,
  );

export {
  getSystemState,
  getMetadataContexts,
  getKpis,
  transformSystemStateResponse,
  callSystemStateApi,
};
