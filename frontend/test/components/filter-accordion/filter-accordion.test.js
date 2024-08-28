import { expect, fixture, html } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import FilterAccordion from '../../../src/components/filter-accordion/filter-accordion.js';
import { isRendered } from '../../utils/isRendered';

const ADD_FILTER_SELECTOR = '#add-filter';

let editEvent;

const DEFAULT_CONTEXT_FILTER = {
  searchPattern: 'Context A',
  not: true,
  operation: 'eq',
};

const DEFAULT_METRIC_FILTER = {
  from: 0,
  to: 100,
  not: false,
  operation: 'eq',
};

const handleEditEvent = (event) => {
  editEvent = event?.detail;
};

const renderContainer = async ({
  title,
  open,
  match,
  error,
  help,
  line,
  filters,
  type,
  fields,
}) => {
  const filterAccordionTemplate = html`
    <e-filter-accordion
      title=${ifDefined(title)}
      ?open=${ifDefined(open)}
      .match=${ifDefined(match)}
      error=${ifDefined(error)}
      .help=${ifDefined(help)}
      ?line=${ifDefined(line)}
      .filters=${ifDefined(filters)}
      .type=${ifDefined(type)}
      .fields=${ifDefined(fields)}
      @open-edit=${handleEditEvent}
    ></e-filter-accordion>
  `;
  const element = await fixture(filterAccordionTemplate);
  await isRendered(element);
  return element;
};

describe('FilterAccordion Component Tests', () => {
  before(() => {
    FilterAccordion.register();
  });

  const filters = [
    { id: 1, type: {}, value: DEFAULT_CONTEXT_FILTER, selected: false },
    { id: 2, type: {}, value: DEFAULT_METRIC_FILTER, selected: true },
  ];

  describe('Basic component setup', () => {
    it('should render <e-filter-accordion>', async () => {
      const component = await renderContainer({ title: 'A title' });
      expect(component).to.exist;
    });

    it('should have a no filters banner when there are no filters provided', async () => {
      const component = await renderContainer({ title: 'A title' });
      const banner = component.shadowRoot.querySelector('#no-filters-banner');

      expect(banner).to.exist;
    });

    it('should not have a no filters banner when there are filters provided', async () => {
      const component = await renderContainer({ title: 'A title', filters });
      const banner = component.shadowRoot.querySelector('#no-filters-banner');

      expect(banner).to.not.exist;
    });

    it('should have an error banner when an error is provided', async () => {
      const component = await renderContainer({
        title: 'A title',
        error: 'something has gone terribly wrong',
      });
      const banner = component.shadowRoot.querySelector('#error-banner');

      expect(banner).to.exist;
    });

    it('should not have an error banner when an error is not provided', async () => {
      const component = await renderContainer({
        title: 'A title',
      });
      const banner = component.shadowRoot.querySelector('#error-banner');

      expect(banner).to.not.exist;
    });

    it('should have a no matching filters banner when there are no matches in the filter list for a given term', async () => {
      const component = await renderContainer({
        title: 'A title',
        filters,
        match: 'nothing',
      });
      const banner = component.shadowRoot.querySelector('#no-matching-filters-banner');
      expect(banner).to.exist;
    });

    it('should not count filters when there are no matches in the filter list for a given term', async () => {
      const component = await renderContainer({
        title: 'A title',
        filters,
        match: 'nothing',
      });
      const filterItemsCount = component.shadowRoot.querySelectorAll('e-filter-list-item').length;
      expect(filterItemsCount).to.equal(0);
    });

    it('should have a hidden filters banner when there is a term provided to match and there are some matches in the filter list', async () => {
      const component = await renderContainer({
        title: 'A title',
        filters,
        match: 'Context A',
      });
      const banner = component.shadowRoot.querySelector('#hidden-filters-banner');
      expect(banner).to.exist;
    });

    it('should not have a hidden filters banner when no match is provided', async () => {
      const component = await renderContainer({
        title: 'A title',
        filters,
        match: 'nothing',
      });
      const banner = component.shadowRoot.querySelector('#hidden-filters-banner');
      expect(banner).to.not.exist;
    });

    it('should have a fields combobox with menu items provided by the fields prop', async () => {
      const fields = [
        { label: 'KPI A', value: 'kpi-a' },
        { label: 'KPI B', value: 'kpi-b' },
        { label: 'KPI C', value: 'kpi-c' },
        { label: 'KPI D', value: 'kpi-d' },
      ];
      const component = await renderContainer({
        title: 'A title',
        fields,
      });

      const fieldBoxItems = component.shadowRoot
        .querySelector('eui-combobox')
        .shadowRoot.querySelectorAll('eui-menu-item');
      expect(fieldBoxItems.length).to.equal(4);
    });

    it('should have an add button', async () => {
      const component = await renderContainer({
        title: 'A title',
      });

      const addBtn = component.shadowRoot.querySelector(ADD_FILTER_SELECTOR);
      expect(addBtn).to.exist;
    });

    it('should have an add button that emits the correct event when clicked when no field is selected', async () => {
      const componentProps = {
        title: 'A title',
        type: 'test-filter-type',
      };
      const component = await renderContainer(componentProps);

      const expected = { selectedField: null, type: componentProps.type };

      // Click add button in order to signal we want to open the edit dialog to create a new filter of type 'test-filter-type'
      const addBtn = component.shadowRoot.querySelector(ADD_FILTER_SELECTOR);
      addBtn.click();
      expect(editEvent).to.deep.equal(expected);
    });

    it('should have an add button which emits the correct event when a field is selected', async () => {
      const fields = [
        { label: 'KPI A', value: 'kpi-a' },
        { label: 'KPI B', value: 'kpi-b' },
        { label: 'KPI C', value: 'kpi-c' },
        { label: 'KPI D', value: 'kpi-d' },
      ];

      const componentProps = {
        title: 'A title',
        type: 'test-filter-type2',
        fields,
      };

      const component = await renderContainer(componentProps);

      const expected = {
        selectedField: fields[0].label,
        type: componentProps.type,
      };

      // Select the first menu item and click it
      const firstFieldBoxItem = component.shadowRoot
        .querySelector('eui-combobox')
        .shadowRoot.querySelectorAll('eui-menu-item')[0];
      firstFieldBoxItem.click();

      // Click add button in order to signal we want to open the edit dialog to create a new filter of type 'test-filter-type' for 'KPI A'
      const addBtn = component.shadowRoot.querySelector(ADD_FILTER_SELECTOR);
      addBtn.click();
      expect(editEvent).to.deep.equal(expected);
    });
  });
});
