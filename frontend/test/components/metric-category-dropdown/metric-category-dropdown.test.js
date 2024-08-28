import { expect, fixture, html } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import { isRendered } from '../../utils/isRendered.js';
import { nextTick } from '../../utils/utils.js';
import MetricCategoryDropdown from '../../../src/components/metric-category-dropdown/metric-category-dropdown';

const numberOfMenuItems = 10;

const selectors = {
  metricCategoryMenu: 'e-metric-category-menu',
  euiMenuItem: 'eui-menu-item',
  euiButton: 'eui-button',
  euiCheckbox: 'eui-checkbox',
  menuButton: '.menu-button',
};

// Building menu item data
const dropdownData = Array.from({ length: numberOfMenuItems }, (_, n) => n).map((i) => ({
  label: `Menu Item ${i + 1}`,
  value: `menu-item-${i + 1}`,
  checked: false,
}));

// Event handling function
let menuItem;
const handleEvent = (event) => {
  menuItem = event.detail.menuItem;
};

const renderContainer = async ({ dropdownLabel }) => {
  const dropdownTemplate = await html`
    <e-metric-category-dropdown
      label=${ifDefined(dropdownLabel)}
      .data=${dropdownData}
      @eui-dropdown:click=${handleEvent}
    ></e-metric-category-dropdown>
  `;
  const element = await fixture(dropdownTemplate);
  await isRendered(element);
  return element;
};

describe('MetricCategoryDropdown Component Tests', () => {
  const baseProps = {
    dropdownLabel: 'More',
  };

  before(() => {
    MetricCategoryDropdown.register();
  });

  describe('Basic component setup', () => {
    it('should render <e-metric-category-dropdown>', async () => {
      const component = await fixture('<e-metric-category-dropdown></e-metric-category-dropdown>');
      expect(component).to.exist;
    });
  });

  describe('Component rendering', () => {
    it('should render with the correct label', async () => {
      const component = await renderContainer(baseProps);
      expect(component.shadowRoot.querySelector(selectors.euiButton).textContent.trim()).to.equal(
        baseProps.dropdownLabel,
      );
    });

    it(`should render with ${numberOfMenuItems} menu items`, async () => {
      const component = await renderContainer(baseProps);
      expect(
        component.shadowRoot.querySelectorAll(
          `${selectors.metricCategoryMenu} ${selectors.euiMenuItem}`,
        ).length,
      ).to.equal(numberOfMenuItems);
    });

    it('should show menu items when clicked', async () => {
      const component = await renderContainer(baseProps);
      const dropdownButton = component.shadowRoot.querySelector(selectors.menuButton);

      // Clicking on the dropdown button
      dropdownButton.click();
      await nextTick();

      // Verifying that the <e-metric-category-menu> element has the `show` attribute
      expect(
        component.shadowRoot
          .querySelector(`${selectors.metricCategoryMenu}`)
          .getAttributeNames()
          .includes('show'),
      ).to.equal(true);
    });

    it("should handle a menu item click properly by checking the menu item's checkbox", async () => {
      const component = await renderContainer(baseProps);
      const dropdownButton = component.shadowRoot.querySelector(selectors.menuButton);

      // Opening dropdown menu
      dropdownButton.click();
      await nextTick();

      // Clicking the first menu item
      const firstMenuItem = component.shadowRoot.querySelector(
        `${selectors.metricCategoryMenu} ${selectors.euiMenuItem}`,
      );
      firstMenuItem.click();
      await nextTick();

      // Verifying that menu item is checked
      expect(firstMenuItem.getAttributeNames().includes('selected')).to.equal(true);
      const checkbox = firstMenuItem.shadowRoot.querySelector(selectors.euiCheckbox);
      expect(checkbox.getAttributeNames().includes('checked')).to.equal(true);
    });
  });

  describe('Event handling', () => {
    it('should emit an event upon clicking the menu item that contains the menu item data', async () => {
      const component = await renderContainer(baseProps);
      const dropdownButton = component.shadowRoot.querySelector(selectors.menuButton);

      // Opening dropdown menu
      dropdownButton.click();
      await nextTick();

      // Clicking the first menu item
      const firstMenuItem = component.shadowRoot.querySelector(
        `${selectors.metricCategoryMenu} ${selectors.euiMenuItem}`,
      );
      firstMenuItem.click();
      await nextTick();

      // Verifying that the click event was handled properly
      expect(menuItem).to.deep.equal({
        label: dropdownData[0].label,
        value: dropdownData[0].value,
      });
    });
  });
});
