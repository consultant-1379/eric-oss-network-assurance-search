import { expect, fixture, html } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import TabBar from '../../../src/components/tab-bar/tab-bar';
import { isRendered } from '../../utils/isRendered';

const EUI_ACTIONABLEICON = '.close';
const SELECTED_TAB_SELECTOR = '.tab[selected]';

const metricBrowser = {
  filters: [],
  active: true,
  loading: false,
  context,
  filterCategories: [
    {
      type: 'context',
      title: 'Network Context',
      selection: 'checkbox',
      fields: [
        {
          label: 'Network Slice Selection Assistance Information',
          value: 'NSSAI',
          valueType: 'string',
        },
        {
          label: 'Network Slice Instance',
          value: 'NSI',
          valueType: 'string',
        },
      ],
      help: 'NETWORK_FILTER_TOOLTIP_MESSAGE',
    },
    {
      type: 'metric',
      title: 'Metrics',
      selection: 'radio',
      fields: [
        {
          label: 'Session Modification Request Received',
          value: 'vi_sessionModificationReqRcvd',
          valueType: 'integer',
        },
        {
          label: 'Dropped Packets',
          value: 'vi_dlUnstrDropPackets',
          valueType: 'integer',
        },
      ],
      help: 'MEASUREMENT_FILTER_TOOLTIP_MESSAGE',
    },
  ],
  data: {
    tableData: [
      {
        NSSAI: 'NSSAI_1234',
        NSI: 'NSI 4321',
        vi_dlUnstrDropPackets: -8618.52,
        vi_sessionModificationReqRcvd: 3379.882952,
        vi_PDUSessionEstSR: 16948.1818,
      },
    ],
    sort: {
      sortBy: undefined,
      sortOrder: undefined,
    },
    currentpage: 1,
    numentries: 20,
    numpages: 1,
    fetchTime: 1683983822487,
  },
  metricCategoryPickerData: {
    viewAllSelected: false,
    maxPillCount: 10,
  },
  relationActions: [
    {
      label: 'NSSAI & NSI Context',
      data: {
        operation: 'open-tab',
        context: { id: 'CID_1234', contextFields: 'Array(2)', name: 'NSSAI & NSI Context' },
      },
      facetCounts: {},
    },
  ],
};

const renderContainer = async ({ browsers, contexts }) => {
  const tabBarTemplate = html`
    <e-tab-bar .browsers=${ifDefined(browsers)} .contexts=${ifDefined(contexts)}></e-tab-bar>
  `;
  const element = await fixture(tabBarTemplate);
  await isRendered(element);
  return element;
};

describe('Tab Bar Component Tests', () => {
  let container;

  before(async () => {
    TabBar.register();
  });

  it('should render <e-tab-bar>', async () => {
    container = await renderContainer({ browsers: [] });
    expect(container).to.exist;
  });

  it('should render <e-tab-bar> with 1 tab - no action icon', async () => {
    container = await renderContainer({
      browsers: [metricBrowser],
    });
    const selectedTab = container.shadowRoot.querySelector(SELECTED_TAB_SELECTOR);
    const selectedTabActionable = selectedTab.querySelector(EUI_ACTIONABLEICON);
    expect(selectedTabActionable).to.not.exist;
  });

  it('should render <e-tab-bar> with multiple tabs - with action icon', async () => {
    container = await renderContainer({
      browsers: [metricBrowser, metricBrowser],
    });
    const selectedTab = container.shadowRoot.querySelector(SELECTED_TAB_SELECTOR);
    const selectedTabActionable = selectedTab.querySelector(EUI_ACTIONABLEICON);
    expect(selectedTabActionable).to.exist;
  });

  it('should render tabs', async () => {
    container = await renderContainer({
      browsers: [metricBrowser],
    });
    const tabs = container.shadowRoot.querySelector("eui-tab[slot='titles']");
    expect(tabs).to.exist;
  });

  it('should render a metric browser', async () => {
    container = await renderContainer({
      browsers: [metricBrowser],
    });
    const browsers = container.shadowRoot.querySelector("e-metric-browser[slot='content']");
    expect(browsers).to.exist;
  });

  it('should show the context error banner when an invalid context', async () => {
    const browserError = {
      type: 'CONTEXT_ERROR',
      data: { name: 'abc', index: 'RAN' },
    };
    const testBrowserObject = { ...metricBrowser, browserError };

    container = await renderContainer({
      browsers: [testBrowserObject],
    });
    const banner = container.shadowRoot.querySelector('e-error-banner');
    expect(banner).to.exist;
  });
});
