/**
 * Component TabBar is defined as
 * `<e-tab-bar>`
 *
 * @extends {LitComponent}
 */
import { LitComponent, html, definition, nothing } from '@eui/lit-component';
import { Tab, Tabs } from '@eui/layout';
import { ActionableIcon, Button, InfoPopup, TextField, Tooltip } from '@eui/base';
import ErrorBanner from '../error-banner/error-banner';
import MetricBrowser from '../metric-browser/metric-browser';
import style from './tab-bar.css';

export default class TabBar extends LitComponent {
  get meta() {
    return import.meta;
  }

  static get components() {
    return {
      'eui-button': Button,
      'eui-actionable-icon': ActionableIcon,
      'eui-tab': Tab,
      'eui-tabs': Tabs,
      'e-metric-browser': MetricBrowser,
      'eui-tooltip': Tooltip,
      'eui-info-popup': InfoPopup,
      'e-error-banner': ErrorBanner,
      'eui-text-field': TextField,
    };
  }

  _focusTab = (id) => this.bubble('focus-tab', id);

  _closeTab = (id) => {
    // This is needed to release all the resources associated with sub-state management
    // Unfortunately it's not in the same place where the sub-state is created.
    this.bubble('remove-browser-sub-state', {
      subState: id,
    });

    this.bubble('close-tab', id);
  };

  actionableIconCloseTab(label, id) {
    return html`
      <eui-tooltip message=${this.i18n?.CLOSE_TAB} ${label} position="top">
        <eui-actionable-icon
          class="close"
          aria-label="${this.i18n?.CLOSE_TAB} ${label}"
          name="cross"
          @keydown=${(e) => {
            if (e.code === 'Space' || e.code === 'Enter') {
              this._closeTab(id);
            }
          }}
          @click=${() => this._closeTab(id)}
        ></eui-actionable-icon>
      </eui-tooltip>
    `;
  }

  _title = (name, data, renamed = false) => {
    let label = `${!renamed ? this.i18n?.LABEL_FOR : ''} ${name || ''}`;
    if (data?.total) {
      label += ` (${data.total})`;
    }
    return label;
  };

  _editBrowserTitle = (tabData) => this.bubble('edit-browser-title', tabData);

  _editTabButton = (data) =>
    html`
      <eui-tooltip message=${this.i18n?.EDIT_TAB_LABEL}>
        <eui-actionable-icon
          class="edit"
          aria-label="${this.i18n?.EDIT_TAB_LABEL}"
          name="edit"
          @keydown=${(e) => {
            if (e.code === 'Space') {
              this._editBrowserTitle(data);
            }
            if (e.code === 'Enter') {
              this._editBrowserTitle(data);
            }
          }}
          @click=${() => this._editBrowserTitle(data)}
        ></eui-actionable-icon>
      </eui-tooltip>
    `;

  _browserLabel = (id, activeFilters, tooltip, label) => html`
    <eui-tooltip position="top">
      <div slot="message">
        <div class="tab-tooltip">${activeFilters ? tooltip : this.i18n?.NO_ACTIVE_FILTERS}</div>
      </div>
      ${label}
    </eui-tooltip>
  `;

  renderTab({ id, context, data, active, filters, tabTitle, browserError, fetchError }) {
    const activeFilters = filters
      .filter((filter) => filter.selected)
      .map((filter) => filter.type.name)
      .join(', ');
    const tooltip = `${this.i18n?.ACTIVE_FILTERS} ${activeFilters}`;
    const errorLabel = this.i18n?.ERROR_TAB_LABEL || 'Error';
    const browserErrorLabel = browserError || fetchError ? errorLabel : '';
    const label = `${browserErrorLabel} ${this._title(tabTitle || context?.name, data, true)}`;
    return html`
      <eui-tab
        aria-label="${label}"
        class="tab"
        .selected=${active}
        @focus=${() => this._focusTab(id)}
      >
        ${this._browserLabel(id, activeFilters, tooltip, label)}
        ${active
          ? this._editTabButton({
              id,
              title: tabTitle || context?.name,
              placeholder: context?.name,
            })
          : nothing}
        ${this.browsers.length > 1 ? this.actionableIconCloseTab(label, id) : nothing}
      </eui-tab>
    `;
  }

  renderMetricBrowser = ({
    id,
    context,
    active,
    filters,
    data,
    settings,
    selectedContext,
    match,
    relationActions,
    fetchError,
    loading,
    selectedRow,
    metricCategoryPickerData,
  }) => {
    const title = this._title(context.name, data);
    const tableActionItems = relationActions.map((relationAction) => ({
      ...relationAction,
      label: `${relationAction.label}`,
    }));
    return html`
      <e-metric-browser
        slot="content"
        aria-label=${`${this.i18n?.METRIC_BROWSER_LABEL}${title}`}
        .id=${id}
        .title=${title}
        ?active=${active}
        .filterCategories=${context.filterCategories}
        .filters=${filters}
        .columns=${context.columns}
        .data=${data}
        .settings=${settings}
        .selectedContext=${selectedContext}
        .match=${match}
        .error=${fetchError}
        ?loading=${loading}
        .actions=${tableActionItems}
        .selectedRow=${selectedRow}
        .browserHelpContent=${this.browserHelpContent}
        .filterHelpContent=${this.filterHelpContent}
        .metricCategoryPickerData=${metricCategoryPickerData}
      ></e-metric-browser>
    `;
  };

  /**
   *
   * @param {Object} browserError
   * @returns
   */
  _showErrorBanner(browserError) {
    return html`
      <e-error-banner slot="content" .error=${browserError}></e-error-banner>
    `;
  }

  _openContexts = () => {
    this.bubble('open-context-panel');
  };

  /**
   * Render the <e-tab-bar> component. This function is called each time a
   * prop changes.
   */
  render() {
    const tabs = this.browsers.map((browser) => this.renderTab(browser));
    const renderBrowsers = this.browsers.map((browser) =>
      browser?.browserError
        ? this._showErrorBanner(browser.browserError)
        : this.renderMetricBrowser(browser),
    );
    return html`
      <div class="row">
        <div id="contexts-label">
          <h4>${this.i18n?.CONTEXT_TABS_LABEL || 'Opened Contexts'}</h4>
          <eui-info-popup position="bottom-start">
            <div id="context-help">${this.i18n?.CONTEXT_TAB_HELP}</div>
          </eui-info-popup>
        </div>

        <eui-button id="open-context" icon="plus" primary @click=${this._openContexts}>
          ${this.i18n?.ADD_CONTEXT_BUTTON || 'Add Context'}
        </eui-button>
      </div>

      <eui-tabs style="--space-base:0">${tabs} ${renderBrowsers}</eui-tabs>
    `;
  }
}

/**
 */
definition('e-tab-bar', {
  style,
  props: {
    browsers: {
      type: Array,
      default: [],
    },
    browserHelpContent: { attribute: false, type: String },
    filterHelpContent: { attribute: false, type: String },
  },
})(TabBar);
