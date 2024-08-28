/**
 * Component BaseListItem is defined as
 * `<e-filter-list-items>`
 *
 * @extends {LitComponent}
 */
import { LitComponent, html, definition, nothing } from '@eui/lit-component';
import { Tooltip, Checkbox, RadioButton } from '@eui/base';
import { Icon } from '@eui/theme';
import style from './filter-list-items.css';

export default class BaseListItem extends LitComponent {
  static get components() {
    return {
      'eui-icon': Icon,
      'eui-tooltip': Tooltip,
      'eui-checkbox': Checkbox,
      'eui-radio-button': RadioButton,
    };
  }

  get meta() {
    return import.meta;
  }

  /**
   * @function _emboldenMatch
   * @description Hightlight substring in bold if it is a match (Case sensitive)
   * @param {String} match The substring to match and make bold in the label
   * @param {String} label The label of the filter item
   * @returns {String}
   */
  _emboldenMatch() {
    const lowerMatch = this.match;
    const lowerLabel = this.label;
    const isMatch = lowerLabel.includes(lowerMatch);
    if (isMatch) {
      const idx = lowerLabel.indexOf(lowerMatch);
      const arr = [
        this.label.substring(0, idx),
        this.label.substring(idx, idx + this.match.length),
        this.label.substring(idx + this.match.length),
      ];
      // prettier-ignore
      const highlight = arr.map((item) =>
        item === lowerMatch
          ? html`<strong id="highlight">${item}</strong>`
          : item,
      );
      return html`
        <span>${highlight}</span>
      `;
    }
    return html`
      <span>${this.label}</span>
    `;
  }

  _updateFilter = () =>
    this.bubble('update-filters', {
      updateOperation: 'select-filter',
      data: {
        type: this.itemtype,
        id: this.id,
      },
    });

  _editFilter = () =>
    this.bubble('edit-filter', {
      type: this.itemtype,
      id: this.id,
    });

  _deleteFilter = () =>
    this.bubble('update-filters', {
      updateOperation: 'remove-filter',
      data: {
        type: this.itemtype,
        id: this.id,
      },
    });

  _icons() {
    return html`
      <div class="icons-container" aria-label="${this.i18n?.ARIA_ICON_CONTAINER_LABEL}">
        <eui-tooltip message="${this.i18n?.EDIT_ICON_TOOLTIP_MSG}" position="top">
          <eui-icon
            class="icons edit"
            name="edit"
            @click="${this._editFilter}"
            alt="${this.i18n?.ARIA_EDIT_ICON_IMG_ALT}"
            aria-label="${this.i18n?.ARIA_EDIT_ICON_LABEL}"
          ></eui-icon>
        </eui-tooltip>
        <eui-tooltip message="${this.i18n?.REMOVE_ICON_TOOLTIP_MSG}" position="top">
          <eui-icon
            class="icons remove"
            name="trashcan"
            @click="${this._deleteFilter}"
            alt="${this.i18n?.ARIA_REMOVE_ICON_IMG_ALT}"
            aria-label="${this.i18n?.ARIA_REMOVE_ICON_LABEL}"
          ></eui-icon>
        </eui-tooltip>
      </div>
    `;
  }

  _createItemContents = (radio = false) =>
    html`
      <eui-tooltip message=${this.label} position="top">
        <div class="label ${radio ? 'radio-label' : ''}" alt=${this.label}>
          ${this.match.length > 0 ? this._emboldenMatch() : this.label}
        </div>
      </eui-tooltip>
    `;

  _radioBtnFilter() {
    return html`
      <eui-radio-button
        ?checked="${this.selected}"
        ?disabled="${this.disabled}"
        label="${this.label}"
        value="${this.label}"
        name="radio-button-filter"
        alt=${this.label}
        group="radio-button-filter-item"
        @click="${this._updateFilter}"
      >
        ${this._createItemContents(true)}
      </eui-radio-button>
    `;
  }

  _checkboxFilter() {
    return html`
      <eui-checkbox
        ?checked="${this.selected}"
        ?disabled="${this.disabled}"
        label="${this.label}"
        name="${this.label}"
        alt=${this.label}
        group="checkbox-filter-item"
        @click="${this._updateFilter}"
      >
        ${this._createItemContents()}
      </eui-checkbox>
    `;
  }

  _filterListItem() {
    return html`
      <div class="base-filter-list" aria-label="${this.label} ${this.i18n?.FILTER_ITEM}">
        ${this.selectiontype === 'radio' ? this._radioBtnFilter() : this._checkboxFilter()}
        ${!this.noicons && !this.disabled ? this._icons() : nothing}
      </div>
    `;
  }

  _filterListItemWithTooltip() {
    return html`
      <eui-tooltip position="top">
        ${this._filterListItem()}
        <div slot="message" id="max_limit_msg">${this.error}</div>
      </eui-tooltip>
    `;
  }

  render() {
    return html`
      ${this.error && !this.selected ? this._filterListItemWithTooltip() : this._filterListItem()}
    `;
  }
}

/**
 * @property {String} label - Filter list item title
 * @property {String} match - Optional substring to highlight in bold
 * @property {Boolean} selected - To keep track of whether the component is active or not
 * @property {Boolean} disabled - Whether selection mechanism is disabled
 * @property {String} error - Message to display on hover of selection mechanism
 * @property {String} selectiontype - Selection group type from accordion group (ex) checkbox or radio
 * @property {String} itemtype - Item group type from accordion group (ex) network or measurement
 * @property {Boolean} noicons - If true, icons are not displayed on hover
 */
definition('e-filter-list-items', {
  style,
  props: {
    id: {
      attribute: true,
      type: String,
    },
    label: {
      attribute: true,
      type: String,
      default: '',
    },
    match: {
      attribute: false,
      type: String,
      default: '',
    },
    selected: {
      attribute: true,
      type: Boolean,
      default: false,
    },
    disabled: {
      attribute: true,
      type: Boolean,
      default: false,
    },
    error: {
      attribute: true,
      type: String,
      default: '',
    },
    selectiontype: {
      attribute: false,
      type: String,
    },
    itemtype: {
      attribute: false,
      type: String,
    },
    noicons: {
      attribute: true,
      type: Boolean,
      default: false,
    },
  },
})(BaseListItem);
