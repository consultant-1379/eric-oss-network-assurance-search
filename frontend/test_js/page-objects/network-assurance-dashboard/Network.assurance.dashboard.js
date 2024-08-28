import PageBase from './Page.base.js';

const cssPaths = {
  networkAssuranceDashboard: 'e-network-assurance-dashboard',
};

class NetworkAssuranceDashboard extends PageBase {
  async root() {
    const appContent = await this.content();
    const networkAssuranceDashboard = await appContent.$(cssPaths.networkAssuranceDashboard);
    return networkAssuranceDashboard.shadow$(cssPaths.networkAssuranceDashboard);
  }

  async open() {
    await browser.url(`${browser.config.baseUrl}/#network-assurance-dashboard`);
  }
}

export default new NetworkAssuranceDashboard();
