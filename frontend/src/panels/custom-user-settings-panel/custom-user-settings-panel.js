/**
 * Component CustomUserSettingsPanel is defined as
 * `<e-custom-user-settings-panel>`
 *
 * Imperatively create component
 * @example
 * let component = new CustomUserSettingsPanel();
 *
 * Declaratively create component
 * @example
 * <e-custom-user-settings-panel></e-custom-user-settings-panel>
 *
 * @extends {LitComponent}
 */
import { LitComponent, html, definition, classMap } from '@eui/lit-component';
import { Icon } from '@eui/theme';
import { Button, Switch } from '@eui/base';
import style from './custom-user-settings-panel.css';

// import dateFormatter from '../../utils/dateFormatter';
import storage from '../../utils/storage';
// import replaceInLocale from '../../utils/replaceInLocale';

export default class CustomUserSettingsPanel extends LitComponent {
  /**
   * @public
   * @function constructor
   * @description The constructor for the component, set options and bind events
   */
  constructor() {
    super();
    this._handleThemeToggle = this._handleThemeToggle.bind(this);
    this._handleLogout = this._handleLogout.bind(this);
    this._isUserAccountRouteAvailable = this._isUserAccountRouteAvailable.bind(this);
  }

  static get components() {
    return {
      'eui-button': Button,
      'eui-switch': Switch,
      'eui-icon': Icon,
    };
  }

  get meta() {
    return import.meta;
  }

  get theme() {
    return storage.get('theme') || 'dark';
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

  async callPlugin(method) {
    return new Promise((resolve) => {
      this.bubble('eui-plugins:execute', {
        plugin: 'settings-plugin',
        method,
        params: { callback: resolve },
      });
    });
  }

  /**
   * @private
   * @function didConnect
   * @description Component did connect callback
   */
  async didConnect() {
    this.timestamp = await this.callPlugin('getLastLoginTime');
  }

  /**
   * @private
   * @function _handleThemeToggle
   * @description Handles dispatching the switch theme event
   */
  _handleThemeToggle(e) {
    const theme = e.detail.on ? 'dark' : 'light';
    this.bubble('eui-theme-change', { theme });
  }

  _handleLogout() {
    this.callPlugin('clearSession');
    this.callPlugin('logout');
  }

  async _isUserAccountRouteAvailable() {
    const route = await this.callPlugin('getUserAccountEditorRoute');
    return !!route;
  }

  _renderLogoutButton() {
    return html`
      <eui-button class="logoutButton" icon="logout" @click="${this._handleLogout}">
        ${this.i18n?.SETTINGS_PANEL?.SIGN_OUT || 'Sign out'}
      </eui-button>
    `;
  }

  _renderSettings() {
    const { MY_SETTINGS, SWITCH_THEME, LIGHT, DARK } = this.i18n?.SETTINGS_PANEL || {};
    return html`
      <div class="title">${MY_SETTINGS || 'My settings'}</div>
      <div class="item">
        <div class="left">${SWITCH_THEME || 'Switch theme'}</div>
        <div class="right">
          <eui-switch
            class=${classMap({ align__right: true })}
            label-on="${DARK || 'Dark'}"
            label-off="${LIGHT || 'Light'}"
            ?on=${this.theme === 'dark'}
            @eui-switch:change=${this._handleThemeToggle}
          ></eui-switch>
        </div>
      </div>
    `;
  }

  // _renderLastLogin() {
  //   const { SIGN_IN, LAST_LOG_IN_MISSING } = this.i18n.SETTINGS_PANEL;
  //   const { timestamp } = this;
  //
  //   const loginText = timestamp
  //     ? replaceInLocale(this.i18n.LAST_LOG_IN_TEXT, {
  //         lastLoginTime: dateFormatter.formatDayMonthYearTimeShort(timestamp),
  //       })
  //     : LAST_LOG_IN_MISSING;
  //
  //   return html`
  //     <div class="title">${SIGN_IN}</div>
  //     <div class="item">
  //       <div class="left" id="loginText">${loginText}</div>
  //     </div>
  //   `;
  // }

  render() {
    return html`
      <div class="settings-panel">
        <div class="content">
          <div class="column sm-12 container">
            <div class="profile">
              <eui-icon name="profile" size="44px"></eui-icon>
              <div class="username">${this._getUserName()}</div>
            </div>
            <div class="content">
              ${this._renderSettings()}
            </div>
          </div>
          <div class="logoutContainer">
            ${this._renderLogoutButton()}
          </div>
        </div>
      </div>
      </div>
    `;
  }
}

definition('e-custom-user-settings-panel', {
  style,
  props: {
    timestamp: {
      type: String,
      default: null,
      attribute: false,
    },
  },
})(CustomUserSettingsPanel);
