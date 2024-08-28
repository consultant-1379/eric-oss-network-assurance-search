import { expect } from '@open-wc/testing';
import cloneDeep from 'lodash/cloneDeep';
import {
  getMetricCategoryObject,
  buildMetricsArrayFromCategory,
  buildVisibleColumnsArray,
  sortMetricCategories,
  initializeMetricCategories,
  updateBrowserMetricCategories,
  toggleMetricCategorySelectionState,
  toggleMetricCategoriesViewAllSelected,
} from '../../src/state/metricCategoryActions';

import appSubStateSkeleton from '../../mocks/state/metricCategoriesActions/appSubStateSkeleton.json';
import uiConfigurationSmall from '../../mocks/state/metricCategoriesActions/uiConfigurationSmall.json';
import uiConfigurationLarge from '../../mocks/state/metricCategoriesActions/uiConfigurationLarge.json';
import metricTypesSmall from '../../mocks/state/metricCategoriesActions/metricTypesSmall.json';
import metricTypesLarge from '../../mocks/state/metricCategoriesActions/metricTypesLarge.json';
import columnsSmall from '../../mocks/state/metricCategoriesActions/columnsSmall.json';
import columnsLarge from '../../mocks/state/metricCategoriesActions/columnsLarge.json';
import freshMetricCategoriesSmall from '../../mocks/state/metricCategoriesActions/freshMetricCategoriesSmall.json';
import freshMetricCategoriesLarge from '../../mocks/state/metricCategoriesActions/freshMetricCategoriesLarge.json';

// Importing mock data for sortMetricCategories tests
import unsortedMetricCategories1 from '../../mocks/state/metricCategoriesActions/sortMetricCategories/unsortedMetricCategories1.json';
import sortedMetricCategories1 from '../../mocks/state/metricCategoriesActions/sortMetricCategories/sortedMetricCategories1.json';
import unsortedMetricCategories2 from '../../mocks/state/metricCategoriesActions/sortMetricCategories/unsortedMetricCategories2.json';
import sortedMetricCategories2 from '../../mocks/state/metricCategoriesActions/sortMetricCategories/sortedMetricCategories2.json';
import sortedMetricCategories3 from '../../mocks/state/metricCategoriesActions/sortMetricCategories/sortedMetricCategories3.json';
import unsortedMetricCategories4 from '../../mocks/state/metricCategoriesActions/sortMetricCategories/unsortedMetricCategories4.json';
import sortedMetricCategories4 from '../../mocks/state/metricCategoriesActions/sortMetricCategories/sortedMetricCategories4.json';

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

const sortExpectedMetricCategories = (subState, metricCategories) => {
  const { viewAllSelected, maxPillCount } = subState.metricCategoryPickerData;
  return sortMetricCategories(metricCategories, viewAllSelected, maxPillCount);
};

describe('Metric category actions tests', () => {
  describe('getMetricCategoryObject tests', () => {
    it('should return the proper category object based on a provided category ID', async () => {
      const expectedCategoryObject = { name: 'category-1', title: 'Category A' };
      const actualCategoryObject = getMetricCategoryObject(
        uiConfigurationSmall,
        expectedCategoryObject.name,
      );
      expect(actualCategoryObject).to.deep.equal(expectedCategoryObject);
    });

    it('should return `undefined` when a category ID that does not exist is provided as an input argument', async () => {
      const actualCategoryObject = getMetricCategoryObject(
        uiConfigurationSmall,
        'undefined-category',
      );
      expect(actualCategoryObject).to.deep.equal(undefined);
    });
  });

  describe('buildMetricsArrayFromCategory tests', () => {
    it('should return a valid metrics array based on a provided category ID', async () => {
      const categoryId = 'category-1';
      const expectedMetricsArray = [
        {
          id: 'vi_nf_MetricOne',
          name: 'MetricOne',
        },
        {
          id: 'vi_nf_MetricNine',
          name: 'MetricNine',
        },
      ];
      const actualMetricsArray = buildMetricsArrayFromCategory(metricTypesLarge, categoryId);
      expect(actualMetricsArray).to.deep.equal(expectedMetricsArray);
    });

    it('should return an empty array when an invalid category ID is provided as an input argument', async () => {
      const categoryId = 'invalidId';
      const actualMetricsArray = buildMetricsArrayFromCategory(metricTypesLarge, categoryId);
      expect(actualMetricsArray).to.deep.equal([]);
    });
  });

  describe('buildVisibleColumnsArray tests', () => {
    const baseMetricCategories = [
      {
        unselected: true,
        metrics: [
          {
            id: 'metric_1',
          },
          {
            id: 'metric_2',
          },
          {
            id: 'metric_3',
          },
          {
            id: 'metric_4',
          },
          {
            id: 'metric_5',
          },
          {
            id: 'metric_6',
          },
        ],
      },
      {
        unselected: true,
        metrics: [
          {
            id: 'metric_1',
          },
          {
            id: 'metric_2',
          },
        ],
      },
      {
        unselected: true,
        metrics: [
          {
            id: 'metric_3',
          },
          {
            id: 'metric_4',
          },
        ],
      },
      {
        unselected: true,
        metrics: [
          {
            id: 'metric_5',
          },
          {
            id: 'metric_6',
          },
        ],
      },
    ];

    it('should return an empty array when no metric categories are selected', async () => {
      const actual = buildVisibleColumnsArray(baseMetricCategories);
      expect(actual).to.deep.equal([]);
    });

    it('should return an array of column IDs corresponding to the one selected metric category', async () => {
      const metricCategories = cloneDeep(baseMetricCategories);
      metricCategories[1].unselected = false;
      const expected = ['metric_1', 'metric_2'];
      const actual = buildVisibleColumnsArray(metricCategories);
      expect(actual).to.deep.equal(expected);
    });

    it('should return an array of column IDs corresponding to the multiple selected metric categories', async () => {
      const metricCategories = cloneDeep(baseMetricCategories);
      metricCategories[1].unselected = false;
      metricCategories[3].unselected = false;
      const expected = ['metric_1', 'metric_2', 'metric_5', 'metric_6'];
      const actual = buildVisibleColumnsArray(metricCategories);
      expect(actual).to.deep.equal(expected);
    });

    it('should return an array of column IDs corresponding to the multiple selected metric categories without any duplicates', async () => {
      const metricCategories = cloneDeep(baseMetricCategories);
      metricCategories[1].unselected = false;
      metricCategories[3].unselected = false;
      metricCategories[0].unselected = false;
      const expected = ['metric_1', 'metric_2', 'metric_3', 'metric_4', 'metric_5', 'metric_6'];
      const actual = buildVisibleColumnsArray(metricCategories);
      expect(actual).to.deep.equal(expected);
    });

    it('should return an empty array when an empty array is passed in as an input argument', async () => {
      const actual = buildVisibleColumnsArray([]);
      expect(actual).to.deep.equal([]);
    });
  });

  describe('sortMetricCategories tests', () => {
    const maxPillCount = 2;

    it(`should sort an array of metric categories properly when one category is selected, 'viewAllSelected' is false, and 'maxPillCount' is ${maxPillCount}`, async () => {
      const actual = sortMetricCategories(unsortedMetricCategories1, false, maxPillCount);
      expect(actual).to.deep.equal(sortedMetricCategories1);
    });

    it(`should sort an array of metric categories properly when many categories are selected, 'viewAllSelected' is false, and 'maxPillCount' is ${maxPillCount}`, async () => {
      const actual = sortMetricCategories(unsortedMetricCategories2, false, maxPillCount);
      expect(actual).to.deep.equal(sortedMetricCategories2);
    });

    it(`should sort an array of metric categories properly when many categories are selected, 'viewAllSelected' is true, and 'maxPillCount' is ${maxPillCount}`, async () => {
      const actual = sortMetricCategories(unsortedMetricCategories2, true, maxPillCount);
      expect(actual).to.deep.equal(sortedMetricCategories3);
    });

    it(`should sort an array of metric categories properly when some categories are selected, 'viewAllSelected' is true, and 'maxPillCount' is ${maxPillCount}`, async () => {
      const actual = sortMetricCategories(unsortedMetricCategories4, true, maxPillCount);
      expect(actual).to.deep.equal(sortedMetricCategories4);
    });
  });

  describe('initializeMetricCategories tests', () => {
    it('should return a fresh metric categories array when given an array of metric types and a UI configuration object', async () => {
      const actual = initializeMetricCategories(metricTypesSmall, uiConfigurationSmall);
      expect(actual).to.deep.equal(freshMetricCategoriesSmall);
    });

    it("should return only the 'all' category when an empty array is provided as metric types", async () => {
      const expected = [
        {
          id: 'all',
          title: 'All',
          unselected: false,
          metrics: [],
        },
      ];
      const actual = initializeMetricCategories([], uiConfigurationSmall);
      expect(actual).to.deep.equal(expected);
    });

    it("should return only the 'all' category when the metricTypes do not have any customization applied to them.", async () => {
      // Building metricTypes for this test by removing customization data for all metric types
      const metricTypes = metricTypesSmall.map((metricType) => ({
        ...metricType,
        visualization: { groups: metricType.visualization.groups },
      }));
      const actual = initializeMetricCategories(metricTypes, uiConfigurationSmall);
      expect(actual).to.deep.equal([freshMetricCategoriesSmall[0]]);
    });

    it("should return the 'all' category and one other category when the metricTypes only have this one customization category applied.", async () => {
      // Building metricTypes for this test by removing customization data for all metric types except one
      const metricTypes = metricTypesSmall.map((metricType) =>
        metricType.id === 'vi_nf_MetricTwo'
          ? metricType
          : {
              ...metricType,
              visualization: { groups: metricType.visualization.groups },
            },
      );
      const actual = initializeMetricCategories(metricTypes, uiConfigurationSmall);
      expect(actual).to.deep.equal([
        freshMetricCategoriesSmall.find((obj) => obj.id === 'all'),
        freshMetricCategoriesSmall.find((obj) => obj.id === 'category-3'),
        freshMetricCategoriesSmall.find((obj) => obj.id === 'category-4'),
      ]);
    });

    it('should return the a category with the same `id` and `title` property when the category id is invalid (does not map to a category within the customization object).', async () => {
      // Building metricTypes for this test by removing customization data for all metric types except one
      // which will have an invalid category
      const metricTypes = metricTypesSmall.map((metricType) => ({
        ...metricType,
        visualization: { groups: metricType.visualization.groups },
      }));
      /* eslint-disable no-template-curly-in-string */
      metricTypes[1].visualization = {
        category: ['INVALID_CATEGORY_1'],
        query: '${metricName}{nf=~"sn.*-4"}',
        group1: ['family1'],
        group2: ['family2'],
        groups: {
          default: ['vi_nf_MetricTwo'],
        },
      };
      /* eslint-enable no-template-curly-in-string */

      const expectedInvalidCategory = {
        id: 'INVALID_CATEGORY_1',
        title: 'INVALID_CATEGORY_1',
        unselected: true,
        metrics: [
          {
            id: 'vi_nf_MetricTwo',
            name: 'MetricTwo',
          },
        ],
      };
      const actual = initializeMetricCategories(metricTypes, uiConfigurationSmall);
      expect(actual).to.deep.equal([
        freshMetricCategoriesSmall.find((obj) => obj.id === 'all'),
        expectedInvalidCategory,
      ]);
    });
  });

  describe('updateBrowserMetricCategories tests', () => {
    beforeEach(() => {
      appSubState = {};
    });

    it('should update the metric categories state with the provided metric categories array and not with a fresh version', async () => {
      // Building initial app substate
      const initialAppSubState = buildAppSubState(metricTypesSmall, columnsSmall);

      // Building state accessor based on initial app substate
      const stateAccessor = buildSubStateAccessor(initialAppSubState, uiConfigurationSmall);

      // Building metric categories array where one non-'all' category is selected
      const metricCategories = cloneDeep(freshMetricCategoriesSmall);
      metricCategories[0].unselected = true;
      metricCategories[1].unselected = false;

      // Building expected metric categories
      const expectedMetricCategories = sortExpectedMetricCategories(
        initialAppSubState,
        metricCategories,
      );

      updateBrowserMetricCategories(stateAccessor, {
        metricCategories,
      });

      expect(appSubState.metricCategoryPickerData.metricCategories).to.deep.equal(
        expectedMetricCategories,
      );
    });

    it('should update the state with a fresh metric categories array when the provided metric categories have different category IDs than the fresh version', async () => {
      // Building initial app substate
      const initialAppSubState = buildAppSubState(metricTypesLarge, columnsLarge);

      // Building state accessor based on initial app substate
      const stateAccessor = buildSubStateAccessor(initialAppSubState, uiConfigurationLarge);

      // Building metric categories array where one non-'all' category is selected
      const metricCategories = cloneDeep(freshMetricCategoriesSmall);
      metricCategories[0].unselected = true;
      metricCategories[1].unselected = false;

      // Building expected metric categories
      const expectedMetricCategories = sortExpectedMetricCategories(
        initialAppSubState,
        freshMetricCategoriesLarge,
      );

      updateBrowserMetricCategories(stateAccessor, {
        metricCategories,
      });
      expect(appSubState.metricCategoryPickerData.metricCategories).to.deep.equal(
        expectedMetricCategories,
      );
    });

    it('should update the state with a fresh metric categories array when the provided metric categories array is undefined', async () => {
      // Building initial app substate
      const initialAppSubState = buildAppSubState(metricTypesSmall, columnsSmall);

      // Building state accessor based on initial app substate
      const stateAccessor = buildSubStateAccessor(initialAppSubState, uiConfigurationSmall);

      // Building expected metric categories
      const expectedMetricCategories = sortExpectedMetricCategories(
        initialAppSubState,
        freshMetricCategoriesSmall,
      );

      updateBrowserMetricCategories(stateAccessor, { metricCategories: undefined });
      expect(appSubState.metricCategoryPickerData.metricCategories).to.deep.equal(
        expectedMetricCategories,
      );
    });

    it('should update the state with a fresh metric categories array when an empty metric categories array is provided', async () => {
      // Building initial app substate
      const initialAppSubState = buildAppSubState(metricTypesSmall, columnsSmall);

      // Building state accessor based on initial app substate
      const stateAccessor = buildSubStateAccessor(initialAppSubState, uiConfigurationSmall);

      // Building expected metric categories
      const expectedMetricCategories = sortExpectedMetricCategories(
        initialAppSubState,
        freshMetricCategoriesSmall,
      );

      updateBrowserMetricCategories(stateAccessor, { metricCategories: [] });
      expect(appSubState.metricCategoryPickerData.metricCategories).to.deep.equal(
        expectedMetricCategories,
      );
    });
  });

  describe('toggleMetricCategorySelectionState tests', () => {
    beforeEach(() => {
      appSubState = {};
    });

    // Testing the scenario when a non-'all' category has been selected, and therefore the 'all' category needs to be unselected
    it("should toggle the unselected state of a category from `true` to `false` while doing the opposite to the 'all' category", async () => {
      // Building initial app substate
      const initialAppSubState = buildAppSubState(
        metricTypesSmall,
        columnsSmall,
        freshMetricCategoriesSmall,
      );

      // Building state accessor based on initial app substate
      const stateAccessor = buildSubStateAccessor(initialAppSubState, uiConfigurationSmall);
      toggleMetricCategorySelectionState(stateAccessor, {
        categoryId: 'category-8',
      });

      // Building expected metric categories
      let expectedMetricCategories = cloneDeep(freshMetricCategoriesSmall);
      expectedMetricCategories[0].unselected = true;
      expectedMetricCategories[expectedMetricCategories.length - 1].unselected = false;
      expectedMetricCategories = sortExpectedMetricCategories(
        initialAppSubState,
        expectedMetricCategories,
      );

      expect(appSubState.metricCategoryPickerData.metricCategories).to.deep.equal(
        expectedMetricCategories,
      );
    });

    // Doing the reverse of the previous test
    // Testing the scenario when the 'all' category has been selected, and therefore every other category will be unselected
    it("should toggle the unselected state of the 'all' category from `true` to `false` and set the unselected state of every other category to `true`", async () => {
      // Building the initial metric categories
      const initialMetricCategories = cloneDeep(freshMetricCategoriesSmall);
      initialMetricCategories[0].unselected = true;
      initialMetricCategories[initialMetricCategories.length - 1].unselected = false;

      // Building initial app substate
      const initialAppSubState = buildAppSubState(
        metricTypesSmall,
        columnsSmall,
        initialMetricCategories,
      );

      // Building state accessor based on initial app substate
      const stateAccessor = buildSubStateAccessor(initialAppSubState, uiConfigurationSmall);
      toggleMetricCategorySelectionState(stateAccessor, {
        categoryId: 'all',
      });

      // Building expected metric categories
      const expectedMetricCategories = sortExpectedMetricCategories(
        initialAppSubState,
        freshMetricCategoriesSmall,
      );

      expect(appSubState.metricCategoryPickerData.metricCategories).to.deep.equal(
        expectedMetricCategories,
      );
    });

    // Testing the scenario when the 'all' category's unselected state is set to `false` because no other categories have an unselected state of `false`
    it("should toggle the unselected state of the 'all' category from `true` to `false` because no other category has their unselected state set to `false`", async () => {
      // Building the initial metric categories
      const initialMetricCategories = cloneDeep(freshMetricCategoriesSmall);
      initialMetricCategories[0].unselected = true;
      initialMetricCategories[initialMetricCategories.length - 1].unselected = false;

      // Building initial app substate
      const initialAppSubState = buildAppSubState(
        metricTypesSmall,
        columnsSmall,
        initialMetricCategories,
      );

      // Building state accessor based on initial app substate
      const stateAccessor = buildSubStateAccessor(initialAppSubState, uiConfigurationSmall);
      toggleMetricCategorySelectionState(stateAccessor, {
        categoryId: 'category-8',
      });

      // Building expected metric categories
      const expectedMetricCategories = sortExpectedMetricCategories(
        initialAppSubState,
        freshMetricCategoriesSmall,
      );

      expect(appSubState.metricCategoryPickerData.metricCategories).to.deep.equal(
        expectedMetricCategories,
      );
    });

    it('should not change the unselected state of any categories when an invalid category ID is provided', async () => {
      // Building initial app substate
      const initialAppSubState = buildAppSubState(
        metricTypesSmall,
        columnsSmall,
        null, // Also testing that the function handles a null value for metric categories.
      );

      // Building state accessor based on initial app substate
      const stateAccessor = buildSubStateAccessor(initialAppSubState, uiConfigurationSmall);
      toggleMetricCategorySelectionState(stateAccessor, {
        categoryId: 'invalid-id',
      });

      // Expecting the app state not to be updated, and in this testing context,
      // that means it remains as an empty object.
      expect(appSubState).to.deep.equal({});
    });
  });

  describe('toggleMetricCategoriesViewAllSelected tests', () => {
    beforeEach(() => {
      appSubState = {};
    });

    it('should toggle the viewAllSelected state from `false` to `true`', async () => {
      const stateAccessor = buildSubStateAccessor(appSubStateSkeleton);
      toggleMetricCategoriesViewAllSelected(stateAccessor);
      expect(appSubState.metricCategoryPickerData.viewAllSelected).to.equal(true);
    });

    it('should toggle the viewAllSelected state from `true` to `false`', async () => {
      const initialSubState = cloneDeep(appSubStateSkeleton);
      initialSubState.metricCategoryPickerData.viewAllSelected = true;
      const stateAccessor = buildSubStateAccessor(initialSubState);
      toggleMetricCategoriesViewAllSelected(stateAccessor);
      expect(appSubState.metricCategoryPickerData.viewAllSelected).to.equal(false);
    });
  });
});
