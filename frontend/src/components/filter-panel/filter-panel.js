/**
 * Component FilterPanel is defined as
 * `<e-filter-panel>`
 *
 * @extends {LitComponent}
 */
import { LitComponent, html, definition, nothing } from '@eui/lit-component';
import { TilePanel } from '@eui/layout';
import { Button, Dialog, TextField } from '@eui/base';
import { Icon } from '@eui/theme';
import style from './filter-panel.css';
import CheckboxFilterAccordion from '../checkbox-filter-accordion/checkbox-filter-accordion';
import RadioFilterAccordion from '../radio-filter-accordion/radio-filter-accordion';
import FilterDialog from '../filter-dialog/filter-dialog';
import replaceInLocale from '../../utils/replaceInLocale.js';
import TutorialBanner from '../tutorial-banner/tutorial-banner';

const DEFAULT_FILTER = {
  id: '',
  type: {},
  value: {
    from: 0,
    to: 0,
    searchPattern: undefined,
    not: false,
    operation: undefined,
  },
  filterCategory: '',
  selected: false,
};

export default class FilterPanel extends LitComponent {
  get meta() {
    return import.meta;
  }

  static get components() {
    return {
      'e-tutorial-banner': TutorialBanner,
      'eui-tile-panel': TilePanel,
      'eui-button': Button,
      'eui-dialog': Dialog,
      'eui-text-field': TextField,
      'eui-icon': Icon,
      'e-checkbox-filter-accordion': CheckboxFilterAccordion,
      'e-radio-filter-accordion': RadioFilterAccordion,
      'e-filter-dialog': FilterDialog,
    };
  }

  _showFilterDialog = (title, dataType, { filterId, selectedField, type }) => {
    this.bubble('pause');
    this._dialogFilterTitle = title;
    this._selectedFilterType = dataType;
    this._showDialog = true;

    if (selectedField) {
      const accordionType = this.categories.filter((category) => category.type === type)[0];
      const fieldType = accordionType.fields.filter((field) => field.name === selectedField)[0]
        .type;
      this._selectedFilter = {
        ...DEFAULT_FILTER,
        id: filterId,
        name: selectedField,
        filterCategory: type,
        type: fieldType,
      };
    }

    if (filterId) {
      this._selectedFilter = { ...this.filters.filter((f) => f.id === filterId)[0] };
    }
  };

  _addFilterDialog = (event) => {
    const { target, detail } = event;
    this._showFilterDialog(this.i18n?.FILTER_TITLE_ADD, target.getAttribute('data-type'), detail);
  };

  _editFilterDialog = (event) => {
    const { detail } = event;
    this.editFilter = true;
    this._showFilterDialog(this.i18n?.FILTER_TITLE_EDIT, event.target.getAttribute('data-type'), {
      filterId: detail.id,
    });
  };

  _closeDialog = () => {
    this._showDialog = false;
    this._selectedFilterType = undefined;
    this._selectedFilter = undefined;
    this.editFilter = false;
    this.bubble('resume');
  };

  // Build the corresponding accordion type for the given selection type (either radio or checkbox)
  _filterAccordionGroup = ({
    selection,
    type,
    title,
    filters,
    line,
    error,
    fields,
    help,
    disclosureForAttribute,
  }) => {
    let group;
    let helpValue = '';
    if (this.i18n) {
      helpValue = this?.i18n[help];
    }

    switch (selection) {
      case 'checkbox':
        group = html`
          <e-checkbox-filter-accordion
            title=${title}
            ?line=${line}
            .filters=${filters}
            error=${error}
            .type=${type}
            .fields=${fields}
            .match=${this.match}
            .help=${helpValue}
            data-type="context"
            @open-edit=${this._addFilterDialog}
            @edit-filter=${this._editFilterDialog}
          ></e-checkbox-filter-accordion>
        `;
        break;
      case 'radio':
        group = html`
          <e-radio-filter-accordion
            title=${title}
            ?line=${line}
            .filters=${filters}
            error=${error}
            .type=${type}
            .fields=${fields}
            .match=${this.match}
            .help=${helpValue}
            data-type="metric"
            @open-edit=${this._addFilterDialog}
            @edit-filter=${this._editFilterDialog}
            .disclosureWarning=${disclosureForAttribute}
          ></e-radio-filter-accordion>
        `;
        break;
      default:
        group = html`
          ${nothing}
        `;
        console.warn(
          `Filter accordion group should be one of checkbox or radio but was ${selection}`,
        );
    }
    return group;
  };

  static get ACTIVE_FILTERS_LIMIT() {
    return 15;
  }

  /**
   * Build the corresponding accordion groups per category and given them the appropriate filters for their category type
   * There are only 100 filters allowed to be applied across the categories at any given time. Provide an error message
   * when this condition has been met.
   */
  _filterPanelContent = () =>
    this.categories.map((category, idx) => {
      const error =
        Object.values(this.filters)
          .flat()
          .filter((item) => item.selected).length >= FilterPanel.ACTIVE_FILTERS_LIMIT
          ? replaceInLocale(this.i18n?.MAX_LIMIT_MESSAGE, {
              limit: FilterPanel.ACTIVE_FILTERS_LIMIT,
            })
          : undefined;

      return this._filterAccordionGroup({
        ...category,
        filters: this.filters.filter((item) => item.filterCategory === category.type),
        line: idx % 2 === 0,
        error,
      });
    });

  _setMatchValue = ({ detail }) => this.bubble('update-match', detail.value);

  _filterBox = () =>
    html`
      <div id="filter-box">
        <small>${this.i18n?.FIND_FILTERS_LABEL}</small>
        <div>
          <eui-text-field
            name="search filters"
            aria-label=${this.i18n?.FIND_FILTERS_LABEL}
            @input=${this._setMatchValue}
            .value=${this.match}
            fullwidth
            placeholder=${this.i18n?.FIND_FILTERS_PLACEHOLDER}
          >
            <eui-icon slot="icon" name="search"></eui-icon>
          </eui-text-field>
        </div>
      </div>
    `;

  _renderFilterDialog = () => {
    if (this._selectedFilterType) {
      const { fields, disclosureForAttribute } = this.categories.filter(
        (r) => r.type === this._selectedFilterType,
      )[0];
      return this._showDialog
        ? html`
            <e-filter-dialog
              ?show=${this._showDialog}
              title=${this._dialogFilterTitle}
              ?edit=${this.editFilter}
              .filter=${this._selectedFilter}
              .fields=${fields}
              .disclosureMessage=${disclosureForAttribute}
              @cancel-dialog=${this._closeDialog}
              @update-filters=${this._closeDialog}
            ></e-filter-dialog>
          `
        : html`
            ${nothing}
          `;
    }
    return nothing;
  };

  _filterHelpBanner = () => {
    let element = nothing;
    if (this.filterHelpContent) {
      element = html`
        <e-tutorial-banner
          .message=${this.filterHelpContent}
          .type=${'filterHelp'}
        ></e-tutorial-banner>
      `;
    }
    return element;
  };

  /**
   * Render the <e-filter-panel> component. This function is called each time a
   * prop changes.
   */
  render = () =>
    html`
      ${this._renderFilterDialog()} ${this._filterHelpBanner()} ${this._filterBox()}
      <section>${this._filterPanelContent()}</section>
    `;
}

/**
 * @property {Array} filters - List of filters
 * @property {Object} categories - List of filter categories and their settings
 */
definition('e-filter-panel', {
  style,
  props: {
    categories: { attribute: false, type: Array, default: [] },
    filters: { attribute: false, type: Array, default: [] },
    match: { attribute: false, type: String, default: '' },
    filterHelpContent: { attribute: false, type: String },
    _showDialog: { attribute: false, type: Boolean, default: false },
    _selectedFilterType: { attribute: false, type: String, default: '' },
    _selectedFilter: { attribute: false, type: Object },
    _dialogFilterTitle: { attribute: false, type: String, default: 'Add default title' },
  },
})(FilterPanel);
