import pick from 'lodash/pick.js';
import configManager from '../../config/configManager.js';
import CONSTANTS from '../../config/constants.js';

/**
 * @description Returns a filtered version of the customization file that only
 * includes properties that are relevant to dashboard metadata, which are passed in as an argument.
 * @param {object} customizationFile - The object which contains all the customization data.
 * @example Refer to the `backend/config/backend-service-config/customization-service-config.json` file.
 * @returns {object} a filtered version of the customization file.
 * @example {"families":[{"name":"family1","title":"Family 1","widget":"timeline","unit":"kbps"},{"name":"family2","widget":"donut"}],"groups":[{"name":"group1","title":"Panel 1","sort":"alphabetical","sortOrder":"asc"},{"name":"group2","title":"Panel 2","sort":"alphabetical","sortOrder":"des"}],"categories":[{"name":"category1","title":"Category 1"},{"name":"category2","title":"Category 2"}]}
 */
function getDashboardMetadata(customizationFile) {
  return pick(customizationFile, CONSTANTS.CUSTOMIZATION_DASHBOARD_METADATA_FIELDS);
}

function getUiConfiguration() {
  return getDashboardMetadata(configManager.getCustomizationConfig());
}

export { getUiConfiguration, getDashboardMetadata };
