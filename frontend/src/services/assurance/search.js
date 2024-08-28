import merge from 'lodash/merge';
import isEqual from 'lodash/isEqual';
import SearchApi from '../../api/SearchApi';
import { DEFAULT_METRIC_BROWSER, NEW_TAB_SETTINGS } from '../../state/constants.js';
import { uuid } from '../../utils/helper.js';
import { decodeParam, encodeParam } from '../../utils/url';
import { createFiltersFromValues } from '../../state/filterActions';

const searchApi = new SearchApi();

export function decodeSearchParams(searchParams) {
  if (searchParams.filters) {
    searchParams.filters = decodeParam(searchParams.filters);
  }
  if (searchParams.chartsIds) {
    searchParams.chartsIds = decodeParam(searchParams.chartsIds);
  }
  return searchParams;
}

export function encodeSerializedParams(serializedParams) {
  if (serializedParams.filters) {
    serializedParams.filters = encodeParam(serializedParams.filters);
  }

  if (serializedParams.chartsIds) {
    serializedParams.chartsIds = encodeParam(serializedParams.chartsIds);
  }
  return serializedParams;
}

export function serializeParams({ id, contextTypeId, index, opts }) {
  const { filters, sortBy, sortOrder, offset, chartsIds } = opts;
  const serializedParams = {
    id,
    contextTypeId,
    index,
  };
  if (filters.length > 0) {
    serializedParams.filters = filters;
  }
  if (sortBy) {
    serializedParams.sortBy = sortBy.id;
  }
  if (sortOrder) {
    serializedParams.sortOrder = sortOrder;
  }
  if (offset > 0) {
    serializedParams.page = offset / 20 + 1;
  }
  if (chartsIds && Object.keys(chartsIds).length > 0) {
    serializedParams.chartsIds = chartsIds;
  }

  return serializedParams;
}

const validateChartsIds = (deserializedParams, context, chartsIds) => {
  if (context && chartsIds) {
    const contextFieldIds = context.contextType.contextFields.map(({ id }) => id).sort();
    const chartsKeys = Object.keys(chartsIds).sort();

    /* If there are context fields and charts ids, when there isn't a browser error already being handled,
      show a validation error if the chartsids list doesn't match the selected contexts' context field ids */
    if (
      contextFieldIds.length > 0 &&
      chartsKeys.length > 0 &&
      !isEqual(contextFieldIds, chartsKeys) &&
      !deserializedParams.browserError
    ) {
      const message =
        'The context fields IDs given for the charts IDs for the historical dashboard do not match the context fields for the selected context';
      console.warn(message);
      deserializedParams.browserError = {
        type: 'DASHBOARD_VALIDATION_ERROR',
        data: message,
      };
      deserializedParams.loading = false;
    } else {
      deserializedParams.chartsIds = chartsIds;
    }
  }
  return deserializedParams;
};

export function deserializeParams(
  { index, contextTypeId, filters, sortBy, sortOrder, page, chartsIds },
  contexts,
) {
  const deserializedParams = { payload: {}, data: {} };

  const context = contexts.find((c) => c.index === index && c.contextType.id === contextTypeId);
  if (!index || !contextTypeId || !context) {
    deserializedParams.browserError = {
      type: 'CONTEXT_ERROR',
      data: { name: contextTypeId, index },
    };
    deserializedParams.loading = false;
  } else {
    deserializedParams.context = context;
  }

  if (context && filters?.length > 0) {
    deserializedParams.filters = createFiltersFromValues(context, filters);
  }
  if (sortBy) {
    deserializedParams.payload.sortBy = { id: sortBy };
  }
  if (sortOrder) {
    deserializedParams.payload.sortOrder = sortOrder;
  }
  if (page) {
    const parsedPage = parseInt(page, 10);
    if (parsedPage > 1) {
      deserializedParams.payload.currentPage = parsedPage;
    }
  }

  validateChartsIds(deserializedParams, context, chartsIds);

  return deserializedParams;
}

function getOffset(metricBrowser) {
  return metricBrowser?.payload?.currentPage
    ? (metricBrowser.payload.currentPage - 1) * metricBrowser.data.numentries
    : (metricBrowser.data.currentpage - 1) * metricBrowser.data.numentries;
}

function createFilterParams(filters) {
  filters = filters
    .filter((filter) => filter.selected)
    .map(({ name, type, value }) => {
      const { to, from, not, searchPattern, operation } = value;
      const { dataType } = type;
      const filterType = dataType === 'metricType' ? 'metric' : 'entity';
      const newFilter = {
        name,
        type: filterType,
      };

      if (filterType === 'metric') {
        switch (operation) {
          case 'eq':
          case 'neq':
            newFilter.from = to;
            newFilter.to = to;
            break;
          case 'lte':
            newFilter.to = to;
            break;
          case 'gte':
            newFilter.from = from;
            break;
          case 'ninr':
          case 'inr':
            newFilter.from = from;
            newFilter.to = to;
            break;
          default:
            console.warn(`The filter operation type: ${operation} wasn't recognized`);
        }
      } else {
        newFilter.searchPattern = searchPattern;
      }

      if (not) {
        newFilter.not = not;
      }

      newFilter[dataType] = { id: type.id };
      return newFilter;
    });
  return filters;
}

/* Function which parses out the required information to recreate the metricBrowser via URL
   so that the URL may be updated with the necessary information.
   Takes the metricBrowser as input and outputs a list of objects with context type as the key
   and context name as the value. If there is no selectedRow, then will return undefined. */
function prepareHistoricalDashParams(metricBrowser) {
  let chartsIds;
  if (
    metricBrowser?.selectedRow?.metadata &&
    metricBrowser?.selectedRow.selected &&
    metricBrowser?.historicalDashboardData.showHistoricalDashboard
  ) {
    const { context } = metricBrowser.selectedRow.metadata;
    chartsIds = context.contextFields.reduce((col, { type, name }) => {
      col[type.id] = name;
      return col;
    }, {});
  }
  return chartsIds;
}

function createSearchParams(metricBrowser) {
  const metricTypes = metricBrowser.context.metricTypes.map(({ id }) => ({ id }));

  // Add default sort on first KPI column
  if (!metricBrowser.payload?.sortBy && metricTypes[0]?.id) {
    metricBrowser.payload = { sortBy: { id: metricTypes[0].id }, sortOrder: 'asc' };
  }

  const returnObj = {
    contextTypeId: metricBrowser.context.contextType.id,
    metricTypes,
    index: metricBrowser.context.index,
    opts: {
      filters: createFilterParams(metricBrowser.filters),
      sortBy: metricBrowser.payload?.sortBy ? metricBrowser.payload.sortBy : undefined,
      sortOrder: metricBrowser.payload?.sortOrder ? metricBrowser.payload.sortOrder : undefined,
      offset: getOffset(metricBrowser),
      length: metricBrowser.data.numentries,
      includeRelations: false,
      chartsIds: prepareHistoricalDashParams(metricBrowser),
    },
  };
  // removing the empty key, values from opts object.
  Object.keys(returnObj.opts).forEach(
    (key) => returnObj.opts[key] == null && delete returnObj.opts[key],
  );

  return returnObj;
}

export const generateSearchData = ({ name, metricTypes }, searchResponse) => {
  const resultMetrics = searchResponse.results;
  const getMetricMeta = (id) => metricTypes.find((m) => m.id === id);
  const extract = ({ type, value, metadata }) => {
    const { id } = type;
    const metricMeta = getMetricMeta(id);
    return {
      id,
      name: metricMeta?.name,
      description: metricMeta?.description,
      value,
      valueType: metricMeta?.valueType,
      unit: metricMeta?.unit,
      // group: getKpiGroup(metricTypes, metricMeta),
      // categories: getKpiCategories(metricMeta),
      visualization: metricMeta?.visualization,
      extra: metadata,
    };
  };

  return resultMetrics.map(({ context, metrics }) => ({
    metadata: {
      contextName: name,
      context,
      metrics: metrics.map((m) => extract(m)),
    },
  }));
};

async function getSearchResults(request) {
  const { contextTypeId, index, metricTypes, opts } = request;
  return searchApi.searchMetricsByQuery(index, contextTypeId, metricTypes, opts);
}

async function validateSearchParams(browser) {
  if (browser?.fromURL && !browser.browserError && browser?.context) {
    try {
      const searchParams = createSearchParams(browser);
      searchParams.opts.length = 1;
      await getSearchResults(searchParams);

      const historicalDashboardParams = { ...searchParams };
      const { chartsIds } = browser;

      // If there are charts params go and get the data required to setup the historical dashboard
      if (chartsIds && Object.keys(chartsIds).length > 0) {
        const filters = Object.keys(chartsIds).map((key) => ({
          type: 'entity',
          searchPattern: chartsIds[key],
          name: key,
          entityType: { id: key },
        }));
        historicalDashboardParams.opts.filters = filters;
        const searchResponse = await getSearchResults(historicalDashboardParams);

        if (searchResponse.results.length > 0) {
          const searchData = generateSearchData(browser.context, searchResponse);
          browser.selectedRow = {
            ...searchData[0],
            selected: true,
          };
          browser.historicalDashboardData.showHistoricalDashboard = true;
        } else {
          browser.historicalDashboardData.noResults = true;
          browser.selectedRow = { selected: true };
          browser.historicalDashboardData.showHistoricalDashboard = true;
        }
      }
    } catch (err) {
      console.warn(err);
      browser.browserError = { type: 'VALIDATION_ERROR', data: err };
      browser.loading = false;
    } finally {
      delete browser.fromURL;
    }
  }
}

async function makeBrowser(browser) {
  const newBrowser = {
    id: uuid(),
    ...DEFAULT_METRIC_BROWSER,
    ...NEW_TAB_SETTINGS,
    filters: [],
    relationActions: browser.context?.relationActions,
  };
  merge(newBrowser, browser);

  await validateSearchParams(newBrowser);
  return newBrowser;
}

async function getSearchRelatedContextsFacets(request) {
  const { index, contextId, contextTypeId } = request;
  return searchApi.searchContextFacets(index, contextId, contextTypeId);
}

/**
 * function to transform search results given by the backend to UI readable format and add it back to the response
 * @param searchResponse
 * @returns tableData
 */
function transformSearchResponseTableData(searchResponse) {
  const createCell = (type, value, beginTimestamp, endTimestamp) => ({
    [type.id]: { value, beginTimestamp, endTimestamp },
  });
  return searchResponse.results.map((result) => {
    const columns = [
      ...result.context.contextFields.map(({ type, name }) => createCell(type, name)),
      ...result.metrics.map(({ type, value, beginTimestamp, endTimestamp }) =>
        createCell(type, value, beginTimestamp, endTimestamp),
      ),
    ];
    return Object.assign({}, ...columns);
  });
}

export {
  createSearchParams,
  getSearchResults,
  validateSearchParams,
  makeBrowser,
  getSearchRelatedContextsFacets,
  transformSearchResponseTableData,
};
