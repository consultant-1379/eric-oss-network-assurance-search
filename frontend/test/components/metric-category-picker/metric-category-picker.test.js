import { expect, fixture, html } from '@open-wc/testing';
import { ifDefined } from '@eui/lit-component';
import cloneDeep from 'lodash/cloneDeep';
import { isRendered } from '../../utils/isRendered.js';
import { nextTick } from '../../utils/utils.js';
import MetricCategoryPicker from '../../../src/components/metric-category-picker/metric-category-picker.js';

// Importing state actions
import {
  sortMetricCategories,
  updateBrowserMetricCategories,
  toggleMetricCategorySelectionState,
  toggleMetricCategoriesViewAllSelected,
} from '../../../src/state/metricCategoryActions.js';

// Importing mock data
import appSubStateSkeleton from '../../../mocks/state/metricCategoriesActions/appSubStateSkeleton.json';
import uiConfigurationSmall from '../../../mocks/state/metricCategoriesActions/uiConfigurationSmall.json';
import uiConfigurationLarge from '../../../mocks/state/metricCategoriesActions/uiConfigurationLarge.json';
import metricTypesSmall from '../../../mocks/state/metricCategoriesActions/metricTypesSmall.json';
import metricTypesLarge from '../../../mocks/state/metricCategoriesActions/metricTypesLarge.json';
import columnsSmall from '../../../mocks/state/metricCategoriesActions/columnsSmall.json';
import columnsLarge from '../../../mocks/state/metricCategoriesActions/columnsLarge.json';
import freshMetricCategoriesSmall from '../../../mocks/state/metricCategoriesActions/freshMetricCategoriesSmall.json';
import freshMetricCategoriesLarge from '../../../mocks/state/metricCategoriesActions/freshMetricCategoriesLarge.json';

const strings = {
  viewAllSelected: 'View all Selected',
  viewLessSelected: 'View less Selected',
  unselectedPillAttribute: 'unselected',
};

const selectors = {
  metricCategoryDropdown: 'e-metric-category-dropdown',
  metricCategoryMenu: 'e-metric-category-menu',
  euiMenuItem: 'eui-menu-item',
  metricCategoryPickerViewOptionsLink: '.metric-category-picker-view-options-link',
  metricCategoryPill: 'e-metric-category-pill',
  menuButton: '.menu-button',
};

const buildAppSubState = (metricTypes, columns, metricCategories = []) => {
  const subState = cloneDeep(appSubStateSkeleton);
  subState.context.metricTypes = cloneDeep(metricTypes);
  subState.context.columns = cloneDeep(columns);
  subState.metricCategoryPickerData.metricCategories = cloneDeep(metricCategories);
  return subState;
};

/* App SubState Accessor */
let appSubState = {};
const buildSubStateAccessor = (initialSubState, uiConfiguration = {}) => ({
  getState: () => ({
    configuration: cloneDeep(uiConfiguration),
  }),
  getSubState: () => cloneDeep(initialSubState),
  updateSubState(s) {
    appSubState = { ...s };
  },
});

const setNCategoriesToSelectedState = (n, metricCategories) => {
  let count = 0;
  return metricCategories.map((categoryObj) => {
    if (count < n && categoryObj.id !== 'all') {
      count += 1;
      return { ...categoryObj, unselected: false };
    }
    if (categoryObj.id === 'all') {
      return { ...categoryObj, unselected: true };
    }
    return categoryObj;
  });
};

let updateEventData;
const handleUpdateEvent = (event) => {
  updateEventData = event.detail;
};

let toggleSelectionEventData;
const handleToggleSelectionEvent = (event) => {
  toggleSelectionEventData = event.detail;
};

const handleToggleViewAllSelectedEvent = async () => {
  const stateAccessor = buildSubStateAccessor(appSubState);
  toggleMetricCategoriesViewAllSelected(stateAccessor);
};

const renderContainer = async ({ metricCategories, viewAllSelected, maxPillCount }) => {
  const metricCategoryPickerTemplate = await html`
    <e-metric-category-picker
      .metricCategories=${ifDefined(metricCategories)}
      .viewAllSelected=${ifDefined(viewAllSelected)}
      .maxPillCount=${ifDefined(maxPillCount)}
      @update-browser-metric-categories=${handleUpdateEvent}
      @toggle-metric-category-selection-state=${handleToggleSelectionEvent}
      @toggle-metric-categories-view-all-selected=${handleToggleViewAllSelectedEvent}
    ></e-metric-category-picker>
  `;
  const element = await fixture(metricCategoryPickerTemplate);
  await isRendered(element);
  return element;
};

const getAllPillElements = (component) =>
  component.shadowRoot.querySelectorAll(selectors.metricCategoryPill);

const clickMetricCategory = async (
  component,
  metricCategoryElement,
  startingSubState,
  uiConfiguration,
) => {
  metricCategoryElement.click();
  await nextTick();

  // Expecting the 'toggle-metric-category-selection-state' event to have been triggered
  const stateAccessor = buildSubStateAccessor(startingSubState, uiConfiguration);
  toggleMetricCategorySelectionState(stateAccessor, toggleSelectionEventData);
  component.metricCategories = appSubState.metricCategoryPickerData.metricCategories;
  await nextTick();
};

const clickViewSelectedLink = async (component, linkElement, startingSubState, uiConfiguration) => {
  linkElement.click();
  await nextTick();

  // Expecting the 'toggle-metric-categories-view-all-selected' event to have been triggered
  let stateAccessor = buildSubStateAccessor(startingSubState);
  toggleMetricCategoriesViewAllSelected(stateAccessor);
  component.viewAllSelected = appSubState.metricCategoryPickerData.viewAllSelected;
  await nextTick();

  // Expecting the 'update-browser-metric-categories' event to have been triggered
  stateAccessor = buildSubStateAccessor(appSubState, uiConfiguration);
  updateBrowserMetricCategories(stateAccessor, updateEventData);
  component.metricCategories = appSubState.metricCategoryPickerData.metricCategories;
  await nextTick();
};

describe('MetricCategoryPicker Component Tests', () => {
  const baseProps = {
    viewAllSelected: false,
    maxPillCount: 10,
  };

  before(() => {
    MetricCategoryPicker.register();
  });

  describe('Basic component setup', () => {
    it('should render <e-metric-category-picker>', async () => {
      const component = await fixture('<e-metric-category-picker></e-metric-category-picker>');
      expect(component).to.exist;
    });
  });

  describe('Component rendering', () => {
    beforeEach(() => {
      appSubState = {};
      updateEventData = undefined;
      toggleSelectionEventData = undefined;
    });

    it("should render with the correct number of category pills and the first pill should be the selected 'all' pill", async () => {
      const component = await renderContainer({
        ...baseProps,
        metricCategories: freshMetricCategoriesSmall,
      });

      // Verifying that the correct number of pills were rendered
      const allPillElements = getAllPillElements(component);
      expect(allPillElements.length).to.equal(freshMetricCategoriesSmall.length);

      // Verifying that the first pill is the 'all' pill and that it's selected
      const firstPill = component.shadowRoot.querySelector(selectors.metricCategoryPill);
      expect(firstPill.getAttribute('id')).to.equal('all');
      expect(firstPill.getAttributeNames().includes(strings.unselectedPillAttribute)).to.equal(
        false,
      );
    });

    it('should render with a dropdown menu when there are more categories than the max pill count allowed', async () => {
      const metricCategories = sortMetricCategories(
        freshMetricCategoriesLarge,
        baseProps.viewAllSelected,
        baseProps.maxPillCount,
      );
      const component = await renderContainer({
        ...baseProps,
        metricCategories,
      });
      const dropdown = component.shadowRoot.querySelector(selectors.metricCategoryDropdown);
      expect(dropdown).to.exist;
    });

    it("should handle a pill click properly (a non-'all' pill) and the proceeding unselection click", async () => {
      // Building initial app sub state
      const initialSubState = buildAppSubState(
        metricTypesSmall,
        columnsSmall,
        freshMetricCategoriesSmall,
      );

      const component = await renderContainer({
        ...baseProps,
        metricCategories: initialSubState.metricCategoryPickerData.metricCategories,
      });
      const allPillElements = getAllPillElements(component);

      // Clicking the last pill in the list
      const lastPill = allPillElements[allPillElements.length - 1];
      const targetPillLabel = lastPill.textContent.trim();
      await clickMetricCategory(component, lastPill, initialSubState, uiConfigurationSmall);

      // Verifying that the clicked pill was moved to the second position and that it's selected

      const secondPill = getAllPillElements(component)[1];
      expect(secondPill.textContent.trim()).to.equal(targetPillLabel);
      expect(secondPill.getAttributeNames().includes(strings.unselectedPillAttribute)).to.equal(
        false,
      );

      // Verifying that the first pill is still the 'all' pill and that it is not selected.
      const firstPill = getAllPillElements(component)[0];
      expect(firstPill.getAttribute('id')).to.equal('all');
      expect(firstPill.getAttributeNames().includes(strings.unselectedPillAttribute)).to.equal(
        true,
      );

      // Clicking selected pill to unselect it
      await clickMetricCategory(component, secondPill, appSubState, uiConfigurationSmall);

      // Verifying that the clicked pill was moved to the last position and that it's unselected
      expect(lastPill.textContent.trim()).to.equal(targetPillLabel);
      expect(lastPill.getAttributeNames().includes(strings.unselectedPillAttribute)).to.equal(true);
    });

    // Note: The 'all' pill will always remain visible, even when it is not selected, and therefore counts as one of the pills
    it(`should have a '${strings.viewAllSelected}' link shown when the number of selected categories is equal to the max pill count allowed`, async () => {
      // Building initial metricCategories array
      const metricCategories = sortMetricCategories(
        setNCategoriesToSelectedState(baseProps.maxPillCount, freshMetricCategoriesLarge),
        baseProps.viewAllSelected,
        baseProps.maxPillCount,
      );

      const component = await renderContainer({
        ...baseProps,
        metricCategories,
      });

      // Verifying that the 'View all Selected' link is visible
      const linkElement = component.shadowRoot.querySelector(
        selectors.metricCategoryPickerViewOptionsLink,
      );
      expect(linkElement.textContent.trim()).to.equal(strings.viewAllSelected);
    });

    // Note: The 'all' pill will always remain visible, even when it is not selected, and therefore counts as one of the pills
    it(`should not have a '${strings.viewAllSelected}' link shown when the number of selected categories is one less than the max pill count allowed`, async () => {
      // Building initial metricCategories array
      const metricCategories = sortMetricCategories(
        setNCategoriesToSelectedState(baseProps.maxPillCount - 1, freshMetricCategoriesLarge),
        baseProps.viewAllSelected,
        baseProps.maxPillCount,
      );

      const component = await renderContainer({
        ...baseProps,
        metricCategories,
      });

      // Verifying that the 'View all Selected' link is not visible
      const linkElement = component.shadowRoot.querySelector(
        selectors.metricCategoryPickerViewOptionsLink,
      );
      expect(linkElement).to.not.exist;
    });

    it(`should show all selected pills when the '${strings.viewAllSelected}' link is clicked`, async () => {
      const numberOfSelectedCategories = baseProps.maxPillCount + 5;
      // Building initial metricCategories array
      const metricCategories = sortMetricCategories(
        setNCategoriesToSelectedState(numberOfSelectedCategories, freshMetricCategoriesLarge),
        baseProps.viewAllSelected,
        baseProps.maxPillCount,
      );
      // Building initial app sub state
      const initialSubState = buildAppSubState(metricTypesLarge, columnsLarge, metricCategories);
      const component = await renderContainer({
        ...baseProps,
        metricCategories: initialSubState.metricCategoryPickerData.metricCategories,
      });

      const linkElement = component.shadowRoot.querySelector(
        selectors.metricCategoryPickerViewOptionsLink,
      );
      // Clicking link element
      await clickViewSelectedLink(component, linkElement, initialSubState, uiConfigurationLarge);

      // Verifying that the number of pills shown equals the number of selected categories + 1
      // (the 'all' category is always visible at the front)
      const allPillElements = getAllPillElements(component);
      expect(allPillElements.length).to.equal(numberOfSelectedCategories + 1);
    });

    it(`should have a '${strings.viewLessSelected}' link shown when more than 10 pills are being shown`, async () => {
      const numberOfSelectedCategories = baseProps.maxPillCount + 5;
      // Building initial metricCategories array
      const metricCategories = sortMetricCategories(
        setNCategoriesToSelectedState(numberOfSelectedCategories, freshMetricCategoriesLarge),
        !baseProps.viewAllSelected,
        baseProps.maxPillCount,
      );
      const component = await renderContainer({
        metricCategories,
        viewAllSelected: true,
        maxPillCount: baseProps.maxPillCount,
      });

      const linkElement = component.shadowRoot.querySelector(
        selectors.metricCategoryPickerViewOptionsLink,
      );
      // Verifying that the 'View less Selected' link is visible
      expect(linkElement.textContent.trim()).to.equal(strings.viewLessSelected);
    });

    it(`should reduce the number of visible pills to the set maximum when the '${strings.viewLessSelected}' link is clicked`, async () => {
      const numberOfSelectedCategories = baseProps.maxPillCount + 5;

      // Building initial metricCategories array
      const metricCategories = sortMetricCategories(
        setNCategoriesToSelectedState(numberOfSelectedCategories, freshMetricCategoriesLarge),
        !baseProps.viewAllSelected,
        baseProps.maxPillCount,
      );

      // Building initial app sub state
      const initialSubState = buildAppSubState(metricTypesLarge, columnsLarge, metricCategories);
      initialSubState.metricCategoryPickerData.viewAllSelected = true;

      const component = await renderContainer({
        metricCategories: initialSubState.metricCategoryPickerData.metricCategories,
        viewAllSelected: true,
        maxPillCount: baseProps.maxPillCount,
      });

      const linkElement = component.shadowRoot.querySelector(
        selectors.metricCategoryPickerViewOptionsLink,
      );
      // Verifying that the 'View less Selected' link is visible
      expect(linkElement.textContent.trim()).to.equal(strings.viewLessSelected);
      // Verifying that there are more visible pills than the set maximum
      expect(getAllPillElements(component).length > baseProps.maxPillCount).to.equal(true);

      // Clicking link element
      await clickViewSelectedLink(component, linkElement, initialSubState, uiConfigurationLarge);

      // Verifying that the number of visible pills is now equal to the set maximum
      expect(getAllPillElements(component).length).to.equal(baseProps.maxPillCount);
    });

    it('should reset the `viewAllSelected` state boolean to false when enough pills are deselected while the `viewAllSelected` state boolean is set to true', async () => {
      const numberOfSelectedCategories = baseProps.maxPillCount + 5;
      // Building initial metricCategories array
      const metricCategories = sortMetricCategories(
        setNCategoriesToSelectedState(numberOfSelectedCategories, freshMetricCategoriesLarge),
        !baseProps.viewAllSelected,
        baseProps.maxPillCount,
      );

      // Building initial app sub state
      const initialSubState = buildAppSubState(metricTypesLarge, columnsLarge, metricCategories);
      initialSubState.metricCategoryPickerData.viewAllSelected = true;
      const component = await renderContainer({
        metricCategories: initialSubState.metricCategoryPickerData.metricCategories,
        viewAllSelected: initialSubState.metricCategoryPickerData.viewAllSelected,
        maxPillCount: baseProps.maxPillCount,
      });

      /* eslint-disable no-await-in-loop */
      // Deselecting all Pills in reverse order
      appSubState = initialSubState;
      for (let i = numberOfSelectedCategories - 1; i > 0; i -= 1) {
        const allPillElements = getAllPillElements(component);
        const pillElement = allPillElements[i];
        await clickMetricCategory(component, pillElement, appSubState, uiConfigurationLarge);
        component.viewAllSelected = appSubState.metricCategoryPickerData.viewAllSelected;
      }
      /* eslint-enable no-await-in-loop */

      // Expecting the viewAllSelected state boolean to have been reset to false
      expect(component.viewAllSelected).to.equal(false);
    });

    it('should handle a dropdown category click properly', async () => {
      // Building initial metricCategories array
      const metricCategories = sortMetricCategories(
        freshMetricCategoriesLarge,
        baseProps.viewAllSelected,
        baseProps.maxPillCount,
      );

      // Building initial app sub state
      const initialSubState = buildAppSubState(metricTypesLarge, columnsLarge, metricCategories);

      const component = await renderContainer({
        ...baseProps,
        metricCategories: initialSubState.metricCategoryPickerData.metricCategories,
      });

      // Verifying that the dropdown exists
      const dropdown = component.shadowRoot.querySelector(selectors.metricCategoryDropdown);
      expect(dropdown).to.exist;

      // Opening dropdown menu
      const dropdownButton = dropdown.shadowRoot.querySelector(selectors.menuButton);
      dropdownButton.click();
      await nextTick();

      // Clicking the first category in the dropdown list.
      const dropdownMenu = dropdown.shadowRoot.querySelector(selectors.metricCategoryMenu);
      const allDropdownMenuItems = dropdownMenu.querySelectorAll(selectors.euiMenuItem);
      const firstMenuItem = allDropdownMenuItems[0];
      const firstMenuItemLabel = firstMenuItem.label;
      await clickMetricCategory(component, firstMenuItem, initialSubState, uiConfigurationLarge);

      // Verifying that the clicked menu item was moved to the second pill position and that it's selected
      const allPillElements = getAllPillElements(component);
      const secondPill = allPillElements[1];
      expect(secondPill.textContent.trim()).to.equal(firstMenuItemLabel);
      expect(secondPill.getAttributeNames().includes(strings.unselectedPillAttribute)).to.equal(
        false,
      );
    });
  });
});
