// eslint-disable-next-line camelcase
import jwt_decode from 'jwt-decode';
import storage from '../../../utils/storage';
import { loadConfig, getConfig } from '../../../config/configManager';

const AUTHZ_COOKIE_TOKEN_KEY = 'auth_id_token';
const DEFAULT_USER_NAME = 'User';

/**
 * Settings Persistance
 * ---------------------------------------------------------------------
 * The plugin is used to persist the theme.
 */

/**
 * Persist the theme in session storage
 *
 * @function themeChanged
 * @param {Event} event The theme changed event
 * @private
 */
const themeChanged = (event) => {
  const { theme } = event.detail;
  storage.set('theme', theme);
};

/**
 * Register for the theme changed event
 *
 * @function registerThemeChangeHandler
 * @private
 */
const registerThemeChangeHandler = (euiContainer) => {
  euiContainer.addEventListener('eui-theme-change', themeChanged);
};

export const getContainer = () => document.querySelector('eui-container');

/**
 * Set the persisted theme into the Container
 *
 * @function setPersistedTheme
 * @private
 */
const setPersistedTheme = () => {
  const theme = storage.get('theme');
  if (theme) {
    const euiTheme = document.querySelector('eui-theme');
    euiTheme.bubble('eui-theme-change', { theme });
  }
};

const getCookie = (name) => {
  const value = `; ${document.cookie}`;
  const parts = value.split(`; ${name}=`);
  if (parts.length === 2) {
    return parts.pop().split(';').shift();
  }
  return null;
};

const getJWTPayload = () => {
  const tokenCookie = getCookie(AUTHZ_COOKIE_TOKEN_KEY);
  if (tokenCookie) {
    return jwt_decode(tokenCookie);
  }
  return null;
};

/**
 * Lifecycle hook executed automatically before
 * the Container loads.
 * Implement this function when you want code in
 * the plugin to execute before the Container loads.
 *
 * @function onBeforeContainerLoad
 * @public
 */
export const onBeforeContainerLoad = () => async (resolve) => {
  try {
    await loadConfig();

    const jwtData = getJWTPayload();

    localStorage.setItem('username', jwtData?.preferred_username || DEFAULT_USER_NAME);
    storage.init({ userName: localStorage.getItem('username') });

    // showing last login date in system panner
    // const authTime = jwtData?.iat;
    // if (authTime) {
    //   const previousLoginTime = storage.get('lastLoginTime');
    //   storage.set('lastLoginTime', authTime);
    //   if (previousLoginTime) {
    //     storage.set('previousLoginTime', previousLoginTime);
    //   }
    // }
  } catch (err) {
    console.warn('get user: ', err);
  }

  setPersistedTheme();
  registerThemeChangeHandler(getContainer());
  resolve();
};

export const onBeforeAppLoad = () => (resolve) => {
  resolve();
};

export const clearSession = () => {
  storage.remove('username');
};

export const openUserAccountEditor = () => {
  window.open(getConfig().getUserAccountURL(), '_blank').focus();
};

export const getUserAccountEditorRoute = () => getConfig().getUserAccountURL();

export const getLastLoginTime = () => storage.get('lastLoginTime');
export const getPreviousLoginTime = () => storage.get('previousLoginTime');

export const logout = () => {
  const logoutUrl = getConfig().getLogoutUrl();
  const redirectUrl = window.location.href;
  window.location.href = `${logoutUrl}?origin=${redirectUrl}`;
};
