import { expect } from 'chai';
import NetworkAssuranceDashboard from '../../page-objects/network-assurance-dashboard/Network.assurance.dashboard.js';

describe('User settings panel', () => {
  let userSettingsPanel;

  before(async () => {
    await NetworkAssuranceDashboard.open();
    await NetworkAssuranceDashboard.waitForLoading();
  });

  it('is closed at startup', async () => {
    userSettingsPanel = await NetworkAssuranceDashboard.settingsPanel();
    expect(await NetworkAssuranceDashboard._isDisplayed(userSettingsPanel)).to.be.false;
  });

  it('can be opened', async () => {
    await NetworkAssuranceDashboard.clickAndWaitToDisplaySettingsPanel();
    userSettingsPanel = await NetworkAssuranceDashboard.settingsPanel();
    expect(await NetworkAssuranceDashboard._isDisplayed(userSettingsPanel)).to.be.true;
  });

  it('can set light theme', async () => {
    await NetworkAssuranceDashboard.setLightTheme();
    expect(await NetworkAssuranceDashboard.theme()).to.be.eq('light');
  });

  it('can set dark theme', async () => {
    await NetworkAssuranceDashboard.setDarkTheme();
    expect(await NetworkAssuranceDashboard.theme()).to.be.eq('dark');
  });

  it('preserves theme setting after reload', async () => {
    await browser.refresh();
    await NetworkAssuranceDashboard.waitForLoading();
    expect(await NetworkAssuranceDashboard.theme()).to.be.eq('dark');
  });
});
