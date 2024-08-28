import supertest from 'supertest';
import { expect } from 'chai';
import ConfigUtilClass from '../util/config-util.js';
import sortFn from '../util/sort-util.js';

const MOCK_BASE = '../../../../mock/domain-ui-generic/public';
const SERVICE_NAME_PREFIX = 'help-center-mock';

const servicesToTest = [
  {
    deploymentName: `${SERVICE_NAME_PREFIX}-ecm`,
    folderPath: `${MOCK_BASE}/help-center-mock-ecm`,
    contentMetadata: 'help-content-metadata.json',
  },
  {
    deploymentName: `${SERVICE_NAME_PREFIX}-eea`,
    folderPath: `${MOCK_BASE}/help-center-mock-eea`,
    contentMetadata: 'help-content-metadata.json',
  },
];

const configUtil = new ConfigUtilClass(servicesToTest);

describe('Integration tests for Help Aggregator Service', () => {
  let request;
  before(() => {
    request = supertest(configUtil.getServiceUrl());
  });

  it('Provides Liveness/Readyness endpoint', async () => {
    await request.get('/status').expect(200);
  });

  it('Discovered deployed documents', async () => {
    const DOCUMENTS_RESP = configUtil.getDocumentsResponse();
    await request
      .get('/help-meta/v1/documents')
      .expect('Content-Type', /json/)
      .expect(200)
      .expect((response) => {
        const documents = response.body;
        expect(documents).to.have.lengthOf(DOCUMENTS_RESP.length);
        expect(documents.sort(sortFn('name'))).to.deep.eq(DOCUMENTS_RESP.sort(sortFn('name')));
      });
  });

  it('Discovered deployed groups', async () => {
    const GROUPS_RESP = configUtil.getGroupsResponse();
    await request
      .get('/help-meta/v1/groups')
      .expect('Content-Type', /json/)
      .expect(200)
      .expect((response) => {
        const groups = response.body;
        expect(groups).to.have.lengthOf(GROUPS_RESP.length);
        expect(
          groups
            .map((group) => ({ ...group, documents: group.documents.sort(sortFn('name')) }))
            .sort(sortFn('name')),
        ).to.deep.eq(
          GROUPS_RESP.map((group) => ({
            ...group,
            documents: group.documents.sort(sortFn('name')),
          })).sort(sortFn('name')),
        );
      });
  });
});
