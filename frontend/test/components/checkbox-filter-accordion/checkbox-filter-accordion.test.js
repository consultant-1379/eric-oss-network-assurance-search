import { expect, fixture, html } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import CheckboxFilterAccordion from '../../../src/components/checkbox-filter-accordion/checkbox-filter-accordion.js';
import { isRendered } from '../../utils/isRendered';

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
}) => {
  const checkboxFilterAccordionTemplate = html`
    <e-checkbox-filter-accordion
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
    ></e-checkbox-filter-accordion>
  `;

  const element = await fixture(checkboxFilterAccordionTemplate);
  await isRendered(element);
  return element.shadowRoot.querySelector('eui-accordion');
};

describe('CheckboxFilterAccordion Component Tests', () => {
  before(() => {
    CheckboxFilterAccordion.register();
  });

  describe('Basic component setup', () => {
    it('should render <e-checkbox-filter-accordion>', async () => {
      const component = await renderContainer({});
      expect(component).to.exist;
    });

    it('should have a select all button', async () => {
      const component = await renderContainer(props);
      const selectAllBtn = component.querySelector('#select-all');
      expect(selectAllBtn).to.exist;
    });

    it('should have a select all button which emits the correct event when clicked', async () => {
      let eventDetails;

      const handleEvent = (event) => {
        eventDetails = event.detail;
      };

      const expected = { updateOperation: 'select-all-of-type', data: 'test' };
      const component = await renderContainer({ ...props, handleEvent });
      const selectAllBtn = component.querySelector('#select-all');
      selectAllBtn.click();
      expect(eventDetails).to.deep.equal(expected);
    });

    it('should have a select none button', async () => {
      const component = await renderContainer(props);
      const selectNoneBtn = component.querySelector('#select-none');
      expect(selectNoneBtn).to.exist;
    });

    it('should have a select none button which emits the correct event when clicked', async () => {
      let eventDetails;

      const handleEvent = (event) => {
        eventDetails = event.detail;
      };

      const expected = { updateOperation: 'clear-all-of-type', data: 'test' };
      const component = await renderContainer({ ...props, handleEvent });
      const selectNoneBtn = component.querySelector('#select-none');
      selectNoneBtn.click();
      expect(eventDetails).to.deep.equal(expected);
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

    it('should build the correct checkbox list item type', async () => {
      const component = await renderContainer(props);
      const checklistItems = component.querySelectorAll('e-filter-list-item');
      const checklistItem = checklistItems[0].shadowRoot.querySelector('eui-checkbox');
      expect(checklistItem).to.exist;
    });
  });
});
