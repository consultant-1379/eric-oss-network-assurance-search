/**
 * Component MetricCategoryPicker is defined as
 * `<e-metric-category-picker>`
 *
 * @extends {LitComponent}
 */
import { LitComponent, html, definition, nothing } from '@eui/lit-component';
import { Tooltip } from '@eui/base';
import { Icon } from '@eui/theme';
import MetricCategoryPill from '../metric-category-pill/metric-category-pill';
import MetricCategoryDropdown from '../metric-category-dropdown/metric-category-dropdown';
import style from './metric-category-picker.css';

const viewOptionsTextColour = '#0069c2';

export default class MetricCategoryPicker extends LitComponent {
  get meta() {
    return import.meta;
  }

  static get components() {
    return {
      'eui-tooltip': Tooltip,
      'eui-icon': Icon,
      'e-metric-category-pill': MetricCategoryPill,
      'e-metric-category-dropdown': MetricCategoryDropdown,
    };
  }

  didConnect() {
    this.bubble('update-browser-metric-categories', {
      metricCategories: this.metricCategories,
    });
  }

  didChangeProps(changedProps) {
    if (changedProps.has('viewAllSelected')) {
      this.bubble('update-browser-metric-categories', {
        metricCategories: this.metricCategories,
      });
    }
  }

  /**
   * @description This method returns the number of metric categories that are currently selected
   * @returns {number} The number of metric categories that are currently selected
   * @example 7
   */
  countSelectedMetricCategories = () =>
    this.metricCategories.filter(
      (categoryObj) => !categoryObj.unselected && categoryObj.id !== 'all',
    ).length;

  /**
   * This method handles the Pill selection events.
   * @param {*} event - Either a click or keydown event.
   * @param {*} pillId - The ID of the Pill that was selected.
   * @example "category-1"
   */
  handlePillCategoryClick = (event, pillId) => {
    if (
      event.type === 'click' ||
      (event.type === 'keydown' && (event.key === this._SPACE_KEY || event.key === 'Enter'))
    ) {
      this.bubble('toggle-metric-category-selection-state', { categoryId: pillId });
    }
  };

  /**
   * This method handles the Dropdown MenuItem selection events.
   * @param {*} event - Either a click or keydown event.
   */
  handleDropdownCategoryClick = (event) => {
    this.bubble('toggle-metric-category-selection-state', {
      categoryId: event.detail.menuItem.value,
    });
  };

  /**
   * This method toggles the `viewAllSelected` state variable.
   */
  toggleViewAllSelected = () => {
    this.bubble('toggle-metric-categories-view-all-selected');
  };

  /**
   * This method returns an array of `<div>` elements that contain metric names.
   * This array is used for the tooltips of the metric category Pills.
   * @param {array} metrics - An array of metric objects
   * @example [ { "id": "vd_tac_GRANGOSR", "name": "GRANGOSR" }, { "id": "vd_tac_5GSEPHOSR", "name": "5GSEPHOSR" } ]
   * @returns {array} An array of `<div>` elements that contain metric names.
   */
  _categoryPillTooltipContent = (metrics) =>
    metrics.map(
      (metric) => html`
        <div>${metric.name}</div>
      `,
    );

  _categoryPill = ({ id, unselected, title }) => {
    if (unselected) {
      return html`
        <e-metric-category-pill
          class="metric-category-pills"
          id=${id}
          ?unselected=${unselected}
          @click=${(e) => this.handlePillCategoryClick(e, id)}
          @keydown=${(e) => this.handlePillCategoryClick(e, id)}
        >
          ${title}
        </e-metric-category-pill>
      `;
    }
    return html`
      <e-metric-category-pill
        class="metric-category-pills"
        id=${id}
        ?unselected=${unselected}
        icon="check"
        style="--pill-background: var(--tag-blue, #202e3a); --pill-border: var(--tag-blue-border, #4d97ed); --pill-text: var(--tag-blue-text, #4d97ed);"
        @click=${(e) => this.handlePillCategoryClick(e, id)}
        @keydown=${(e) => this.handlePillCategoryClick(e, id)}
      >
        ${title}
      </e-metric-category-pill>
    `;
  };

  /**
   * This method returns a custom Pill component which is wrapped by the E-UI SDK's Tooltip component.
   * @param {object} categoryObj - A metric category object.
   * @example { "id": "bb-category", "title": "Bb Category", "unselected": true, "dropdown": false, "metrics": [ { "id": "vd_tac_DLLat_gNB-DU", "name": "DLLat_gNB-DU" } ] }
   * @returns {html} A custom Pill component which is wrapped by the E-UI SDK's Tooltip component.
   */
  _categoryPillWithTooltip = (categoryObj) =>
    html`
      <eui-tooltip position="bottom" style="vertical-align:middle">
        ${this._categoryPill(categoryObj)}
        <div slot="message">${this._categoryPillTooltipContent(categoryObj.metrics)}</div>
      </eui-tooltip>
    `;

  /**
   * This method returns a custom Dropdown component which will contain MenuItems corresponding
   * to metric categories.
   * @param {array} dropdownMetricCategories - An array of metric category objects which will
   * be displayed within the dropdown menu.
   * @example [ { "id": "bb-category", "title": "Bb Category", "unselected": true, "dropdown": true, "metrics": [ { "id": "vd_tac_DLLat_gNB-DU", "name": "DLLat_gNB-DU" } ] } ]
   * @returns {html} A custom Dropdown component which will contain the custom Menu and MenuItem components.
   */
  _categoryDropdownPicker = (dropdownMetricCategories) => {
    // Mutating metricCategories array data into the Dropdown component's data format
    const dropdownData = dropdownMetricCategories.map((categoryObj) => ({
      label: categoryObj.title,
      value: categoryObj.id,
      checked: !categoryObj.unselected,
    }));
    return html`
      <e-metric-category-dropdown
        label=${this.i18n?.DROPDOWN_MENU_LABEL}
        data-type="multi"
        .data=${dropdownData}
        @eui-dropdown:click="${(event) => this.handleDropdownCategoryClick(event)}"
      ></e-metric-category-dropdown>
    `;
  };

  /**
   * This method builds a 'collapsible' `<div>` that toggles visibility on all the selected metrics if the
   * number of selected metric categories is greater than the maximum number of Pills allowed, which is set
   * by the `maxPillCount` state variable. If the number of selected metric categories is less than the
   * maximum number of Pills allowed and the `viewAllSelected` flag is set to true, the `viewAllSelected`
   * flag will be reset to false.
   * @returns {html} A 'collapsible' `<div>` that toggles visibility on all the selected metrics OR nothing.
   */
  _metricCategoryOverflow = () => {
    if (this.countSelectedMetricCategories() >= this.maxPillCount) {
      /**
       * The number of selected categories is greater than the maximum number of Pills allowed,
       * therefore the view option link will be displayed.
       */
      return html`
        <div
          class="metric-category-picker-view-options-link"
          @click=${this.toggleViewAllSelected}
          role="button"
        >
          ${this.viewAllSelected
            ? this.i18n?.VIEW_LESS_SELECTED_LABEL
            : this.i18n?.VIEW_ALL_SELECTED_LABEL}
          <eui-icon
            name="${this.viewAllSelected ? 'chevron-up' : 'chevron-down'}"
            color="${viewOptionsTextColour}"
            size="20px"
          ></eui-icon>
        </div>
      `;
    }

    if (this.viewAllSelected) {
      // The number of selected categories is less than the maximum number of Pills allowed
      // but the `viewAllSelected` state variable is still set to `true`, therefore it needs to be
      // toggled back to false.
      this.toggleViewAllSelected();
    }

    return nothing;
  };

  /**
   * This method returns an array of custom Pill components and potentially a
   * custom Dropdown component if there are more metric categories than the
   * maximum number of Pills allowed.
   * @returns {array} An array of custom components.
   */
  _categories = () => {
    const { metricCategories } = this;

    // Localizing title of the 'all' category
    metricCategories[0] = {
      ...metricCategories[0],
      title: this.i18n?.ALL_CATEGORY_PILL_LABEL,
    };

    // Filtering the categories which will be displayed within pills
    const pillCategories = metricCategories.filter((categoryObj) => !categoryObj.dropdown);

    // Filtering the categories which will be displayed within the dropdown menu
    const dropdownCategories = metricCategories.filter((categoryObj) => categoryObj.dropdown);

    // Building the pill HTML elements
    const categoryPickerElements = pillCategories.map((categoryObj) =>
      this._categoryPillWithTooltip(categoryObj),
    );

    // Building the dropdown HTML element which contains the menu item HTML elements
    const categoryDropdown = this._categoryDropdownPicker(dropdownCategories);

    // Combining the pill HTML elements and the dropdown HTML element (if it is not empty)
    return dropdownCategories.length > 0
      ? categoryPickerElements.concat(categoryDropdown)
      : categoryPickerElements;
  };

  /**
   * Render the <e-metric-category-picker> component. This function is called each time a
   * prop changes.
   *
   * The metricCategories array must have a length greater than 1 in order for the metric
   * category picker elements to be rendered (there will always be an 'all' category, even
   * when there are no other categories).
   */
  render() {
    return this.metricCategories.length > 1
      ? html`
          <div class="metric-category-picker" role="toolbar" aria-label="Metric Category Selection">
            ${this._categories()}${this._metricCategoryOverflow()}
          </div>
        `
      : nothing;
  }
}

/**
 * @property {Array} metricCategories - An array of metric category objects.
 * @example [ { "id": "bb-category", "title": "Bb Category", "unselected": true, "metrics": [ { "id": "vd_tac_DLLat_gNB-DU", "name": "DLLat_gNB-DU" } ] } ]
 * @property {Number} viewAllSelected - A boolean which dictates whether all selected categories
 * will be shown within Pills or not.
 * @default false
 * @property {Number} maxPillCount - The maximum number of Pills that will be displayed when the
 * `viewAllSelected` variable is equal to false.
 * @default 10
 */
definition('e-metric-category-picker', {
  style,
  props: {
    metricCategories: { attribute: false, type: Array },
    viewAllSelected: { attribute: false, type: Boolean, default: false },
    maxPillCount: { attribute: false, type: Number, default: 10 },
  },
})(MetricCategoryPicker);
