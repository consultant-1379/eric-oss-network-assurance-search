/**
 * Component MetricCategoryMenu is defined as
 * `<e-metric-category-menu>`
 *
 * @extends {Menu}
 */
import { definition } from '@eui/lit-component';
import { Menu } from '@eui/base';
import style from './metric-category-menu.css';

const keyTypes = {
  ARROW_UP_KEY: 'ArrowUp',
  ARROW_DOWN_KEY: 'ArrowDown',
  TAB_KEY: 'Tab',
  ESCAPE_KEY: 'Escape',
  ENTER_KEY: 'Enter',
  SPACE_KEY: 'Space',
  HOME_KEY: 'Home',
  END_KEY: 'End',
  PAGE_UP_KEY: 'PageUp',
  PAGE_DOWN_KEY: 'PageDown',
};

/**
 * @property {Object} position - x,y coordinates of the top left of the menu
 * @property {Boolean} show - show/hide the menu
 * @property {String} type - type of menu [null|'single'|'multi']
 * 1. action (type = null)
 * 2. single select (type= 'single')
 * 3. multiple select (type = 'multi')
 */
export default class MetricCategoryMenu extends Menu {
  static get components() {
    return {
      ...super.components,
    };
  }

  /**
   * Handle eui-menuItem:click event
   *
   * @function _handleMenuItemClick
   * @param {Event} event - eui-menuItem:click event
   */
  _handleMenuItemClick = (event) => {
    this.bubble('eui-menu:click', {
      menuItem: {
        label: event.target.label,
        value: event.target.value,
      },
    });
  };

  /**
   * Handle all keyboard control keys.
   *
   * @function _handleKeyboard
   * @param {Event} event - keyboard key event
   */
  _handleKeyboard(event, key) {
    // Note: Could return any element that is in focus within the
    // parent's (dropdown/combobox) shadowRoot.
    // Slottable elements are not defined in Menu's shadow
    let { activeElement } = this.getRootNode();
    // Use the live nodeName as eui-menu may have been registered
    // with alt name for scoped elements
    if (activeElement?.nodeName === this.nodeName) {
      // Inside Menu shadow and maybe on select-all item
      // else on something else that has been applied in slot
      activeElement = activeElement.shadowRoot.activeElement;
    }

    const menuItemIndex = this._menuItemIndex(activeElement);
    switch (key) {
      case keyTypes.ENTER_KEY:
      case keyTypes.SPACE_KEY:
        this.bubble('eui-menu:click', {
          menuItem: {
            label: event.target.label,
            value: event.target.value,
          },
        });
        break;
      case keyTypes.ARROW_UP_KEY:
        event.preventDefault();
        this._setFocus(menuItemIndex - 1, 'up');
        this._setScrollBarHeight(this.focusedChild);
        break;
      case keyTypes.ARROW_DOWN_KEY:
        event.preventDefault();
        this._setFocus(menuItemIndex + 1, 'down');
        this._setScrollBarHeight(this.focusedChild);
        break;
      case keyTypes.TAB_KEY:
      case keyTypes.ESCAPE_KEY:
        // eslint-disable-next-line no-case-declarations
        const emittedEvent = this.bubble('eui-menu:hidden', {}, { cancelable: true });
        if (!emittedEvent.defaultPrevented) {
          this.show = false;
        }
        break;
      case keyTypes.HOME_KEY:
        event.preventDefault();
        this._setFocus(0, 'down');
        this._setScrollBarHeight(this.focusedChild);
        break;
      case keyTypes.END_KEY:
        event.preventDefault();
        this._setFocus(this.filteredMenuItems.length - 1, 'up');
        this._setScrollBarHeight(this.focusedChild);
        break;
      case keyTypes.PAGE_UP_KEY:
      case keyTypes.PAGE_DOWN_KEY:
        // blocks native scrolling of page
        event.preventDefault();
        break;
      default:
        break;
    }
  }

  /**
   * Handle all the events bubbled from children, keyboard and document.
   *
   * @function handleEvent
   * @param {Event} event - an event
   */
  handleEvent(event) {
    switch (event.type) {
      case 'keydown':
        this._handleKeyboard(event, event.key);
        break;

      case 'eui-menuItem:click':
        this._handleMenuItemClick(event);
        break;

      case 'eui-menuItem:change':
        this._handleMenuItemChange(event);
        break;

      case 'mousedown':
      case 'wheel':
      case 'resize':
      case 'touchend':
      case 'scroll':
      case 'touchmove':
        this._closeMenuWhenClickedOutside(event);
        break;

      case 'slotchange':
        this._handleSlotChange();
        break;

      default:
        break;
    }
  }
}

definition('e-metric-category-menu', {
  style,
  props: {
    position: { type: Object },
    selectAll: { attribute: true, type: String },
    show: { attribute: true, type: Boolean },
    type: { attribute: true, type: String },
    _maxPaddingLeft: { type: Number, default: 0 },
    _maxPaddingRight: { type: Number, default: 0 },
  },
})(MetricCategoryMenu);
