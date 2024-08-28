import lomap from 'lodash/map';
import loremove from 'lodash/remove';
import lofill from 'lodash/fill';
import { uuid } from '../utils/helper.js';
import CONSTANTS from '../utils/constants.js';

const { EQUAL, LESS_THAN_EQUAL, GREATER_THAN_EQUAL, NOT_EQUAL, IN_RANGE, NOT_IN_RANGE } =
  CONSTANTS.OPERATIONS;

/**
 * This function will take action on table sorting if filter get changes
 * @param {Object} browser : state object
 */
const filterEffectOnSorting = (browser, persistenceEngine) => {
  // Ony apply logic when the persistence engine is OS
  if (persistenceEngine === CONSTANTS.PERSISTENCE_ENGINE_OS) {
    // Only for metric type filter
    const filter = browser.filters.find(
      (_filter) => _filter.selected && _filter.filterCategory === 'metric',
    );

    const filterCategory = browser.context.filterCategories.find(
      (_filterCategory) => _filterCategory.type === 'metric',
    );

    if (filter) {
      filterCategory.disclosureForAttribute = filter.type.name;
      browser.data.sort.isNewSortApplied = false;

      // apply sort on filter column
      browser.payload = {
        sortBy: {
          id: filter.name,
        },
        sortOrder: 'asc',
      };
    } else {
      filterCategory.disclosureForAttribute = '';
    }
  }
};

const addFilter = (metricBrowser, filter, { persistenceEngine }) => {
  const { filters, context } = metricBrowser;
  const { filterCategories } = context;
  const { filterCategory } = filter;
  const filterOptionType = filterCategories.filter(
    (category) => category.type === filterCategory,
  )[0].selection;

  if (filterOptionType === 'radio') {
    lomap(filters, (f) => {
      if (f.filterCategory === filterCategory) {
        f.selected = false;
      }
      return f;
    });
  }

  filters.unshift(filter);

  filterEffectOnSorting(metricBrowser, persistenceEngine);
};

const editFilter = (metricBrowser, { changeItem, updatedFilter }, { persistenceEngine }) => {
  const { filters } = metricBrowser;

  const indexOfFilter = filters.findIndex((f) => f.id === changeItem);
  if (indexOfFilter !== undefined) {
    lofill(filters, updatedFilter, indexOfFilter, indexOfFilter + 1);
  }

  filterEffectOnSorting(metricBrowser, persistenceEngine);
};

const selectFilter = (metricBrowser, { id, type }, { persistenceEngine }) => {
  const { filterCategories } = metricBrowser.context;
  const filterOptionType = filterCategories.filter((category) => category.type === type)[0]
    .selection;

  metricBrowser.filters.forEach((filter) => {
    const isMatch = filter.filterCategory === type && filter.id === id;

    if (filterOptionType === 'radio') {
      if (isMatch) {
        filter.selected = true;
      } else if (filter.filterCategory === type) {
        filter.selected = false;
      }
    } else if (filterOptionType === 'checkbox') {
      if (isMatch) {
        filter.selected = !filter.selected;
      }
    } else {
      console.warn(`Filter selection type wasn't recognized: ${filterOptionType}`);
    }
  });

  filterEffectOnSorting(metricBrowser, persistenceEngine);
};

const removeFilter = (metricBrowser, { id, type }) => {
  loremove(metricBrowser.filters, (f) => type === f.filterCategory && id === f.id);
  metricBrowser.payload = {};
};

const selectFilters = (metricBrowser, filterCategory, select = true) => {
  lomap(metricBrowser.filters, (filter) => {
    if (filter.filterCategory === filterCategory) {
      filter.selected = select;
    }
    return filter;
  });
  metricBrowser.payload = {};
};

const clearAllFilters = (metricBrowser) => {
  lomap(metricBrowser.filters, (filter) => {
    filter.selected = false;
  });
  metricBrowser.payload = {};
};

const removeAllFilters = (metricBrowser, filterCategory) => {
  loremove(metricBrowser.filters, (filter) => filter.filterCategory === filterCategory);
  metricBrowser.payload = {};
};

/**
 * Handle 'update-filters' event
 * @callback
 * @param {StateAccessor} stateAccessor - state accessor
 * @param payload
 */
export const updateFilters = (
  { getSubState, updateSubState },
  { updateOperation, data },
  flags,
) => {
  const metricBrowser = getSubState();

  switch (updateOperation) {
    case 'add-filter':
      addFilter(metricBrowser, data, flags);
      break;
    case 'edit-filter':
      editFilter(metricBrowser, data, flags);
      break;
    case 'select-filter':
      selectFilter(metricBrowser, data, flags);
      break;
    case 'remove-filter':
      removeFilter(metricBrowser, data);
      break;
    case 'select-all-of-type':
      selectFilters(metricBrowser, data, true);
      break;
    case 'clear-all-of-type':
      selectFilters(metricBrowser, data, false);
      break;
    case 'remove-all-of-type':
      removeAllFilters(metricBrowser, data);
      break;
    case 'clear-all-filters':
      clearAllFilters(metricBrowser);
      break;
    default:
      console.warn('Update operation not recognized');
  }
  metricBrowser.loading = true;
  updateSubState(metricBrowser);
};

/**
 * Handler for 'update-match' event
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param payload
 */
export const updateMatch = ({ getSubState, updateSubState }, payload) => {
  const metricBrowser = getSubState();
  metricBrowser.match = payload;
  updateSubState(metricBrowser);
};

const _calculateOperation = ({ to, from, not, searchPattern }) => {
  if (searchPattern || to === from) {
    return not ? NOT_EQUAL : EQUAL;
  }
  if (!to) {
    return GREATER_THAN_EQUAL;
  }
  if (!from) {
    return LESS_THAN_EQUAL;
  }
  if (not) {
    return NOT_IN_RANGE;
  }
  return IN_RANGE;
};

const _buildValue = (value) => ({ ...value, operation: _calculateOperation(value) });

const _buildFilter = (field, value) => ({
  ...field,
  id: uuid(),
  value: _buildValue(value),
  selected: true,
});

const _fieldsLookup = (context) => context.filterCategories.map((m) => m.fields).flat();

export const createFiltersFromValues = (context, values) =>
  values.map((v) => {
    const field = _fieldsLookup(context).find((m) => m.name === v.name);
    return _buildFilter(field, v);
  });

export const createContextFiltersFromRowAction = (newContext, actionDetail) =>
  actionDetail.context.contextFields.flatMap((contextField) => {
    const field = _fieldsLookup(newContext).find((m) => m.name === contextField.id);
    const value = actionDetail.row[contextField.id]?.value;
    const filterValue = { searchPattern: value, not: false };
    return value ? _buildFilter(field, filterValue) : [];
  });
