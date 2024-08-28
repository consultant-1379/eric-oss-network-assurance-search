/**
 * Component FilterPanel is defined as
 * `<e-tutorial-banner>`
 *
 * @extends {LitComponent}
 */
import { LitComponent, definition, html } from '@eui/lit-component';
import { Banner } from '@eui/base';
import style from './tutorial-banner.css';

export default class TutorialBanner extends LitComponent {
  static get components() {
    return {
      'eui-banner': Banner,
    };
  }

  didConnect() {
    this.addEventListener('click', () => this.bubble('dismiss-help', this.type));
  }

  didDisconnect() {
    this.removeEventListener('click', () => this.bubble('dismiss-help', this.type));
  }

  _createBanner = () => {
    const element = this.createElement('eui-banner');
    element.class = 'help-banner';
    element.icon = 'lightbulb';
    element.color = 'yellow';
    element.bannerType = 'dynamic';
    element.innerHTML = `
      <div class="help-banner">${this.message}</div>
    `;

    return element;
  };

  render() {
    return html`
      ${this._createBanner()}
    `;
  }
}

/**
 * @property {String} message - The text message of the banner
 * @property {String} type - The type of the message, emitted on close event
 */
definition('e-tutorial-banner', {
  style,
  props: {
    message: { attribute: false, type: String },
    type: { attribute: false, type: String },
  },
})(TutorialBanner);
