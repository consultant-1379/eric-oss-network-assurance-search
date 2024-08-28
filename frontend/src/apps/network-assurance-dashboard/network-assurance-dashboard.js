/**
 * NetworkAssuranceDashboard is defined as
 * `<e-network-assurance-dashboard>`
 *
 * @extends {App}
 */
import { App, html, definition } from '@eui/app';
import {
  Button,
  Dialog,
  InfoPopup,
  Loader,
  Notification,
  TextField,
  Tooltip,
  Tree,
} from '@eui/base';
import { FlyoutPanel, MultiPanelTile, TilePanel } from '@eui/layout';
import { Icon } from '@eui/theme';
import { nothing } from '@eui/lit-component';
import cloneDeep from 'lodash/cloneDeep';
import InfoBanner from '../../components/info-banner/info-banner.js';
import { stateActions, stateEffects } from '../../state/index.js';
import replaceInLocale from '../../utils/replaceInLocale';
import StorageModule from '../../utils/storage.js';
import { persistState } from './storage.js';
import { destroyStateManagement, initializeStateManagement } from '../../utils/stateManager';

import ErrorBanner from '../../components/error-banner/error-banner';
import HistoricalMetricsDashboard from '../../components/historical-metrics-dashboard/historical-metrics-dashboard.js';
import InlineButton from '../../components/inline-button/inline-button';
import MetricBrowser from '../../components/metric-browser/metric-browser';
import TabBar from '../../components/tab-bar/tab-bar';
import style from './network-assurance-dashboard.css';
import TutorialBanner from '../../components/tutorial-banner/tutorial-banner.js';

export default class NetworkAssuranceDashboard extends App {
  constructor() {
    super();

    StorageModule.init();
  }

  get meta() {
    return import.meta;
  }

  static get components() {
    return {
      // register components here
      'e-tutorial-banner': TutorialBanner,
      'eui-button': Button,
      'eui-flyout-panel': FlyoutPanel,
      'eui-dialog': Dialog,
      'eui-icon': Icon,
      'eui-loader': Loader,
      'eui-notification': Notification,
      'eui-text-field': TextField,
      'eui-tree': Tree,
      'eui-info-popup': InfoPopup,
      'eui-tooltip': Tooltip,
      'e-error-banner': ErrorBanner,
      'e-inline-button': InlineButton,
      'e-metric-browser': MetricBrowser,
      'e-tab-bar': TabBar,
      'eui-multi-panel-tile': MultiPanelTile,
      'eui-tile-panel': TilePanel,
      'e-historical-metrics-dashboard': HistoricalMetricsDashboard,
      'e-info-banner': InfoBanner,
    };
  }

  didConnect() {
    initializeStateManagement({
      getState: () => this.appstate,
      updateState: this.updateState.bind(this),
      emitEvent: this.bubble.bind(this),
      addEventListener: this.addEventListener.bind(this),
      removeEventListener: this.removeEventListener.bind(this),
      stateActions,
      stateEffects,
    });

    this.bubble('app:title', { displayName: this.i18n?.APP_NAME || 'Service Assurance Dashboard' });
    this.bubble('app:subtitle', { subtitle: '' });

    // Initialize application state
    this.bubble('init-application');
  }

  didDisconnect() {
    destroyStateManagement();
  }

  _notificationPanel = () => {
    const notificationError = this.appstate?.error;

    const notification = {
      id: 'notification-error',
      title: this.i18n?.ERROR,
      message: this.i18n?.NETWORK_ERROR_MESSAGE,
    };

    if (notificationError?.isWarning) {
      notification.id = 'notification-warning';
      notification.title = this.i18n?.WARNING;
      notification.message = this.i18n?.NO_DATA_WARNING_MESSAGE;
    }

    if (notificationError?.type === 'SYSTEM_STATE') {
      notification.message = this.i18n?.SYSTEM_ERROR;
    }

    return html`
      <div id="notificationContainer">
        <eui-notification id="${notification.id}">
          <strong>${notification.title}</strong>
          <div slot="description">${notification.message}</div>
        </eui-notification>
      </div>
    `;
  };

  loadingBanner = () => {
    const systemState = this.appstate?.systemState;

    if (systemState?.isInitializing) {
      systemState.loadingMessage =
        this.i18n?.SYSTEM_STATE_LOADING ||
        'Service Assurance Dashboard is awaiting configuration information.';
    }

    return html`
      <div id="loading-banner" class="banner">
        <eui-loader size="medium"></eui-loader>
        <div id="loading-banner-title">
          ${systemState?.loadingMessage || this.i18n?.APP_LOADING}
        </div>
      </div>
    `;
  };

  _openChartPanel = (event) => {
    const { detail } = event;
    if (detail.operation === 'open-charts') {
      this.shadowRoot.querySelector('#historical-dashboard').open();
    }
  };

  _closeChartPanel = ({ detail }) => {
    if (!detail.selected) {
      this.shadowRoot.querySelector('#historical-dashboard').close();
    }
  };

  tabsBar = () => html`
    <e-tab-bar
      id="tab-bar"
      .browsers=${this.appstate.browsers}
      .browserHelpContent=${this.appstate?.onboardingHelp?.browserHelp
        ? this.i18n?.BROWSER_HELP
        : ''}
      .filterHelpContent=${this.appstate?.onboardingHelp?.filterHelp ? this.i18n?.FILTER_HELP : ''}
      @table-actions=${this._openChartPanel}
      @edit-browser-title=${({ detail }) => this._setRenameDialogContent(detail)}
      @open-context-panel=${this._openTabDialog}
    ></e-tab-bar>
  `;

  _openTab = (browser) => {
    this.bubble('open-tab', browser);
  };

  _resetTab = () => {
    this.selected = {};
    this.match = '';
  };

  _openTabDialog = () => {
    this.showdialog = true;
  };

  _addTab = () => {
    this._openTab({ context: this.selected });
    this.showdialog = false;
    this._resetTab();
  };

  _cancelTabDialog = () => {
    this.showdialog = false;
    this._resetTab();
  };

  _setMatchValue = ({ detail }) => {
    this.match = detail.value;
  };

  filterBox = () =>
    html`
      <div id="filter-contexts-box">
        <small>${this.i18n?.FIND_CONTEXTS_LABEL}</small>
        <div>
          <eui-text-field
            name="search filters"
            aria-label=${this.i18n?.FIND_CONTEXTS_LABEL}
            @input=${this._setMatchValue}
            value=${this.match}
            fullwidth
            placeholder=${this.i18n?.FIND_CONTEXTS_PLACEHOLDER}
          >
            <eui-icon slot="icon" name="search"></eui-icon>
          </eui-text-field>
        </div>
      </div>
    `;

  /**
   * @function _emboldenMatch
   * @description Highlight substring in bold if it is a match (Case insensitive)
   * @param {String} label The label of the item
   * @returns {String}
   */
  _emboldenMatch(label) {
    const lowerMatch = this.match.toLowerCase();
    const lowerLabel = label.toLowerCase();
    const isMatch = lowerLabel.includes(lowerMatch);
    if (isMatch) {
      const idx = lowerLabel.indexOf(lowerMatch);
      const arr = [
        label.substring(0, idx),
        label.substring(idx, idx + this.match.length),
        label.substring(idx + this.match.length),
      ];
      // prettier-ignore
      return arr.map((item) =>
        item.toLowerCase() === lowerMatch
          ? html`<strong id="highlight">${item}</strong>`
          : item,
      );
    }
    return '';
  }

  treeItemData = (selected, context) => {
    const { id } = context?.contextType || {};
    const label = this._emboldenMatch(context.name);
    return { label, data: { ...context, id }, active: id === selected };
  };

  contextMatches = (selectedContext) =>
    this.appstate?.contexts
      ? this.appstate?.contexts
          .map((c) => this.treeItemData(selectedContext, c))
          .filter(({ label }) => label !== '')
      : [];

  _clearMatch = () => {
    this.match = '';
  };

  contextSelector = () => {
    const matches = this.contextMatches(this?.selected.id);
    return html`
      <label>
        ${this.i18n?.CONTEXT_FILTER_LABEL_PREFIX} (${this.i18n?.CONTEXT_FILTER_LABEL_SHOWING}
        ${matches.length} ${this.i18n?.CONTEXT_FILTER_LABEL_OF} ${this.appstate?.contexts?.length})
      </label>
      <e-inline-button
        id="clear-btn"
        aria-label="${this.i18n?.ARIA_CLEAR_MATCH_DESCRIPTION}"
        secondary
        @click=${this._clearMatch}
        label=${this.match !== '' ? this.i18n?.CLEAR_MATCH_BTN_LABEL : nothing}
      ></e-inline-button>
      <eui-tree
        .data=${matches}
        @eui-tree:select="${(event) => {
          this.selected = event.detail.data;
        }}"
      ></eui-tree>
    `;
  };

  flyoutContent() {
    return html`
      ${this.filterBox()}
      <section id="context-selector">${this.contextSelector()}</section>
    `;
  }

  tabDialog() {
    return html`
      <eui-flyout-panel
        id="flyout"
        ?show=${this.showdialog}
        panel-title="${this.i18n?.ADDING_TAB_TITLE}"
        style="--space-large:16px;"
        @eui-flyout-panel:closed=${this._cancelTabDialog}
      >
        <div slot="content">${this.flyoutContent()}</div>
        <eui-button id="cancel-btn" slot="footer" @click=${this._cancelTabDialog}>
          ${this.i18n?.ADDING_TAB_FLYOUT_PANEL_CANCEL}
        </eui-button>
        <eui-button
          id="add-btn"
          aria-label="${this.i18n?.ADD_TAB}"
          primary
          slot="footer"
          ?disabled=${!this.selected.id}
          @click=${this._addTab}
        >
          ${this.i18n?.ADDING_TAB_FLYOUT_PANEL_ADD}
        </eui-button>
      </eui-flyout-panel>
    `;
  }

  _setRenameDialogContent = (data) => {
    this.tabToRename = data;
  };

  _resetDialogContent = () => {
    this.tabToRename = undefined;
  };

  _updateBrowserTitle = () => {
    this.bubble('update-browser-title', this.tabToRename);
    this._resetDialogContent();
  };

  _browserTitleTextField = () => html`
    <div class="rename-tab-description">${this.i18n?.RENAME_DESCRIPTION}</div>
    <eui-text-field
      class="tab-title-field"
      placeholder=${this.tabToRename?.placeholder}
      fullwidth
      .value=${this.tabToRename?.title}
      @input=${(e) => {
        this.tabToRename.title = e.detail.value;
      }}
    ></eui-text-field>
  `;

  _renameTabDialog = () => html`
    <eui-dialog
      id="rename-dialog"
      style="--space-large:16px;"
      ?show=${this.tabToRename}
      label="${this.i18n?.RENAME_DIALOG_TITLE}"
      @eui-dialog:cancel=${this._resetDialogContent}
      @keydown=${(ev) => {
        if (ev.code === 'Escape') {
          this._resetDialogContent();
        }
      }}
    >
      <div slot="content">${this._browserTitleTextField()}</div>
      <eui-button
        slot="bottom"
        id="apply-btn"
        aria-label="${this.i18n?.APPLY_RENAME}"
        primary
        @click=${this._updateBrowserTitle}
      >
        ${this.i18n?.APPLY_RENAME}
      </eui-button>
    </eui-dialog>
  `;

  errorBanner = () => {
    const bannerError = this.appstate?.error;
    if (bannerError?.type === 'SYSTEM_STATE') {
      bannerError.message = this.i18n?.SYSTEM_ERROR;
    }
    return html`
      <e-error-banner .error="${bannerError}"></e-error-banner>
    `;
  };

  _sortNotification = (deselectedSort, appliedSort) => html`
    <div id="sortNotificationContainer">
      <eui-notification id="sortNotification" timeout="4000">
        <div slot="description" id="sortNotificationDescription">
          <eui-icon name="info"></eui-icon>
          <p>
            ${replaceInLocale(this.i18n?.SORT_NOTIFICATION_MESSAGE, {
              deselectedSort,
              appliedSort,
            })}
          </p>
        </div>
      </eui-notification>
    </div>
  `;

  sortNotification = (browsers) => {
    const activeBrowser = browsers.find((browser) => browser.active);
    return activeBrowser?.data?.sort?.isNewSortApplied && !activeBrowser.loading
      ? this._sortNotification(
          activeBrowser?.data?.sort?.deselectedMetricSort,
          activeBrowser?.data?.sort?.sortNotificationInfo,
        )
      : nothing;
  };

  content = () =>
    html`
      ${this.appstate?.onboardingHelp?.appHelp ? this._displayAppHelp() : nothing} ${this.tabsBar()}
      ${this.tabDialog()} ${this.sortNotification(this.appstate.browsers)}
      ${this._renameTabDialog()}
    `;

  /**
   * This method will return the main content of this network-assurance-dashboard app if the
   * application is not in a loading state. The application state has a `loading` boolean property
   * which will dictate this.
   *
   * Note: At times, this method is executed before the application state has finished initializing. When
   * this occurs, the `loading` boolean property of the application state will be equal to
   * `undefined`.
   */
  mainContent = () =>
    html`
      ${this.appstate.loading === false ? this.content() : this.loadingBanner()}
    `;

  updateHistoricalDashboardVisibility = (newVisibilityStatus) => {
    this.bubble('update-historical-dashboard-visibility', {
      newVisibilityStatus,
    });
  };

  /**
   * This function remediates a bug within the EUI-SDK's <eui-tile-panel> component
   * that applies the hidden HTML attribute to both the <eui-tile-panel> and the
   * <eui-panel-button> when it shouldn't. This bug arises when the ?show={} prop
   * of the <eui-tile-panel> flips between true and false quickly.
   *
   * The IDUN-102625 SPIKE will address this issue and will hopefully allow us to
   * remove this workaround.
   */
  refreshTilePanelVisibility = async () => {
    const euiTilePanel = document
      .querySelector('body > eui-container')
      .shadowRoot.querySelector('.content > e-network-assurance-dashboard')
      .shadowRoot.querySelector('eui-multi-panel-tile > eui-tile-panel');
    const euiTilePanelButton = document
      .querySelector('body > eui-container')
      .shadowRoot.querySelector('.content > e-network-assurance-dashboard')
      .shadowRoot.querySelector('eui-multi-panel-tile > eui-panel-button');
    if (euiTilePanel !== null && this.showHistoricalDashboard && euiTilePanel.hidden) {
      euiTilePanel.hidden = false;
      euiTilePanelButton.hidden = true;
      /* c8 ignore next 8 */
    } else if (euiTilePanel !== null && !this.showHistoricalDashboard && !euiTilePanel.hidden) {
      euiTilePanel.hidden = true;
      euiTilePanelButton.hidden = false;
    }
  };

  _tileSubtitle = (activeIndex) => {
    const nameStr = this.appstate.browsers[
      activeIndex
    ]?.selectedRow?.metadata?.context.contextFields
      .map(({ name }) => name)
      .join(', ');
    return `${this.i18n?.HISTORICAL_DASHBOARD_SUBTITLE || 'KPIs for: '} ${nameStr}`;
  };

  _noResultsBanner = () =>
    html`
      <e-info-banner
        slot="content"
        id="no-results"
        message=${this.i18n?.NO_RESULTS}
      ></e-info-banner>
    `;

  _historicalDashboard = (historicalDashboardModel) => html`
    <e-historical-metrics-dashboard
      slot="content"
      .historicalDashboardModel=${historicalDashboardModel}
    ></e-historical-metrics-dashboard>
  `;

  _historicalDashboardHelpTooltip = () => html`
    <eui-info-popup id="historical-help" slot="action" icon="info" position="bottom-end">
      <div id="historical-dashboard-info">${this.i18n?.HISTORICAL_DASHBOARD_HELP}</div>
    </eui-info-popup>
  `;

  /**
   * Render historical metrics dashboard
   * @returns {TemplateResult<1>}
   * @private
   */
  _renderHistoricalMetrics = () => {
    // To reproduce the bug mentioned above the refreshTilePanelVisibility function,
    // comment out the line below.
    this.refreshTilePanelVisibility();
    const activeIndex = this.appstate.browsers.findIndex((b) => b.active);
    const { historicalDashboardModel, showHistoricalDashboard, noResults } =
      activeIndex >= 0 ? this.appstate.browsers[activeIndex].historicalDashboardData : {};
    this.showHistoricalDashboard = showHistoricalDashboard;
    const { selectedRow } = activeIndex >= 0 ? this.appstate.browsers[activeIndex] : {};
    return selectedRow
      ? html`
          <eui-tile-panel
            id="historical-dashboard"
            slot="right"
            icon-name="graph-line"
            tile-title=${this.i18n?.HISTORICAL_DASHBOARD_TITLE || 'Historical Dashboard'}
            subtitle=${this._tileSubtitle(activeIndex)}
            width="800"
            resizable
            ?show="${this.showHistoricalDashboard}"
            @eui-tile-panel:hide="${() => this.updateHistoricalDashboardVisibility(false)}"
            @eui-tile-panel:show="${() => this.updateHistoricalDashboardVisibility(true)}"
          >
            ${this._historicalDashboardHelpTooltip()}
            ${noResults
              ? this._noResultsBanner()
              : this._historicalDashboard(historicalDashboardModel)}
          </eui-tile-panel>
        `
      : nothing;
  };

  _displayAppHelp = () => html`
    <e-tutorial-banner .message=${this.i18n?.APP_HELP} .type=${'appHelp'}></e-tutorial-banner>
  `;

  showErrors = () => html`
    ${this._notificationPanel()} ${this.errorBanner()}
  `;

  /**
   * Render the <e-network-assurance-dashboard> app. This function is called each time a
   * prop changes.
   */
  render() {
    return html`
      <eui-multi-panel-tile
        class="top-level-multi-panel"
        style="--space-xl:0px; --space-large:0 15px;"
      >
        <section slot="content">
          ${this.appstate.error ? this.showErrors() : this.mainContent()}
        </section>

        ${this._renderHistoricalMetrics()}
      </eui-multi-panel-tile>
    `;
  }

  /**
   * Update state callback.
   * Called every time when the state is mutated.
   * @param state
   */
  updateState = (state) => {
    this.appstate = cloneDeep(state);
    persistState(this.appstate);
  };
}

definition('e-network-assurance-dashboard', {
  style,
  props: {
    appstate: { type: Object, default: {} },
    match: {
      attribute: false,
      type: String,
      default: '',
    },
    selected: {
      attribute: false,
      type: Object,
      default: {},
    },
    showdialog: { type: Boolean, default: false },
    showHistoricalDashboard: { attribute: false, type: Boolean, default: false },
    tabToRename: { type: Object },
  },
})(NetworkAssuranceDashboard);

NetworkAssuranceDashboard.register();
