import { expect, fixture, html } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import FilterPanel from '../../../src/components/filter-panel/filter-panel.js';
import { isRendered } from '../../utils/isRendered';
import { nextTick } from '../../utils/utils.js';

const ACCORDION_SELECTOR = 'eui-accordion';
const FILTER_ITEM_SELECTOR = 'e-filter-list-item';

const renderContainer = async ({ categories, filters, match }) => {
  const filterPanelTemplate = html`
    <e-filter-panel
      .categories=${ifDefined(categories)}
      .filters=${ifDefined(filters)}
      .match=${ifDefined(match)}
    ></e-filter-panel>
  `;
  const element = await fixture(filterPanelTemplate);
  await isRendered(element);
  return element;
};

const _makeFilter = (id, type, selected = false, value = {}) => ({
  id,
  name: 'A',
  type: { id: 'A', description: 'something', valueType: 'string' },
  selected,
  filterCategory: type,
  value,
});

describe('FilterPanel Component Tests', () => {
  let container;

  const categories = [
    {
      title: 'Network Filters',
      type: 'context',
      selection: 'checkbox',
      fields: [
        { label: 'NSI Context Column', name: 'NSI' },
        { label: 'SNSSAI Context Column', name: 'SNSSAI' },
      ],
    },
    {
      title: 'Metric Filters',
      type: 'metric',
      selection: 'radio',
      fields: [
        { label: 'KPI A', name: 'kpi-a' },
        { label: 'KPI B', name: 'kpi-b' },
        { label: 'KPI C', name: 'kpi-c' },
        { label: 'KPI D', name: 'kpi-d' },
      ],
    },
  ];

  before(() => {
    FilterPanel.register();
  });

  describe('Basic component setup', () => {
    it('should render <e-filter-panel>', async () => {
      container = await renderContainer({ categories: [], filters: [] });
      expect(container).to.exist;
    });

    it('should render the correct amount of children for the amount of categories', async () => {
      container = await renderContainer({ categories });
      const filterAccordions = container.shadowRoot.querySelector('section').children;
      expect(filterAccordions.length).to.equal(2);
    });

    it('should render the correct accordions for the categories', async () => {
      container = await renderContainer({ categories });
      const filterAccordions = container.shadowRoot.querySelector('section').children;

      expect(filterAccordions[0].nodeName).to.equal('E-CHECKBOX-FILTER-ACCORDION');
      expect(filterAccordions[1].nodeName).to.equal('E-RADIO-FILTER-ACCORDION');
    });

    it('should sort the filters into the correct categories', async () => {
      const filters = [
        ...['1', '2', '3', '4', '10'].map((itm, idx) => _makeFilter(itm, 'context', idx % 2 === 0)),
        ...['5', '6', '7', '8', '11'].map((itm, idx) => _makeFilter(itm, 'metric', idx % 2 === 1)),
      ];

      container = await renderContainer({ categories, filters });
      const [contextAccordion, metricAccordion] =
        container.shadowRoot.querySelector('section').children;

      const contextCount = contextAccordion.shadowRoot
        .querySelector(ACCORDION_SELECTOR)
        .querySelectorAll(FILTER_ITEM_SELECTOR).length;

      const metricCount = metricAccordion.shadowRoot
        .querySelector(ACCORDION_SELECTOR)
        .querySelectorAll(FILTER_ITEM_SELECTOR).length;

      expect(contextCount).to.equal(5);

      // There's an extra radio filter list item added by the group to allow for No filter selection
      expect(metricCount).to.equal(6);
    });

    it(`should correctly provide a message to accordions about max limit of filters reached (${FilterPanel.ACTIVE_FILTERS_LIMIT})`, async () => {
      const maxFilters = Array.from(Array(FilterPanel.ACTIVE_FILTERS_LIMIT).keys()).map((itm) =>
        _makeFilter(itm, itm % 2 === 0 ? 'context' : 'metric', true),
      );

      container = await renderContainer({ categories, filters: maxFilters });

      await nextTick();

      const errorString = `"You have reached the limit of applied filters (${FilterPanel.ACTIVE_FILTERS_LIMIT})."`;
      const errorCount = container.shadowRoot.querySelectorAll(`[error*=${errorString}]`).length;

      expect(errorCount).to.equal(2);
    });

    it('should filter lists based on search term', async () => {
      const filters = [
        ...['1', '2', '3', '4', '10'].map((itm, idx) =>
          _makeFilter(itm, 'context', idx % 2 === 0, { searchPattern: itm, operation: 'eq' }),
        ),
        ...['5', '6', '7', '8', '11'].map((itm, idx) =>
          _makeFilter(itm, 'metric', idx % 2 === 1, { to: itm, from: itm, operation: 'eq' }),
        ),
      ];

      container = await renderContainer({ categories, filters, match: '1' });

      const [contextAccordion, metricAccordion] =
        container.shadowRoot.querySelector('section').children;

      const contextCount = contextAccordion.shadowRoot
        .querySelector(ACCORDION_SELECTOR)
        .querySelectorAll(FILTER_ITEM_SELECTOR).length;

      const metricCount = metricAccordion.shadowRoot
        .querySelector(ACCORDION_SELECTOR)
        .querySelectorAll(FILTER_ITEM_SELECTOR).length;

      // two filter should match - 1 and 10
      expect(contextCount).to.equal(2);

      /**
       * Only the no applied filters option and an entry for 11 should be present
       * There's an extra radio filter list item added by the group to allow for No filter selection
       * */
      expect(metricCount).to.equal(2);
    });
  });
});
