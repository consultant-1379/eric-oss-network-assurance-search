import isEqual from 'lodash/isEqual';
import StorageModule from '../../utils/storage.js';

/**
 * Saves the state to the local storage of the browser
 * @param {Object} state - The current application state
 */
export function persistState(state) {
  const { browsers = [], version, filterCategories, postgresSchemaName, onboardingHelp } = state;
  const stateToStore = {
    onboardingHelp,
    browsers: browsers.map((browser) => {
      const selectedRow = browser?.selectedRow
        ? { metadata: browser.selectedRow.metadata, selected: browser.selectedRow.selected }
        : { selected: false };
      return {
        ...browser,
        loading: false,
        data: {
          ...browser.data,
          fetchTime: undefined,
          tableData: [],
          currentpage: 1,
          numentries: 13,
          numpages: 1,
        },
        fetchError: undefined,
        selectedRow,
        historicalDashboardData: {
          ...browser.historicalDashboardData,
          historicalDashboardModel: {},
        },
      };
    }),
    version,
    filterCategories,
    postgresSchemaName,
  };

  // If the basic things that are stored in local storage haven't changed don't do any commit to storage
  const currentStoredState = StorageModule.get('appState');
  if (!isEqual(currentStoredState, stateToStore)) {
    StorageModule.set('appState', stateToStore);
  }
}
