import { expect, fixture, html } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import TutorialBanner from '../../../src/components/tutorial-banner/tutorial-banner';
import { dismissHelpBanner } from '../../../src/state/tutorialActions';
import { isRendered } from '../../utils/isRendered';

let dismissEvent;
const handleDismissEvent = ({ detail }) => {
  dismissEvent = detail;
};

const renderTutorialBanner = async ({ message, type }) => {
  const tutorialBanner = html`
    <e-tutorial-banner
      .message=${ifDefined(message)}
      .type=${ifDefined(type)}
      @dismiss-help=${handleDismissEvent}
    ></e-tutorial-banner>
  `;
  const element = await fixture(tutorialBanner);
  await isRendered(element);
  return element;
};

describe('Presentational tests for tutorial banner', async () => {
  before(() => TutorialBanner.register());
  it('should have the correctly configured message', async () => {
    const element = await renderTutorialBanner({
      message: 'Hello world 1',
      type: 'hello-banner-1',
    });
    const helpBanner = element.shadowRoot.querySelector('.help-banner');
    expect(helpBanner.textContent).to.equal('Hello world 1');
  });

  it('should emit the appropriate event when clicked', async () => {
    const element = await renderTutorialBanner({
      message: 'Hello world 2 ',
      type: 'hello-banner-2',
    });
    element.click();
    expect(dismissEvent).to.deep.equal('hello-banner-2');
  });
});

describe('Actions tests for tutorial banner', async () => {
  before(() => TutorialBanner.register());
  beforeEach(() => {
    dismissEvent = undefined;
  });
  it('should mutate the state correctly for app banner dismissal', async () => {
    const element = await renderTutorialBanner({
      message: 'App banner',
      type: 'appHelp',
    });
    element.click();

    let actual = {};

    const stateAccessor = {
      getState: () => ({
        onboardingHelp: { appHelp: true, filterHelp: true, browserHelp: true },
      }),
      updateState(s) {
        actual = { ...s };
      },
    };
    dismissHelpBanner(stateAccessor, dismissEvent);
    expect(actual.onboardingHelp).to.deep.equal({
      appHelp: false,
      filterHelp: true,
      browserHelp: true,
    });
  });

  it('should mutate the state correctly for browser banner dismissal', async () => {
    const element = await renderTutorialBanner({
      message: 'Filter banner',
      type: 'filterHelp',
    });
    element.click();

    let actual = {};

    const stateAccessor = {
      getState: () => ({
        onboardingHelp: { appHelp: true, filterHelp: true, browserHelp: true },
      }),
      updateState(s) {
        actual = { ...s };
      },
    };
    dismissHelpBanner(stateAccessor, dismissEvent);
    expect(actual.onboardingHelp).to.deep.equal({
      appHelp: true,
      filterHelp: false,
      browserHelp: true,
    });
  });

  it('should mutate the state correctly for filter banner dismissal', async () => {
    const element = await renderTutorialBanner({
      message: 'Browser',
      type: 'browserHelp',
    });
    element.click();
    let actual = {};

    const stateAccessor = {
      getState: () => ({
        onboardingHelp: { appHelp: true, filterHelp: true, browserHelp: true },
      }),
      updateState(s) {
        actual = { ...s };
      },
    };
    dismissHelpBanner(stateAccessor, dismissEvent);
    expect(actual.onboardingHelp).to.deep.equal({
      appHelp: true,
      filterHelp: true,
      browserHelp: false,
    });
  });
});
