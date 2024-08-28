import { terser } from 'rollup-plugin-terser';
import minifyHTML from 'rollup-plugin-minify-html-literals';
import summary from 'rollup-plugin-summary';
import glob from 'glob';

const minifiedFiles = [];

const locales = glob.sync('build/src/**/en-us.json');
const componentFolders = locales.map((locale) => locale.replace('locale/en-us.json', ''));
const modules = componentFolders.map((componentFolder) => glob.sync(`${componentFolder}/*.js`)[0]);

const paths = [];
const regex1 = /[a-z]*\/[a-z]*\/[a-z]*\//;
const regex2 = /[a-z]*\/[a-z]*\//;

modules.forEach((module) => {
  paths.push(module.replace(regex1, '../'));
  paths.push(module.replace(regex2, '../../'));
});

// list of all modules that are being extended here
const externalModules = paths.concat([
  '../../utils/storage.js',
  '../../../utils/storage.js',
  '../../utils/dateFormatter.js',
  '../../../utils/dateFormatter.js',
  '../../utils/logger.js',
  '../../utils/rest.js',
  '../src/utils/rest.js',
  '../utils/rest.js',
  './rest.js',
  '../../config/configManager.js',
  '../../../config/configManager.js',
  '../config/configManager.js',
  '../../../libs/pkg/@eui/app.js',
  '../../../libs/pkg/@eui/lit-component.js',
  '../../../libs/pkg/@eui/component.js',
  '../../libs/pkg/@eui/component.js',
  '../../libs/pkg/@eui/base/switch.js',
  // configs
  '../../deployment-config/frontend-config.json',
]);

// creates an array of all JS files to be minified
const jsFilesToMinify = glob.sync('build/**/*.js');

jsFilesToMinify.forEach((file) => {
  if (file.includes('index.js')) {
    return;
  }
  minifiedFiles.push({
    input: file,
    output: [
      {
        file,
        format: 'esm',
        name: `${file}`,
      },
    ],
    plugins: [
      // Minify HTML template literals
      minifyHTML(),
      // Minify JS
      terser({
        ecma: 2020,
        module: true,
        warnings: true,
      }),
      // Print bundle summary
      // Not necessary for our CLI but good for showcase to show file sizes
      summary(),
    ],
    external: externalModules,
    onwarn: (warning) => {
      // Skip This set to undefined warning
      // see warning message https://rollupjs.org/guide/en/#error-this-is-undefined
      // for more information on this
      if (warning.code === 'THIS_IS_UNDEFINED') {
        return;
      }

      // console.warn everything else
      // eslint-disable-next-line no-console
      console.warn(warning.message);
    },
  });
});

export default minifiedFiles;
