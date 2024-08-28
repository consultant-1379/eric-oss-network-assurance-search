import { Verifier } from '@pact-foundation/pact';

const pactFilePath =
  '../backend/test/contract/indexer/pacts/network-assurance-search-assurance-indexer-service.json';

describe('Pact Verification', () => {
  it('validates the expectations of network-assurance-search', () => {
    const opts = {
      logLevel: 'error',
      providerBaseUrl: 'http://localhost:8282',
      provider: 'assurance-indexer-service',
      providerVersion: '1.0.0',
      pactUrls: [pactFilePath],
    };

    return new Verifier(opts).verifyProvider().then((output) => {
      console.log(output);
    });
  });
});
