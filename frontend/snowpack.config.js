import { createRequire } from 'module';
import { nodeResolve } from '@rollup/plugin-node-resolve';

const require = createRequire(import.meta.url);

const { devDependencies } = require('./package.json');
const externalModules = require('./public/config.package.json').modules;

const { NODE_ENV } = process.env;
const TEST = 'test';

const CONFIG = {
  workspaceRoot: '/',
  mount: {
    public: '/',
    src: '/src',
    './node_modules/@eui/theme/dist/fonts': {
      url: '/assets/fonts',
      resolve: false,
      static: true,
    },
    './node_modules/@eui/theme': {
      url: '/libs/shared/@eui/theme',
      static: true,
    },
    './node_modules/@eui/container': {
      url: '/libs/shared/@eui/container',
      static: true,
    },
    './node_modules/@eui/app': {
      url: '/libs/shared/@eui/app',
      static: true,
    },
    './node_modules/@eui/lit-component': {
      url: '/libs/shared/@eui/lit-component',
      static: true,
    },
    './node_modules/@eui/base': {
      url: '/libs/shared/@eui/base',
      static: true,
    },
    './node_modules/@eui/layout': {
      url: '/libs/shared/@eui/layout',
      static: true,
    },
  },
  plugins: ['@eui/import-css-plugin'],
  packageOptions: {
    polyfillNode: true,
    rollup: {
      plugins: [nodeResolve()],
    },
    external: [...Object.keys(devDependencies), ...externalModules.map((module) => module.name)],
    knownEntrypoints: [
      '@open-wc/testing-helpers',
      '@eui/base/checkbox',
      '@eui/layout/card',
      '@eui/theme/icon',
      '@eui/base/spinner',
      '@eui/base/dropdown',
    ],
  },
  devOptions: {},
  buildOptions: {
    metaUrlPath: 'libs',
  },
};

if (NODE_ENV === TEST) {
  let externalPackageOptions = [...Object.keys(devDependencies)];
  // Removing exclusions from list
  const exclusions = ['ajv', 'ajv-formats'];
  externalPackageOptions = externalPackageOptions.filter(
    (devDependency) => !exclusions.includes(devDependency),
  );
  CONFIG.packageOptions.external = externalPackageOptions;
}

/** @type {import("snowpack").SnowpackUserConfig } */
export default CONFIG;
