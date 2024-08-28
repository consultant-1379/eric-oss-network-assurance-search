/**
 * Component TableSettingDialog is defined as
 * `<e-table-setting-dialog>`
 *
 * @extends {LitComponent}
 */
import { LitComponent, html, definition } from '@eui/lit-component';
import {
  Button,
  TextField,
  Dropdown,
  Checkbox,
  Spinner,
  Dialog,
  MenuItem,
  ComboBox,
  Accordion,
  Switch,
} from '@eui/base';
import { Setting } from '@eui/table';
import style from './table-setting-dialog.css';

export default class TableSettingDialog extends LitComponent {
  get meta() {
    return import.meta;
  }

  static get components() {
    return {
      'eui-button': Button,
      'eui-dialog': Dialog,
      'eui-text-field': TextField,
      'eui-checkbox': Checkbox,
      'eui-dropdown': Dropdown,
      'eui-menu-item': MenuItem,
      'eui-spinner': Spinner,
      'eui-combobox': ComboBox,
      'eui-accordion': Accordion,
      'eui-table-setting': Setting,
      'eui-switch': Switch,
    };
  }

  didConnect() {
    this.settingsToUpdate = { ...this.settings };
  }

  didChangeProps(changedProps) {
    if (changedProps.has('show')) {
      this.settingsToUpdate = { ...this.settings };

      // Override the E-UI SDK's dropdown default keydown event to support a ESC button for a table-setting-dialog
      const dialog = this.shadowRoot.querySelector('eui-dialog');
      const dropdown = dialog
        .querySelector('[slot=content] .row .column eui-dropdown')
        .shadowRoot.querySelector('.dropdown eui-button');
      dropdown.addEventListener('keydown', (ev) => {
        this._escBtnClicked(ev);
      });
    }
  }

  didUpgrade = () => {
    this.tableSettings = this.shadowRoot.querySelector('eui-table-setting');
  };

  // Event to hide the dialog. Functionality is implemented by calling component.
  _dialogCancel = () => {
    this.bubble('cancel-dialog');
    this.settingsToUpdate = { ...this.settings };
  };

  _escBtnClicked = (ev) => {
    if (ev.code === 'Escape') {
      this._dialogCancel();
    }
  };

  // Bubble the event to update the table with the selected settings and close the dialog
  _applySettings = () => {
    this.bubble('update-settings', { ...this.settingsToUpdate });
    this._dialogCancel();
  };

  /*
   * Update the table settings with the provided setting data for the provided key
   * Helper function. Other functions below provide the specific data.
   */
  _adjustSettings = (setting, key) => {
    this.settingsToUpdate[key] = setting;
  };

  /*
   * This function is called once the event with the column data is emitted from table-settings component.
   * The information from that event is used to update the 'columns' in the table settings object and
   * and then emitted to the top level for processing and integration into the state.
   */
  _adjustColumns = ({ detail }) => {
    this._adjustSettings(detail.value, 'columns');
    this._applySettings();
  };

  // calls apply method on tableSettings to get the state via event of the webcomponent as recommended by euisdk
  _applyColumns = () => this.tableSettings.apply();

  // Update row_height in the table settings object with the selected value
  _adjustRowHeight = ({ detail }) => this._adjustSettings(detail.menuItems[0].value, 'rowHeight');

  // Build the row height menu items
  _buildMenuItem = ({ label, value }, selected) =>
    html`
      <eui-menu-item
        label="${label}"
        value=${value}
        ?selected=${selected === value}
      ></eui-menu-item>
    `;

  // Build Row Height menu items
  _buildRowHeightMenuItems = (rowHeight) =>
    [
      {
        label: this.i18n?.ROW_HEIGHT_DEFAULT || 'Normal (Default)',
        value: undefined,
      },
      {
        label: this.i18n?.ROW_HEIGHT_COMPACT || 'Compact',
        value: 'compact',
      },
      {
        label: this.i18n?.ROW_HEIGHT_TINY || 'Tiny',
        value: 'tiny',
      },
    ].map((item) => this._buildMenuItem(item, rowHeight));

  _buildDialogContent = () => {
    const { columns, rowHeight } = this.settingsToUpdate;

    return html`
      <div class="row" id="labels">
        <div class="column">${this.i18n?.ROW_HEIGHT || 'Row Height'}</div>
      </div>
      <div class="row">
        <div class="column">
          <eui-dropdown
            tabindex="0"
            data-type="single"
            label=${this.i18n?.ROW_HEIGHT_LABEL || 'Select...'}
            @eui-dropdown:change="${this._adjustRowHeight}"
          >
            ${this._buildRowHeightMenuItems(rowHeight)}
          </eui-dropdown>
        </div>
      </div>
      <div class="row">
        <eui-table-setting
          id="column-settings"
          visibility-action-tooltip=${this.i18n?.COL_VIS_TOOLTIP || 'Hide / Show column'}
          pin-action-tooltip=${this.i18n?.PIN_TOOLTIP || 'Pin / Unpin column'}
          sub-heading=${this.i18n?.COL_LABEL || 'Columns'}
          show-all=${this.i18n?.COLS_SHOW_ALL || 'Show All'}
          hide-all=${this.i18n?.COLS_HIDE_ALL || 'Hide All'}
          ?pinned=${true}
          .columns=${columns}
          @eui-table-setting:apply=${this._adjustColumns}
        ></eui-table-setting>
      </div>
    `;
  };

  /**
   * Render the <e-table-setting-dialog> component. This function is called each time a
   * prop changes.
   */
  render() {
    return html`
      <eui-dialog
        style="--space-large:16px"
        ?show=${this.show}
        label=${this.i18n?.TITLE}
        @keydown=${(ev) => {
          this._escBtnClicked(ev);
        }}
        @eui-dialog:cancel=${this._dialogCancel}
      >
        <div slot="content">${this._buildDialogContent()}</div>
        <eui-button slot="bottom" @click=${this._applyColumns} primary>
          ${this.i18n?.APPLY_BUTTON}
        </eui-button>
      </eui-dialog>
    `;
  }
}

/**
 * @property {Object} settings - data used to set the table: includes auto-refresh, current columns, and row height
 * @property {Boolean} show - whether to show or hide the dialog
 */
definition('e-table-setting-dialog', {
  style,
  props: {
    settings: {
      attribute: false,
      type: Object,
    },
    show: { attribute: true, type: Boolean, default: false },
  },
})(TableSettingDialog);
