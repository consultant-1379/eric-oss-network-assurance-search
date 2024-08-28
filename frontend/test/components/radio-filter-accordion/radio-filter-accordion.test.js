import { expect, fixture, html } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import RadioFilterAccordion from '../../../src/components/radio-filter-accordion/radio-filter-accordion.js';
import { isRendered } from '../../utils/isRendered';

const NO_FILTERS_SELECTOR = '#no-filters-applied';

const props = {
  title: 'My Filters',
  type: 'test',
  filters: [
    { label: '1', type: 'test', value: '1', selected: false },
    { label: '2', type: 'test', value: '2', selected: false },
  ],
};

const renderContainer = async ({
  title,
  type,
  open,
  match,
  error,
  help,
  line,
  filters,
  fields,
  handleEvent,
  disclosureForAttribute,
}) => {
  const radioFilterAccordionTemplate = html`
    <e-radio-filter-accordion
      title=${ifDefined(title)}
      ?open=${ifDefined(open)}
      .match=${ifDefined(match)}
      error=${ifDefined(error)}
      .help=${ifDefined(help)}
      ?line=${ifDefined(line)}
      .filters=${ifDefined(filters)}
      .fields=${ifDefined(fields)}
      .type=${ifDefined(type)}
      @update-filters=${ifDefined(handleEvent)}
      .disclosureWarning=${ifDefined(disclosureForAttribute)}
    ></e-radio-filter-accordion>
  `;
  const element = await fixture(radioFilterAccordionTemplate);
  await isRendered(element);
  return element.shadowRoot.querySelector('eui-accordion');
};

describe('RadioFilterAccordion Component Tests', () => {
  before(() => {
    RadioFilterAccordion.register();
  });

  describe('Basic component setup', () => {
    it('should render <e-radio-filter-accordion>', async () => {
      const component = await renderContainer({});
      expect(component).to.exist;
    });

    it('should have a "No Filters Applied" option', async () => {
      const component = await renderContainer(props);
      const noFiltersOption = component.querySelector(NO_FILTERS_SELECTOR);
      expect(noFiltersOption).to.exist;
    });

    it('should have "No Filters Applied" selected when no filters are selected', async () => {
      const component = await renderContainer(props);
      const noFiltersOption = component.querySelector(NO_FILTERS_SELECTOR);
      expect(noFiltersOption.getAttribute('selected')).to.exist;
    });

    it('should not have a "No Filters Applied" selected when there is a selected', async () => {
      const filters = [
        { label: '1', type: 'test', value: '1', selected: false },
        { label: '2', type: 'test', value: '2', selected: true },
      ];
      const component = await renderContainer({ ...props, filters });
      const noFiltersOption = component.querySelector('#no-filters-applied');
      expect(noFiltersOption.getAttribute('selected')).to.not.exist;
    });

    it('should have a remove all button', async () => {
      const component = await renderContainer(props);
      const removeAllBtn = component.querySelector('#remove-all');
      expect(removeAllBtn).to.exist;
    });

    it('should have a remove all button which emits the correct event when clicked', async () => {
      let eventDetails;

      const handleEvent = (event) => {
        eventDetails = event.detail;
      };

      const expected = { updateOperation: 'remove-all-of-type', data: 'test' };
      const component = await renderContainer({ ...props, handleEvent });
      const removeAllBtn = component.querySelector('#remove-all');
      removeAllBtn.click();
      expect(eventDetails).to.deep.equal(expected);
    });

    it('should build the correct radio list item type', async () => {
      const component = await renderContainer(props);
      const radiolistItems = component.querySelectorAll('e-filter-list-item');
      const radiolistItem = radiolistItems[1].shadowRoot.querySelector('eui-radio-button');
      expect(radiolistItem).to.exist;
    });

    it('Should not show disclosure warning', async () => {
      const component = await renderContainer(props);
      const disclosureMsg = component.querySelector('#disclosure-warning-message');
      expect(disclosureMsg).to.not.exist;
    });

    it('Should show disclosure warning with disclosureForAttribute', async () => {
      const component = await renderContainer({ ...props, disclosureForAttribute: 'KpiA' });
      const disclosureMsg = component.querySelector('#disclosure-warning-message');
      expect(disclosureMsg).to.exist;
    });
  });
});
