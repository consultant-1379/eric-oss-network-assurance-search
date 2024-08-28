import { expect, fixture, elementUpdated, html } from '@open-wc/testing';
import { MenuItem } from '@eui/base';
import { isRendered } from '../../utils/isRendered.js';
import { nextTick } from '../../utils/utils.js';
import { constants } from '../../utils/constants.js';
import MetricCategoryMenu from '../../../src/components/metric-category-menu/metric-category-menu.js';

const numberOfMenuItems = 10;

// Query Selectors
const selectors = {
  euiMenuItem: 'eui-menu-item',
};

// Building menu item data
const menuItemProps = Array.from({ length: numberOfMenuItems }, (_, n) => n).map((i) => ({
  label: `Menu Item ${i + 1}`,
  value: `menu-item-${i + 1}`,
  selected: false,
}));

// Building template string for the menu items
let menuItemsTemplateString = '';
menuItemProps.forEach((props) => {
  menuItemsTemplateString += `<eui-menu-item label="${props.label}" value="${props.value}" selected="${props.selected}"></eui-menu-item>`;
});

// Event handling function
let menuItem;
const handleEvent = (event) => {
  menuItem = event.detail.menuItem;
};

// Renders Menu component with a number of
const renderContainer = async () => {
  const menuTemplate = html`
    <e-metric-category-menu @eui-menu:click=${handleEvent} show></e-metric-category-menu>
  `;
  const menuElement = await fixture(menuTemplate);
  const menuItems = await fixture(menuItemsTemplateString, { parentNode: menuElement });
  await isRendered(menuItems);
  return menuElement;
};

const getAllMenuItems = (component) => component.querySelectorAll(selectors.euiMenuItem);

const removeByIndex = (arr, index) => arr.filter((_, i) => i !== index);

const unhighlightedItemsCheck = (allMenuItems, highlightedMenuItemIndex) => {
  const unhighlightedMenuItems = removeByIndex(Array.from(allMenuItems), highlightedMenuItemIndex);
  return unhighlightedMenuItems.every((menuItemElement) => menuItemElement._highlight === false);
};

describe('MetricCategoryMenu Component Tests', () => {
  before(() => {
    MetricCategoryMenu.register();
    MenuItem.register();
  });

  describe('Basic component setup', () => {
    it('should render <e-metric-category-menu>', async () => {
      const component = await fixture('<e-metric-category-menu></e-metric-category-menu>');
      expect(component).to.exist;
    });
  });

  describe('Component rendering', () => {
    it('should render with a menu item', async () => {
      const component = await renderContainer();
      expect(
        component.querySelector(selectors.euiMenuItem).shadowRoot.querySelector('#label')
          .textContent,
      ).to.equal(menuItemProps[0].label);
    });
  });

  describe('Event handling', () => {
    it('should emit an event upon clicking a menu item that contains the menu item data', async () => {
      const component = await renderContainer();
      const menuItemComponent = component.querySelector(selectors.euiMenuItem);

      // Clicking the menu item
      menuItemComponent.click();
      await nextTick();

      // Verifying the event data
      expect(menuItem).to.deep.equal({
        label: menuItemProps[0].label,
        value: menuItemProps[0].value,
      });
    });

    it('should emit an event upon an ENTER keydown on a menu item that contains the menu item data', async () => {
      const component = await renderContainer();
      const menuItemComponent = component.querySelector(selectors.euiMenuItem);

      // Pressing the ENTER key on the menu item
      const enterKey = constants.KEYDOWN_EVENTS.ENTER;
      menuItemComponent.dispatchEvent(enterKey);
      await elementUpdated(menuItemComponent);

      // Verifying the event data
      expect(menuItem).to.deep.equal({
        label: menuItemProps[0].label,
        value: menuItemProps[0].value,
      });
    });

    it('should highlight a menu item upon an ARROW DOWN and ARROW UP keydown event', async () => {
      const component = await renderContainer();
      const allMenuItems = getAllMenuItems(component);

      /* eslint-disable no-await-in-loop */
      // Using the ARROW DOWN key to navigate to the bottom of the menu
      for (let i = 0; i < menuItemProps.length; i += 1) {
        // Pressing the ARROW DOWN key on the menu item
        const arrowDownKey = constants.KEYDOWN_EVENTS.ARROW_DOWN;
        allMenuItems[i].dispatchEvent(arrowDownKey);
        await elementUpdated(allMenuItems[i]);

        // Expecting the target menu item to be highlighted after an ARROW DOWN key event
        expect(allMenuItems[i]._highlight).to.equal(true);

        // Expecting all other menu items to not be highlighted
        expect(unhighlightedItemsCheck(allMenuItems, i)).to.equal(true);
      }

      // Using the ARROW UP key to navigate to the top of the menu
      // Need to start from the second last menu item because the last menu item is already highlighted.
      for (let i = menuItemProps.length - 2; i >= 0; i -= 1) {
        // Pressing the ARROW_UP key on the menu item
        const arrowUpKey = constants.KEYDOWN_EVENTS.ARROW_UP;
        allMenuItems[i].dispatchEvent(arrowUpKey);
        await elementUpdated(allMenuItems[i]);

        // Expecting the target menu item to be highlighted after an ARROW_UP DOWN key event
        expect(allMenuItems[i]._highlight).to.equal(true);

        // Expecting all other menu items to not be highlighted
        expect(unhighlightedItemsCheck(allMenuItems, i)).to.equal(true);
      }
      /* eslint-enable no-await-in-loop */
    });

    it('should handle ESCAPE keydown event properly', async () => {
      const component = await renderContainer();
      const allMenuItems = getAllMenuItems(component);

      // Expecting the menu component to not be hidden
      expect(component.show).to.equal(true);

      // Pressing the ESCAPE key on the first menu item
      const escapeKey = constants.KEYDOWN_EVENTS.ESCAPE;
      allMenuItems[0].dispatchEvent(escapeKey);
      await elementUpdated(allMenuItems[0]);

      // Expecting the menu component to be hidden
      expect(component.show).to.equal(false);
    });

    it('should handle TAB keydown event properly', async () => {
      const component = await renderContainer();
      const allMenuItems = getAllMenuItems(component);

      // Expecting the menu component to not be hidden
      expect(component.show).to.equal(true);

      // Pressing the TAB key on the first menu item
      const tabKey = constants.KEYDOWN_EVENTS.TAB;
      allMenuItems[0].dispatchEvent(tabKey);
      await elementUpdated(allMenuItems[0]);

      // Expecting the menu component to be hidden
      expect(component.show).to.equal(false);
    });

    it('should handle END and HOME keydown events properly', async () => {
      const component = await renderContainer();
      const allMenuItems = getAllMenuItems(component);
      const menuDivElement = component.shadowRoot.querySelector('.menu');

      // Expect the scroll height of the menu div to be equal to 0
      expect(menuDivElement.scrollTop).to.equal(0);

      // Pressing the END key on the first menu item
      const endKey = constants.KEYDOWN_EVENTS.END;
      allMenuItems[0].dispatchEvent(endKey);
      await elementUpdated(allMenuItems[0]);

      // Expecting the last menu item to be highlighted after an END key event
      const lastMenuItemIndex = allMenuItems.length - 1;
      expect(allMenuItems[lastMenuItemIndex]._highlight).to.equal(true);
      // Expecting all other menu items to not be highlighted
      expect(unhighlightedItemsCheck(allMenuItems, lastMenuItemIndex)).to.equal(true);
      // Expecting the scroll height of the menu div to NOT be equal to 0 anymore
      expect(menuDivElement.scrollTop).to.not.equal(0);

      // Pressing the HOME key on the first menu item
      const homeKey = constants.KEYDOWN_EVENTS.HOME;
      allMenuItems[0].dispatchEvent(homeKey);
      await elementUpdated(allMenuItems[0]);

      // Expecting the first menu item to be highlighted after a HOME key event
      expect(allMenuItems[0]._highlight).to.equal(true);
      // Expecting all other menu items to not be highlighted
      expect(unhighlightedItemsCheck(allMenuItems, 0)).to.equal(true);
      // Expect the scroll height of the menu div to be equal to 0 again
      expect(menuDivElement.scrollTop).to.equal(0);
    });

    it('should handle PAGE DOWN keydown event properly', async () => {
      /**
       * The PAGE DOWN keydown event should have no effect on the scroll height
       */
      const component = await renderContainer();
      const allMenuItems = getAllMenuItems(component);
      const menuDivElement = component.shadowRoot.querySelector('.menu');

      // Expect the scroll height of the menu div to be equal to 0
      expect(menuDivElement.scrollTop).to.equal(0);

      // Pressing the PAGE_DOWN key on the first menu item
      const pageDownKey = constants.KEYDOWN_EVENTS.PAGE_DOWN;
      allMenuItems[0].dispatchEvent(pageDownKey);
      await elementUpdated(allMenuItems[0]);

      // Expect the scroll height of the menu div to still be equal to 0
      expect(menuDivElement.scrollTop).to.equal(0);
    });

    it('should handle PAGE UP keydown event properly', async () => {
      /**
       * The PAGE UP keydown event should have no effect on the scroll height
       */
      const component = await renderContainer();
      const allMenuItems = getAllMenuItems(component);
      const menuDivElement = component.shadowRoot.querySelector('.menu');

      // Pressing the END key on the first menu item to focus
      // on last menu item in the menu (maxing out the scroll height)
      const endKey = constants.KEYDOWN_EVENTS.END;
      allMenuItems[0].dispatchEvent(endKey);
      await elementUpdated(allMenuItems[0]);

      // Expect the scroll height of the menu div to not be equal to 0
      expect(menuDivElement.scrollTop).to.not.equal(0);

      // Pressing the PAGE_UP key on the last menu item
      const pageUpKey = constants.KEYDOWN_EVENTS.PAGE_UP;
      const lastMenuItemIndex = allMenuItems.length - 1;
      allMenuItems[lastMenuItemIndex].dispatchEvent(pageUpKey);
      await elementUpdated(allMenuItems[lastMenuItemIndex]);

      // Expect the scroll height of the menu div to still not be equal to 0
      expect(menuDivElement.scrollTop).to.not.equal(0);
    });
  });
});
