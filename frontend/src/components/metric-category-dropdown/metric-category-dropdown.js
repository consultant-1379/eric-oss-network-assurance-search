/**
 * Component MetricCategoryDropdown is defined as
 * `<e-metric-category-dropdown>`
 *
 * @extends {Dropdown}
 */
import { definition, html, ifDefined, nothing } from '@eui/lit-component';
import { Dropdown, MenuItem } from '@eui/base';
import MetricCategoryMenu from '../metric-category-menu/metric-category-menu';
import style from './metric-category-dropdown.css';

/**
 * @property {Array} data - data to configure the tree
 * @property {Array} dataInnerlabel - label of dropdown button on selecting
 * checkbox menu item when data type is multi
 * @property {String} dataType - define if dropdown contains actions,
 * single select or multi select
 * @property {Boolean} disabled - disabled the dropdown button
 * @property {String} label - sets the label of dropdown button
 * @property {Boolean} more - if true, replaces dropdown button with more Icon
 * @property {String} selectAll - Set the label of the select all option.
 * Setting to null removes the select all option when data type is multi.
 */
export default class MetricCategoryDropdown extends Dropdown {
  static get components() {
    return {
      ...super.components,
      'e-metric-category-menu': MetricCategoryMenu,
      'eui-menu-item': MenuItem,
    };
  }

  /**
   * Lifecycle hook to hook into the point where the component is upgraded.
   * This is a good time to start observing the menu for changes to its items.
   *
   * @function didUpgrade
   */
  didUpgrade() {
    this.menu = this.shadowRoot.querySelector('e-metric-category-menu');
  }

  /**
   * Render the <eui-dropdown> component. This function is called each time a
   * prop changes.
   *
   * @method render
   */
  render() {
    // 'click' -->  menu component type=null
    const dataType = ['single', 'multi'].includes(this.dataType) ? this.dataType : null;
    const dropdownButton = html`
      <eui-button
        tabindex="0"
        class="menu-button"
        @click="${this._toggleDropdownMenu}"
        @keydown="${this._toggleDropdownMenu}"
        ?disabled=${this.disabled}
        ?primary=${this.primary}
        icon="chevron-down"
        reverse
        align-edge
      >
        ${this.label}
      </eui-button>
    `;
    return html`
      <div class="dropdown" @eui-menu:hidden=${this}>
        ${dropdownButton}
        ${!this.data
          ? html`
              <slot @slotchange=${(event) => this._moveMenuItem(event)}></slot>
            `
          : nothing}
        <e-metric-category-menu
          type=${ifDefined(dataType)}
          @eui-menu:click=${this}
          select-all=${ifDefined(this.selectAll)}
          @eui-menu:change=${this}
        >
          ${this.data ? this._makeDropdownOptions() : nothing}
        </e-metric-category-menu>
      </div>
    `;
  }
}

definition('e-metric-category-dropdown', {
  style,
  props: {
    data: { type: Array },
    dataInnerlabel: {
      type: Array,
      default: [
        ['one', 'item selected'],
        ['other', 'items selected'],
        ['all', 'All items selected'],
      ],
    },
    dataType: { attribute: true, type: String, default: 'multi' },
    disabled: { attribute: true, type: Boolean },
    primary: { attribute: true, type: Boolean },
    label: { attribute: true, type: String, required: true },
    _dynamicLabel: { type: String },
    _visible: { type: Boolean },
    more: { attribute: true, type: Boolean },
    selectAll: { attribute: true, type: String },
  },
})(MetricCategoryDropdown);
