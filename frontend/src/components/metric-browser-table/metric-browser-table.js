/**
 * Component MetricBrowserTable is defined as
 * `<e-metric-browser-table>`
 *
 * @extends {LitComponent}
 */
import { LitComponent, html, definition } from '@eui/lit-component';
import { Table, Pagination } from '@eui/table';
import { ActionableIcon, InfoPopup, Button, Tooltip, Menu, MenuItem, Dropdown } from '@eui/base';
import { Icon } from '@eui/theme';
import style from './metric-browser-table.css';
import CustomTable from '../custom-table/custom-table.js';
import ErrorBanner from '../error-banner/error-banner';
import InfoBanner from '../info-banner/info-banner';
import TableSettingDialog from '../table-setting-dialog/table-setting-dialog';
import { uuid } from '../../utils/helper.js';
import replaceInLocale from '../../utils/replaceInLocale';

const METRIC_SEARCH = 'metric-search';
const UPDATE_FACET_COUNTS = 'update-facet-counts';
const ROW_SELECTED_ACTION = 'table-actions-row-selected';

export default class MetricBrowserTable extends LitComponent {
  constructor() {
    super();
    Table.register();
    // Pagination.register();
    this.tableElement = null;
    this.paginationElement = null;
  }

  static get components() {
    return {
      'eui-actionable-icon': ActionableIcon,
      'eui-custom-table': CustomTable,
      'eui-info-popup': InfoPopup,
      'eui-icon': Icon,
      'eui-tooltip': Tooltip,
      'eui-button': Button,
      'eui-pagination': Pagination,
      'e-info-banner': InfoBanner,
      'e-error-banner': ErrorBanner,
      'eui-menu-item': MenuItem,
      'eui-menu': Menu,
      'eui-table': Table,
      'eui-dropdown': Dropdown,
      'e-table-setting-dialog': TableSettingDialog,
    };
  }

  get meta() {
    return import.meta;
  }

  // Lifecycle events
  didUpgrade() {
    this.tableElement = this.shadowRoot.querySelector('eui-table');
  }

  // Broadcasting events
  _refreshTableData = () => this.bubble(METRIC_SEARCH);

  // Handling events
  _handleSortEvent = (event) => {
    if (event.detail) {
      const sortBy = {
        id: event.detail?.column.attribute,
      };
      const sortOrder = event.detail?.column.sort;
      this.bubble(METRIC_SEARCH, { sortBy, sortOrder });
    }
    event.stopPropagation();
  };

  _handlePageEvent = (event) => {
    const column = this.columns.find((c) => c.sort);
    const sort = { sortBy: { id: column.attribute }, sortOrder: column.sort };

    this.bubble(METRIC_SEARCH, {
      ...event.detail?.state,
      ...sort,
    });
    event.stopPropagation();
  };

  _errorBanner = () => {
    console.warn('The table is misconfigured because it has no columns.');
    return html`
      <e-error-banner message=${this.i18n?.CONFIG_ERROR}></e-error-banner>
    `;
  };

  _noResultsBanner = () =>
    html`
      <e-info-banner id="no-results" message=${this.i18n?.NO_RESULTS}></e-info-banner>
    `;

  _emitActionEvent = (value) => {
    if (value === 'charts') {
      this.contextRow.selected = true;
      this.bubble('table-actions', { operation: 'open-charts', data: this.contextRow });
    } else {
      const id = uuid();
      // Removing the facet count from the label
      const baseLabelMatches = value.match(/(.*) \(\d+\)$/);
      // If there is no facet count in the label, then baseLabel == label
      const baseLabel = baseLabelMatches !== null ? baseLabelMatches[1] : value;
      const actionDetail = this.actions.filter((i) => i.label === baseLabel)[0]?.data;
      actionDetail.row = this.contextRow;
      actionDetail.id = id;
      this.bubble('table-actions', actionDetail);
    }
  };

  _searchRelatedContextsFacets = (rowData, facetCountKey) => {
    this.bubble(UPDATE_FACET_COUNTS, { rowData, facetCountKey });
  };

  _handleContextMenu = (event) => {
    this._searchRelatedContextsFacets(event.detail.row, 'contextMenu');
    // store the row...
    this.contextRow = event.detail.row;
    // show the menu
    event.detail.menu.show = true;
  };

  _handleTableRowSelect = (event) => {
    this._searchRelatedContextsFacets(event.detail, 'contextMenu');
    this.contextRow = event.detail;
    this.bubble(ROW_SELECTED_ACTION, event.detail);
  };

  _actionButtonOnContext = (event) => {
    const [menuItem] = event.detail.menuItems;
    this._emitActionEvent(menuItem.value);
  };

  _chartsMenuItem = () => html`
    <eui-menu-item
      label=${this.i18n?.HISTORIICAL_DASHBOARD_BUTTON || 'Historical Data'}
      value="charts"
    >
      <eui-icon name="graph-plot" slot="left"></eui-icon>
    </eui-menu-item>
  `;

  buildMenuItem = (menuList) =>
    menuList.map(({ facetCounts, label }) => {
      const labelSuffix = facetCounts?.contextMenu ? ` (${facetCounts.contextMenu})` : '';
      return html`
        <eui-menu-item
          label="${this.i18n?.CONTEXT_ITEM_PREFIX || 'Add Context: '}${label}${labelSuffix}"
          value=${label}
        >
          <eui-icon name="plus" slot="left"></eui-icon>
        </eui-menu-item>
      `;
    });

  // Build the table settings dialog: row height, and column adjustment settings
  _buildTableSettingsDialog = () =>
    html`
      <e-table-setting-dialog
        .settings=${{ ...this.settings, columns: this.columns }}
        ?show=${this.showSettingsDialog}
        @cancel-dialog=${this._hideTableSettings}
      ></e-table-setting-dialog>
    `;

  // Function to hide the table settings
  _hideTableSettings = () => this.bubble('hide-settings');

  _buildPager = () =>
    html`
      <eui-pagination
        @eui-table:page-index-change=${this._handlePageEvent}
        current-page=${this.currentpage}
        num-entries=${this.numentries}
        num-pages=${this.numpages}
        comp-orientation="horizontal"
        comp-direction="normal"
      ></eui-pagination>
    `;

  _resultCountTitle = () => {
    const start = !this.total ? 0 : this.numentries * (this.currentpage - 1) + 1;
    const end =
      this.total / this.currentpage > this.numentries ? start + this.numentries : this.total;
    return html`
      <div class="table-metadata" id="result-title">
        ${replaceInLocale(
          this.i18n?.TABLE_RESULTS_LABEL || '{{start}} - {{end}} of {{total}} results',
          {
            start,
            end,
            total: this.total,
          },
        )}
      </div>
    `;
  };

  _selectedRowDisclosure = () => html`
    <div class="table-metadata" id="row-disclosure">${this.selectedRowLabel}</div>
  `;

  _buildTable = () => html`
    ${this._buildTableSettingsDialog()}
    <div>${this._selectedRowDisclosure()}${this._resultCountTitle()}</div>

    <eui-custom-table
      class="metrics-table"
      resizable
      sortable
      single-select
      ?tiny=${this.settings.rowHeight === 'tiny'}
      ?compact=${this.settings.rowHeight === 'compact'}
      pinned
      striped
      .data=${this.data}
      .columns=${this.columns}
      @eui-table:sort=${this._handleSortEvent}
      @eui-table:contextmenu="${this._handleContextMenu}"
      @eui-table:row-click=${this._handleTableRowSelect}
    >
      <eui-menu slot="context-menu" @eui-menu:click="${this._actionButtonOnContext}">
        ${this._chartsMenuItem()} ${this.buildMenuItem(this.actions)}
      </eui-menu>
    </eui-custom-table>

    ${this.data.length === 0 ? this._noResultsBanner() : this._buildPager()}
  `;

  /**
   * Render the <e-metric-browser-table> component. This function is called each time a
   * prop changes.
   */
  render() {
    return html`
      ${this.columns.length === 0 ? this._errorBanner() : this._buildTable()}
    `;
  }
}

/**

 */
definition('e-metric-browser-table', {
  style,
  props: {
    currentpage: { attribute: false, type: Number, default: 1 },
    numentries: { attribute: false, type: Number, default: 1 },
    numpages: { attribute: false, type: Number, default: 1 },
    total: { attribute: false, type: Number, default: 1 },
    columns: { attribute: false, type: Array },
    data: { type: Array },
    striped: { attribute: true, type: Boolean, default: true },
    showActionButtons: { attribute: false, type: Boolean, default: false },
    actions: { attribute: false, type: Array, default: [] },
    showSettingsDialog: { attribute: true, type: Boolean, default: false },
    selectedRowLabel: { attribute: false, type: String },
    settings: {
      attribute: false,
      type: Object,
      default: { autoRefresh: false, columns: [], rowHeight: undefined },
    },
  },
})(MetricBrowserTable);
