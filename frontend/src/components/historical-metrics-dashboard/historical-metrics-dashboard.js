/**
 * Component HistoricalMetricsDashboard is defined as
 * `<e-historical-metrics-dashboard>`
 *
 *
 * @extends {TemplateComponent}
 */
import { definition, nothing } from '@eui/lit-component';
import { Icon } from '@eui/theme';
import { TemplateComponent } from '@eui/component';
import { Loader, Notification } from '@eui/base';
import isEqual from 'lodash/isEqual';
import style from './historical-metrics-dashboard.css';
import ErrorBanner from '../error-banner/error-banner.js';
import { getConfig } from '../../config/configManager.js';

export default class HistoricalMetricsDashboard extends TemplateComponent {
  /**
   * Assurance Dashboard ID
   * @type {string}
   */
  static ASSURANCE_DASHBOARD_ELEMENT_ID = 'cnom-assurance-dashboard';

  constructor() {
    super();
    this.cnomUrl = getConfig().getCnomUrl();
  }

  get meta() {
    return import.meta;
  }

  static get components() {
    return {
      'eui-icon': Icon,
      'eui-loader': Loader,
      'eui-notification': Notification,
      'e-error-banner': ErrorBanner,
    };
  }

  didUpgrade() {
    this.bubble('eui-plugins:execute', {
      plugin: 'settings-plugin',
      method: 'getContainer',
      params: { callback: this._themeChangeHandler },
    });
  }

  _themeChangeHandler = (euiContainer) => {
    euiContainer?.addEventListener('eui-theme-change', this.themeChanged);
  };

  didConnect() {
    this.startAssuranceDashboard();
  }

  /**
   * Get iframe element
   * @returns {HTMLElement | undefined}
   */
  getIframe = () =>
    this.shadowRoot?.getElementById(HistoricalMetricsDashboard.ASSURANCE_DASHBOARD_ELEMENT_ID);

  /**
   * Get current NAS application theme
   * @return {String}
   */
  getTheme = () => document.querySelector('eui-theme')?.theme;

  syncTheme = () => {
    const theme = this.getTheme();
    const themeEvent = { detail: { theme } };
    this.themeChanged(themeEvent);
  };

  /**
   * Detect EUI SDK theme change and update CNOM app
   *
   * @param {object} event
   */
  themeChanged = (event) => {
    // Detect theme change event
    const { theme } = event.detail;
    const message = { messageType: 'THEME', payload: theme };
    this.postMessage(message);
  };

  /**
   *
   * @param params
   */
  startAssuranceDashboard = () => {
    const iframe = this.getIframe();
    if (iframe) {
      iframe.src = this.cnomUrl.toString();
      this.targetOrigin = iframe.src;

      iframe.addEventListener('load', () => {
        this.updateAssuranceDashboard();
      });

      window.addEventListener('message', (event) => {
        // Make sure the message is coming from a trusted source
        if (event.origin === this.cnomUrl.origin) {
          this._loaded = event.data === 'Loaded';
          this.updateAssuranceDashboard();
          /* c8 ignore next 6 */
          iframe.style.display = 'block';
          const loadingBanner = this.shadowRoot?.getElementById('loading-banner');
          loadingBanner.style.display = 'none';
          this.syncTheme();
        }
      });
    }
  };

  /**
   * Send post message to iframe / CNOM dashboard application
   *
   * @param {object} message
   */
  postMessage = (message) => {
    if (this._loaded) {
      const iframe = this.getIframe();
      /* c8 ignore next 8 */
      if (iframe) {
        iframe.contentWindow.postMessage(message, this.targetOrigin);
      }
    }
  };

  /**
   * Updates assurance dashboard with new metrics
   * @param context
   * @param metrics - new metrics
   */
  updateAssuranceDashboard = () => {
    if (this.historicalDashboardModel?.$schema) {
      const messageType = 'DASHBOARD';
      this.postMessage({ messageType, payload: this.historicalDashboardModel });
    }
  };

  didChangeProps(changedProps) {
    if (
      changedProps.has('historicalDashboardModel') &&
      !isEqual(changedProps.get('historicalDashboardModel'), this.historicalDashboardModel)
    ) {
      this.updateAssuranceDashboard();
    }
  }

  /**
   * Display loading indicator
   * @returns {string} html markup
   */
  static renderLoadingIndicator() {
    return `
      <div id="loading-banner">
        <eui-loader size="medium"></eui-loader>
        <div>${this.i18n?.LOADING || 'Dashboard is loading...'}</div>
      </div>
    `;
  }

  /**
   * Display iframe
   * @returns {string} html markup
   */
  static renderIframe() {
    return `<iframe
        style="display: ${this._loaded ? 'block' : 'none'}"
        title="${this.title}"
        id="${HistoricalMetricsDashboard.ASSURANCE_DASHBOARD_ELEMENT_ID}"
        src=""
        width="100%"
        height="100%"
      ></iframe>
    `;
  }

  /**
   *
   * @returns {string}
   */
  static get template() {
    return `<div id="iframe">
        ${this.renderIframe()} ${this._loaded ? nothing : this.renderLoadingIndicator()}
      </div>
    `;
  }
}

definition('e-historical-metrics-dashboard', {
  style,
  props: {
    historicalDashboardModel: {
      attribute: false,
      type: Object,
      default: {},
    },
    _loaded: { type: Boolean, default: false },
  },
})(HistoricalMetricsDashboard);
