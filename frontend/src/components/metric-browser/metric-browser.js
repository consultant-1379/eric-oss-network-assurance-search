/**
 * Component MetricBrowser is defined as
 * `<e-metric-browser>`
 *
 * @extends {LitComponent}
 */
import { definition, html, LitComponent, nothing } from '@eui/lit-component';
import { MultiPanelTile, TilePanel } from '@eui/layout';
import { Button, Dropdown, MenuItem, InfoPopup, Loader, Tooltip, ActionableIcon } from '@eui/base';
import { Icon } from '@eui/theme';
import dayjs from 'dayjs';
import relativeTime from 'dayjs/plugin/relativeTime';
import style from './metric-browser.css';
import MetricCategoryPicker from '../metric-category-picker/metric-category-picker';
import MetricBrowserTable from '../metric-browser-table/metric-browser-table.js';
import FilterPanel from '../filter-panel/filter-panel';
import InlineButton from '../inline-button/inline-button';
import replaceInLocale from '../../utils/replaceInLocale';
import TutorialBanner from '../tutorial-banner/tutorial-banner';
import { uuid } from '../../utils/helper';

export default class MetricBrowser extends LitComponent {
  constructor() {
    super();
    dayjs.extend(relativeTime);
    setInterval(() => {
      this.lastRefreshed = dayjs().to(dayjs(this.data.fetchTime));
    }, 60000);

    setInterval(() => {
      // If the tab is active, auto refresh is on
      if (this.active && this.settings.autoRefresh) {
        this._refreshTableData();
      }
    }, 30000);
  }

  get meta() {
    return import.meta;
  }

  static get components() {
    return {
      'e-tutorial-banner': TutorialBanner,
      'eui-multi-panel-tile': MultiPanelTile,
      'eui-tile-panel': TilePanel,
      'eui-info-popup': InfoPopup,
      'eui-icon': Icon,
      'eui-button': Button,
      'e-metric-category-picker': MetricCategoryPicker,
      'e-metric-browser-table': MetricBrowserTable,
      'e-filter-panel': FilterPanel,
      'e-inline-button': InlineButton,
      'eui-loader': Loader,
      'eui-tooltip': Tooltip,
      'eui-actionable-icon': ActionableIcon,
      'eui-dropdown': Dropdown,
      'eui-menu-item': MenuItem,
    };
  }

  _resizeEvent = () => {
    const rect = this.shadowRoot.querySelector('e-metric-browser-table')?.getBoundingClientRect();
    this.showCollapsedMenu = rect && rect.width < 800;
  };

  didConnect() {
    this.bubble('create-browser-sub-state', {
      subState: this.id,
      mediator: this,
    });
    this.resizeObserver = new ResizeObserver(this._resizeEvent);
  }

  didDisconnect() {
    this.resizeObserver.disconnect();
  }

  didChangeProps(changedProps) {
    const element = this.shadowRoot.querySelector('e-metric-browser-table');

    if (element) {
      this.resizeObserver.observe(element);
    }

    this._updateTimeSince();

    /**
     * When `id` prop is changed this browser needs to be fully reset.
     * Removing the sub-state will release all resources.
     * Subsequently, when a new sub-state is created,
     * it will trigger the re-installation of the necessary resources.
     */
    if (changedProps.has('id')) {
      this.bubble('remove-browser-sub-state', {
        subState: this.id,
      });

      this.bubble('create-browser-sub-state', {
        subState: this.id,
        mediator: this,
      });
    }
  }

  _updateTimeSince = () => {
    if (!this.data.fetchTime) {
      this.data.fetchTime = new Date().getTime();
    }
    this.lastRefreshed = dayjs().to(dayjs(this.data.fetchTime));
  };

  _clearAllFilters = () => this.bubble('update-filters', { updateOperation: 'clear-all-filters' });

  _helpTooltip = () => html`
    <eui-info-popup class="action-button" slot="action" icon="info" position="bottom-end">
      <div id="metric-browser-help">${this.i18n?.METRIC_BROWSER_HELP}</div>
    </eui-info-popup>
  `;

  _filterPanel = () =>
    html`
      <eui-tile-panel
        slot="left"
        id="filter-panel"
        tile-title="${this.i18n?.FILTER_PANEL_TITLE}"
        aria-label="${this.i18n?.FILTER_PANEL_TITLE}"
        icon-name="filter"
        width="340"
      >
        <eui-info-popup slot="action" icon="info" position="left-start">
          <div id="filter-help">${this.i18n?.FILTER_HELP}</div>
        </eui-info-popup>

        <e-filter-panel
          slot="content"
          .categories=${this.filterCategories}
          .filters=${this.filters}
          .match=${this.match}
          .filterHelpContent=${this.filterHelpContent}
          @pause=${this._pauseAutoRefresh}
          @resume=${this._resumeAutoRefresh}
        ></e-filter-panel>
      </eui-tile-panel>
    `;

  _filterCountLabelAndButton = (count) => {
    const activeFilters = this.filters
      .filter((filter) => filter.selected)
      .map((filter) => filter.type.name)
      .join(', ');
    const tooltip = `${this.i18n?.ACTIVE_FILTERS} ${activeFilters}`;

    return html`
      <eui-tooltip dotted position="top">
        <div slot="message">
          <div>${tooltip}</div>
        </div>
        <span id="filters-applied">
          ${count > 1
            ? `${count} ${this.i18n?.FILTERS_APPLIED_SUBTITLE}`
            : this.i18n?.FILTER_APPLIED_SUBTITLE}
        </span>
      </eui-tooltip>
      <e-inline-button
        id="clear-btn"
        aria-label="${this.i18n?.ARIA_CLEAR_FILTERS_DESCRIPTION}"
        secondary
        @click=${this._clearAllFilters}
        label=${this.i18n?.CLEAR_FILTERS_BTN_LABEL}
      ></e-inline-button>
    `;
  };

  _controlAutoRefresh = (autoRefresh) =>
    this.bubble('update-settings', { ...this.settings, columns: this.columns, autoRefresh });

  _pauseAutoRefresh = () => this._controlAutoRefresh(false);

  _resumeAutoRefresh = () => this._controlAutoRefresh(true);

  _resumeAutoRefreshButton = () =>
    html`
      <eui-actionable-icon
        id="resume-refresh"
        class="autorefresh-control"
        aria-label=${this.i18n?.AUTOREFRESH_PLAY_LABEL || 'Restart auto-refresh'}
        name="video-play"
        @click=${this._resumeAutoRefresh}
      ></eui-actionable-icon>
    `;

  _pauseAutoRefreshButton = () =>
    html`
      <eui-actionable-icon
        id="pause-refresh"
        class="autorefresh-control"
        aria-label=${this.i18n?.AUTOREFRESH_PAUSE_LABEL || 'Pause auto-refresh'}
        name="video-pause"
        @click=${this._pauseAutoRefresh}
      ></eui-actionable-icon>
    `;

  _refreshTableData = () => {
    const sortedColumn = this.columns.find((c) => c?.sort);
    const sortBy = sortedColumn?.attribute ? { id: sortedColumn.attribute } : undefined;
    const sortOrder = sortedColumn?.sort ? sortedColumn.sort : undefined;
    this.bubble('metric-search', { sortBy, sortOrder });
  };

  _manualRefreshButton = () => html`
    <eui-tooltip position="top">
      <div slot="message">${this.i18n?.REFRESH_LABEL || 'Manually refresh table data'}</div>
      <eui-actionable-icon
        id="manual-refresh"
        class="autorefresh-control"
        aria-label=${this.i18n?.REFRESH_LABEL || 'Manually refresh table data'}
        name="reload"
        @click=${this._refreshTableData}
      ></eui-actionable-icon>
    </eui-tooltip>
    <span class="separator"></span>
  `;

  _autoRefreshSubtitle = () => {
    const { autoRefresh } = this.settings;
    return html`
      ${!autoRefresh ? this._manualRefreshButton() : nothing}
      <eui-tooltip position="top">
        <div slot="message">
          ${!autoRefresh
            ? this.i18n?.AUTOREFRESH_PAUSE_LABEL || 'Pause auto-refresh'
            : this.i18n?.AUTOREFRESH_PLAY_LABEL || 'Resume auto-refresh'}
        </div>

        ${!autoRefresh ? this._resumeAutoRefreshButton() : this._pauseAutoRefreshButton()}
      </eui-tooltip>
      ${autoRefresh
        ? this.i18n?.AUTOREFRESH_ON_LABEL || 'Auto-refreshing every 30s'
        : this.i18n?.AUTOREFRESH_PAUSED || 'Auto-refresh paused -'}
      ${!autoRefresh ? this._lastRefreshedLabel() : nothing}
    `;
  };

  _noFiltersLabel = () =>
    html`
      <span id="no-filters">${this.i18n?.NO_FILTERS_APPLIED_SUBTITLE}</span>
    `;

  _filtersSubtitle = () => {
    const filtersAppliedCount = this.filters.filter((filter) => filter.selected).length;
    return html`
      ${filtersAppliedCount
        ? this._filterCountLabelAndButton(filtersAppliedCount)
        : this._noFiltersLabel()}
    `;
  };

  _loadingDataSubtitleContent = () => html`
    <span id="loading-indicator">
      -
      <eui-loader class="autorefresh-control" size="small"></eui-loader>
      ${this.i18n?.LOADING}
    </span>
  `;

  _errorSubtitleContent = () =>
    html`
      <span id="error-indicator">
        -
        <eui-icon id="error-icon" name="cross" color="var(--red-36, #942228)"></eui-icon>
        ${this.i18n?.FETCH_FAILURE}
      </span>
    `;

  _lastRefreshedLabel = () =>
    html`
      <span id="last-refreshed">${this.i18n?.LAST_REFRESHED_PREFIX} ${this.lastRefreshed}</span>
    `;

  _hiddenColumnsText = (hiddenColumnsCount) => html`
    <span id="hidden-columns">
      ${hiddenColumnsCount}
      ${hiddenColumnsCount > 1 ? this.i18n?.COLUMNS || 'columns' : this.i18n?.COLUMN || 'column'}
      ${this.i18n?.HIDDEN || 'hidden -'}
    </span>
  `;

  _hiddenColumnsTextWithTooltip = (sortedColumnHidden, hiddenColumnsCount) => html`
    <eui-tooltip position="top" dotted visible=${sortedColumnHidden}>
      <div slot="message">
        ${replaceInLocale(this.i18n?.SORTED_COLUMN_HIDDEN || 'Sorted column {{column}} is hidden', {
          column: sortedColumnHidden.title,
        })}
      </div>
      ${this._hiddenColumnsText(hiddenColumnsCount)}
    </eui-tooltip>
  `;

  _columnsHiddenLabel = () => {
    const hiddenColumnsCount = this.columns.filter((c) => c.hidden).length;
    const sortedColumnHidden = this.columns.filter((c) => c.hidden && c.sort)[0];

    if (hiddenColumnsCount) {
      return sortedColumnHidden
        ? this._hiddenColumnsTextWithTooltip(sortedColumnHidden, hiddenColumnsCount)
        : this._hiddenColumnsText(hiddenColumnsCount);
    }
    return html`
      ${nothing}
    `;
  };

  _panelSubtitleMeta = () => html`
    <i id="panelSubtitle">
      ${this._autoRefreshSubtitle()} - ${this._columnsHiddenLabel()} ${this._filtersSubtitle()}
      ${this.error ? this._errorSubtitleContent() : nothing}
      ${this.loading ? this._loadingDataSubtitleContent() : nothing}
    </i>
  `;

  _browserHelpBanner = () => {
    let element = nothing;
    if (this.browserHelpContent) {
      element = html`
        <e-tutorial-banner
          .message=${this.browserHelpContent}
          .type=${'browserHelp'}
        ></e-tutorial-banner>
      `;
    }
    return element;
  };

  _showSettings = () => {
    this._pauseAutoRefresh();
    this.showSettings = true;
  };

  _hideSettings = () => {
    this.showSettings = false;
  };

  _createRowSelectionDisclosure = () => {
    const entitiesSelected = this.selectedRow?.metadata?.context.contextFields
      .map(({ name }) => name)
      .join(', ');

    return entitiesSelected && this.selectedRow?.selected
      ? `${this.i18n?.ROW_SELECTED_LABEL || 'Row selection: '} ${entitiesSelected}`
      : `${this.i18n?.ROW_SELECTED_LABEL || 'Row selection: '} ${
          this.i18n?.NO_ROW_SELECTED_LABEL || 'Nothing selected'
        } `;
  };

  _metricCategoryPicker = () => html`
    <e-metric-category-picker
      .metricCategories=${this.metricCategoryPickerData.metricCategories ?? []}
      .viewAllSelected=${this.metricCategoryPickerData.viewAllSelected}
      .maxPillCount=${this.metricCategoryPickerData.maxPillCount}
    ></e-metric-category-picker>
  `;

  _mainPanel = () => html`
    <section slot="content">
      ${this._panelSubtitleMeta()} ${this._browserHelpBanner()} ${this._metricCategoryPicker()}
      <e-metric-browser-table
        .columns=${this.columns}
        .data=${this.data.tableData}
        .currentpage=${this.data.currentpage}
        .numentries=${this.data.numentries}
        .numpages=${this.data.numpages}
        .total=${this.data.total}
        .settings=${this.settings}
        .actions=${this.actions}
        .selectedRowLabel=${this._createRowSelectionDisclosure()}
        ?show-settings-dialog=${this.showSettings}
        @pause=${this._pauseAutoRefresh}
        @hide-settings=${this._hideSettings}
      ></e-metric-browser-table>
    </section>
  `;

  _settingsLabel = () => this.i18n?.SETTINGS || 'Settings';

  _filtersLabel = () => this.i18n?.FILTERS || 'Filters';

  _chartsLabel = () => this.i18n?.HISTORICAL_DASHBOARD_BUTTON || 'Historical Data';

  _settingsButton = () =>
    html`
      <eui-button
        id="settings-button"
        class="action-button"
        slot="action"
        icon="settings"
        @click=${this._showSettings}
      >
        ${this._settingsLabel()}
      </eui-button>
    `;

  _showFilters = () => this.shadowRoot.querySelector('#filter-panel').open();

  _filtersButton = () =>
    html`
      <eui-button
        id="filter-button"
        class="action-button"
        slot="action"
        icon="filter"
        @click=${this._showFilters}
      >
        ${this._filtersLabel()}
      </eui-button>
    `;

  _buildMenuItems = (menuList) =>
    menuList.map(({ facetCounts, label }) => {
      const labelSuffix = facetCounts?.contextMenu ? ` (${facetCounts.contextMenu})` : '';
      return html`
        <eui-menu-item
          label="${this.i18n?.CONTEXT_ITEM_PREFIX || 'Add Context: '}${label}${labelSuffix}"
          value="${label}"
        >
          <eui-icon name="plus" slot="left"></eui-icon>
        </eui-menu-item>
      `;
    });

  _contextMenuEventHandler = ({ detail }) => {
    const { value } = detail.menuItems[0];
    const { data } = this.actions.filter(({ label }) => label === value)[0];
    data.id = uuid();
    data.row = this.selectedRow;
    this.bubble('table-actions', data);
  };

  _otherContextsButton = () => html`
    <eui-dropdown
      class="action-button"
      id="other-contexts"
      slot="action"
      type="single"
      data-type="click"
      label=${this.i18n?.OTHER_CONTEXTS || 'Other Contexts'}
      @eui-dropdown:change=${this._contextMenuEventHandler}
    >
      ${this._buildMenuItems(this.actions)}
    </eui-dropdown>
  `;

  _openCharts = () =>
    this.bubble('table-actions', { operation: 'open-charts', data: this.selectedRow });

  _chartsButton = () =>
    html`
      <eui-button
        id="charts"
        class="action-button"
        slot="action"
        icon="graph-plot"
        @click=${this._openCharts}
      >
        ${this._chartsLabel()}
      </eui-button>
    `;

  _menuEventHandler = (event) => {
    const { value } = event.detail.menuItems[0];
    switch (value) {
      case 'filters':
        this._showFilters();
        break;
      case 'settings':
        this._showSettings();
        break;
      case 'charts':
        this._openCharts();
        break;
      default:
        this._contextMenuEventHandler(event);
    }
  };

  _collapsedActionsMenu = (rowSelected) => {
    const staticMenuItems = [
      {
        label: this._filtersLabel(),
        value: 'filters',
        icons: [{ name: 'filter' }],
      },
      {
        label: this._settingsLabel(),
        value: 'settings',
        icons: [{ name: 'settings' }],
      },
    ];
    const dynamicMenuItems = [
      {
        label: this._chartsLabel(),
        value: 'charts',
        icons: [{ name: 'graph-plot' }],
      },
      ...this.actions.map(({ facetCounts, label }) => {
        const labelSuffix = facetCounts?.contextMenu ? ` (${facetCounts.contextMenu})` : '';
        return {
          label: `${this.i18n?.CONTEXT_ITEM_PREFIX || 'Add Context: '}${label}${labelSuffix}`,
          value: label,
          icons: [{ name: 'plus' }],
        };
      }),
    ];
    const data = [...(rowSelected ? dynamicMenuItems : []), ...staticMenuItems];
    return html`
      <eui-dropdown
        id="table-options"
        class="action-button"
        slot="action"
        type="single"
        data-type="click"
        .data=${data}
        label=${this.i18n?.OPTIONS || 'Options'}
        @eui-dropdown:change=${this._menuEventHandler}
      ></eui-dropdown>
    `;
  };

  _staticActionButtons = () =>
    html`
      ${this._filtersButton()} ${this._settingsButton()}
    `;

  _dynamicActionButtons = () =>
    html`
      ${this._chartsButton()} ${this._otherContextsButton()}
    `;

  _allActionButtons = () =>
    html`
      ${this._dynamicActionButtons()} ${this._staticActionButtons()}
    `;

  _buildActionBar = () => {
    const rowSelected = this.selectedRow?.selected;
    const buttonBar = rowSelected ? this._allActionButtons() : this._staticActionButtons();

    let element = buttonBar;
    if (this.showCollapsedMenu) {
      element = this._collapsedActionsMenu(rowSelected);
    }

    return element;
  };

  /**
   * Render the <e-metric-browser> component. This function is called each time a
   * prop changes.
   */
  render() {
    return html`
      <eui-multi-panel-tile
        tile-title="${this.title}"
        style="--space-xl:0px; --space-base:8px; --space-large:15px 15px; padding: 8px;"
        aria-label="${this.i18n?.ARIA_METRIC_BROWSER_LABEL}${this.title}"
        aria-describedby="metric-browser-help"
        ?auto-close=${true}
      >
        ${this._helpTooltip()} ${this._buildActionBar()} ${this._mainPanel()} ${this._filterPanel()}
      </eui-multi-panel-tile>
    `;
  }
}

/**
 * @property {String} title - Metric Browser title
 * @property {String} filters - List of filters (currently applied or not) for metric browser instance
 * @property {String} columns - Columns for the metric browser table
 * @property {Object} data - Data for table (should include last refresh)
 * @property {String} settings - Settings for the metric browser
 * @property {String} selectedContext - The active metric browser selection object { displayName, open, dashboardURL, CTSQuery }
 * @property {String} lastRefreshed - Time since last refresh
 */
definition('e-metric-browser', {
  style,
  props: {
    id: {
      attribute: false,
      type: String,
    },
    title: {
      attribute: true,
      type: String,
      default: 'Placeholder Title',
    },
    active: {
      attribute: true,
      type: Boolean,
      default: false,
    },
    filterCategories: {
      attribute: false,
      type: Array,
      default: [],
    },
    filters: {
      attribute: false,
      type: Array,
      default: [],
    },
    match: {
      attribute: false,
      type: String,
      default: '',
    },
    columns: {
      type: Array,
      default: [],
    },
    data: {
      attribute: false,
      type: Object,
      default: {},
    },
    selectedContext: {
      attribute: false,
      type: Object,
    },
    lastRefreshed: {
      attribute: false,
      type: String,
    },
    error: {
      attribute: false,
      type: String,
    },
    loading: {
      attribute: true,
      type: Boolean,
      default: false,
    },
    actions: { attribute: false, type: Array, default: [] },
    selectedRow: { attribute: false, type: Object, default: {} },
    settings: {
      attribute: false,
      type: Object,
    },
    browserHelpContent: { attribute: false, type: String },
    filterHelpContent: { attribute: false, type: String },
    showSettings: { attribute: false, type: Boolean, default: false },
    showCollapsedMenu: { attribute: false, type: Boolean, defaul: false },
    metricCategoryPickerData: {
      attribute: false,
      type: Object,
    },
  },
})(MetricBrowser);
