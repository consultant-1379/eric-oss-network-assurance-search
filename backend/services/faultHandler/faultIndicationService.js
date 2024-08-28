import { createRequire } from 'module';
import { schemaValidator } from '../../utils/schemaValidator.js';
import { getLogger } from '../logging.js';
import configManager from '../../config/configManager.js';

const require = createRequire(import.meta.url);
const FI_DEFAULTS = require('./faultIndicationDefaultsMap.json');

const logger = getLogger();

/**
 * Apply custom config props for default config
 * @private
 * @param {Object} config default config
 * @param {Object} customConfig custom config
 * see http://json-schema.org/draft-04/schema#
 *    for additional details
 * @returns {Object}
 */
function applyCustomConfig(config, customConfig) {
  if (customConfig.faultName) {
    logger.error(
      `Faultname can't be overridden in fault indication custom config: { faultName: ${customConfig.faultName} }`,
    );
    customConfig.faultName = config.faultName;
  }
  return Object.assign(config, customConfig);
}

/**
 * Validate fault indication config with Fault Indication Schema
 * @private
 * @param {Object} config fault indication config
 * see http://json-schema.org/draft-04/schema#
 *    for additional details
 * @returns {Boolean}
 */
function validateFaultIndicationConfig(config) {
  const result = schemaValidator.validateFaultIndication(config);

  if (!result.valid) {
    throw new Error(`Validation failed for fault indication config: ${result.errors}`);
  }
}

/**
 * Get fault indication
 * @private
 * @param {Object} fault
 * @param {Object} [customConfig] custom fault indication config
 * see http://json-schema.org/draft-04/schema#
 *    for additional details
 * @returns {Object|null}
 */
function getFaultIndication({ fault, customConfig }) {
  const { serviceName } = configManager.getFaultManagerConfig();

  if (!fault) {
    throw new Error('Please provide fault mandatory parameter for fault indication data');
  }
  const { faultName } = FI_DEFAULTS[fault];

  let faultConfig = FI_DEFAULTS[fault];

  if (customConfig) {
    faultConfig = applyCustomConfig(faultConfig, customConfig);
  }

  validateFaultIndicationConfig(faultConfig);

  return {
    key: `${serviceName}.${faultName}`,
    value: JSON.stringify(faultConfig),
  };
}

export { getFaultIndication };
