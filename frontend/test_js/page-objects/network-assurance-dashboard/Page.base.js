import euiFrame from '../common/eui-frame.component.js';

const cssPaths = {
  cardView: 'e-card-view',
  euiLoader: 'eui-loader',
};

class PageBase extends euiFrame.PageBase {
  async waitForCardViewLoading() {
    await this._waitForLoading(cssPaths.cardView);
  }

  async _waitForLoading(viewCssPath) {
    await super.waitForLoading();
    await browser.waitUntil(async () => {
      const root = await this.root();
      const view = await root.shadow$(viewCssPath);
      return this._isDisplayed(view);
    }, undefined);
  }

  async waitForLoading() {
    super.waitForLoading();
    await browser.waitUntil(
      async () => {
        const root = await this.root();
        const euiLoader = await root.shadow$(cssPaths.euiLoader);
        const isDisplayed = await this._isDisplayed(euiLoader);
        return !isDisplayed;
      },
      undefined,
      'Failed to wait for loader to disappear',
    );
  }
}

export default PageBase;
