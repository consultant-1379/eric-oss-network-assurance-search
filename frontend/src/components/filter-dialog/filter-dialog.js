/**
 * Component FilterDialog is defined as
 * `<e-filter-dialog>`
 *
 * @extends {LitComponent}
 */
import { LitComponent, html, definition, nothing } from '@eui/lit-component';
import { Button, TextField, Dropdown, Checkbox, Dialog, ComboBox, Accordion } from '@eui/base';
import { Icon } from '@eui/theme';
import style from './filter-dialog.css';
import { uuid } from '../../utils/helper.js';
import CONSTANTS from '../../utils/constants.js';

const { EQUAL, LESS_THAN_EQUAL, GREATER_THAN_EQUAL, NOT_EQUAL, IN_RANGE, NOT_IN_RANGE } =
  CONSTANTS.OPERATIONS;

const EQUALITY_OPERATIONS = [EQUAL, NOT_EQUAL];
const RANGE_OPERATIONS = [IN_RANGE, NOT_IN_RANGE];
const DEFAULT_VALUE = {
  from: 0,
  to: 0,
  searchPattern: undefined,
  not: false,
  operation: undefined,
};

export default class FilterDialog extends LitComponent {
  get meta() {
    return import.meta;
  }

  static get components() {
    return {
      'eui-button': Button,
      'eui-dialog': Dialog,
      'eui-text-field': TextField,
      'eui-checkbox': Checkbox,
      'eui-dropdown': Dropdown,
      'eui-icon': Icon,
      'eui-combobox': ComboBox,
      'eui-accordion': Accordion,
    };
  }

  // Reset the filter dialog
  reset = () => {
    this.filter = {
      name: '',
      type: '',
      fieldType: {},
      value: DEFAULT_VALUE,
      filterCategory: '',
      selected: false,
    };
    this._valueErrorMessage = '';
    this._operationErrorMessage = '';
    this._columnErrorMessage = '';
  };

  // Operations to perform when the dialog is dismissed with a canel operation
  _dialogCancel = () => {
    this.show = false;
    this.reset();
    this.bubble('cancel-dialog');
  };

  _validateNumberFilter = ({ operation, to, from, type }) => {
    const { valueType } = type;
    let toVal;
    let fromVal;
    const numberPattern = /^[+-]?([0-9]+([.][0-9]*)?|[.][0-9]+)$/;
    const toTest = numberPattern.test(to);
    const fromTest = numberPattern.test(from);

    switch (valueType) {
      case 'integer':
        toVal = Number.parseInt(to, 10);
        fromVal = Number.parseInt(from, 10);
        break;

      case 'float':
        toVal = Number.parseFloat(to);
        fromVal = Number.parseFloat(from);
        break;

      default:
        console.warn('Value type for column to filter is not recognized');
    }

    if (Number.isNaN(toVal) || Number.isNaN(fromVal) || !toTest || !fromTest) {
      this._valueErrorMessage = this.i18n?.ERROR_MESSAGE_VALUE_NUMBER;
      return false;
    }

    if (
      (EQUALITY_OPERATIONS.includes(operation) &&
        valueType !== 'string' &&
        to === undefined &&
        from === undefined) ||
      (operation === GREATER_THAN_EQUAL && from === undefined) ||
      (operation === LESS_THAN_EQUAL && to === undefined)
    ) {
      this._valueErrorMessage = this.i18n?.ERROR_MESSAGE_VALUE_NUMBER;
      return false;
    }

    if (RANGE_OPERATIONS.includes(operation) && (toVal === fromVal || toVal < fromVal)) {
      this._valueErrorMessage = this.i18n?.ERROR_MESSAGE_VALUE;
      return false;
    }

    return true;
  };

  _validateFilter = () => {
    const { value, type } = this.filter;
    const { valueType, id } = type;
    const { searchPattern, operation } = value;

    let validation = true;
    if (!id) {
      this._columnErrorMessage = this.i18n?.ERROR_MESSAGE_COLUMN;
      validation = false;
    }
    if (!operation) {
      this._operationErrorMessage = this.i18n?.ERROR_MESSAGE_OPERATION;
      validation = false;
    }
    if (EQUALITY_OPERATIONS.includes(operation) && valueType === 'string' && !searchPattern) {
      this._valueErrorMessage = this.i18n?.ERROR_MESSAGE_VALUE_STRING;
      validation = false;
    }

    if (valueType !== 'string' && validation) {
      validation = this._validateNumberFilter({ ...value, type });
    }

    return validation;
  };

  // Validate and emit the filter to be applied and added
  _applyFilter = () => {
    const { type, filterCategory } = this.filter;
    const { id } = type;
    if (this._validateFilter()) {
      const filterId = this.filter.id || uuid();
      this.filter = {
        ...this.filter,
        id: filterId,
        name: id,
        filterCategory,
        type,
        selected: true,
      };

      const updateOptions = {
        updateOperation: this.edit ? 'edit-filter' : 'add-filter',
        data: this.edit ? { changeItem: this.filter.id, updatedFilter: this.filter } : this.filter,
      };

      this.bubble('update-filters', updateOptions);
      this.reset();
      this.show = false;
    }
  };

  // Change the column/ field for which the filter should be applied
  _changeFieldSelection = (event) => {
    const selectedValue =
      event.target.data.filter((f) => f.checked).length === 0
        ? ''
        : event.detail.menuItems[0].value;

    const { type, filterCategory } = this.fields.filter((r) => r.label === selectedValue)[0];

    if (!selectedValue) {
      this.filter = { ...this.filter, value: DEFAULT_VALUE, name: '', type: {} };
    }
    this.filter = {
      ...this.filter,
      type,
      filterCategory,
      name: selectedValue,
    };
    this._columnErrorMessage = '';
  };

  // Change the operation which should be performed for the column/ field
  _changeOperation = (event) => {
    const operation = event.detail.menuItems[0].value;
    const notOperations = [NOT_EQUAL, NOT_IN_RANGE];
    this.filter = {
      ...this.filter,
      value: {
        ...this.filter.value,
        not: notOperations.includes(operation),
        operation,
      },
    };
    this._operationErrorMessage = '';
  };

  // Update the value for the filter based on changes in the value fields
  _updateValue = ({ target, detail }) => {
    const valueAttribute = target.getAttribute('data-value-key');
    const { value } = detail;
    if (valueAttribute === 'eq') {
      this.filter.value.to = value;
      this.filter.value.from = value;
    } else {
      this.filter.value[valueAttribute] = value;
    }
    this._valueErrorMessage = '';
  };

  _makeNumberField = ({ id, value, dataKey }) =>
    html`
      <eui-text-field
        id=${id}
        .value=${value}
        data-value-key=${dataKey}
        @change="${this._updateValue}"
        custom-validation="${this._valueErrorMessage}"
      ></eui-text-field>
    `;

  // Render the correct value elements for the operation selection
  _renderValue = () => {
    const { operation } = this.filter.value;
    const textField = html`
      <eui-text-field
        data-value-key="searchPattern"
        .value=${this.filter.value.searchPattern}
        @change="${this._updateValue}"
        fullwidth
        custom-validation="${this._valueErrorMessage}"
      ></eui-text-field>
    `;

    const numberField = html`
      ${RANGE_OPERATIONS.includes(operation) || operation === GREATER_THAN_EQUAL
        ? this._makeNumberField({
            id: 'from-field',
            dataKey: 'from',
            value: this.filter.value.from,
          })
        : nothing}
      ${operation === IN_RANGE || operation === NOT_IN_RANGE ? '-' : nothing}
      ${RANGE_OPERATIONS.includes(operation) || operation === LESS_THAN_EQUAL
        ? this._makeNumberField({
            id: 'to-field',
            dataKey: 'to',
            value: this.filter.value.to,
          })
        : nothing}
      ${EQUALITY_OPERATIONS.includes(operation)
        ? this._makeNumberField({
            id: 'eq-field',
            dataKey: 'eq',
            value: this.filter.value.to,
          })
        : nothing}
    `;

    return html`
      <div class="value-field">
        <label>${this.i18n?.LABEL_VALUE}</label>
        <br />
        ${this.filter.type?.valueType === 'string' ? textField : numberField}
      </div>
    `;
  };

  // Create the operation list of supported operation options for the operations dropdown
  _constructOperationsList = () => {
    const { operation } = this.filter.value;
    const stringOperations = [
      {
        label: this.i18n?.OPERATOR_LABEL_MATCH,
        value: EQUAL,
        checked: operation === EQUAL,
      },
      {
        label: this.i18n?.OPERATOR_LABEL_DOESNT_MATCH,
        value: NOT_EQUAL,
        checked: operation === NOT_EQUAL,
      },
    ];

    const floatOperations = [
      {
        label: this.i18n?.OPERATOR_LABEL_GREATER_THEN_EQUAL,
        value: GREATER_THAN_EQUAL,
        checked: operation === GREATER_THAN_EQUAL,
      },
      {
        label: this.i18n?.OPERATOR_LABEL_LESS_THAN_EQUAL,
        value: LESS_THAN_EQUAL,
        checked: operation === LESS_THAN_EQUAL,
      },
      {
        label: this.i18n?.OPERATOR_LABEL_NOT_RANGE,
        value: NOT_IN_RANGE,
        checked: operation === NOT_IN_RANGE,
      },
      {
        label: this.i18n?.OPERATOR_LABEL_RANGE,
        value: IN_RANGE,
        checked: operation === IN_RANGE,
      },
    ];

    const numberOperations = [...stringOperations, ...floatOperations];

    if (this.filter.type?.valueType === 'string') {
      return stringOperations;
    }

    if (this.filter.type?.valueType === 'float') {
      return floatOperations;
    }

    return numberOperations;
  };

  helpAccordion = () => html`
    <eui-accordion class="help" category-title=${this.i18n?.HELP_LABEL}>
      <eui-icon name="info" slot="left"></eui-icon>
      <div>
        <h4>${this.i18n?.HELP_W_STRINGS_LABEL}</h4>
        <div>${this.i18n?.HELP_W_STRINGS}</div>
      </div>
      <div>
        <h4>${this.i18n?.HELP_W_NUMBERS_LABEL}</h4>
        <div>${this.i18n?.HELP_W_NUMBERS}</div>
      </div>
    </eui-accordion>
  `;

  /**
   * Function to show disclosure warning message on the dialog
   * @returns {HTMLElement}
   */
  showWarningMessage = () => html`
    <div class="disclosure-warning-message">
      <eui-icon name="triangle-warning" class="icon-warning-message"></eui-icon>
      <span class="disclosure-text">
        ${this.i18n?.FILTER_WARNING_MESSAGE.replace('#filterName', this.disclosureMessage)}
      </span>
    </div>
  `;

  /**
   *
   * Render the <e-measurement-filter> component. This function is called each time a
   * prop changes.
   */
  render() {
    const { operation } = this.filter.value;
    const fieldOptions = this.fields.map((field) => ({
      ...field,
      checked: this.filter.name === field.name,
    }));
    const container = html`
      <div id="border">
        <p>${this.i18n?.MEASUREMENT_DIALOG_SUBTITLE}</p>
        ${this.helpAccordion()}
        <div class="field">
          <label>${this.i18n?.LABEL_COLUMN}</label>
          <eui-combobox
            class="fieldsBox"
            aria-label="${this.i18n?.ARIA_SELECT_FIELD_BOX}"
            placeholder=${this.i18n?.FILTER_COLUMN_BOX_PLACEHOLDER}
            ?disabled=${this.error}
            .data=${fieldOptions}
            width="100%"
            @eui-combobox:click=${this._changeFieldSelection}
          ></eui-combobox>
          ${this.disclosureMessage ? this.showWarningMessage(this.filter.type) : nothing}
          ${this._columnErrorMessage === ''
            ? nothing
            : html`
                <div id="column-validation" class="input__validation">
                  <eui-icon class="icon-triangle-warning" name="triangle-warning"></eui-icon>
                  <span class="input__validation-message">${this._columnErrorMessage}</span>
                </div>
              `}
        </div>
        <div class="field">
          <label>${this.i18n?.LABEL_OPERATION}</label>
          <eui-dropdown
            data-type="single"
            .data=${this._constructOperationsList()}
            label=${this.i18n?.OPERATION_DROPDOWN_LABEL || 'Select Operation'}
            ?disabled=${!Object.keys(this.filter.type).length}
            width="100%"
            @eui-dropdown:change=${this._changeOperation}
          ></eui-dropdown>
          ${this._operationErrorMessage === ''
            ? nothing
            : html`
                <div id="operation-validation" class="input__validation">
                  <eui-icon class="icon-triangle-warning" name="triangle-warning"></eui-icon>
                  <span class="input__validation-message">${this._operationErrorMessage}</span>
                </div>
              `}
        </div>
        ${operation ? this._renderValue() : nothing}
      </div>
    `;
    return html`
      <eui-dialog
        style="--space-large:16px"
        ?show=${this.show}
        label=${this.title}
        @keydown=${(ev) => {
          if (ev.code === 'Escape') {
            this._dialogCancel();
          }
        }}
        @eui-dialog:cancel=${this._dialogCancel}
      >
        <div slot="content">${container}</div>
        <eui-button slot="bottom" @click=${this._applyFilter} primary>
          ${this.i18n?.APPLY_BUTTON}
        </eui-button>
      </eui-dialog>
    `;
  }
}

/**
 * @property {Boolean} show - open/close dialog state.
 * @property {String} title - set Dialog title
 * @property {Array} fields - list of fields you can filter on
 * @property {Object} filter- dialog details object
 */
definition('e-filter-dialog', {
  style,
  props: {
    show: { attribute: true, type: Boolean, default: false },
    fields: { attribute: false, type: Array, default: [] },
    edit: { attribute: true, type: Boolean },
    filter: {
      attribute: false,
      type: Object,
      default: {
        name: '',
        type: {},
        value: DEFAULT_VALUE,
        filterCategory: '',
        selected: false,
      },
    },
    disclosureMessage: { attribute: false, type: String },
    title: { attribute: true, type: String, default: 'Filter' },
    _valueErrorMessage: { attribute: false, type: String, default: '' },
    _columnErrorMessage: { attribute: false, type: String, default: '' },
    _operationErrorMessage: { attribute: false, type: String, default: '' },
  },
})(FilterDialog);
