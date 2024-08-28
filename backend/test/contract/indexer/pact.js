import pact from '@pact-foundation/pact';
import path from 'path';
import process from 'process';

const Pact = pact.PactV3;
const consumerVersion = '1.0.0';
const consumerName = 'network-assurance-search';
const providerName = 'assurance-indexer-service';
const pactFilePath = 'test/contract/indexer/pacts';

const provider = new Pact({
  consumer: consumerName,
  provider: providerName,
  dir: path.resolve(process.cwd(), pactFilePath),
  log: path.resolve(process.cwd(), 'logs', `${pactFilePath}/pact.log`),
  logLevel: 'error',
});

// used to kill any left over mock server instances in case of errors
process.on('SIGINT', () => {
  pact.removeAllServers();
});

export { provider, consumerName, providerName, consumerVersion };
