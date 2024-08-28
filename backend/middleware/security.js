import helmet from 'helmet';
import configManager from '../config/configManager.js';

const unsafeInline = "'unsafe-inline'";

/**
 * Get a list of custom Helmet options we use e.g. for our
 * http routes.
 *
 * These options have been carefully crafted. They should only be changed if you know
 * what you are doing.
 *
 * @returns {helmet.HelmetOptions} The options to use with Helmet
 */
function getHelmetOptions() {
  return {
    hsts: {
      maxAge: 31536000, // 365 days (instead of the default 180 days)
    },
    contentSecurityPolicy: {
      useDefaults: false,
      directives: {
        'default-src': ["'none'"],
        'connect-src': ["'self'"],
        'font-src': ["'self'"],
        'form-action': ["'self'"],
        'navigate-to': ["'self'"],
        'base-uri': ["'none'"],
        // The ones below should be fixed:
        // Remove the use of data: sources, it is considered unsafe
        // It can only be removed once jsoneditor has fixed this (or we can replace the CSS with
        // our own to not use the svg, see https://github.com/josdejong/jsoneditor/issues/1418)
        'img-src': ["'self'", 'data:'],
        'script-src': ["'self'"],
        // style-src is a fallback for style-src-elem/style-src-attr when they are not supported
        // Remove 'unsafe-inline' once/if if E-UI SDK fixes this
        'style-src': ["'self'", unsafeInline],
        // Remove 'unsafe-inline' once/if if E-UI SDK fixes this
        'style-src-elem': ["'self'", unsafeInline],
        // Remove 'unsafe-inline' once/if if E-UI SDK fixes this
        // This might be dependent on Polymer/Lit though, but we will check this after E-UI SDK 2
        'style-src-attr': [unsafeInline],
      },
    },
    // The Cross-Origin-Opener-Policy is ignored by a browser if a URL's origin is considered
    // untrustworthy i.e. if using HTTP instead of HTTPS. We thus skip including the header when
    // using HTTP, as otherwise the browser logs an error in the console.
    crossOriginOpenerPolicy: configManager.useHttps(),
  };
}

const corsMiddleware = helmet(getHelmetOptions());

export { corsMiddleware };
