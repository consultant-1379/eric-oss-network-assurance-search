import isEmpty from 'lodash/isEmpty';
import memoize from 'lodash/memoize';
import logger from '../utils/logger';
import { getIndices, getContextInformationForIndex } from '../services/assurance/metadata';
import { getURLSearchParams, urlSearchParamsToObject, URLSearchParamsExist } from '../utils/url.js';
import { deserializeParams, decodeSearchParams, makeBrowser } from '../services/assurance/search';
import CONSTANTS from '../utils/constants';

const { TABLE_COLUMN_BUFFER_WIDTH, MIN_COLUMN_WIDTH } = CONSTANTS;

/**
 * @description This function calculates what the width of a column (in pixels) needs
 * to be so that the entire column header title is visible. It calculates the width
 * based on the string of the column title and it's font.
 * @param {string} columnTitle - The string that will be used as the column header title
 * @example "Partial DRB Accessibility (successes)"
 * @param {string} font - The CSS font value to use
 * @example '14px "Ericsson Hilda", Helvetica, Arial, sans-serif'
 * @returns A string that represents the width of the column (in pixels) that will
 * ensure the entire column header title is visible.
 * @example "247px"
 */
export const calculateColumnWidth = (columnTitle, font) => {
  // Creating a `div` element and giving it proper style attributes
  const element = document.createElement('div');
  element.style.visibility = 'hidden';
  element.style.font = font || getComputedStyle(document.body).font;
  element.style.width = 'fit-content';
  element.innerHTML = columnTitle;

  // Adding element to document body
  document.body.appendChild(element);

  // There are elements in the column header (other than the actual text)
  // which take up a static amount of space. This space must be appended
  // to the calculated text width.
  const columnWidth = element.getBoundingClientRect().width + TABLE_COLUMN_BUFFER_WIDTH;

  // Removing element from document body
  document.body.removeChild(element);

  // Returning either the calculated with (rounded up), or the
  // minimum column width allowed, whichever is the larger value.
  return `${Math.max(Math.ceil(columnWidth), MIN_COLUMN_WIDTH)}px`;
};

// Using the lodash `memoize` method which stores the result of
// a function call with it's specific input params into the cache.
const cachedCalculateColumnWidth = memoize(calculateColumnWidth);

const createColumnFromContextField = (field) => {
  const { id, name, description, valueType = 'string' } = field;
  const label = name || id;
  const width = cachedCalculateColumnWidth(label);

  return {
    title: label,
    name: label,
    attribute: id,
    valueType,
    sortable: true,
    additionalInfo: description,
    width,
    mandatory: true,
    type: field,
  };
};

const unitString = (unit) => (unit ? ` (${unit})` : '');

const createColumnFromMetricField = ({ id, name, unit, valueType = 'string', description }) => {
  const label = name || id;
  const title = `${label}${unitString(unit)}`;
  const width = cachedCalculateColumnWidth(title);

  return {
    title,
    name: label,
    attribute: id,
    valueType,
    sortable: true,
    additionalInfo: description,
    width,
    sortNotificationInfo: label,
  };
};

const createContextColumns = ({ contextType, metricTypes }) => [
  ...contextType.contextFields.map(createColumnFromContextField),
  ...metricTypes.map(createColumnFromMetricField),
];

const createFilterFields = (field, type) => {
  const { id, name, valueType = 'string' } = field;
  return {
    label: name || id,
    name: id,
    filterCategory: type,
    type: { ...field, valueType },
  };
};

const setupContextFilterCategories = (filterCategories, context) =>
  filterCategories.map((category) => {
    const { type } = category;
    let { fields } = category;

    const { contextType, metricTypes } = context;

    if (type === 'context') {
      fields = contextType.contextFields.map((field) => createFilterFields(field, type));
    }

    if (type === 'metric') {
      fields = metricTypes.map((field) => createFilterFields(field, type));
    }

    return { ...category, fields };
  });

const commaAndName = (list) => {
  const last = list.pop();
  return `${list.join(', ')} & ${last}`;
};

/**
 * @description Returns a user-friendly context name
 * @param {object} context - An object of contextType
 * @example {"id":"nf_snssai", "contextFields":[{"id":"c_nf", "name":"NF", "description":"Network Function"},{"id":"c_snssai","name":"SNSSAI","description":"Single Slice Selection Assistance Information"}]}
 * @returns A string of a user-friendly context display name for UI
 * @example "My NF and SNSSAI"
 */
export const makeFullContextName = (contextType) => {
  if (contextType?.name) {
    return contextType.name;
  }
  const contextFieldName = contextType.contextFields.map((cf) => cf.name);
  if (contextFieldName.some((name) => name === undefined)) {
    return contextType.id;
  }
  if (contextFieldName.length === 1) {
    return contextFieldName[0];
  }
  return commaAndName(contextFieldName);
};

/**
 * @description Returns an array of objects that contain data relevant to relation actions
 * @param {Array.<Relation>} relations - An array of `Relation` objects
 * @example [ { "relationType": "RELATED_TO", "related": { "id": "NF_NSI", "contextFields": [ { "id": "c_NF", "name": "NF", "description": null, "dataType": "entityType" }, { "id": "c_NSI", "name": "NSI", "description": null, "dataType": "entityType" } ], "name": "NF & NSI" } } ]
 * @returns an array of objects that contain data relevant to relation actions
 * @example [ { "label": "NF & NSI", "data": { "operation": "open-tab", "context": { "id": "NF_NSI", "contextFields": [ { "id": "c_NF", "name": "NF", "description": null, "dataType": "entityType" }, { "id": "c_NSI", "name": "NSI", "description": null, "dataType": "entityType" } ], "name": "NF & NSI" } }, "facetCounts": {} } ]
 */
export const createRelationActionsStateObject = (relations) =>
  // Create table actions
  relations
    ? relations.map((relation) => ({
        label: relation.related.name,
        data: { operation: 'open-tab', context: relation.related },
        facetCounts: {},
      }))
    : [];

const createRelations = (relations) => {
  // Setup contexts with discovery information
  relations
    .map((relation) => {
      relation.related.contextFields = relation.related.contextFields.map((contextField) => ({
        ...contextField,
        dataType: 'entityType',
      }));
      relation.related.name = makeFullContextName(relation.related);
      return relation;
    })
    .sort((a, b) => a.related.name.localeCompare(b.related.name));
  return createRelationActionsStateObject(relations);
};

export const setupContextForApp = (index, filterCategories, context) => {
  context.contextType.contextFields = context.contextType.contextFields.map((contextField) => ({
    ...contextField,
    dataType: 'entityType',
  }));
  context.metricTypes = context.metricTypes.map((metricField) => {
    const result = {
      ...metricField,
      dataType: 'metricType',
    };

    /**
     * For now, just synthesize families based on IDs.
     * Providing a unique ID for the metric family name will cause the creation of a separate widget for each metric.
     */
    if (isEmpty(metricField?.visualization?.groups)) {
      result.visualization = {
        ...result?.visualization,
        groups: {
          default: [metricField.id],
        },
      };
    }
    return result;
  });
  context.relationActions = createRelations(context.relations);
  context.filterCategories = setupContextFilterCategories(filterCategories, context);
  context.name = makeFullContextName(context.contextType);
  context.columns = createContextColumns(context);
  context.index = index;
  return context;
};

export const handleError = (err) => {
  console.warn(err);
  logger.error(err);
  throw err;
};

export const setIndexData = () =>
  getIndices().then(
    (response) => response,
    (err) => handleError(err),
  );

export const setIndexContextData = (index, filterCategories) =>
  getContextInformationForIndex(index).then(
    (response) =>
      response
        .map((context) => setupContextForApp(index, filterCategories, context))
        .sort((a, b) => a.name.localeCompare(b.name)),
    (err) => handleError(err),
  );

const _updateSavedBrowser = (browser, context) => {
  const newColumns = context.columns;
  const oldColumns = browser.context.columns;
  const newColumnReference = {};
  const oldColAttributes = [];

  // The updated list of columns
  const updatedColumns = [];

  // setup new cols reference to make things a bit faster
  newColumns.reduce((collection, column) => {
    collection[column.attribute] = column;
    return collection;
  }, newColumnReference);

  // update old columns and remove invalid ones
  oldColumns.reduce((collection, oldColumn) => {
    const newColumn = newColumnReference[oldColumn.attribute];
    if (newColumn) {
      const { attribute, title, additionalInfo, width } = newColumn;
      oldColumn.title = title;
      oldColumn.additionalInfo = additionalInfo;
      oldColumn.width = width;
      collection.push(oldColumn);
      oldColAttributes.push(attribute);
    }
    return collection;
  }, updatedColumns);

  // add new columns
  Object.keys(newColumnReference)
    // find the difference between updated old columns and new columns
    .filter((attribute) => !oldColAttributes.includes(attribute))
    // add each of the new columns to the list
    .forEach((attribute) => updatedColumns.push(newColumnReference[attribute]));

  browser.context = { ...context, columns: updatedColumns };
  // Remove filters that are no longer relevant
  browser.filters = browser.filters.filter((filter) => newColumnReference[filter.name]);
  browser.relationActions = context.relationActions;
  browser.browserError = undefined;
  return browser;
};

export const validateSavedBrowser = (contexts, browser) => {
  const browserContextId = browser?.context?.contextType.id;
  const browserIndex = browser?.context?.index;
  const browserErrorType = browser?.browserError?.type;

  const findContextMatches = ({ contextType, index }) =>
    browserContextId === contextType.id && browserIndex === index;

  if (browserErrorType === 'VALIDATION_ERROR') {
    browser.settings.autoRefresh = false;
    return browser;
  }

  if (browserErrorType === 'CONTEXT_ERROR' && !browser?.context) {
    browser.settings.autoRefresh = false;
    return browser;
  }

  if (!contexts.some(findContextMatches)) {
    browser.browserError = {
      type: 'CONTEXT_ERROR',
      data: { name: browserContextId, index: browserIndex },
    };
    browser.settings.autoRefresh = false;
  } else {
    const context = contexts.find(findContextMatches);
    browser = _updateSavedBrowser(browser, context);
  }
  return browser;
};

const initStoredBrowsers = (state, matchesURLSearchParamsId) =>
  state.browsers.map((browser) => {
    const selectedRow = browser?.selectedRow;
    const isActive = matchesURLSearchParamsId(browser);
    return {
      ...browser,
      loading: isActive,
      active: isActive,
      selectedRow: { ...selectedRow },
    };
  });

const handleContextError = (state) => {
  if (!state.contexts || state.contexts.length === 0) {
    /* c8 ignore next 4 */
    const contextError = new Error('Context not found');
    contextError.type = 'NO_CONTEXTS';
    contextError.isWarning = true;
    throw contextError;
  }
};

/**
 * Get application configuration information from the Assurance Indexer
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 */
export const discovery = async (stateAccessor) => {
  const selectedIndex = 0;
  const { getState, updateState } = stateAccessor;

  try {
    const indices = await setIndexData();
    const state = getState();
    const { filterCategories, browsers } = state;
    state.indices = indices;
    if (indices?.length > selectedIndex) {
      state.contexts = await setIndexContextData(indices[selectedIndex].name, filterCategories);
      handleContextError(state);
      state.browsers = browsers.map((browser) => validateSavedBrowser(state.contexts, browser));
      const active = state.browsers.find((browser) => browser.active);
      if (URLSearchParamsExist) {
        const urlSearchParams = getURLSearchParams();
        const matchesURLSearchParamsId = (b) => b.id === urlSearchParams.get('id');
        const foundBrowser = state.browsers.find(matchesURLSearchParamsId);
        if (foundBrowser) {
          state.browsers = initStoredBrowsers(state, matchesURLSearchParamsId);
        } else {
          state.browsers = state.browsers.map((browser) => ({
            ...browser,
            loading: false,
            active: false,
          }));
          const newBrowser = await makeBrowser({
            fromURL: true,
            ...deserializeParams(
              decodeSearchParams(urlSearchParamsToObject(urlSearchParams)),
              state.contexts,
            ),
          });
          newBrowser.urlSearchParams = urlSearchParams.toString();
          state.browsers = [...state.browsers, newBrowser];
        }
      } else if (!URLSearchParamsExist && !browsers.length && state.contexts.length) {
        const newBrowser = await makeBrowser({ context: state.contexts[0] });
        state.browsers = [...state.browsers, newBrowser];
      } else {
        active.loading = true;
      }
    } else if (indices?.length === 0) {
      /* c8 ignore next 2 */
      const error = { type: 'NO_INDEXES', isWarning: true };
      state.error = error;
    }
  } catch (err) {
    console.warn(err);
    const state = getState();
    state.error = err;
    if (!err?.type) {
      state.error.type = 'NETWORK_ERROR';
    }
  } finally {
    const state = getState();
    state.loading = false;
    state.discoveryCompleted = true;
    updateState(state);
  }
};
