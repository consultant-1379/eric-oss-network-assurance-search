import { expect, fixture, html, elementUpdated } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import MetricBrowser from '../../../src/components/metric-browser/metric-browser.js';
import { isRendered } from '../../utils/isRendered';
import { constants } from '../../utils/constants.js';
import { nextTick } from '../../utils/utils.js';
import { updateSettings } from '../../../src/state/tableActions';

const PANEL_TITLE = 'Test Metric Browser';
const PANEL_SUBTITLE_SELECTOR = '#panelSubtitle';
const MULTITILEPANEL = 'eui-multi-panel-tile';
const CLEAR_FILTERS_SELECTOR = '#clear-btn';
const RESUME = '#resume-refresh';
const PAUSE = '#pause-refresh';
const REFRESH = '#manual-refresh';
const LAST_REFRESHED_LABEL = '#last-refreshed';
const SETTINGS_DIALOG = 'e-table-setting-dialog';
const SETTINGS = '#settings-button';
const TABLE_OPTIONS = '#table-options';
const ROW_DISCLOSURE = '#row-disclosure';
const METRIC_TABLE = 'e-metric-browser-table';

let filtersCleared = false;
let settingsUpdate;
let tableActionEvent;

const clearFilters = (event) => {
  filtersCleared = event;
};

const updateTableSettings = (event) => {
  settingsUpdate = event.detail;
};

const tableData = constants.MOCK_TABLE_DATA;

const tableActions = constants.MOCK_TABLE_ACTIONS;

const columnInfo = constants.MOCK_TABLE_COLUMNS;

const tableSettings = constants.TABLE_SETTINGS;

const metricCategoryPickerData = constants.MOCK_METRIC_CATEGORY_PICKER_DATA;

const settingDefaults = { ...tableSettings, columns: columnInfo };

const clickSettingsButton = async (element) => {
  // If the test runs the window smaller than the required allocated space for the full action buttons row use table options selector
  const tableOptions = element.querySelector(TABLE_OPTIONS);
  if (tableOptions) {
    tableOptions.click();
    await nextTick();
    const settingsMenuItem = tableOptions.shadowRoot.querySelector("[value='settings'");
    settingsMenuItem.click();
  } else {
    const settingsButton = element.querySelector(SETTINGS);
    settingsButton.click();
  }
};

const handleTableActionEvent = ({ detail }) => {
  tableActionEvent = detail;
};

export const renderMetricBrowser = async ({
  title,
  filters,
  columns,
  data,
  selectedContext,
  settings,
  loading,
  error,
  filterCategories,
  match,
  actions,
  rowSelected,
}) => {
  const metricBrowserTemplate = html`
    <e-metric-browser
      .title=${ifDefined(title)}
      .filters=${ifDefined(filters)}
      .filterCategories=${ifDefined(filterCategories)}
      .columns=${ifDefined(columns)}
      .data=${ifDefined(data)}
      .selectedContext=${ifDefined(selectedContext)}
      .settings=${ifDefined(settings)}
      ?loading=${ifDefined(loading)}
      .error=${ifDefined(error)}
      .match=${ifDefined(match)}
      .actions=${ifDefined(actions)}
      .selectedRow=${ifDefined(rowSelected)}
      @update-filters=${clearFilters}
      @update-settings=${updateTableSettings}
      @table-actions=${handleTableActionEvent}
      .metricCategoryPickerData=${metricCategoryPickerData}
    ></e-metric-browser>
  `;
  const element = await fixture(metricBrowserTemplate);
  await isRendered(element);
  return element.shadowRoot.querySelector(MULTITILEPANEL);
};

describe('Metric Browser Component Tests', () => {
  let container;

  before(async () => {
    MetricBrowser.register();
  });

  it('should render <e-metric-browser>', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      settings: tableSettings,
    });
    expect(container).to.exist;
  });

  it('should have the correct title', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      settings: tableSettings,
    });
    const title = container.getAttribute('tile-title');
    expect(title).to.equal(`${PANEL_TITLE}`);
  });

  it('should have a left panel button for filters', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      settings: tableSettings,
    });
    const filterButton = container.querySelector(`[slot='left-panel-button']`);
    expect(filterButton).to.exist;
  });

  it('should have a right panel action button for contextual help', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      settings: tableSettings,
    });
    const helpButton = container.querySelector(`eui-info-popup[slot='action']`);
    expect(helpButton).to.exist;
  });

  it('subtitle should have loading indicator when loading', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      loading: true,
      settings: tableSettings,
    });
    const loading = container.querySelector('#loading-indicator');
    expect(loading).to.exist;
  });

  it('should have the correct initial no filters applied label when no filters are applied', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      settings: tableSettings,
    });
    const noFiltersApplied = container.querySelector('#no-filters');
    expect(noFiltersApplied).to.exist;
  });

  it('should not have a clear filters button when no filters are applied', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      settings: tableSettings,
    });
    const clearFiltersButton = container.querySelector(CLEAR_FILTERS_SELECTOR);
    expect(clearFiltersButton).to.not.exist;
  });

  it('should have the correct indication of applied filters when there is 1 applied filter', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      filters: [
        { selected: false, type: { name: 'a' } },
        { selected: true, type: { name: 'b' } },
      ],
      settings: tableSettings,
    });
    const subtitle = container.querySelector(PANEL_SUBTITLE_SELECTOR).textContent;
    expect(subtitle.includes('1 filter')).to.be.true;
  });

  it('should have the correct indication of applied filters when there is more than 1 applied filter', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      settings: tableSettings,
      filters: [
        { selected: true, type: { name: 'a' } },
        { selected: false, type: { name: 'b' } },
        { selected: true, type: { name: 'c' } },
      ],
    });
    const subtitle = container.querySelector(PANEL_SUBTITLE_SELECTOR).textContent;
    expect(subtitle.includes('2 filters')).to.be.true;
  });

  it('should have a clear filters button when there are one or more filters applied', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      settings: tableSettings,
      filters: [
        { selected: false, type: { name: 'a' } },
        { selected: true, type: { name: 'b' } },
      ],
    });
    const clearFiltersButton = container.querySelector(CLEAR_FILTERS_SELECTOR);
    expect(clearFiltersButton).to.exist;
  });

  it('should have a clear filters button which emits a clear-all-filters event when clicked', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      settings: tableSettings,
      filters: [
        { selected: false, type: { name: 'a' } },
        { selected: true, type: { name: 'b' } },
      ],
    });
    const clearFiltersButton = container.querySelector(CLEAR_FILTERS_SELECTOR);
    clearFiltersButton.click();
    expect(filtersCleared).to.not.be.equal(false);
  });

  it('should not have a right side panel button when there is no selected context provided', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      loading: false,
      settings: tableSettings,
    });
    const rightPanelButton = container.querySelector(`[slot='right-panel-button']`);
    expect(rightPanelButton).to.not.exist;
  });

  it('should build the filter panel component', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      settings: tableSettings,
      filters: [
        { label: '1', value: '1', type: 'context', selected: true },
        { label: '2', value: '2', type: 'context', selected: false },
        { label: '3', value: '3', type: 'metric', selected: true },
      ],
      filterCategories: [
        {
          title: 'Network Filters',
          type: 'context',
          selection: 'checkbox',
          fields: [
            { label: 'NSI Context Column', value: 'NSI' },
            { label: 'SNSSAI Context Column', value: 'SNSSAI' },
          ],
          help: 'Test help for metrics accordion group',
        },
        {
          title: 'Metric Filters',
          type: 'metric',
          selection: 'radio',
          fields: [
            { label: 'KPI A', value: 'kpi-a' },
            { label: 'KPI B', value: 'kpi-b' },
            { label: 'KPI C', value: 'kpi-c' },
            { label: 'KPI D', value: 'kpi-d' },
          ],
          help: 'Test help for metrics accordion group',
        },
      ],
    });

    const filterPanel = container.querySelector('e-filter-panel');
    expect(filterPanel).to.exist;
  });

  it('should show error message in subtitle when metric browser has an error', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      error: 'some error',
      settings: { rowHeight: undefined, autoRefresh: false },
    });
    const errorIndicator = container.querySelector('#error-indicator');
    expect(errorIndicator).to.exist;
  });

  it('When autorefresh is turned on metric browser should contain the pause auto-refresh button', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      settings: { ...tableSettings, autoRefresh: true },
    });

    const resumeButton = container.querySelector(RESUME);
    const pauseButton = container.querySelector(PAUSE);
    const manualRefreshButton = container.querySelector(REFRESH);
    const lastRefreshedLabel = container.querySelector(LAST_REFRESHED_LABEL);

    expect(pauseButton).to.exist;
    expect(resumeButton).to.not.exist;
    expect(manualRefreshButton).to.not.exist;
    expect(lastRefreshedLabel).to.not.exist;
  });

  it('When autorefresh is turned off the metric browser should contain the resume auto-refresh button', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      settings: { ...tableSettings, autoRefresh: false },
    });

    const resumeButton = container.querySelector(RESUME);
    const pauseButton = container.querySelector(PAUSE);
    const manualRefreshButton = container.querySelector(REFRESH);
    const lastRefreshedLabel = container.querySelector(LAST_REFRESHED_LABEL);

    expect(pauseButton).to.not.exist;
    expect(resumeButton).to.exist;
    expect(manualRefreshButton).to.exist;
    expect(lastRefreshedLabel).to.exist;
  });

  it('When autorefresh is turned on you can pause the auto refresh', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      settings: { ...tableSettings, autoRefresh: true },
    });

    const pauseButton = container.querySelector(PAUSE);
    pauseButton.click();
    await nextTick();

    // Test the event emitted to apply the changes
    expect(settingsUpdate).to.deep.equal({ ...tableSettings, autoRefresh: false });

    let actual = {};

    const stateAccessor = {
      getSubState: () => ({
        id: 'test1',
        title: 'test1',
        settings: { autoRefresh: true, rowHeight: 'compact' },
        context: { columns: [] },
      }),
      updateSubState(s) {
        actual = { ...s };
      },
    };

    const expectedBrowserStateForSettings = {
      id: 'test1',
      title: 'test1',
      settings: { autoRefresh: false, rowHeight: 'compact' },
      context: { columns: [] },
    };

    // use the event emitted as input to the action handler to test the contract
    await updateSettings(stateAccessor, settingsUpdate);
    expect(actual).to.deep.eql(expectedBrowserStateForSettings);
  });

  it('When autorefresh paused you can resume the auto refresh', async () => {
    container = await renderMetricBrowser({
      title: PANEL_TITLE,
      settings: { ...tableSettings, autoRefresh: false },
    });

    const resumeButton = container.querySelector(RESUME);
    resumeButton.click();
    await nextTick();

    // Test the event emitted to apply the changes
    expect(settingsUpdate).to.deep.equal({ ...tableSettings, autoRefresh: true });

    let actual = {};

    const stateAccessor = {
      getSubState: () => ({
        id: 'test2',
        title: 'test2',
        settings: { autoRefresh: false, rowHeight: 'compact' },
        context: { columns: [] },
      }),
      updateSubState(s) {
        actual = { ...s };
      },
    };

    const expectedBrowserStateForSettings = {
      id: 'test2',
      title: 'test2',
      settings: { autoRefresh: true, rowHeight: 'compact' },
      context: { columns: [] },
    };

    // use the event emitted as input to the action handler to test the contract
    await updateSettings(stateAccessor, settingsUpdate);
    expect(actual).to.deep.eql(expectedBrowserStateForSettings);
  });

  it('Should have the correct indication of selected row when no row is selected', async () => {
    const element = await renderMetricBrowser({
      settings: settingDefaults,
      columns: columnInfo,
      actions: tableActions,
      rowSelected: { selected: false },
      data: { total: 10, numpages: 1, numentries: 13, currentpage: 1, tableData },
    });

    const table = element.querySelector(METRIC_TABLE);
    const rowSelectionDisclosure = table.shadowRoot.querySelector(ROW_DISCLOSURE);
    expect(rowSelectionDisclosure.textContent).to.equal('Row selection:  Nothing selected ');
  });

  it('Should have the correct indication of selected row when a row is selected', async () => {
    const element = await renderMetricBrowser({
      settings: settingDefaults,
      columns: columnInfo,
      actions: tableActions,
      rowSelected: {
        selected: true,
        metadata: { context: { contextFields: [{ name: 'a' }, { name: 'b' }, { name: 'c' }] } },
      },
      data: { total: 10, numpages: 1, numentries: 13, currentpage: 1, tableData },
    });

    const table = element.querySelector(METRIC_TABLE);
    const rowSelectionDisclosure = table.shadowRoot.querySelector(ROW_DISCLOSURE);
    expect(rowSelectionDisclosure.textContent).to.equal('Row selection:  a, b, c');
  });
});

describe('Metric Browser Action tests', async () => {
  before(async () => {
    MetricBrowser.register();
  });

  it('Row Select: If there is no selected row only show the static action buttons', async () => {
    const element = await renderMetricBrowser({
      settings: settingDefaults,
      columns: columnInfo,
      actions: tableActions,
      rowSelected: { selected: false },
      data: { total: 10, numpages: 1, numentries: 13, currentpage: 1, tableData },
    });

    const tableOptions = element.querySelector(TABLE_OPTIONS);
    if (tableOptions) {
      tableOptions.click();
      await nextTick();
      const menuItems = tableOptions.shadowRoot.querySelectorAll('eui-menu-item');
      // menu items: filters, settings
      expect(menuItems.length).to.equal(2);
    } else {
      const actionButtons = element.querySelectorAll('.action-button');
      // action buttons: info-popup, filters, settings
      expect(actionButtons.length).to.equal(3);
    }
  });

  it('Row Select: If there is a selected row show the dynamic action buttons and the static action buttons', async () => {
    const element = await renderMetricBrowser({
      settings: settingDefaults,
      columns: columnInfo,
      actions: tableActions,
      rowSelected: { selected: true },
      data: { total: 10, numpages: 1, numentries: 13, currentpage: 1, tableData },
    });

    const tableOptions = element.querySelector(TABLE_OPTIONS);
    if (tableOptions) {
      tableOptions.click();
      await nextTick();
      const menuItems = tableOptions.shadowRoot.querySelectorAll('eui-menu-item');
      // menu items: historical data, other contexts options, filters, and settings
      expect(menuItems.length).to.equal(9);
    } else {
      const actionButtons = element.querySelectorAll('.action-button');
      // action buttons: info-popup, historical data, other contexts, filters, settings
      expect(actionButtons.length).to.equal(5);
    }
  });

  it('Filters Button: Clicking filters opens the filter panel', async () => {
    const element = await renderMetricBrowser({
      settings: settingDefaults,
      columns: columnInfo,
      data: { total: 10, numpages: 1, numentries: 13, currentpage: 1, tableData },
    });
    let filterButton;
    const tableOptions = element.querySelector(TABLE_OPTIONS);
    if (tableOptions) {
      tableOptions.click();
      await nextTick();
      filterButton = tableOptions.shadowRoot.querySelector("[value='filters']");
    } else {
      filterButton = element.querySelector('#filter-button');
    }
    filterButton.click();
    await elementUpdated(element);
    const filterPanel = element.shadowRoot.querySelector('e-filter-panel');
    expect(filterPanel).is.visible;
  });

  it('Table Settings Button: Clicking table settings button in the action bar for the table shows the table settings dialog', async () => {
    const element = await renderMetricBrowser({
      settings: settingDefaults,
      columns: columnInfo,
      data: { total: 10, numpages: 1, numentries: 13, currentpage: 1, tableData },
    });

    await clickSettingsButton(element);

    await nextTick();
    const settingsDialog = element
      .querySelector(METRIC_TABLE)
      .shadowRoot.querySelector(SETTINGS_DIALOG);

    expect(settingsDialog.show).to.be.true;
  });

  it('Table Settings: Cancel button hides the dialog', async () => {
    const element = await renderMetricBrowser({
      settings: settingDefaults,
      columns: columnInfo,
      data: { total: 10, numpages: 1, numentries: 13, currentpage: 1, tableData },
    });
    await clickSettingsButton(element);

    await nextTick();
    const settingsDialog = element
      .querySelector(METRIC_TABLE)
      .shadowRoot.querySelector(SETTINGS_DIALOG);
    const dialog = settingsDialog.shadowRoot.querySelector('eui-dialog');
    const cancelButton = dialog.shadowRoot.querySelector('eui-button[class="cancel"]');
    cancelButton.click();
    await nextTick();
    expect(settingsDialog.show).to.be.false;
  });

  it('Other Context: Clicking a context option from the table actions emits the correct event', async () => {
    const element = await renderMetricBrowser({
      settings: settingDefaults,
      columns: columnInfo,
      actions: tableActions,
      rowSelected: { selected: true },
      data: { total: 10, numpages: 1, numentries: 13, currentpage: 1, tableData },
    });
    let contextItem;
    const tableOptions = element.querySelector(TABLE_OPTIONS);
    if (tableOptions) {
      tableOptions.click();
      await nextTick();
      contextItem = tableOptions.shadowRoot.querySelector("[value='Open supporting NSI']");
    } else {
      const otherContextsButton = element.querySelector('#other-contexts');
      otherContextsButton.click();
      await nextTick();
      contextItem = otherContextsButton.shadowRoot.querySelector("[value='Open supporting NSI'");
    }
    contextItem.click();
    const expected = {
      context: {
        contextFields: 'Array(2)',
        id: 'CID_1235',
        name: 'NSSAI & NSI Context',
      },
      operation: 'open-tab',
      row: {
        selected: true,
      },
    };
    const { id, ...rest } = tableActionEvent;
    expect(rest).to.deep.equal(expected);
  });

  it('Historical Data: Clicking on charts option from the table actions emits the correct event', async () => {
    const element = await renderMetricBrowser({
      settings: settingDefaults,
      columns: columnInfo,
      actions: tableActions,
      rowSelected: { selected: true },
      data: { total: 10, numpages: 1, numentries: 13, currentpage: 1, tableData },
    });
    let chartsItem;
    const tableOptions = element.querySelector(TABLE_OPTIONS);
    if (tableOptions) {
      tableOptions.click();
      await nextTick();
      chartsItem = tableOptions.shadowRoot.querySelector("[value='charts']");
    } else {
      chartsItem = element.querySelector('#charts');
    }
    chartsItem.click();
    const expected = {
      data: {
        selected: true,
      },
      operation: 'open-charts',
    };
    const { id, ...rest } = tableActionEvent;
    expect(rest).to.deep.equal(expected);
  });
});
