import { Client } from '@opensearch-project/opensearch';
import { createRequire } from 'module';
import { readFileSync } from 'fs';

const require = createRequire(import.meta.url);
const { searchEngineUrl } = require('../config/backend-service-config-default.json');

const OPENSEARCH_CONNECTION = {
  search_engine_url: process.env.SEARCH_ENGINE_URL || searchEngineUrl,
  tls_cert: process.env.TLS_CERT,
  tls_key: process.env.TLS_KEY,
};
const tlsEnabled = !!OPENSEARCH_CONNECTION.tls_cert;
const certDir = '/runtime/server/certificates/';
const caDir = `${certDir}root/`;
const opensearchDir = `${certDir}search/`;

const client = new Client({
  node: `${OPENSEARCH_CONNECTION.search_engine_url}`,
  // auth is required for running the standalone version of the microservice
  auth: process.env.STANDALONE
    ? {
        username: process.env.OPENSEARCH_USERNAME,
        password: process.env.OPENSEARCH_PASSWORD,
      }
    : undefined,
  // Create an OpenSearch connection with SSL/TLS enabled.
  ssl: {
    ...(tlsEnabled && {
      ca: readFileSync(`${caDir}ca.crt`),
    }),
    ...(tlsEnabled && {
      cert: readFileSync(opensearchDir + OPENSEARCH_CONNECTION.tls_cert),
    }),
    ...(tlsEnabled && {
      key: readFileSync(opensearchDir + OPENSEARCH_CONNECTION.tls_key),
    }),
    rejectUnauthorized: tlsEnabled,
    requestCert: tlsEnabled,
  },
});

export default client;
