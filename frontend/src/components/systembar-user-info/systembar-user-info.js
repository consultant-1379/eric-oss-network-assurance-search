/**
 * Component SystembarUserInfo is defined as
 * `<e-systembar-user-info>`
 *
 * Imperatively create component
 * @example
 * let component = new SystembarUserInfo();
 *
 * Declaratively create component
 * @example
 * <e-systembar-user-info></e-systembar-user-info>
 *
 * @extends {LitComponent}
 */
import { LitComponent, html, definition } from '@eui/lit-component';
import { Icon } from '@eui/theme';
import style from './systembar-user-info.css';

class SystembarUserInfo extends LitComponent {
  clickHandler() {
    this.bubble('system:panel', { panel: 'e-custom-user-settings-panel' });
  }

  static get components() {
    return {
      'eui-icon': Icon,
    };
  }

  /**
   * @private
   * @function _getUserName
   * @description Component did connect callback
   */
  _getUserName() {
    const { localStorage } = window;
    return localStorage.getItem('username') || '';
  }

  render() {
    return html`
      <div class="system-action" @click=${() => this.clickHandler()}>
        <eui-icon name="profile"></eui-icon>
        <span>${this._getUserName()}</span>
      </div>
    `;
  }
}

definition('e-systembar-user-info', {
  style,
})(SystembarUserInfo);

/**
 * Register the component as e-systembar-user-info.
 * Registration can be done at a later time and with a different name
 */
SystembarUserInfo.register();

export { SystembarUserInfo };
