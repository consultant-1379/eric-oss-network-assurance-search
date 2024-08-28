import { expect, fixture, elementUpdated, fixtureCleanup, html } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import { isRendered } from '../../utils/isRendered';
import { nextTick } from '../../utils/utils';
import FilterDialog from '../../../src/components/filter-dialog/filter-dialog.js';

const message = 'This field is required';
const SELECTOR_TEXT_FIELD = 'eui-text-field';
const VALIDATION_MSG = {
  COLUMN: message,
  OPERATION: message,
  VALUE: message,
};
/* eslint-disable sonarjs/no-duplicate-string */
const sampleFields = [
  {
    label: 'Network Context 1',
    name: 'NSI',
    filterCategory: 'context',
    type: {
      id: 'NSI',
      description: 'Network Slice Instance',
      valueType: 'string',
    },
  },
  {
    label: 'Network Context 2',
    name: 'NSI-2',
    filterCategory: 'context',
    type: {
      id: 'NSI-2',
      description: 'Network Slice Instance',
      valueType: 'string',
    },
  },
  {
    label: 'Metrics radio',
    name: 'M2',
    filterCategory: 'metric',
    type: {
      id: 'M2',
      valueType: 'integer',
      description: 'Metrics Radio',
    },
  },
];

const renderContainer = async ({ show, edit, title, fields, filter, handleEvent }) => {
  const filterAccordionTemplate = html`
    <e-filter-dialog
      ?show=${ifDefined(show)}
      ?edit=${ifDefined(edit)}
      title=${ifDefined(title)}
      .filter=${ifDefined(filter)}
      .fields=${ifDefined(fields)}
      @close-dialog=${ifDefined(handleEvent)}
      @update-filters=${ifDefined(handleEvent)}
    ></e-filter-dialog>
  `;
  const element = await fixture(filterAccordionTemplate);
  await isRendered(element);
  return element;
};

describe('FilterDialog Component Tests', () => {
  before(() => {
    FilterDialog.register();
  });

  describe('Basic component setup', () => {
    it('should render <e-filter-dialog>', async () => {
      const component = await fixture('<e-filter-dialog></e-filter-dialog>');
      expect(component).to.exist;
      fixtureCleanup();
    });

    it('opens and closes the dialog', async () => {
      const component = await fixture('<e-filter-dialog></e-filter-dialog>');
      expect(component.show).to.be.false;

      component.show = true;
      await elementUpdated(component);

      expect(component.show).to.be.true;
      fixtureCleanup();
    });

    it('dialog title', async () => {
      const component = await fixture('<e-filter-dialog title="Test title"></e-filter-dialog>');
      expect(component.title).to.eq('Test title');

      const DialogComponent = component.shadowRoot.querySelector('eui-dialog');
      expect(DialogComponent.label).to.eq('Test title');
      fixtureCleanup();
    });
  });

  describe('render dialog filter components', () => {
    it('should render filter combobox', async () => {
      const component = await renderContainer({
        show: true,
        title: 'A title',
        fields: sampleFields,
      });

      const comboboxComponent = component.shadowRoot.querySelector('eui-combobox');
      expect(comboboxComponent).to.exist;
      fixtureCleanup();
    });

    it('should render filter operation dropdown', async () => {
      const component = await renderContainer({
        show: true,
        title: 'A title',
        fields: sampleFields,
      });

      const dropdownComponent = component.shadowRoot.querySelector('eui-dropdown');
      expect(dropdownComponent).to.exist;
      fixtureCleanup();
    });

    it('should support a escape button to close a filter dialog', async () => {
      const component = await renderContainer({
        show: true,
        title: 'A title',
        fields: sampleFields,
        filter: {
          label: '',
          name: 'NSI',
          type: {
            id: 'NSI',
            valueType: 'string',
            description: 'Network Context 1',
          },
          value: {
            from: 0,
            to: 0,
            searchPattern: undefined,
            not: false,
            operation: undefined,
          },
          filterCategory: 'context',
          selected: false,
        },
      });
      const dialogComponent = component.shadowRoot.querySelector('eui-dialog');
      const escapeBtn = new KeyboardEvent('keydown', {
        key: 'Escape',
        code: 'Escape',
        keyCode: 27,
        which: 27,
        bubbles: true,
      });
      component.dispatchEvent(escapeBtn);
      await elementUpdated(component);
      expect(dialogComponent.show).to.be.false;
    });

    it('should render value textfield', async () => {
      const component = await renderContainer({
        show: true,
        title: 'A title',
        fields: sampleFields,
        filter: {
          label: '',
          name: 'NSI',
          type: {
            id: 'NSI',
            valueType: 'string',
            description: 'Network Context 1',
          },
          value: {
            from: 0,
            to: 0,
            searchPattern: undefined,
            not: false,
            operation: undefined,
          },
          filterCategory: 'context',
          selected: false,
        },
      });
      const dropdown = component.shadowRoot.querySelector('eui-dropdown');
      dropdown.shadowRoot.querySelector('eui-menu-item').click();

      await nextTick();

      const textboxComponent = component.shadowRoot.querySelector(SELECTOR_TEXT_FIELD);
      expect(textboxComponent).to.exist;
      fixtureCleanup();
    });
  });

  describe('filter validation and event', async () => {
    it('should validate operation to be specified', async () => {
      const component = await renderContainer({
        show: true,
        title: 'A title',
        fields: sampleFields,
        filter: {
          label: '',
          name: 'NSI',
          type: {
            id: 'NSI',
            valueType: 'string',
            description: 'Network Context 1',
          },
          value: {
            from: 0,
            to: 0,
            searchPattern: undefined,
            not: false,
            operation: undefined,
          },
          filterCategory: 'context',
          selected: false,
        },
      });
      const apply = component.shadowRoot.querySelector('eui-button');
      apply.click();
      await nextTick();
      const validationForOp = component.shadowRoot.querySelector('#operation-validation>span');
      expect(validationForOp.textContent).to.eq(VALIDATION_MSG.OPERATION);
      fixtureCleanup();
    });

    it('should validate column properly when no column selected', async () => {
      const component = await renderContainer({
        show: true,
        title: 'A title',
        fields: sampleFields,
      });
      const apply = component.shadowRoot.querySelector('eui-button');
      apply.click();
      await nextTick();
      const validationForCol = component.shadowRoot.querySelector('#column-validation>span');
      expect(validationForCol.textContent).to.eq(VALIDATION_MSG.COLUMN);
      fixtureCleanup();
    });

    it('should validate value correctly when no value is specified', async () => {
      const component = await renderContainer({
        show: true,
        title: 'A title',
        fields: sampleFields,
      });
      const fields = component.shadowRoot.querySelector('eui-combobox');
      fields.shadowRoot.querySelector('eui-menu-item').click();
      await nextTick();

      const operation = component.shadowRoot.querySelector('eui-dropdown');
      operation.shadowRoot.querySelector('eui-menu-item').click();
      await nextTick();

      const apply = component.shadowRoot.querySelector('eui-button');
      apply.click();

      await nextTick();

      const validationForTxt = component.shadowRoot.querySelector(SELECTOR_TEXT_FIELD);
      expect(validationForTxt.customValidation).to.eq(VALIDATION_MSG.VALUE);
      fixtureCleanup();
    });

    it('should emit the correct event when clicked on apply button', async () => {
      const filter = {
        id: '123',
        filterCategory: 'context',
        name: 'NSI',
        selected: true,
        type: {
          description: 'Network Slice Instance',
          id: 'NSI',
          valueType: 'string',
        },
        value: {
          from: 0,
          not: false,
          operation: 'eq',
          searchPattern: 'Slice A',
          to: 0,
        },
      };

      let eventDetails;
      const handleEvent = (event) => {
        eventDetails = event;
      };

      const component = await renderContainer({
        show: true,
        title: 'A title',
        fields: sampleFields,
        filter,
        handleEvent,
      });

      const expected = {
        data: {
          id: '123',
          filterCategory: 'context',
          name: 'NSI',
          selected: true,
          type: {
            description: 'Network Slice Instance',
            id: 'NSI',
            valueType: 'string',
          },
          value: {
            from: 0,
            not: false,
            operation: 'eq',
            searchPattern: 'Slice A',
            to: 0,
          },
        },
        updateOperation: 'add-filter',
      };

      const fields = component.shadowRoot.querySelector('eui-combobox');
      fields.shadowRoot.querySelector('eui-menu-item').click();
      await nextTick();

      const dropdown = component.shadowRoot.querySelector('eui-dropdown');
      dropdown.shadowRoot.querySelector('eui-menu-item').click();
      await nextTick();

      component.filter.value.searchPattern = 'Slice A';

      const apply = component.shadowRoot.querySelector('eui-button');
      apply.click();

      expect(eventDetails.type).to.deep.equal('update-filters');
      expect(eventDetails.detail).to.deep.equal(expected);
    });

    it('should show the disclosure warning message', async () => {
      const component = await renderContainer({
        show: true,
        title: 'A title',
        fields: sampleFields,
      });
      const fields = component.shadowRoot.querySelector('eui-combobox');
      fields.shadowRoot.querySelector('eui-menu-item').click();
      await nextTick();

      const operation = component.shadowRoot.querySelector('eui-dropdown');
      operation.shadowRoot.querySelector('eui-menu-item').click();
      await nextTick();

      const apply = component.shadowRoot.querySelector('eui-button');
      apply.click();

      await nextTick();

      const iconComponent = component.shadowRoot.querySelector('eui-icon');
      expect(iconComponent).to.exist;
      fixtureCleanup();
    });

    it('should fail validation when a string is input for a number operation', async () => {
      const filter = {
        id: 'M2',
        filterCategory: 'metrics',
        name: 'Metrics Radio',
        selected: true,
        type: {
          id: 'M2',
          valueType: 'integer',
          description: 'Metrics Radio',
        },
        value: {
          from: '0.0asdf',
          not: false,
          operation: 'eq',
          searchPattern: undefined,
          to: '0.0asdf',
        },
      };

      const component = await renderContainer({
        show: true,
        title: 'A title',
        fields: sampleFields,
        filter,
      });

      const apply = component.shadowRoot.querySelector('eui-button');
      apply.click();

      await nextTick();

      const validationForTxt = component.shadowRoot.querySelector(SELECTOR_TEXT_FIELD);
      expect(validationForTxt.customValidation).to.equal('please enter valid number');
    });

    it('should pass validation when a integer is given for a number operation', async () => {
      const filter = {
        id: 'M2',
        filterCategory: 'metrics',
        name: 'Metrics Radio',
        selected: true,
        type: {
          id: 'M2',
          valueType: 'integer',
          description: 'Metrics Radio',
        },
        value: {
          from: '1',
          not: false,
          operation: 'eq',
          searchPattern: undefined,
          to: '1',
        },
      };

      const component = await renderContainer({
        show: true,
        title: 'A title',
        fields: sampleFields,
        filter,
      });

      const apply = component.shadowRoot.querySelector('eui-button');
      apply.click();

      await nextTick();

      const validationForTxt = component.shadowRoot.querySelector(SELECTOR_TEXT_FIELD);
      expect(validationForTxt.customValidation).to.equal('');
    });

    it('should pass validation when a float is given for a number operation', async () => {
      const filter = {
        id: 'M2',
        filterCategory: 'metrics',
        name: 'Metrics Radio',
        selected: true,
        type: {
          id: 'M2',
          valueType: 'float',
          description: 'Metrics Radio',
        },
        value: {
          from: '1.1',
          not: false,
          operation: 'inr',
          searchPattern: undefined,
          to: '1.4',
        },
      };

      const component = await renderContainer({
        show: true,
        title: 'A title',
        fields: sampleFields,
        filter,
      });

      const apply = component.shadowRoot.querySelector('eui-button');
      apply.click();

      await nextTick();

      const validationForTxt = component.shadowRoot.querySelector(SELECTOR_TEXT_FIELD);
      expect(validationForTxt.customValidation).to.equal('');
    });

    it('should pass if a string with a mix characters is given for a string operation', async () => {
      const filter = {
        id: '123',
        filterCategory: 'context',
        name: 'NSI',
        selected: true,
        type: {
          description: 'Network Slice Instance',
          id: 'NSI',
          valueType: 'string',
        },
        value: {
          from: 0,
          not: false,
          operation: 'eq',
          searchPattern: 'Slice A?*.#~123-_$,:/\\|@%',
          to: 0,
        },
      };

      const component = await renderContainer({
        show: true,
        title: 'A title',
        fields: sampleFields,
        filter,
      });

      const apply = component.shadowRoot.querySelector('eui-button');
      apply.click();

      await nextTick();

      const validationForTxt = component.shadowRoot.querySelector(SELECTOR_TEXT_FIELD);
      expect(validationForTxt.customValidation).to.equal('');
    });

    it('should pass if a string with only numbers is given for a string operation', async () => {
      const filter = {
        id: '123',
        filterCategory: 'context',
        name: 'NSI',
        selected: true,
        type: {
          description: 'Network Slice Instance',
          id: 'NSI',
          valueType: 'string',
        },
        value: {
          from: 0,
          not: false,
          operation: 'eq',
          searchPattern: '12.33',
          to: 0,
        },
      };

      const component = await renderContainer({
        show: true,
        title: 'A title',
        fields: sampleFields,
        filter,
      });

      const apply = component.shadowRoot.querySelector('eui-button');
      apply.click();

      await nextTick();

      const validationForTxt = component.shadowRoot.querySelector(SELECTOR_TEXT_FIELD);
      expect(validationForTxt.customValidation).to.equal('');
    });

    it('should only accept properly formatted floats: more than one decimal is invalid', async () => {
      const filter = {
        id: 'M2',
        filterCategory: 'metrics',
        name: 'Metrics Radio',
        selected: true,
        type: {
          id: 'M2',
          valueType: 'float',
          description: 'Metrics Radio',
        },
        value: {
          from: '1.1.1',
          not: false,
          operation: 'inr',
          searchPattern: undefined,
          to: '1.4.3',
        },
      };

      const component = await renderContainer({
        show: true,
        title: 'A title',
        fields: sampleFields,
        filter,
      });

      const apply = component.shadowRoot.querySelector('eui-button');
      apply.click();

      await nextTick();

      const validationForTxt = component.shadowRoot.querySelector(SELECTOR_TEXT_FIELD);
      expect(validationForTxt.customValidation).to.equal('please enter valid number');
    });
  });
});
