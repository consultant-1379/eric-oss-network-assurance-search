import UIConfigurationApi from '../../api/UIConfigurationApi';

const uiConfigurationApi = new UIConfigurationApi();

export const getConfiguration = () => uiConfigurationApi.getUiConfiguration();
