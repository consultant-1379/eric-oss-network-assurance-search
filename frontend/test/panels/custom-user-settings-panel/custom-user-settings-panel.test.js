import { expect, fixture, html } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import { isRendered } from '../../utils/isRendered';
import settingsPanel from '../../../src/panels/custom-user-settings-panel/custom-user-settings-panel.js';
import storage from '../../../src/utils/storage.js';

let eventData;
const handleEvent = (event) => {
  eventData = event;
};

const panel = async ({ timestamp }) => {
  const panelTemplate = html`
    <e-custom-user-settings-panel
      timestamp=${ifDefined(timestamp)}
      @eui-plugins:execute=${handleEvent}
    ></e-custom-user-settings-panel>
  `;
  const element = await fixture(panelTemplate);
  await isRendered(element);
  return element;
};

describe('User settings panel Tests', async () => {
  let element;
  before(async () => {
    storage.init();
    settingsPanel.register();
  });

  it('should create a new <e-custom-user-settings-panel>', async () => {
    element = await panel({ timestamp: null });
    expect(element.shadowRoot.querySelector('eui-icon')).to.exist;
  });

  it('should have logout button', async () => {
    element = await panel({ timestamp: null });
    const logoutButton = element.shadowRoot.querySelector('.logoutButton');
    expect(logoutButton).to.exist;
    logoutButton.click();
    expect(eventData.detail?.method).to.equal('logout');
  });

  it('should display user name', async () => {
    localStorage.setItem('username', 'TestUser');
    element = await panel({ timestamp: null });
    const userName = element.shadowRoot.querySelector('.username');
    expect(userName).to.exist;

    expect(userName.textContent.trim()).to.equal('TestUser');
  });
});
