import { discovery } from './discoveryActions.js';
import { initApplicationState } from './initActions.js';
import { configuration } from './configurationActions.js';
import { updateFilters, updateMatch } from './filterActions';
import { systemState, systemStateInitializing } from './systemStateActions.js';
import { getConfig } from '../config/configManager.js';
import {
  updateBrowserMetricCategories,
  toggleMetricCategorySelectionState,
  toggleMetricCategoriesViewAllSelected,
} from './metricCategoryActions.js';
import {
  createNewBrowser,
  createInitialBrowser,
  removeBrowser,
  updateBrowser,
  focusBrowser,
  triggerBrowserUpdate,
  tableActions,
  tableActionsRowSelected,
  updateBrowserTitle,
  globalContextSelection,
  updateHistoricalDashboardVisibility,
} from './tabActions.js';
import { clearFacetCounts, updateFacetCounts, updateSettings } from './tableActions.js';
import { dismissHelpBanner } from './tutorialActions.js';
import { disableSubState, enableSubState } from '../utils/stateManager.js';
import { loadApplicationState } from './loadStateActions';

/**
 * State Actions Definitions
 * Actions are register with event types and mutate the application state
 * @type {Object.<string, StateAction>}
 */
export const stateActions = {
  initAction: {
    triggerOnEvent: 'init-application',
    eventHandler: initApplicationState,
  },

  loadState: {
    triggerOnEvent: 'load-local-state',
    eventHandler: loadApplicationState,
  },

  configurationAction: {
    triggerOnEvent: 'load-application-configuration',
    eventHandler: configuration,
  },

  systemStateAction: {
    triggerOnEvent: 'load-system-state',
    eventHandler: systemState,
  },

  systemStateCallBackAction: {
    triggerOnEvent: 'system-state-initializing',
    eventHandler: systemStateInitializing,
  },

  discoveryAction: {
    triggerOnEvent: 'discover-metadata',
    eventHandler: discovery,
  },

  // Initializes sub-state
  createBrowserSubState: {
    triggerOnEvent: 'create-browser-sub-state',
    /**
     * Handle create-browser-sub-state event
     * @function
     * @param {StateAccessor} stateAccessor - state accessor
     * @param payload
     */
    eventHandler: (stateAccessor, payload) => {
      const { subState, mediator } = payload;
      enableSubState(
        stateAccessor,
        mediator,
        'browsers',
        subState,
        [
          'update-browser-title',
          'update-browser-metric-categories',
          'toggle-metric-category-selection-state',
          'toggle-metric-categories-view-all-selected',
          'update-filters',
          'metric-search',
          'update-match',
          'table-actions-row-selected',
          'update-facet-counts',
          'clear-facet-counts',
          'update-settings',
        ],
        stateActions,
      );
    },
  },

  removeBrowserSubState: {
    triggerOnEvent: 'remove-browser-sub-state',
    /**
     * Handle create-browser-sub-state event
     * @function
     * @param {StateAccessor} stateAccessor - state accessor
     * @param payload
     */
    eventHandler: (stateAccessor, { subState }) => {
      disableSubState(subState);
    },
  },

  createTableAction: {
    triggerOnEvent: 'table-actions',
    eventHandler: tableActions,
  },

  tableActionRowSelected: {
    triggerOnEvent: 'table-actions-row-selected',
    eventHandler: tableActionsRowSelected,
  },

  updateFacetCountsAction: {
    triggerOnEvent: 'update-facet-counts',
    eventHandler: updateFacetCounts,
  },

  clearFacetCountsAction: {
    triggerOnEvent: 'clear-facet-counts',
    eventHandler: clearFacetCounts,
  },

  createBrowserAction: {
    triggerOnEvent: 'open-tab',
    eventHandler: createNewBrowser,
  },

  focusBrowserAction: {
    triggerOnEvent: 'focus-tab',
    eventHandler: focusBrowser,
  },

  removeBrowserAction: {
    triggerOnEvent: 'close-tab',
    eventHandler: removeBrowser,
  },

  loadAppAction: {
    triggerOnEvent: 'init-browser',
    eventHandler: createInitialBrowser,
  },

  updateBrowserAction: {
    triggerOnEvent: 'update-browser',
    eventHandler: updateBrowser,
  },

  updateBrowserTitle: {
    triggerOnEvent: 'update-browser-title',
    eventHandler: updateBrowserTitle,
  },

  updateBrowserMetricCategoriesAction: {
    triggerOnEvent: 'update-browser-metric-categories',
    eventHandler: updateBrowserMetricCategories,
  },

  toggleMetricCategorySelectionStateAction: {
    triggerOnEvent: 'toggle-metric-category-selection-state',
    eventHandler: toggleMetricCategorySelectionState,
  },

  toggleMetricCategoriesViewAllSelectedAction: {
    triggerOnEvent: 'toggle-metric-categories-view-all-selected',
    eventHandler: toggleMetricCategoriesViewAllSelected,
  },

  updateFilterMatch: {
    triggerOnEvent: 'update-match',
    eventHandler: updateMatch,
  },

  updateFilterAction: {
    triggerOnEvent: 'update-filters',
    eventHandler: (handlers, payload) =>
      updateFilters(handlers, payload, getConfig().getFeatureFlags()),
  },

  metricSearchAction: {
    triggerOnEvent: 'metric-search',
    eventHandler: (handlers, payload) =>
      triggerBrowserUpdate(handlers, payload, getConfig().getFeatureFlags()),
  },

  globalContextSelectionAction: {
    triggerOnEvent: 'global-kpi-context-selection-changed',
    eventHandler: globalContextSelection,
  },

  updateSettingsAction: {
    triggerOnEvent: 'update-settings',
    eventHandler: updateSettings,
  },

  updateHistoricalDashboardVisibilityAction: {
    triggerOnEvent: 'update-historical-dashboard-visibility',
    eventHandler: updateHistoricalDashboardVisibility,
  },

  dismissHelpBanner: {
    triggerOnEvent: 'dismiss-help',
    eventHandler: dismissHelpBanner,
  },
};

/**
 * State Effects.
 * Effects are registered with props and emit events.
 * Effects emit events and not don't modify state directly.
 *
 * Exec received these properties:
 * { path,
 *   parentPath,
 *   changedObject,
 *   changedProperty,
 *   previousValue,
 *   changedValue,
 *   }
 *
 *   Note that events declared for emission by `emitEventType` property are fired at root component
 *   which means that they can't be captured by sub-state management. It's recommended to only use
 *   with their own event types and reuse events fired by other application components.
 */
export const stateEffects = {
  // TODO: Add ability to define event type per exec
  // executors: [executor('some_event_1') => function(state, selector, changedValue) {return state.A + state.B},
  //             executor('some_event_2') => function(state, selector, changedValue) {return state.A + state.B}]
  // or simply:
  // executors: [{emitEventType: 'some_event'
  //              eventHandler: (state, selector, changedValue) => {state.A.counter + state.B.counter}}]
  // executors: [(state, selector, changedValue) => {state.A.counter + state.B.counter},
  //             (state, selector, changedValue) => {state.A.counter + state.B.counter}]

  /**
   * Define effects
   *
   * @example
   *
   *   exampleEffect: {
   *     selector: 'some[*].selector.hello',
   *     emitEventType: 'hello_from_example_effect',
   *     eventPayload: 'Hi!',
   *   },
   *
   *   contextsLoaded: {
   *     selector: '$.contexts[0]',
   *     emitEventType: 'open-tab',
   *     eventPayload: ({ changedValue }) => ({
   *       id: uuid(),
   *       context: changedValue,
   *     }),
   *   },
   */

  /**
   * Get the system status from backend service
   */
  loadSystemState: {
    selector: 'applicationInitialized',
    emitEventType: 'load-system-state',
  },

  /**
   * Reload the system state if system state is  in 'Initializing'
   */
  systemStateInitializingEffect: {
    selector: 'systemStateInitializing',
    emitEventType: 'system-state-initializing',
  },

  /**
   * Loads application configuration from the server.
   * Must be run after application is initialized.
   */
  loadConfiguration: {
    selector: 'systemStateReady',
    emitEventType: 'load-application-configuration',
  },

  /**
   * Restores previous application state to the application.
   * Must be run after application configuration is loaded from the server.
   */
  loadLocalState: {
    selector: 'configuration',
    emitEventType: 'load-local-state',
  },

  /**
   * Loads context and metrics related metadata from the server.
   * Must be run after local application state is restored.
   */
  discoverMetadata: {
    selector: 'localStateIsLoaded',
    emitEventType: 'discover-metadata',
  },

  refreshTableLoadingEffect: {
    selector: 'browsers[*].loading',
    emitEventType: 'update-browser',
    /**
     * @function
     * @param {EffectPayload}
     * @returns {{browserPath, value}}
     */
    eventPayload: ({ parentPath, changedValue }) => ({
      browserPath: parentPath,
      value: changedValue,
    }),
  },

  /**
   * Fires global-kpi-context-selection-changed when
   * selected row is clicked in one of the metric browsers
   */
  updateGlobalContextSelection: {
    selector: 'browsers[*].selectedRow',
    emitEventType: 'global-kpi-context-selection-changed',
    /**
     * @function
     * @param {EffectPayload}
     * @returns {{browserPath, value}}
     */
    eventPayload: ({ changedValue }) => changedValue,
  },
};
