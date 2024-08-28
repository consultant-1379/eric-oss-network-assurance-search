import webTestRunner from '@snowpack/web-test-runner-plugin';
import { summaryReporter, defaultReporter } from '@web/test-runner';

import mockMiddleware from './test/utils/mockMiddleware.js';

process.env.NODE_ENV = 'test';

export default {
  coverage: true,
  nodeResolve: true,
  concurrentBrowsers: 1,
  browserStartTimeout: 300_000,
  plugins: [webTestRunner()],
  files: 'test/**/*.test.js',
  reporters: [
    defaultReporter({ reportTestResults: false, reportTestProgress: true }),
    summaryReporter(),
  ],
  testFramework: {
    config: {
      timeout: 20_000,
    },
  },
  middleware: [mockMiddleware],
  coverageConfig: {
    reportDir: 'coverage/frontend',
    exclude: [
      '.scannerwork/**',
      'dev/**',
      'libs/**',
      'node_modules/**',
      'public/**',
      'scripts/**',
      'src/ApiClient.js',
      'src/api/**',
      'src/config/**',
      'src/index.js',
      'src/model/**',
      'src/plugins/**',
      'src/schemas/**',
      'src/utils/**',
      'test_js/**',
      'utils/**',
    ],
  },
};
