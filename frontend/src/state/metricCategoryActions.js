import isEqual from 'lodash/isEqual';
import uniqBy from 'lodash/uniqBy';
import uniq from 'lodash/uniq';

/**
 * This function returns the `Category` object that contains the provided category id as a name.
 *
 * @param {object} uiConfiguration  - The UI configuration object that comes from the /ui/configuration internal API endpoint.
 * @param {string} categoryId - The category id that will be matched against the `Category` objects.
 * @example "observability"
 * @returns {object} The `Category` object that contains the provided category id as a name.
 */
export const getMetricCategoryObject = (uiConfiguration, categoryId) =>
  uiConfiguration?.categories?.find((categoryObj) => categoryObj.name === categoryId);

/**
 * This function builds an array of metrics that are associated with the provided category.
 *
 * @param {MetricType[]} metricTypes - An array of `MetricType` objects.
 * @example [ { "id": "vd__tac_PartialDRBAccessibility", "name": "Partial DRB Accessibility", "valueType": "float", "description": "Description", "unit": "successes", "visualization": { "category": ["accessibility"], "group1": ["family1"], "group2": ["family2"], "query": "${metricName}{tac=~\"sn.*-4\"}", "groups": { "default": ["vd_tac_PartialDRBAccessibility"] } }, "dataType": "metricType" } ]
 * @param {string} categoryId - The category id that will be matched against the metric type objects.
 * @example "observability"
 * @returns {array} An array of metrics that are associated with the provided category.
 * @example [ { "id": "vd_tac_PartialDRBAccessibility", "name": "Partial DRB Accessibility" }, { "id": "vd_tac_DLUeThroughput", "name": "DLUeThroughput" } ]
 */
export const buildMetricsArrayFromCategory = (metricTypes, categoryId) =>
  metricTypes
    .filter((metricType) => metricType?.visualization?.category?.includes(categoryId))
    .map((metricType) => ({ id: metricType.id, name: metricType.name }));

/**
 * This function builds the array which is required to toggle column visibility via the
 * 'update-table-column-visibility' bubble event. The resulting array will contain the column
 * IDs that are expected to be visible.
 *
 * @param {array} metricCategories - An array of metric category objects.
 * @example [ { "id": "bb-category", "title": "Bb Category", "unselected": true, "metrics": [ { "id": "vd_tac_DLLat_gNB-DU", "name": "DLLat_gNB-DU" } ] } ]
 * @returns {array} An array of metric IDs, which are also column IDs.
 * @example ["vd_tac_DLDelay_gNBDU","vd_tac_DLUeThroughput","vd_tac_UlUeThroughput","vd_tac_GRANGOSR","vd_tac_5GSEPHOSR"]
 */
export const buildVisibleColumnsArray = (metricCategories) =>
  uniq(
    metricCategories
      .filter((categoryObj) => !categoryObj.unselected)
      .map((categoryObj) => categoryObj.metrics.map((kpi) => kpi.id))
      .flat(1),
  );

/**
 * This function sorts the metricCategories array, first based on selection status, and then alphabetically.
 * A metric category can be shown either within a Pill or as a MenuItem within a Dropdown menu, depending on
 * the values of the `viewAllSelected` and `maxPillCount` input arguments.
 *
 * @param {array} metricCategories - An array of metric category objects that will be sorted.
 * @example [ { "id": "bb-category", "title": "Bb Category", "unselected": true, "metrics": [ { "id": "vd_tac_DLLat_gNB-DU", "name": "DLLat_gNB-DU" } ] } ]
 * @param {boolean} viewAllSelected - A boolean which dictates whether all selected categories should be shown as Pills or not.
 * @param {number} maxPillCount - The max number of pills to show when viewAllSelected is equal to false.
 * @returns {array} A sorted metricCategories array.
 * @example [ { "id": "bb-category", "title": "Bb Category", "unselected": true, "metrics": [ { "id": "vd_tac_DLLat_gNB-DU", "name": "DLLat_gNB-DU" } ] } ]
 */
export const sortMetricCategories = (metricCategories, viewAllSelected, maxPillCount) => {
  // Separating the selected and unselected categories,
  // and then applying an alphabetical sort to each group.
  const selectedCategories = metricCategories
    .filter((categoryObj) => !categoryObj.unselected && categoryObj.id !== 'all')
    .sort((a, b) => a.title.localeCompare(b.title));
  const unselectedCategories = metricCategories
    .filter((categoryObj) => categoryObj.unselected && categoryObj.id !== 'all')
    .sort((a, b) => a.title.localeCompare(b.title));

  // Concatenating the selected and unselected category arrays, while also
  // putting the 'all' category in the first index of the resulting array.
  const sortedMetricCategories = [metricCategories[0]].concat(
    selectedCategories,
    unselectedCategories,
  );

  // If viewAllSelected is true, all selected categories will not be placed within the dropdown list.
  // Otherwise, all categories above a certain index will be placed within the dropdown list.
  return viewAllSelected
    ? sortedMetricCategories.map((categoryObj) =>
        !categoryObj.unselected || categoryObj.id === 'all'
          ? { ...categoryObj, dropdown: false }
          : { ...categoryObj, dropdown: true },
      )
    : sortedMetricCategories.map((categoryObj, index) =>
        index >= maxPillCount
          ? { ...categoryObj, dropdown: true }
          : { ...categoryObj, dropdown: false },
      );
};

/**
 * This function builds a brand new metric categories array from the browser metric types
 * and the UI configuration. All metric categories will be set to unselected, except for the `All` category.
 *
 * @param {MetricType[]} metricTypes - An array of `MetricType` objects.
 * @example [ { "id": "vd__tac_PartialDRBAccessibility", "name": "Partial DRB Accessibility", "valueType": "float", "description": "Description", "unit": "successes", "visualization": { "category": ["accessibility"], "group1": ["family1"], "group2": ["family2"], "query": "${metricName}{tac=~\"sn.*-4\"}", "groups": { "default": ["vd_tac_PartialDRBAccessibility"] } }, "dataType": "metricType" } ]
 * @param {object} uiConfiguration  - The UI configuration object that comes from the /ui/configuration internal API endpoint.
 * @returns {array} metricCategories - An array of metric category objects.
 * @example [ { "id": "bb-category", "title": "Bb Category", "unselected": true, "metrics": [ { "id": "vd_tac_DLLat_gNB-DU", "name": "DLLat_gNB-DU" } ] } ]
 */
export const initializeMetricCategories = (metricTypes, uiConfiguration) => {
  // Building a new metric categories array from the browser metric types and UI configuration.
  let metricCategories = [];
  metricTypes.forEach((metric) => {
    if (Array.isArray(metric?.visualization?.category)) {
      metric.visualization.category.forEach((categoryId) => {
        metricCategories.push({
          id: categoryId,
          title: getMetricCategoryObject(uiConfiguration, categoryId)?.title ?? categoryId,
          unselected: true,
          metrics: buildMetricsArrayFromCategory(metricTypes, categoryId),
        });
      });
    }
  });

  // Removing duplicate objects from the array of category objects
  metricCategories = uniqBy(metricCategories, 'title');

  // Adding the "All" category to the beginning of the array
  metricCategories.unshift({
    id: 'all',
    title: 'All',
    unselected: false,
    metrics: metricTypes.map((metricType) => ({ id: metricType.id, name: metricType.name })),
  });

  return metricCategories;
};

/**
 * Handler for 'update-browser-metric-categories' event
 *
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param {array} metricCategories - An array of metric category objects.
 * @default []
 * @example [ { "id": "bb-category", "title": "Bb Category", "unselected": true, "metrics": [ { "id": "vd_tac_DLLat_gNB-DU", "name": "DLLat_gNB-DU" } ] } ]
 */
export const updateBrowserMetricCategories = (
  { getState, getSubState, updateSubState },
  { metricCategories = [] },
) => {
  const browser = getSubState();
  const { metricTypes } = browser.context;
  const { configuration } = getState();

  // Building a new metricCategories array from the browser metric types.
  const newMetricCategories = initializeMetricCategories(metricTypes, configuration);

  /**
   * Need to check if this newMetricCategories array contains the same category IDs as the
   * metricCategories input argument.
   *
   * If they do, the initialized newMetricCategories array will not replace the
   * metricCategories state.
   *
   * If they do not, it's either a fresh web browser session or the UI configuration
   * has been changed. Either way, the newMetricCategories array will be applied.
   */
  const getIds = (metrics) => metrics.map((m) => m.id).sort();
  const getMetricCategories = () =>
    isEqual(getIds(metricCategories), getIds(newMetricCategories))
      ? metricCategories
      : newMetricCategories;

  const { viewAllSelected, maxPillCount } = browser.metricCategoryPickerData;
  metricCategories = sortMetricCategories(getMetricCategories(), viewAllSelected, maxPillCount);

  // Updating metricCategories state
  browser.metricCategoryPickerData.metricCategories = [...metricCategories];

  // Updating table column visibility
  const visibleColumns = buildVisibleColumnsArray(metricCategories);
  const { columns } = browser.context;
  if (columns) {
    columns.forEach((col) => {
      if (!col.type) {
        col.hidden = !visibleColumns.includes(col.attribute);
      }
    });
  }

  updateSubState(browser);
};

/**
 * Handler for 'toggle-metric-category-selection-state' event.
 * This function will toggle the `unselected` property of a specific metric category object.
 * The metric category object that is targetted is based upon the provided `categoryId` argument.
 * If the provided `categoryId` is invalid, the metricCategories array will not be changed.
 *
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param {string} categoryId - The category id of the metric category that will have
 * it's selection state toggled
 * @example "observability"
 */
export const toggleMetricCategorySelectionState = (
  { getState, getSubState, updateSubState },
  { categoryId },
) => {
  const browser = getSubState();
  const metricCategories = browser.metricCategoryPickerData.metricCategories ?? [];

  // Searching the metricCategories array for target metric category
  const categoryIndex = metricCategories.findIndex((categoryObj) => categoryObj.id === categoryId);
  if (categoryIndex !== -1) {
    // Toggling the `unselected` property of the metric category
    const unselected = !metricCategories[categoryIndex].unselected;
    const updatedMetricCategories = metricCategories;
    updatedMetricCategories[categoryIndex].unselected = unselected;

    // Some extra logic is required to implement situational rules.
    // NOTE: The 'all' category object is always the first element of the metricCategories array
    const isAllCategory = () => categoryIndex === 0;

    if (isAllCategory() && !unselected) {
      // The 'all' category has been selected, therefore every other category will be unselected
      updatedMetricCategories.forEach((categoryObj, index) => {
        if (categoryObj.id !== 'all') {
          updatedMetricCategories[index].unselected = true;
        }
      });
    } else if (!isAllCategory() && !unselected) {
      // Disabling the 'all' category because another category has been selected
      updatedMetricCategories[0].unselected = true;
    } else if (
      !updatedMetricCategories.some(
        (categoryObj) => categoryObj.id !== 'all' && !categoryObj.unselected,
      )
    ) {
      // Enabling the 'all' category because no other categories are currently selected
      updatedMetricCategories[0].unselected = false;
    }

    // Updating the metricCategories state variable
    updateBrowserMetricCategories(
      { getState, getSubState, updateSubState },
      { metricCategories: updatedMetricCategories },
    );
  }
};

/**
 * Handler for 'toggle-metric-categories-view-all-selected' event.
 * This function will toggle the viewAllSelected state of a browser's metric category picker.
 *
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 */
export const toggleMetricCategoriesViewAllSelected = ({ getSubState, updateSubState }) => {
  const browser = getSubState();
  browser.metricCategoryPickerData.viewAllSelected =
    !browser.metricCategoryPickerData.viewAllSelected;
  updateSubState(browser);
};
