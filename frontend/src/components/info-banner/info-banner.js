/**
 * Component InfoBanner is defined as
 * `<e-info-banner>`
 *
 * @extends {LitComponent}
 */
import { LitComponent, html, definition } from '@eui/lit-component';
import { Icon } from '@eui/theme';
import style from './info-banner.css';

export default class InfoBanner extends LitComponent {
  static get components() {
    return {
      'eui-icon': Icon,
    };
  }

  /**
   * Render the <e-info-banner> component. This function is called each time a
   * prop changes.
   */
  render() {
    return html`
      <div id="info-banner">
        <eui-icon name="info"></eui-icon>
        ${this.message}
      </div>
    `;
  }
}

/**
 * @property {String} message - The message to display
 */
definition('e-info-banner', {
  style,
  props: {
    message: { attribute: true, type: String },
  },
})(InfoBanner);
