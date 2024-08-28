/**
 * Integration tests for <e-network-assurance-dashboard>
 */
import { elementUpdated, expect, fixture, html } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import sinon from 'sinon';
import NetworkAssuranceDashboard from '../../../src/apps/network-assurance-dashboard/network-assurance-dashboard.js';
import { isRendered } from '../../utils/isRendered';
import { nextTick } from '../../utils/utils.js';
import { MetadataApi, SearchApi, UIConfigurationApi, SystemApi } from '../../../src/index.js';

import testAppState from '../../../mocks/app/network-assurance-dashboard/appState.json';
import searchMetricsByQueryResponse from '../../../mocks/app/network-assurance-dashboard/searchMetricsByQueryResponse.json';
import getStaticInformationResponse from '../../../mocks/app/network-assurance-dashboard/getStaticInformationResponse.json';
import getUiConfigurationResponse from '../../../mocks/app/network-assurance-dashboard/getUiConfigurationResponse.json';
import getSystemStateResponse from '../../../mocks/app/network-assurance-dashboard/getSystemStateResponse.json';

const EUI_BUTTON = 'eui-button';
const EUI_FLYOUT = 'eui-flyout-panel';
const HISTORICAL_DASHBOARD = '#historical-dashboard';

/* eslint-disable sonarjs/no-duplicate-string */
const APPSTATE_KEY = 'eric-oss-network-assurance-search-service/defaultUser/appState';

const pruneBrowsers = (browsers) =>
  browsers.map((browser) => {
    delete browser.browserError;
    delete browser.fetchError;
    delete browser.data.fetchTime;
    return {
      ...browser,
      loading: false,
      data: {
        ...browser.data,
        tableData: [],
        currentpage: 1,
        numentries: 13,
        numpages: 1,
      },
      historicalDashboardData: {
        historicalDashboardModel: {},
        showHistoricalDashboard: false,
      },
      selectedRow: { selected: false },
    };
  });

const dashboardContainer = async ({
  appState,
  discoverEventFn,
  searchEventFn,
  metricEventFn,
  tabEventFn,
}) => {
  const dashboardTemplate = html`
    <e-network-assurance-dashboard
      .appstate="${ifDefined(appState)}"
      @discover-indices="${ifDefined(discoverEventFn)}"
      @metric-search="${ifDefined(searchEventFn)}"
      @fetch-metrics="${ifDefined(metricEventFn)}"
      @open-tab="${ifDefined(tabEventFn)}"
    ></e-network-assurance-dashboard>
  `;
  const element = await fixture(dashboardTemplate);
  await isRendered(element);
  return element;
};

describe('Network Assurance Dashboard Application Tests', () => {
  sinon.stub(SearchApi.prototype, 'searchMetricsByQuery').resolves(searchMetricsByQueryResponse);

  sinon.stub(MetadataApi.prototype, 'getAvailableIndexes').resolves([
    { name: 'ran', description: 'Radio Access Network (RAN)' },
    { name: 'soa', description: 'Some description' },
  ]);

  sinon
    .stub(MetadataApi.prototype, 'getStaticInformation')
    .withArgs('ran')
    .resolves(getStaticInformationResponse);

  sinon
    .stub(UIConfigurationApi.prototype, 'getUiConfiguration')
    .resolves(getUiConfigurationResponse);

  sinon.stub(SystemApi.prototype, 'getSystemState').resolves(getSystemStateResponse);

  describe('Basic application setup', () => {
    before(() => NetworkAssuranceDashboard.register());

    it('should create a new <e-network-assurance-dashboard>', async () => {
      const element = await dashboardContainer({});
      expect(element).to.exist;
    });

    it('should have a tab bar', async () => {
      const element = await dashboardContainer({});
      const tabBar = element.shadowRoot.querySelector('e-tab-bar');
      expect(tabBar).to.exist;
    });

    it('should show the error banner when an error is present', async () => {
      const element = await dashboardContainer({});
      element.appstate = { ...testAppState, error: 'some error' };
      await nextTick();
      const banner = element.shadowRoot.querySelector('e-error-banner');
      expect(banner).to.exist;
    });

    it('should show the system state error banner when an error is present', async () => {
      const element = await dashboardContainer({});
      const systemStateError = new Error('Test Error');
      systemStateError.message = `Detail test error message'`;
      systemStateError.type = 'SYSTEM_STATE';

      element.appstate = { ...testAppState, error: systemStateError };
      await nextTick();
      const banner = element.shadowRoot.querySelector('e-error-banner');
      expect(banner).to.exist;
    });

    it('should render the add KPI Context button', async () => {
      const element = await dashboardContainer({});
      const addButton = element.shadowRoot.querySelector(EUI_BUTTON);
      expect(addButton).to.exist;
    });

    it('should render flyout panel', async () => {
      const element = await dashboardContainer({});
      const flyoutPanel = element.shadowRoot.querySelector(EUI_FLYOUT);
      expect(flyoutPanel).to.exist;
    });

    it('able to cancel/close the flyout panel', async () => {
      const element = await dashboardContainer({});
      const flyoutPanel = element.shadowRoot.querySelector(EUI_FLYOUT);
      const cancelBtn = flyoutPanel.querySelector('#cancel-btn');
      expect(cancelBtn).to.exist;
      cancelBtn.click();
      await elementUpdated(cancelBtn);
      expect(flyoutPanel.show).to.equal(false);
    });

    it('should enable the add button', async () => {
      const element = await dashboardContainer({});
      const flyoutPanel = element.shadowRoot.querySelector(EUI_FLYOUT);
      const addBtn = flyoutPanel.querySelector('#add-btn');
      const tree = flyoutPanel.querySelector('[slot=content] eui-tree');
      const treeItem = tree.shadowRoot.querySelector('eui-tree-item');
      const treeItemListItem = treeItem.shadowRoot.querySelector('li span');
      treeItemListItem.click();
      await elementUpdated(treeItem);
      expect(treeItem.active).to.equal(true);
      expect(addBtn.disabled).to.equal(false);
    });

    it('should update label showing available/total contexts', async () => {
      const element = await dashboardContainer({});
      element.appstate = { ...testAppState };

      await nextTick();
      const addKPIContext = element.shadowRoot.querySelector(EUI_BUTTON);
      addKPIContext.click();
      await nextTick();
      const flyoutPanel = element.shadowRoot.querySelector(EUI_FLYOUT);
      element.match = 'D';
      await nextTick();
      const labelShowing = flyoutPanel.querySelector('[slot=content] label');
      expect(labelShowing.textContent.trim()).to.equal('Contexts (Showing\n        1 of 4)');
    });

    it('should emit the open-tab event', async () => {
      let tabEvent;
      const tabEventFn = (event) => {
        tabEvent = event;
      };
      const element = await dashboardContainer({ tabEventFn });

      const flyoutPanel = element.shadowRoot.querySelector('eui-flyout-panel');
      const addBtn = flyoutPanel.querySelector('#add-btn');
      const tree = flyoutPanel.querySelector('[slot=content] eui-tree');
      const treeItem = tree.shadowRoot.querySelector('eui-tree-item');
      const treeItemListItem = treeItem.shadowRoot.querySelector('li span');
      treeItemListItem.click();
      await elementUpdated(treeItem);
      expect(treeItem.active).to.equal(true);
      expect(addBtn.disabled).to.equal(false);

      addBtn.click();
      await elementUpdated(addBtn);
      expect(tabEvent.type).to.equal('open-tab');
    });

    it('should have toast notification when isNewSortApplied is true', async () => {
      const element = await dashboardContainer({});
      await nextTick();
      const activeIndex = element.appstate.browsers.findIndex((browser) => browser.active);
      element.appstate.browsers[activeIndex].data.sort = {
        deselectedMetricSort: 'Session Modification Req Rcvd',
        sortBy: {
          id: 'vi_dlUnstrDropPackets',
        },
        sortOrder: 'asc',
        isNewSortApplied: true,
        sortNotificationInfo: 'AMF Mean Reg Nbr',
      };

      element.appstate = { ...element.appstate };
      await nextTick();
      const containerPanel = element.shadowRoot.querySelector('#sortNotificationContainer');
      expect(containerPanel).to.exist;
    });

    it('should not have toast notification when isNewSortApplied is false', async () => {
      const element = await dashboardContainer({});
      const containerPanel = element.shadowRoot.querySelector('#sortNotificationContainer');
      expect(containerPanel).to.not.exist;
    });

    it('should show error in toast notification', async () => {
      const element = await dashboardContainer({});
      const browserError = new Error('Test Error');
      browserError.statusText = `Details test error'`;
      browserError.isWarning = false;
      element.appstate = { ...testAppState, error: browserError };

      await nextTick();
      const notification = element.shadowRoot.querySelector('#notificationContainer');
      const errorNotification = notification.querySelector('#notification-error');
      expect(errorNotification).to.exist;
    });

    it('should show system state error in toast notification', async () => {
      const element = await dashboardContainer({});
      const systemStateError = new Error('Test Error');
      systemStateError.statusText = `Details test error'`;
      systemStateError.type = 'SYSTEM_STATE';
      element.appstate = { ...testAppState, error: systemStateError };

      await nextTick();
      const notification = element.shadowRoot.querySelector('#notificationContainer');
      const errorNotification = notification.querySelector('#notification-error');
      expect(errorNotification).to.exist;
    });

    it('should show warning in toast notification', async () => {
      const element = await dashboardContainer({});
      const browserError = new Error('Test warning');
      browserError.statusText = `Details test warning'`;
      browserError.isWarning = true;
      element.appstate = { ...testAppState, error: browserError };

      await nextTick();
      const notification = element.shadowRoot.querySelector('#notificationContainer');
      const warningNotification = notification.querySelector('#notification-warning');
      expect(warningNotification).to.exist;
    });

    it('should have a right side panel button', async () => {
      const container = await dashboardContainer({});
      const rightPanelButton = container.shadowRoot.querySelector(
        'eui-multi-panel-tile > eui-panel-button',
      );
      expect(rightPanelButton).to.exist;
    });

    it('should have a right side panel closed', async () => {
      const container = await dashboardContainer({});
      const rightPanel = container.shadowRoot.querySelector(
        'eui-multi-panel-tile > eui-tile-panel',
      );
      expect(rightPanel.getAttribute('hidden'));
    });

    it('should have a right side panel which hosts `e-historical-metrics-dashboard`', async () => {
      const container = await dashboardContainer({});
      const rightPanel = container.shadowRoot.querySelector(
        'eui-multi-panel-tile > eui-tile-panel',
      );
      expect(rightPanel.querySelector('e-historical-metrics-dashboard').nodeName).to.equal(
        'E-HISTORICAL-METRICS-DASHBOARD',
      );
    });

    it('should have a right side panel which hosts `e-historical-metrics-dashboard` which contains `IFRAME`', async () => {
      const container = await dashboardContainer({});
      const iframe = container.shadowRoot
        .querySelector('eui-multi-panel-tile > eui-tile-panel > e-historical-metrics-dashboard')
        .shadowRoot.querySelector('#cnom-assurance-dashboard');
      expect(iframe.nodeName).to.equal('IFRAME');
    });

    it('should have historical dashboard appropriately subtitled to row selection when open', async () => {
      window.localStorage.removeItem(APPSTATE_KEY);
      const appState = { ...testAppState };
      const activeIndex = appState.browsers.findIndex((b) => b.active);
      appState.browsers[activeIndex].historicalDashboardData.showHistoricalDashboard = true;
      appState.browsers[activeIndex].historicalDashboardData.noResults = true;

      appState.browsers[activeIndex].selectedRow = {
        selected: true,
        metadata: { context: { contextFields: [{ name: 'c' }, { name: 'a' }, { name: 'b' }] } },
      };
      const container = await dashboardContainer({});
      container.appstate = { ...appState };

      await nextTick();

      const historicalDashboardTile = container.shadowRoot.querySelector(HISTORICAL_DASHBOARD);
      expect(historicalDashboardTile.getAttribute('subtitle')).to.equal('KPIs for:  c, a, b');
    });

    it('should have help available on the historical dashboard', async () => {
      window.localStorage.removeItem(APPSTATE_KEY);
      const appState = { ...testAppState };
      const activeIndex = appState.browsers.findIndex((b) => b.active);
      appState.browsers[activeIndex].historicalDashboardData.showHistoricalDashboard = true;
      appState.browsers[activeIndex].historicalDashboardData.noResults = true;

      appState.browsers[activeIndex].selectedRow = {
        selected: true,
        metadata: { context: { contextFields: [{ name: 'c' }, { name: 'a' }, { name: 'b' }] } },
      };
      const container = await dashboardContainer({});
      container.appstate = { ...appState };

      await nextTick();

      const historicalDashboardTile = container.shadowRoot.querySelector(HISTORICAL_DASHBOARD);
      const historicalDashboardHelp = historicalDashboardTile.querySelector('#historical-help');
      expect(historicalDashboardHelp).to.exist;
    });

    it('should have a no results message in the historical dashboard flyout panel when flag is set in selectedRow', async () => {
      window.localStorage.removeItem(APPSTATE_KEY);
      const appState = { ...testAppState };
      const activeIndex = appState.browsers.findIndex((b) => b.active);
      appState.browsers[activeIndex].historicalDashboardData.showHistoricalDashboard = true;
      appState.browsers[activeIndex].historicalDashboardData.noResults = true;

      appState.browsers[activeIndex].selectedRow = {
        selected: true,
        metadata: { context: { contextFields: [{ name: 'c' }, { name: 'a' }, { name: 'b' }] } },
      };
      const container = await dashboardContainer({});
      container.appstate = { ...appState };

      await nextTick();

      const historicalDashboardTile = container.shadowRoot.querySelector(HISTORICAL_DASHBOARD);
      const noResultsBanner = historicalDashboardTile.querySelector('#no-results');
      expect(noResultsBanner).to.be.visible;
    });

    it('should support a escape button to close a fly-out panel', async () => {
      const element = await dashboardContainer({});
      const flyoutPanel = element.shadowRoot.querySelector(EUI_FLYOUT);
      const escapeBtnEvent = new KeyboardEvent('keydown', {
        key: 'Escape',
        code: 'Escape',
        keyCode: 27,
        which: 27,
        bubbles: true,
      });
      flyoutPanel.dispatchEvent(escapeBtnEvent);
      await elementUpdated(flyoutPanel);
      expect(flyoutPanel.show).to.be.false;
    });

    it('should only have edit button when a tab is active', async () => {
      const container = await dashboardContainer({});
      const tabs = container.shadowRoot.querySelector('e-tab-bar');
      const editPencils = tabs.shadowRoot.querySelectorAll('eui-actionable-icon[name="edit"]');
      const activeTab = tabs.shadowRoot.querySelector('eui-tab[selected]');
      const activeTabEditButton = activeTab.querySelector('eui-actionable-icon[name="edit"]');

      expect(editPencils.length).to.equal(1);
      expect(activeTabEditButton).to.exist;
    });

    it('should be able to rename a tab', async () => {
      const element = await dashboardContainer({});
      const tabBar = element.shadowRoot.querySelector('e-tab-bar');
      const tabs = tabBar.shadowRoot.querySelector('eui-tabs');
      const activeTab = tabs.querySelector('eui-tab[selected]');
      const editButton = activeTab.querySelector('eui-actionable-icon[name="edit"]');
      const renameDialog = element.shadowRoot.querySelector('#rename-dialog');
      const renameTextField = renameDialog.querySelector('eui-text-field');
      const applyButton = renameDialog.querySelector('#apply-btn');
      const newTabName = 'New Tab Name';

      editButton.click();
      await nextTick();
      renameTextField.value = newTabName;
      renameTextField.dispatchEvent(new CustomEvent('input', { detail: { value: newTabName } }));
      await nextTick();
      applyButton.click();
      await nextTick();

      const actualTabBar = element.shadowRoot.querySelector('e-tab-bar');
      const actualTabs = actualTabBar.shadowRoot.querySelector('eui-tabs');
      const actualActiveTab = actualTabs.querySelector('eui-tab[selected]');
      const actual = actualActiveTab.textContent;
      expect(actual.includes(newTabName)).to.be.true;
    });

    it('should be able to cancel renaming a tab', async () => {
      const element = await dashboardContainer({});
      const tabBar = element.shadowRoot.querySelector('e-tab-bar');
      const tabs = tabBar.shadowRoot.querySelector('eui-tabs');
      const activeTab = tabs.querySelector('eui-tab[selected]');
      const editButton = activeTab.querySelector('eui-actionable-icon[name="edit"]');
      const renameDialog = element.shadowRoot.querySelector('#rename-dialog');
      const renameTextField = renameDialog.querySelector('eui-text-field');
      const cancelButton = renameDialog.shadowRoot.querySelector('eui-button[class="cancel"]');
      const newTabName = 'New Tab Name';

      editButton.click();
      await nextTick();
      renameTextField.value = newTabName;
      renameTextField.dispatchEvent(new CustomEvent('input', { detail: { value: newTabName } }));
      await nextTick();
      cancelButton.click();
      await nextTick();

      const actualTabBar = element.shadowRoot.querySelector('e-tab-bar');
      const actualTabs = actualTabBar.shadowRoot.querySelector('eui-tabs');
      const actualActiveTab = actualTabs.querySelector('eui-tab[selected]');
      const actual = actualActiveTab.textContent;
      expect(actual).to.deep.equal(activeTab.textContent);
    });
  });
});

describe('Application state storage tests', () => {
  it('should have correct appstate stored in browser storage upon fresh init', async () => {
    window.localStorage.removeItem(APPSTATE_KEY);
    await dashboardContainer({});
    const expected = '1.0.2';
    const actual = JSON.parse(window.localStorage.getItem(APPSTATE_KEY));
    expect(actual.version).to.deep.equal(expected);
  });

  it('should reset appstate when appstate in localStorage has wrong version', async () => {
    // Setup localStorage to have app state with the wrong version
    window.localStorage.removeItem(APPSTATE_KEY);
    await dashboardContainer({});
    let appState = JSON.parse(window.localStorage.getItem(APPSTATE_KEY));
    const invalidVersion = '3.0.0';
    appState.version = invalidVersion;
    window.localStorage.setItem(APPSTATE_KEY, JSON.stringify(appState));
    expect(appState.version).to.equal(invalidVersion);
    await dashboardContainer({});
    appState = JSON.parse(window.localStorage.getItem(APPSTATE_KEY));
    const expectedVersion = '1.0.2';
    expect(appState.version).to.equal(expectedVersion);
  });

  it('should not commit to local storage if nothing significant has changed', async () => {
    // Setup localStorage to have app state with the wrong version
    window.localStorage.removeItem(APPSTATE_KEY);
    const element = await dashboardContainer({});
    const expected = pruneBrowsers(element.appstate.browsers);
    element.appstate.browsers[0].loading = true;
    element.updateState(element.appstate);
    const { browsers } = JSON.parse(window.localStorage.getItem(APPSTATE_KEY));
    expect(browsers).to.deep.equal(expected);
  });

  it('should commit to local storage if something significant has changed', async () => {
    // Setup localStorage to have app state with the wrong version
    window.localStorage.removeItem(APPSTATE_KEY);
    const element = await dashboardContainer({});
    element.appstate.browsers = [...element.appstate.browsers, element.appstate.browsers[0]];
    const expected = pruneBrowsers(element.appstate.browsers);
    element.updateState(element.appstate);
    const { browsers } = JSON.parse(window.localStorage.getItem(APPSTATE_KEY));
    expect(browsers).to.deep.equal(expected);
  });
});
