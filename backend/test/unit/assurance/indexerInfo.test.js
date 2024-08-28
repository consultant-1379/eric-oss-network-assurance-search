import { expect } from 'chai';
import * as td from 'testdouble';
import { getIndexerList } from '../../../services/assurance/indexerInfo.js';
import ConfigManagerMock from '../../mocks/modules/configManagerMock.js';

describe('Unit tests for indexerInfo.js', () => {
  after(async () => {
    td.reset();
  });
  it('should return a promise', async () => {
    await td.replaceEsm('../../config/configManager.js', null, new ConfigManagerMock());
    const { fetchResponse } = await td.replaceEsm('../../../utils/NetworkUtil.js');
    getIndexerList().then((done) => {
      expect(fetchResponse).to.be.calledWith('/v1/indexer-info/indexer-list', 'testServiceName');
      done();
    });
  });
});
