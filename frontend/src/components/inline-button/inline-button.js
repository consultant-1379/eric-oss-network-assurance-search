/**
 * Component InlineButton is defined as
 * `<e-inline-button>`
 *
 * @extends {LitComponent}
 */
import { LitComponent, html, definition } from '@eui/lit-component';
import style from './inline-button.css';

export default class InlineButton extends LitComponent {
  render = () =>
    html`
      <button secondary>${this.label}</button>
    `;
}

/**
 * @property {String} label - label of button
 */
definition('e-inline-button', {
  style,
  props: {
    label: { attribute: true, type: String },
  },
})(InlineButton);
