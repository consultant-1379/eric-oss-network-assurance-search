import { createRequire } from 'module';

const require = createRequire(import.meta.url);
const groups = require('../../dev/mockdata/groups.json');
const documents = require('../../dev/mockdata/documents.json');

const uiConfig = {
  logging: { logLevel: 'info' },
};

const returnJson = (res, data) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'application/json');
  return res.end(JSON.stringify(data));
};

export default function mockMiddleware({ url, res }, next) {
  switch (url) {
    case '/ui-logging/v1/logs':
      res.statusCode = 200;
      return res.end();
    case '/internal-api/uiConfig':
      return returnJson(res, uiConfig);
    case '/help-meta/v1/documents':
      return returnJson(res, documents);
    case '/help-meta/v1/groups':
      return returnJson(res, groups);
    default:
      return next();
  }
}
