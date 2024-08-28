import { getSystemState } from '../services/assurance/system';
import CONSTANTS from '../utils/constants.js';
import { getConfig } from '../config/configManager.js';

/**
 * Get System state
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 */
export const systemState = async (stateAccessor) => {
  const { getState, updateState } = stateAccessor;
  const state = getState();
  const featureFlags = getConfig()?.getFeatureFlags() || { persistenceEngine: 'vm' };
  let systemProp = state?.systemState;

  if (featureFlags.persistenceEngine === CONSTANTS.PERSISTENCE_ENGINE_OS) {
    // This will skip API //system/state
    state.systemStateReady = true;
  } else {
    try {
      // Get system state from NAS API
      const systemStateApiResponse = await getSystemState();
      systemProp = { ...systemProp, ...systemStateApiResponse };

      switch (systemProp.status) {
        case CONSTANTS.SYSTEM_STATUS.ERROR:
          state.error = { type: 'SYSTEM_STATE', message: systemProp.message };
          console.error('System state service could not be reached. Error:', systemProp.message);
          break;

        case CONSTANTS.SYSTEM_STATUS.INITIALIZING:
          state.loading = true;
          systemProp.isInitializing = true;
          // Toggle the value of systemStateInitializing for detect the changes in state effects
          state.systemStateInitializing = !(state?.systemStateInitializing || false);
          break;

        default:
          state.loading = false;
          state.systemStateReady = true;
          break;
      }
    } catch (err) {
      /* c8 ignore next 2 */
      console.error('System status api not available in NAS. Error details : ', err);
      state.error = { type: 'NETWORK_ERROR' };
    }
  }

  state.systemState = { ...state?.systemState, ...systemProp };
  updateState(state);
};

/**
 * This function use for trigger the system state API again until next state effects
 * Call systemState() event function after the time interval,
 */
export const systemStateInitializing = (stateAccessor) => {
  /* c8 ignore next 8 */
  setTimeout(
    () => {
      systemState(stateAccessor);
    },
    5000,
    stateAccessor,
    systemState,
  );
};
