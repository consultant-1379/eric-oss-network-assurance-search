import { APP_SCHEMA_VERSION, DEFAULT_STATE } from './constants.js';
import StorageModule from '../utils/storage.js';

/**
 * Set application configuration
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 */
export const initApplicationState = async (stateAccessor) => {
  const { updateState } = stateAccessor;

  // Start with the default state on newly loaded app.
  // Previous application state will be merged when application is ready.

  const state = { ...DEFAULT_STATE, applicationInitialized: true };

  // Preserve the previous application state in a temporary storage.
  // This is necessary to ensure that other asynchronous actions can complete
  // before restoring the previous state. Immediate restoration may trigger
  // unintended reactions, and if certain configurations have not been retrieved yet,
  // it could lead to potential issues.

  const storedState = StorageModule.get('appState');

  // Store previous application state only when it's valid
  if (storedState?.version === APP_SCHEMA_VERSION) {
    state.previousApplicationState = storedState;
  }

  updateState(state);
};
