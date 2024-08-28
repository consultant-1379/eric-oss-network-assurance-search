import { createRequire } from 'module';
import { FULLCONTEXT_DOCS } from '../mock-api-responses/mock-data/index_metadata_relations/constants.js';

const require = createRequire(import.meta.url);
const helpContentMetadataService1 = require('../config-files/help-content-metadata-service-1.json');
const helpContentMetadataValidService = require('../config-files/help-content-metadata-valid-service.json');
const indexerFullContextDocs = require('../mock-api-responses/mock-data/index_metadata_relations/FullContextSpecs_0.json');
const metricsDocs = require('../mock-api-responses/mock-data/index_metadata_relations/ValuesForFullContext_0.json');

const fakeCloneFunction = () => ({
  buffer: () => Buffer.from('fake zip file content for tests'),
});

export default (url) =>
  new Promise((resolve, reject) => {
    let error;
    switch (true) {
      case /.*help-content-config-context.*configContext.*help-content-metadata\.json$/.test(url):
      case /.*help-content-service-1.*help-content-metadata\.json$/.test(url):
      case /.*domain1.*.json$/.test(url):
        resolve({
          ok: true,
          json: () => Promise.resolve(helpContentMetadataService1),
        });
        break;
      case /https:.*help-content-valid-service.*help-content-metadata\.json$/.test(url):
      case /help-content-service-2.*help-content-metadata\.json$/.test(url):
        resolve({
          ok: true,
          json: () => Promise.resolve(helpContentMetadataValidService),
        });
        break;
      case /https:.*help-content-valid-service.*\.zip$/.test(url):
        resolve({
          ok: true,
          clone: fakeCloneFunction,
        });
        break;
      case /http:.*help-content-lib.*/.test(url):
        error = new Error('No such app.');
        error.code = 'ECONNRESET';
        reject(error);
        break;
      case /.*help-content-config-context.*help-content-metadata\.json$/.test(url):
        reject(new Error());
        break;
      case /.*failingurl.com\/[a-z]{1,11}$/.test(url):
        resolve({
          ok: false,
        });
        break;
      case /\/v1\/indexer-info\/search-engine-index-list$/.test(url):
        resolve({
          ok: true,
          json: () => Promise.resolve([{ name: 'soa', description: 'Soa description' }]),
        });
        break;
      case /\/v1\/indexer-info\/spec\/fullcontexts\?searchEngineIndexName=[a-zA-Z][a-zA-Z0-9_-]{0,254}$/.test(
        url,
      ):
        resolve({
          ok: true,
          json: () =>
            Promise.resolve(
              FULLCONTEXT_DOCS.has(url.substring(url.indexOf('=') + 1))
                ? FULLCONTEXT_DOCS.get(url.substring(url.indexOf('=') + 1))
                : indexerFullContextDocs,
            ),
        });
        break;
      case /\/v1\/indexer-info\/spec\/values-for-fullcontext\?searchEngineIndexName=[a-zA-Z][a-zA-Z0-9_-]{0,254}&fullContextName=[a-zA-Z][a-zA-Z0-9_-]{0,254}$/.test(
        url,
      ): {
        const searchEngineIndexName = url.match(/searchEngineIndexName=([^&]*)/)[1];
        const fullContextName = url.match(/fullContextName=([^&]*)/)[1];
        resolve({
          ok: true,
          json: () => Promise.resolve(metricsDocs[`${searchEngineIndexName}_${fullContextName}`]),
        });
        break;
      }
      default:
        reject(new Error('No such app.'));
        break;
    }
  });
