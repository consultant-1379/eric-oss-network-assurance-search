/**
 * Component ErrorBanner is defined as
 * `<e-error-banner>`
 *
 * @extends {LitComponent}
 */
import { LitComponent, html, definition } from '@eui/lit-component';
import { Icon } from '@eui/theme';
import replaceInLocale from '../../utils/replaceInLocale';
import style from './error-banner.css';

export default class ErrorBanner extends LitComponent {
  static get components() {
    return {
      'eui-icon': Icon,
    };
  }

  get meta() {
    return import.meta;
  }

  /**
   * This function extract error detail and create the template
   * @returns html message template
   */
  _getMessage() {
    const UNKNOWN_ERROR_MESSAGE = this.i18n?.UNKNOWN_ERROR_MESSAGE || 'An unknown error occurred.';
    let { message } = this;
    switch (this.error?.type) {
      case 'CONTEXT_ERROR': {
        const { name, index } = this.error.data;
        message = replaceInLocale(this.i18n?.CONTEXT_ERROR_MESSAGE || '', {
          name,
          index,
        });
        break;
      }
      case 'NO_INDEXES':
        message =
          this.i18n?.NO_INDEXES ||
          'No indexes are configured. This can happen as the system is initializing. Reload to try again.';
        break;
      case 'NO_CONTEXTS':
        message =
          this.i18n?.NO_CONTEXTS ||
          'No contexts are configured. This can happen as the system is initializing. Reload to try again.';
        break;
      case 'NETWORK_ERROR':
        message =
          this.i18n?.NETWORK_ERROR ||
          'There was an unexpected issue connecting to our services for data. Reload to try again.';
        break;
      case 'VALIDATION_ERROR':
        message =
          this.i18n?.VALIDATION_ERROR_MESSAGE ||
          "There was a problem creating the KPI Context. You can click 'Add KPI Context' to explore available KPI Contexts or refresh the page to try again.";
        break;
      case 'DASHBOARD_VALIDATION_ERROR':
        message =
          this.i18n?.DASHBOARD_VALIDATION_ERROR_MESSAGE ||
          "There was a problem creating the Historical Dashboard: the identifier types provided for the Historical Dashboard are incorrect for the selected Context. You can click 'Add KPI Context' to explore available KPI Contexts or refresh the page to try again.";
        break;
      case 'SYSTEM_STATE':
        message = this.error?.message;
        break;
      case 'MESSAGE':
        message = message || UNKNOWN_ERROR_MESSAGE;
        break;
      default:
        message = UNKNOWN_ERROR_MESSAGE;
    }
    return message;
  }

  /**
   * Render the <e-error-banner> component. This function is called each time a
   * prop changes.
   */
  render() {
    return html`
      <div id="error-banner">
        <eui-icon name="cross" color="var(--red-36, #942228)"></eui-icon>
        ${this._getMessage()}
      </div>
    `;
  }
}

/**
 * @property {String} message - The message to show
 * @property {Object} error -  The error Object should be in below format for Context type error
 *
 * {
 *   type: 'CONTEXT_ERROR',
 *   data: {
 *     name: 'Context name', // [string format]
 *     index: 'Index name',  // [string format]
 *    },
 * }
 */
definition('e-error-banner', {
  style,
  props: {
    message: { attribute: true, type: String, default: '' },
    error: { attribute: false, type: Object, default: { type: 'MESSAGE' } },
  },
})(ErrorBanner);
