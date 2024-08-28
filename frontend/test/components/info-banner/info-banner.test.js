import { expect, fixture, html } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import { isRendered } from '../../utils/isRendered';
import InfoBanner from '../../../src/components/info-banner/info-banner.js';

const banner = async ({ message }) => {
  const bannerTemplate = html`
    <e-info-banner message=${ifDefined(message)}></e-info-banner>
  `;
  const element = await fixture(bannerTemplate);
  await isRendered(element);
  return element;
};

describe('Info Banner Tests', async () => {
  let element;
  before(async () => {
    InfoBanner.register();
  });

  it('should create a new <e-info-banner> with message', async () => {
    element = await banner({ message: 'Hello world' });
    expect(element.shadowRoot.querySelector('#info-banner').textContent.trim()).to.equal(
      'Hello world',
    );
  });
});
