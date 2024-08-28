import SynchronizationService from '@adp/kubernetes/synchronizationService';
import configManager from '../config/configManager.js';
import certificateManager from './certificateManager.js';
import { getLogger } from './logging.js';
import CONSTANTS from '../config/constants.js';

const logger = getLogger();

const config = configManager.getSynchronizationConfig();

const synchronizationService = new SynchronizationService({
  syncConfig: {
    ...config,
    headerValues: CONSTANTS.VIA_HEADER_VALUE,
    tlsType: CONSTANTS.TLS_TYPE_HTTP_CLIENT,
  },
  logger,
  certificateManager,
});

export default synchronizationService;
