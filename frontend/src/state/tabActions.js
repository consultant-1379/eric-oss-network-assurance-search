import { uuid } from '../utils/helper.js';
import { setTableData } from './tableActions.js';
import { createContextFiltersFromRowAction } from './filterActions';
import { DEFAULT_METRIC_BROWSER, NEW_TAB_SETTINGS } from './constants.js';
import {
  makeBrowser,
  createSearchParams,
  encodeSerializedParams,
  serializeParams,
} from '../services/assurance/search.js';
import { replaceURLSearchParams } from '../utils/url.js';
import { dashboardModel } from '../services/historicalDashboard/dashboardGenerator.js';
import getVisualizationDirectives from '../services/historicalDashboard/getVisualizationDirectives.js';
import CONSTANTS from '../utils/constants.js';

/**
 * Handler for 'init-browser' event
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 */
export const createInitialBrowser = ({ getState, updateState }) => {
  const state = getState();
  if (state.browsers.length === 0) {
    state.browsers.push({
      id: uuid(),
      ...DEFAULT_METRIC_BROWSER,
      ...NEW_TAB_SETTINGS,
      context: state.contexts[0],
      relationActions: state.contexts[0].relationActions,
    });
  }

  updateState(state);
};

/**
 * Handler for 'open-tab' event
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param id
 * @param context
 * @param filters
 */
export const createNewBrowser = async (stateAccessor, browserInit) => {
  const { getState, updateState } = stateAccessor;
  const state = getState();

  state.browsers = state?.browsers.map((b) => ({ ...b, active: false }));
  state.browsers.push(await makeBrowser(browserInit));
  updateState(state);
};

/**
 * Handler for 'update-browser' event
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param payload
 */
export const updateBrowser = async (stateAccessor, { browserPath, value }) => {
  const index = browserPath[1];
  const { getState } = stateAccessor;
  const { browserError, active, loading } = getState().browsers[index];
  if (active && loading && value && !browserError) {
    await setTableData(stateAccessor, index);
  }
};

/** Handler which takes state and an update function to update URL parameters
 * after an action which should update the URL
 * @param {substate} browser - accessor to the state of application
 * @param updateFn - the function which should be used to update state
 */
export const updateURLParams = (browser) => {
  const searchParams = createSearchParams(browser);
  searchParams.id = browser.id;
  const urlSearchParams = new URLSearchParams(
    encodeSerializedParams(serializeParams(searchParams)),
  );
  replaceURLSearchParams(urlSearchParams);
  browser.urlSearchParams = urlSearchParams.toString();
};

/**
 * Handler for 'focus-tab' event
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param id
 */
export const focusBrowser = ({ getState, updateState }, id) => {
  const state = getState();
  replaceURLSearchParams({});
  state.browsers.map((b) => {
    b.active = b.id === id;
    b.loading = b.active;
    b.data.sort.isNewSortApplied = false;
    return b;
  });
  updateState(state);
};

/**
 * Handler for 'close-tab' event
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param id
 */
export const removeBrowser = ({ getState, updateState }, id) => {
  const state = getState();
  const browsers = state.browsers.filter((b) => b.id !== id);
  let activeIndex = state.browsers.findIndex((b) => b.active);

  if (activeIndex >= browsers.length) {
    activeIndex -= 1;
  }
  state.browsers = browsers.map((b, i) =>
    activeIndex === i ? { ...b, active: true, loading: true } : { ...b },
  );
  updateState(state);
};

/**
 * This function will take action on filter if table sorting get changes
 * @param {Object} browser  state object
 * @param {Object} payload  sorting and pagination details
 */
const sortingEffectOnFilter = (browser, payload) => {
  // Apply Short term table solution: Adjust filter state logic to account for filter and sorting side effects
  browser.data.sort.isNewSortApplied = false;

  if (payload.sortBy) {
    const selectedColumnId = payload.sortBy.id;
    const sortByName = browser.context.columns.find(
      (col) => col.attribute === selectedColumnId,
    )?.title;
    const isSelectedColumnContextType = browser.context.contextType.contextFields.find(
      (_contextField) => _contextField.id === selectedColumnId,
    );
    const activeFilterOnSortColumn = browser.filters.find(
      (_filter) => _filter.selected && _filter.name === selectedColumnId,
    );

    // if different KPI column is selected
    if (!activeFilterOnSortColumn && !isSelectedColumnContextType) {
      // select new KPI column
      browser.filters.forEach((_filter) => {
        const filterName = _filter.type.name || _filter.type.id;
        if (
          _filter.filterCategory === 'metric' &&
          (_filter.selected || payload?.deselectedMetricSort === filterName)
        ) {
          // Deselect filter
          _filter.selected = false;

          // show notification
          browser.data.sort.isNewSortApplied = true;
          browser.data.sort.deselectedMetricSort = filterName;
          browser.data.sort.sortNotificationInfo = sortByName;
        }
      });
    }

    if (!isSelectedColumnContextType) {
      browser.context.filterCategories.find(
        (_filterCategory) => _filterCategory.type === 'metric',
      ).disclosureForAttribute = sortByName;
    }
  }
};

/**
 * Handler for 'metric-search' event
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param payload
 */
export const triggerBrowserUpdate = (
  { getSubState, updateSubState },
  payload,
  { persistenceEngine },
) => {
  const browser = getSubState();
  if (!browser.browserError) {
    browser.payload = payload;
    if (persistenceEngine === CONSTANTS.PERSISTENCE_ENGINE_OS) {
      sortingEffectOnFilter(browser, payload);
    }
    browser.loading = true;
    browser.fetchError = undefined;
    updateSubState(browser);
  }
};

/**
 * Handler for 'table-actions' open-tab event
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param {Object} actionDetail - event details
 */
const openTabAction = (stateAccessor, actionDetail) => {
  const { getState } = stateAccessor;
  const findContextById = actionDetail.context.id;
  const newContext = getState().contexts.find((f) => f.contextType.id === findContextById);
  const filters = createContextFiltersFromRowAction(newContext, actionDetail);
  createNewBrowser(stateAccessor, { id: actionDetail.id, context: newContext, filters });
};

/**
 * Handler for 'table-actions' event
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param {Object} actionDetail - event details
 */
export const tableActions = (stateAccessor, actionDetail) => {
  const { getState, updateState } = stateAccessor;
  const state = getState();
  const activeIndex = state.browsers.findIndex((b) => b.active);
  switch (actionDetail.operation) {
    case 'open-tab':
      openTabAction(stateAccessor, actionDetail);
      break;
    case 'open-charts':
      state.browsers[activeIndex].selectedRow = actionDetail.data;
      state.browsers[activeIndex].historicalDashboardData.showHistoricalDashboard = true;
      state.browsers[activeIndex].historicalDashboardData.noResults = false;
      updateURLParams(state.browsers[activeIndex]);
      updateState(state);
      break;
    default:
      console.warn(
        'Invalid or undefined table action. Invalid operation name ',
        actionDetail.operation,
      );
  }
};

/**
 * Handler for 'table-actions-row-selected' event
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param {Object} actionDetail - event details
 */
export const tableActionsRowSelected = (stateAccessor, actionDetail = {}) => {
  const { getSubState, updateSubState } = stateAccessor;
  const browser = getSubState();
  browser.selectedRow = actionDetail;
  const { showHistoricalDashboard, noResults } = browser.historicalDashboardData;
  if (showHistoricalDashboard && !actionDetail.selected) {
    browser.historicalDashboardData.showHistoricalDashboard = false;
  }
  if (showHistoricalDashboard && noResults) {
    browser.historicalDashboardData.noResults = false;
  }
  updateURLParams(browser);
  updateSubState(browser);
};

export const updateBrowserTitle = (stateAccessor, { id, title }) => {
  const { getState, updateState } = stateAccessor;
  const state = getState();
  state.browsers = state.browsers.map((browser) =>
    browser.id === id ? { ...browser, tabTitle: title } : browser,
  );

  return updateState(state);
};

/**
 * Handler for 'global-kpi-context-selection-changed' event
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param {Object} metadata - an object that contains context and metric data for the selected table row
 */
export const globalContextSelection = ({ getState, updateState }, { metadata }) => {
  const state = getState();
  const activeIndex = state.browsers.findIndex((b) => b.active);
  if (metadata) {
    state.selectedKpiContext = metadata;
    const { context, metrics = [] } = state.selectedKpiContext;
    state.browsers[activeIndex].historicalDashboardData.historicalDashboardModel = dashboardModel(
      getVisualizationDirectives(context, metrics, state.configuration, state.postgresSchemaName),
      metrics,
    );
  } else {
    state.browsers[activeIndex].historicalDashboardData.historicalDashboardModel = undefined;
  }

  updateState(state);
};

/**
 * Handler for 'update-historical-dashboard-visibility' event
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param {Boolean} newVisibilityStatus - a boolean representing the new visibility status of the historical
 * dashboard for the active metric browser
 */
export const updateHistoricalDashboardVisibility = (
  { getState, updateState },
  { newVisibilityStatus },
) => {
  const state = getState();
  const activeIndex = state.browsers.findIndex((b) => b.active);
  state.browsers[activeIndex].historicalDashboardData.showHistoricalDashboard =
    !!newVisibilityStatus;

  updateState(state);
};
