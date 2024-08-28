import isEmpty from 'lodash/isEmpty';
import { getConfiguration } from '../services/assurance/configuration';

const defaultConfiguration = {
  families: [
    {
      name: 'default',
      widget: 'timeline',
    },
  ],
  groups: [
    {
      name: 'default',
      title: 'Historical Dashboard',
      sort: 'alphabetical',
      sortOrder: 'asc',
    },
  ],
};

/**
 * Get application configuration
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 */
export const configuration = async (stateAccessor) => {
  const { getState, updateState } = stateAccessor;
  const applicationConfiguration = await getConfiguration();
  const state = getState();
  const { families, groups } = applicationConfiguration;
  state.configuration =
    isEmpty(families) || isEmpty(groups) ? defaultConfiguration : applicationConfiguration;
  updateState(state);
};
