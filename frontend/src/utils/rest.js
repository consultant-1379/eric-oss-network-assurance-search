import { Rest as RestCommon } from '@adp/ui-common';
import { loadConfig, getConfig } from '../config/configManager.js';

import gasApiUrls from '../config/api-config.json';

const REQUEST_HEADER = {
  'Content-type': 'application/json',
};

class Rest extends RestCommon {
  constructor() {
    super();
    this.apiUrls = { ...gasApiUrls };
  }

  setApiUrls(urls) {
    this.apiUrls = urls;
  }

  getApiUrls() {
    return this.apiUrls;
  }

  async sendLogEvent(logevent) {
    const options = {
      method: 'POST',
      headers: REQUEST_HEADER,
      body: JSON.stringify(logevent),
    };
    return this.makeRequest(
      `${this.apiUrls.logging.prefix}${this.apiUrls.logging.routes.logs}`,
      options,
      true,
    );
  }
}

const rest = new Rest();

if (!getConfig()) {
  await loadConfig(); // This required for Unit test and Contract test
}

const config = await getConfig().getConfig();
const isLocal = config?.rest?.hostname === 'localhost';

rest.setBaseContext(isLocal ? null : config?.rest);

export default rest;
