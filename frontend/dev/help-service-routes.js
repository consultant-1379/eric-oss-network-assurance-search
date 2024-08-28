import { createRequire } from 'module';

const require = createRequire(import.meta.url);

const apiConfig = require('../src/config/api-config.json');
const documents = require('./mockdata/documents.json');
const groups = require('./mockdata/groups.json');

const UIConfig = {
  logging: {
    logLevel: 'info',
  },
  routes: { ...apiConfig },
};

export default [
  {
    src: '/internal-api/uiConfig',
    dest: (_req, res) => res.end(JSON.stringify(UIConfig)),
  },
  {
    src: '/ui-logging/v1/logs',
    dest: (_req, res) => {
      setTimeout(() => {
        res.statusCode = 200;
        res.end();
      });
    },
  },
  {
    src: '/help-meta/v1/documents',
    dest: (_req, res) => res.end(JSON.stringify(documents)),
  },
  {
    src: '/help-meta/v1/groups',
    dest: (_req, res) => res.end(JSON.stringify(groups)),
  },
];
