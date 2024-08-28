import { expect, fixture, html } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import { isRendered } from '../../utils/isRendered';
import ErrorBanner from '../../../src/components/error-banner/error-banner.js';

const banner = async ({ message, error }) => {
  const bannerTemplate = html`
    <e-error-banner message=${ifDefined(message)} .error=${error}></e-error-banner>
  `;
  const element = await fixture(bannerTemplate);
  await isRendered(element);
  return element;
};

const getErrorBanner = (element) => {
  const bannerElement = element.shadowRoot.querySelector('#error-banner');
  if (bannerElement) {
    return bannerElement.textContent.trim();
  }
  return bannerElement;
};

describe('Error Banner Tests', async () => {
  let element;

  before(async () => {
    ErrorBanner.register();
  });

  it('should create a new <e-error-banner> with message', async () => {
    element = await banner({});
    const errorBanner = getErrorBanner(element);
    expect(errorBanner).to.equal('An unknown error occurred.');
  });

  it('should show correct context error message', async () => {
    const error = {
      type: 'CONTEXT_ERROR',
      data: { name: 'abc', index: 'test' },
    };
    const result =
      "The KPI Context for 'abc' for index 'test' doesn't exist. You can click 'Add KPI Context' button to explore available KPI Contexts.";

    element = await banner({ error });
    const errorBanner = getErrorBanner(element);
    expect(errorBanner).to.equal(result);
  });

  it('should show the correct historical dashboard error message', async () => {
    const error = {
      data: 'The context field IDs given for the charts IDs for the historical dashboard do not match the context fields for the selected context',
      type: 'DASHBOARD_VALIDATION_ERROR',
    };

    const result =
      "There was a problem creating the Historical Dashboard: the identifier types provided for the Historical Dashboard are incorrect for the selected Context. You can click 'Add KPI Context' to explore available KPI Contexts or refresh the page to try again.";

    element = await banner({ error });
    const errorBanner = getErrorBanner(element);
    expect(errorBanner).to.equal(result);
  });

  it('should show correct validation error message', async () => {
    const error = {
      type: 'VALIDATION_ERROR',
      data: {},
    };
    const result =
      "There was a problem creating the KPI Context. You can click 'Add KPI Context' to explore available KPI Contexts or refresh the page to try again.";

    element = await banner({ error });
    const errorBanner = getErrorBanner(element);
    expect(errorBanner).to.equal(result);
  });

  it('should show correct no indexes message', async () => {
    const error = {
      type: 'NO_INDEXES',
      data: {},
    };
    const result =
      'No indexes are configured. This can happen as the system is initializing. Reload to try again.';

    element = await banner({ error });
    const errorBanner = getErrorBanner(element);
    expect(errorBanner).to.equal(result);
  });

  it('should show correct no contexts message', async () => {
    const error = {
      type: 'NO_CONTEXTS',
      data: {},
    };
    const result =
      'No contexts are configured. This can happen as the system is initializing. Reload to try again.';

    element = await banner({ error });
    const errorBanner = getErrorBanner(element);
    expect(errorBanner).to.equal(result);
  });

  it('should show correct network error message', async () => {
    const error = {
      type: 'NETWORK_ERROR',
      data: {},
    };
    const result =
      'There was an unexpected issue connecting to our services for data. Reload to try again.';

    element = await banner({ error });
    const errorBanner = getErrorBanner(element);
    expect(errorBanner).to.equal(result);
  });

  it('should show default message without error type', async () => {
    const message = '';
    const result = 'An unknown error occurred.';

    element = await banner({ message });
    const errorBanner = getErrorBanner(element);
    expect(errorBanner).to.equal(result);
  });

  it('should show custom message without error type', async () => {
    const message = 'This is custom error message';
    const result = 'This is custom error message';

    element = await banner({ message });
    const errorBanner = getErrorBanner(element);
    expect(errorBanner).to.equal(result);
  });

  it('should show correct system state error message', async () => {
    const error = {
      type: 'SYSTEM_STATE',
      message: 'This is sample message',
    };
    const result = 'This is sample message';

    element = await banner({ error });
    const errorBanner = getErrorBanner(element);
    expect(errorBanner).to.equal(result);
  });
});
