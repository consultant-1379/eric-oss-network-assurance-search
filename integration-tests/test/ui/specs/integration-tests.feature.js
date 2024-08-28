import chai from 'chai';
import chaiString from 'chai-string';
import MainPage from '../../../../frontend/test_js/page-objects/eric-oss-network-assurance-search/Main.page.js';

const { expect } = chai;

chai.use(chaiString);

describe('Integration Tests', () => {
  before(async () => {
    await MainPage.open();
    await MainPage.waitForLoading();
  });

  it('can load the page', async () => {
    const cardView = await MainPage.cardView();
    expect(cardView).not.to.be.undefined;
  });
});
