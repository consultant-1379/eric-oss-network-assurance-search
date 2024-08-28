/**
 * Get application configuration information from the Assurance Indexer
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param storedState - stored state from storage for the user
 */
export const dismissHelpBanner = async (stateAccessor, type) => {
  const { getState, updateState } = stateAccessor;
  const state = getState();
  state.onboardingHelp[type] = false;
  updateState(state);
};
