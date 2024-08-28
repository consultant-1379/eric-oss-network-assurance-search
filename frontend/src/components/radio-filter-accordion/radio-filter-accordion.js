/**
 * Component RadioFilterAccordion is defined as
 * `<e-radio-filter-accordion>`
 *
 * @extends {FilterAccordion}
 */
import { html, definition } from '@eui/lit-component';
import { Accordion, Button, ComboBox, InfoPopup, Tooltip } from '@eui/base';
import { Icon } from '@eui/theme';
import FilterAccordion from '../filter-accordion/filter-accordion';
import InlineButton from '../inline-button/inline-button';
import style from './radio-filter-accordion.css';
import BaseListItem from '../filter-list-items/filter-list-items';

const UPDATE_FILTERS = 'update-filters';

export default class RadioFilterAccordion extends FilterAccordion {
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

  // Event dispatch to remove all filter list items for the type: should remove all items from the accordion
  _removeAll = () =>
    this.bubble(UPDATE_FILTERS, { updateOperation: 'remove-all-of-type', data: this.type });

  // Control bar for removing all filter list items for the type
  filterListControlBar = () =>
    html`
      <div id="filters-controls">
        <e-inline-button
          id="remove-all"
          aria-label=${this.i18n?.ARIA_REMOVE_ALL_BUTTON}
          label="${this.i18n?.REMOVE_ALL_BUTTON}"
          @click=${this._removeAll}
        ></e-inline-button>
        ${this.disclosureWarning && this._showWarningMessage(this.disclosureWarning)}
      </div>
    `;

  // No applied filters option
  optionalSlot = () =>
    html`
      <e-filter-list-item
        id="no-filters-applied"
        label="${this.i18n?.NO_FILTERS_APPLIED}"
        aria-label=${this.i18n?.ARIA_NO_FILTERS_APPLIED}
        ?selected=${!this.filters.filter((f) => f.selected).length}
        ?noicons=${true}
        .selectiontype=${`radio`}
        .itemtype=${this.type}
        @edit-filter=${this.editFilter}
      ></e-filter-list-item>
    `;

  /** Create list item
   * disable the list item when there are no filters selected but there's an error because
   * this means the max has been reached outside of this list. The only filter which can then
   * be selected is no applied option */
  listItem = (filter) => {
    const { id, selected } = filter;
    return html`
      <e-filter-list-item
        id=${id}
        .label=${this.createLabel(filter)}
        aria-label=${`${this.i18n?.ARIA_FILTER_ITEM_LABEL}`}
        .match=${this.match}
        ?disabled=${(!this.filters.filter((f) => f.selected).length > 0 && this.error) ||
        (this.error && !selected)}
        error=${this.error}
        .selectiontype=${`radio`}
        .itemtype=${this.type}
        ?selected=${selected}
      ></e-filter-list-item>
    `;
  };

  /**
   * Function to display disclosure warning message.
   * @param {String} name
   * @returns {TemplateResult<1>}
   * @private
   */
  _showWarningMessage = (name) =>
    html`
      <div id="disclosure-warning-message">
        <eui-icon name="triangle-warning" id="icon-warning-message"></eui-icon>
        <span>${this.i18n?.FILTER_WARNING_MESSAGE.replace('#filterName', name)}</span>
      </div>
    `;
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
definition('e-radio-filter-accordion', {
  style,
  props: {
    title: { attribute: true, type: String, default: 'Filters' },
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
    disclosureWarning: { attribute: true, type: String, default: undefined },
  },
})(RadioFilterAccordion);
