/**
 * Component FilterAccordion is defined as
 * `<e-filter-accordion>`
 *
 * @extends {LitComponent}
 */
import { LitComponent, html, definition, nothing } from '@eui/lit-component';
import { Accordion, Button, ComboBox, InfoPopup, Tooltip } from '@eui/base';
import { Icon } from '@eui/theme';
import style from './filter-accordion.css';
import CONSTANTS from '../../utils/constants.js';

const { EQUAL, LESS_THAN_EQUAL, GREATER_THAN_EQUAL, NOT_EQUAL, IN_RANGE, NOT_IN_RANGE } =
  CONSTANTS.OPERATIONS;

export default class FilterAccordion extends LitComponent {
  get meta() {
    return import.meta;
  }

  static get components() {
    return {
      'eui-accordion': Accordion,
      'eui-button': Button,
      'eui-combobox': ComboBox,
      'eui-info-popup': InfoPopup,
      'eui-tooltip': Tooltip,
      'eui-icon': Icon,
    };
  }

  // Create the user facing label to be displayed for the filter
  createLabel = (filter) => {
    let label = '';
    const { to, from, searchPattern, not, operation } = filter.value;
    const { id, name } = filter.type;
    const fieldName = name || id;

    if (searchPattern) {
      label = `${
        not ? this.i18n?.OPERATOR_LABEL_DOESNT_MATCH : ''
      } ${searchPattern} (${fieldName})`;
    } else if (operation === EQUAL) {
      label = `${fieldName} ${this.i18n?.OPERATOR_LABEL_EQUAL} ${to}`;
    } else if (operation === NOT_EQUAL) {
      label = `${fieldName} ${this.i18n?.OPERATOR_LABEL_NOT_EQUAL} ${to}`;
    } else if (operation === LESS_THAN_EQUAL) {
      label = `${fieldName} ${this.i18n?.OPERATOR_LABEL_LESS_THAN_EQUAL} ${to}`;
    } else if (operation === GREATER_THAN_EQUAL) {
      label = `${fieldName} ${this.i18n?.OPERATOR_LABEL_GREATER_THEN_EQUAL} ${from}`;
    } else if (operation === IN_RANGE) {
      label = `${fieldName} ${this.i18n?.OPERATOR_LABEL_IN_RANGE} ${from} - ${to}`;
    } else if (operation === NOT_IN_RANGE) {
      label = `${fieldName} ${this.i18n?.OPERATOR_LABEL_NOT_IN_RANGE} ${from} - ${to}`;
    } else {
      label = `${this.i18n?.OPERATOR_LABEL_UNKNOWN}`;
      console.warn(`The format of the value for the filter wasn't recognized: ${filter}`);
    }

    return label;
  };

  // Event dispatch to open the edit dialog for the provided field and accordion type
  _addFilter = () => {
    this.bubble('open-edit', { selectedField: this.selectedField, type: this.type });
    this.selectedField = '';
  };

  // Error banner
  _errorBanner = () =>
    html`
      <div class="error-banner" id="error-banner">
        <eui-icon name="triangle-warning"></eui-icon>
        ${this.error}
      </div>
    `;

  // No filters banner
  _noFiltersBanner = () =>
    html`
      <div class="banner" id="no-filters-banner">
        <div>${this.i18n?.NO_FILTERS_CREATED}</div>
        <div>${this.i18n?.NO_FILTERS_SUGGESTION}</div>
      </div>
    `;

  // Hidden filters banner
  _hiddenFiltersBanner = (hiddenCount) =>
    html`
      <div class="banner" id="hidden-filters-banner">
        <div>
          ${hiddenCount} ${hiddenCount > 1 ? this.i18n?.HIDDEN_FILTERS : this.i18n?.HIDDEN_FILTER}
        </div>
        <div>${this.i18n?.HIDDEN_FILTERS_SUGGESTION}</div>
      </div>
    `;

  // No matching filters banner
  _noMatchingFiltersBanner = () =>
    html`
      <div class="banner" id="no-matching-filters-banner">
        <div>${this.i18n?.NO_MATCHING_FILTERS}</div>
        <div>${this.i18n?.NO_FILTERS_SUGGESTION}</div>
      </div>
    `;

  // Function which is used to determine filters which have a substring that matches 'match' in the label
  _matchFilters = () =>
    this.filters.filter((filter) => this.createLabel(filter).includes(this.match));

  // Builds the matches banners: Used for indicating how many filters are hidden/ matches made when a match is set
  _matchFiltersBanner = () => {
    const matches = this._matchFilters();
    if (matches.length) {
      const filtersDiff = this.filters.length - matches.length;
      return filtersDiff ? this._hiddenFiltersBanner(filtersDiff) : nothing;
    }
    return this._noMatchingFiltersBanner();
  };

  // overridable function to build the control bar
  filterListControlBar = () => {
    console.warn('Filter list must be implemented by extending classes.');
    return nothing;
  };

  // overridable function to build a list item
  listItem = () => {
    console.warn('Filter list must be implemented by extending classes.');
    return nothing;
  };

  // overridable function to build optional elements in place
  optionalSlot = () => nothing;

  _buildFilters = () => this._matchFilters().map((filter) => this.listItem(filter));

  // Builds all elements of the filter list: control bar, optional slot, and fitler items
  _filterList = () =>
    html`
      ${this.filterListControlBar()}
      <div class="filter-list">${this.optionalSlot()} ${this._buildFilters()}</div>
    `;

  // Function which returns the field list and the matches banners (some or no matching filters banner)
  _renderFilterList = () =>
    html`
      <div class="filters">
        ${this._filterList()} ${this.match ? this._matchFiltersBanner() : nothing}
      </div>
    `;

  /**
   * Event handler to change the field that is provided to the add dialog when the add button is clicked.
   * The field is used to indicate to the edit dialog which column we are making a filter for. It is optional.
   */
  _changeFieldSelection = (event) => {
    this.selectedField =
      event.target.data.filter((f) => f.checked).length === 0
        ? ''
        : event.detail.menuItems[0].value;
  };

  /**
   * Render the <e-filter-accordion> component. This function is called each time a
   * prop changes.
   */
  render() {
    const title = `${this.title} (${this.filters.length}) - ${
      this.filters.filter((filter) => filter.selected).length
    } ${this.i18n?.SELECTED_LABEL}`;
    const ariaTitle = `${this.i18n?.ARIA_FILTERS_FOR} ${title}`;
    const fields = this.fields.map(({ label, name }) => ({
      label,
      value: name,
      checked: this.selectedField === name,
    }));
    return html`
      <eui-accordion
        category-title=${title}
        ?open=${this.open}
        ?line=${this.line}
        aria-label=${ariaTitle}
      >
        <eui-info-popup position="bottom-start" slot="left">
          <div id="help_content">${this.help}</div>
        </eui-info-popup>
        ${this.error ? this._errorBanner() : nothing}
        <eui-tooltip .message=${this.error || this.i18n?.ADD_FILTER_TOOLTIP}>
          <eui-combobox
            class="fieldsBox"
            aria-label="${this.i18n?.ARIA_SELECT_FIELD_BOX}"
            placeholder=${this.i18n?.FILTER_COLUMN_BOX_PLACEHOLDER}
            ?disabled=${this.error}
            .data=${fields}
            width="170px"
            @eui-combobox:change=${this._changeFieldSelection}
          ></eui-combobox>
        </eui-tooltip>
        <eui-tooltip .message=${this.error || this.i18n?.ADD_FILTER_TOOLTIP}>
          <eui-button
            class="fieldsBox"
            id="add-filter"
            aria-label=${this.i18n?.ARIA_ADD_FILTER}
            secondary
            ?disabled=${this.error}
            icon="plus"
            @click=${this._addFilter}
          >
            ${this.i18n?.ADD_BUTTON_LABEL}
          </eui-button>
        </eui-tooltip>
        ${this.filters.length > 0 ? this._renderFilterList() : this._noFiltersBanner()}
      </eui-accordion>
    `;
  }
}

/**
 * @property {String} title - Title of Filter Accordion Group
 * @property {Boolean} open - Whether the accordion is open by default
 * @property {String} match - Substring to match in filter items
 * @property {String} error - Message for error
 * @property {String} help - Help content for help tooltip
 * @property {String} type - The type of filters (used by add filter event)
 * @property {Array} field - List of fields a new filter can be made for
 * @property {Boolean} line - Whether to line the accordion borders
 * @property {Array} filters - The list of filters to render
 */
definition('e-filter-accordion', {
  style,
  props: {
    title: { attribute: true, type: String, default: 'Filters' },
    open: { attribute: true, type: Boolean, default: true },
    match: { attribute: false, type: String, default: '' },
    error: { attribute: true, type: String },
    help: { attribute: false, type: String, default: '' },
    line: { attribute: true, type: Boolean, default: false },
    filters: { attribute: false, type: Array, default: [] },
    type: { attribute: false, type: String },
    selectedField: { attribute: false, type: String },
    fields: {
      attribute: false,
      type: Array,
      default: [],
    },
  },
})(FilterAccordion);
