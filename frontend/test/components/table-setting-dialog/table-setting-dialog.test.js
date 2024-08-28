import { expect, fixture, html, elementUpdated } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import TableSettingDialog from '../../../src/components/table-setting-dialog/table-setting-dialog';
import { updateSettings } from '../../../src/state/tableActions';
import { isRendered } from '../../utils/isRendered';
import { nextTick } from '../../utils/utils.js';
import { constants } from '../../utils/constants.js';
import MetricBrowserTable from '../../../src/components/metric-browser-table/metric-browser-table';

const SAVE_SETTINGS = 'eui-button[slot="bottom"]';
const COLUMN_SETTINGS = 'eui-table-setting';
const ROW_HEIGHT_MENU = 'eui-dropdown';
const HEADER_ITEM = '.header-item';

const renderTableSettings = async ({ settings, show, applyFn }) => {
  const tableSettings = html`
    <e-table-setting-dialog
      .settings=${ifDefined(settings)}
      ?show=${ifDefined(show)}
      @update-settings=${ifDefined(applyFn)}
    ></e-table-setting-dialog>
  `;
  const element = await fixture(tableSettings);
  await isRendered(element);
  return element;
};

const columnInfo = constants.MOCK_TABLE_COLUMNS;

const settingDefaults = { ...constants.TABLE_SETTINGS, columns: columnInfo };

describe('TableSettingDialog Component Tests', async () => {
  before(() => {
    TableSettingDialog.register();
    MetricBrowserTable.register();
  });

  it('Esc button hides the dialog', async () => {
    const element = await renderTableSettings({
      settings: settingDefaults,
      show: true,
    });
    const dialogComponent = element.shadowRoot.querySelector('eui-dialog');
    const escapeBtn = new KeyboardEvent('keydown', {
      key: 'Escape',
      code: 'Escape',
      keyCode: 27,
      which: 27,
      bubbles: true,
    });
    element.dispatchEvent(escapeBtn);
    await elementUpdated(element);
    expect(dialogComponent.show).to.be.false;
  });

  it('Apply the table settings emits the correct event when applied with row height adjusted', async () => {
    let result;

    const updateTableSettings = (event) => {
      result = event.detail;
    };

    const element = await renderTableSettings({
      settings: settingDefaults,
      show: true,
      applyFn: updateTableSettings,
    });

    const rowHeightMenu = element.shadowRoot.querySelector(ROW_HEIGHT_MENU);
    rowHeightMenu.click();
    await nextTick();

    const compactOption = rowHeightMenu.shadowRoot.querySelector(
      'eui-menu eui-menu-item[value="tiny"]',
    );
    compactOption.click();
    await nextTick();

    const applyButton = element.shadowRoot.querySelector(SAVE_SETTINGS);
    applyButton.click();
    await nextTick();

    expect(result).to.deep.equal({ ...settingDefaults, rowHeight: 'tiny' });
  });

  it('Apply the table settings emits the correct event when applied with column changes', async () => {
    let result;

    const updateTableSettings = (event) => {
      result = event.detail;
    };

    const element = await renderTableSettings({
      settings: settingDefaults,
      show: true,
      applyFn: updateTableSettings,
    });

    const columnSettingsComponent = element.shadowRoot.querySelector(COLUMN_SETTINGS);
    const hideAllButton = columnSettingsComponent.shadowRoot.querySelectorAll(HEADER_ITEM)[1];
    hideAllButton.click();
    await nextTick();

    const applyButton = element.shadowRoot.querySelector(SAVE_SETTINGS);
    applyButton.click();
    await nextTick();

    expect(result).to.deep.equal({
      autoRefresh: false,
      columns: columnInfo.map((c) => {
        c.hidden = true;
        return c;
      }),
      rowHeight: 'compact',
    });
  });

  it('Apply the table settings emits the correct event when all settings changed and applies to state as expected', async () => {
    let result;

    const updateTableSettings = (event) => {
      result = event.detail;
    };

    const element = await renderTableSettings({
      settings: settingDefaults,
      show: true,
      applyFn: updateTableSettings,
    });

    const rowHeightMenu = element.shadowRoot.querySelector(ROW_HEIGHT_MENU);
    rowHeightMenu.click();
    await nextTick();

    const compactOption = rowHeightMenu.shadowRoot.querySelector(
      'eui-menu eui-menu-item[value="compact"]',
    );
    compactOption.click();
    await nextTick();

    const columnSettingsComponent = element.shadowRoot.querySelector(COLUMN_SETTINGS);
    const hideAllButton = columnSettingsComponent.shadowRoot.querySelectorAll(HEADER_ITEM)[1];
    hideAllButton.click();
    await nextTick();

    const applyButton = element.shadowRoot.querySelector(SAVE_SETTINGS);
    applyButton.click();
    await nextTick();

    // Test the event emitted to apply the changes
    expect(result).to.deep.equal({
      autoRefresh: false,
      columns: columnInfo.map((c) => {
        c.hidden = true;
        return c;
      }),
      rowHeight: 'compact',
    });

    let actual = {};

    const stateAccessor = {
      getSubState: () => ({
        id: 'test2',
        title: 'test2',
        settings: { autoRefresh: true, rowHeight: 'tiny' },
        context: { columns: columnInfo },
      }),
      updateSubState(s) {
        actual = { ...s };
      },
    };

    const expectedBrowserStateForSettings = {
      id: 'test2',
      title: 'test2',
      settings: {
        autoRefresh: false,
        rowHeight: 'compact',
      },
      context: {
        columns: columnInfo.map((c) => {
          c.hidden = true;
          return c;
        }),
      },
    };

    // use the event emitted as input to the action handler to test the contract
    await updateSettings(stateAccessor, result);
    expect(actual).to.deep.eql(expectedBrowserStateForSettings);
  });

  it('Dialog controls are properly selected when settings are provided', async () => {
    const element = await renderTableSettings({
      settings: {
        autoRefresh: false,
        columns: columnInfo.map((c) => {
          c.hidden = true;
          return c;
        }),
        rowHeight: 'compact',
      },
      show: true,
    });
    const rowHeightMenu = element.shadowRoot.querySelector(ROW_HEIGHT_MENU);
    const rowHeightActiveSelection = rowHeightMenu.shadowRoot.querySelector(
      'eui-menu eui-menu-item[selected]',
    );
    const columnSettingsComponent = element.shadowRoot.querySelector(COLUMN_SETTINGS);
    const hideAllButton = columnSettingsComponent.shadowRoot.querySelectorAll(HEADER_ITEM)[1];

    expect(rowHeightActiveSelection.getAttribute('value')).to.equal('compact');
    expect(hideAllButton.classList.contains('enabled')).to.be.false;
  });
});
