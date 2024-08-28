import { NON_PERSISTED_STATE } from './constants.js';

/**
 * Get application configuration
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 */
export const loadApplicationState = async (stateAccessor) => {
  const { getState, updateState } = stateAccessor;

  // Restore application state.
  const state = getState();
  const { previousApplicationState } = state;
  delete state.previousApplicationState;

  updateState({
    ...state,
    ...previousApplicationState,
    ...NON_PERSISTED_STATE,
    localStateIsLoaded: true,
  });
};
