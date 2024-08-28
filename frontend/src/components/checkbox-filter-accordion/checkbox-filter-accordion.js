/**
 * Component CheckboxFilterAccordion is defined as
 * `<e-checkbox-filter-accordion>`
 *
 * @extends {FilterAccordion}
 */
import { html, definition } from '@eui/lit-component';
import { Accordion, Button, ComboBox, InfoPopup, Tooltip } from '@eui/base';
import { Icon } from '@eui/theme';
import FilterAccordion from '../filter-accordion/filter-accordion';
import InlineButton from '../inline-button/inline-button';
import style from './checkbox-filter-accordion.css';
import BaseListItem from '../filter-list-items/filter-list-items';

const UPDATE_FILTERS = 'update-filters';

export default class CheckboxFilterAccordion extends FilterAccordion {
  get meta() {
    return import.meta;
  }

  static get components() {
    return {
      'e-inline-button': InlineButton,
      'eui-accordion': Accordion,
      'eui-button': Button,
      'eui-combobox': ComboBox,
      'eui-info-popup': InfoPopup,
      'eui-tooltip': Tooltip,
      'eui-icon': Icon,
      'e-filter-list-item': BaseListItem,
    };
  }

  // Event dispatch to select all filters in the accordion list
  _selectAll = () =>
    this.bubble(UPDATE_FILTERS, { updateOperation: 'select-all-of-type', data: this.type });

  // Event dispatch to deselect all filters in the accordion list
  _clearAll = () =>
    this.bubble(UPDATE_FILTERS, { updateOperation: 'clear-all-of-type', data: this.type });

  // Event dispatch to remove all filters in the accordion list
  _removeAll = () =>
    this.bubble(UPDATE_FILTERS, { updateOperation: 'remove-all-of-type', data: this.type });

  /** Build the filter list control bar: options for selecting all filters, deselecting all filters,
   * and removing all filters */
  filterListControlBar = () =>
    html`
      <div id="filters-controls">
        ${this.i18n?.SELECT_FILTERS_LABEL}:
        <e-inline-button
          id="select-all"
          label="${this.i18n?.SELECT_ALL_BUTTON}"
          aria-label=${this.i18n?.ARIA_SELECT_ALL_BUTTON}
          @click="${this._selectAll}"
        ></e-inline-button>
        |
        <e-inline-button
          id="select-none"
          label="${this.i18n?.SELECT_NONE_BUTTON}"
          aria-label=${this.i18n?.ARIA_SELECT_NONE_BUTTON}
          @click="${this._clearAll}"
        ></e-inline-button>
        <e-inline-button
          id="remove-all"
          label="${this.i18n?.REMOVE_ALL_BUTTON}"
          aria-label=${this.i18n?.ARIA_REMOVE_ALL_BUTTON}
          @click=${this._removeAll}
        ></e-inline-button>
      </div>
    `;

  // Build the checkbox filter list items
  listItem = (filter) => {
    const { id, selected } = filter;
    return html`
      <e-filter-list-item
        id=${id}
        .label=${this.createLabel(filter)}
        aria-label=${`${this.i18n?.ARIA_FILTER_ITEM_LABEL}`}
        .match=${this.match}
        error=${this.error}
        ?disabled=${(!this.filters.filter((f) => f.selected).length > 0 && this.error) ||
        (this.error && !selected)}
        .selectiontype="checkbox"
        .itemtype=${this.type}
        ?selected=${selected}
      ></e-filter-list-item>
    `;
  };
}

/**
 * @property {String} title - Title of Filter Accordion Group
 * @property {Boolean} open - Whether the accordion is open by default
 * @property {String} match - Substring to match in filter items
 * @property {String} error - Message for error
 * @property {String} help - Help content for help tooltip
 * @property {Array} field - List of fields a new filter can be made for
 * @property {Boolean} line - Whether to line the accordion borders
 * @property {Array} filters - The list of filters to render
 */
definition('e-checkbox-filter-accordion', {
  style,
  props: {
    title: { attribute: true, type: String },
    open: { attribute: true, type: Boolean, default: true },
    match: { attribute: false, type: String, default: '' },
    error: { attribute: true, type: String },
    help: { attribute: false, type: String, default: '' },
    line: { attribute: true, type: Boolean, default: false },
    filters: { attribute: false, type: Array, default: [] },
    fields: {
      attribute: false,
      type: Array,
      default: [],
    },
  },
})(CheckboxFilterAccordion);
