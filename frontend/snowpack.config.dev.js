import CONFIG from './snowpack.config.js';
import devOptions from './dev/help-service-routes.js';

const { NODE_ENV } = process.env;
const DEVELOPMENT = 'development';

if (NODE_ENV === DEVELOPMENT) {
  const helpServiceRoutes = devOptions;
  CONFIG.routes = [...helpServiceRoutes];
}

/** @type {import("snowpack").SnowpackUserConfig } */
export default CONFIG;
