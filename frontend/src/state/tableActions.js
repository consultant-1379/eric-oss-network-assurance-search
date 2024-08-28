import isEqual from 'lodash/isEqual';
import {
  createSearchParams,
  generateSearchData,
  getSearchResults,
  getSearchRelatedContextsFacets,
  transformSearchResponseTableData,
  encodeSerializedParams,
  serializeParams,
} from '../services/assurance/search.js';
import logger from '../utils/logger.js';
import { replaceURLSearchParams } from '../utils/url.js';

export const transformMetricBrowserState = (metricBrowser, searchResponse, fetchTime) => {
  const tableData = transformSearchResponseTableData(searchResponse);

  const searchData = generateSearchData(metricBrowser.context, searchResponse);

  const enrichedTableData = tableData.map((obj, index) => ({
    ...obj,
    ...searchData[index],
  }));

  metricBrowser.data.fetchTime = fetchTime;
  metricBrowser.data.tableData = enrichedTableData;
  metricBrowser.data.numpages = Math.ceil(searchResponse.total / metricBrowser.data.numentries);
  metricBrowser.data.currentpage =
    metricBrowser.payload?.currentPage || metricBrowser.data.currentpage;
  metricBrowser.data.total = searchResponse.total;
  if (metricBrowser.payload?.sortBy) {
    metricBrowser.data.sort.sortBy = metricBrowser.payload.sortBy;
    metricBrowser.data.sort.sortOrder = metricBrowser.payload.sortOrder;
    // Set sort in table columns
    const { columns } = metricBrowser.context;
    const { sort } = metricBrowser.data;
    if (columns) {
      columns.forEach((col) => {
        col.sort = null;
        if (sort.sortBy.id === col.attribute) {
          col.sort = sort.sortOrder;
        }
      });
    }
  }
  // Preserve the currently selected row if in frame
  if (metricBrowser?.selectedRow?.selected) {
    const { selectedRow } = metricBrowser;
    metricBrowser.data.tableData = metricBrowser.data.tableData.map((row) => {
      if (isEqual(row.metadata.context, selectedRow.metadata.context)) {
        row.selected = true;
      }
      return row;
    });
  }

  metricBrowser.loading = false;
  metricBrowser.fetchError = undefined;
};

/**
 * Update table data
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param {number} index
 */
export const setTableData = async ({ getState, updateState }, index) => {
  const searchParams = createSearchParams(getState().browsers[index]);
  await getSearchResults(searchParams)
    .then((searchResponse) => {
      const state = getState();
      transformMetricBrowserState(state.browsers[index], searchResponse, new Date().getTime());
      searchParams.id = state.browsers[index].id;
      const urlSearchParams = new URLSearchParams(
        encodeSerializedParams(serializeParams(searchParams)),
      );
      replaceURLSearchParams(urlSearchParams);
      state.browsers[index].urlSearchParams = urlSearchParams.toString();
      updateState(state);
    })
    .catch((err) => {
      const state = getState();
      state.browsers[index].fetchError = err;
      console.warn(err);
      logger.error(err);
    })
    .finally(() => {
      const state = getState();
      state.browsers[index].loading = false;
      updateState(state);
    });
};

/**
 * Updates the relationActions state with the `ContextFacet` data returned from the facet endpoint
 * @param {Object} browser - The browser state
 * @param {Object} contextFacetsResponse - The response object received from the /:index/search/related-contexts-facets endpoint
 * @param {String} facetCountKey - The key of the facet count that needs to be updated
 * @returns {Object} An updated relationActions object (the context facet count is applied)
 */
export const transformRelationActionsState = (browser, contextFacetsResponse, facetCountKey) => {
  browser.relationActions = browser.relationActions.map((relationAction) => {
    const contextTypeId = relationAction.data.context.id;
    const facetCountObject = contextFacetsResponse.find(
      (contextFacet) => contextFacet.contextType.id === contextTypeId,
    );
    return {
      ...relationAction,
      facetCounts: {
        ...relationAction.facetCounts,
        [facetCountKey]: facetCountObject.count,
      },
    };
  });
};

/**
 *
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param {String} searchIndex - The OpenSearch index name
 * @param {String} contextTypeId - The contextTypeId of the browser (sometimes referred to as the full_context)
 * @param {Context} contextId - The `Context` object that will be sent to the facet endpoint as a query parameter
 * @param {String} facetCountKey - The key of the facet count that needs to be updated
 */
export const setFacetCounts = async (
  { getSubState, updateSubState },
  searchIndex,
  contextTypeId,
  contextId,
  facetCountKey,
) => {
  await getSearchRelatedContextsFacets({ index: searchIndex, contextId, contextTypeId })
    .then((contextFacetsResponse) => {
      const browser = getSubState();
      transformRelationActionsState(browser, contextFacetsResponse, facetCountKey);
      updateSubState(browser);
    })
    .catch((err) => {
      const browser = getSubState();
      browser.fetchError = err;
      console.warn(err);
      logger.error(err);
    })
    .finally(() => {
      const browser = getSubState();
      browser.loading = false;
      updateSubState(browser);
    });
};

/**
 * Handler for 'clear-facet-counts' event
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param {String} facetCountKey - The key of the facet count that needs to be cleared
 */
export const clearFacetCounts = async ({ getSubState, updateSubState }, facetCountKey) => {
  const browser = getSubState();
  browser.relationActions = browser.relationActions.map((relationAction) => ({
    ...relationAction,
    facetCounts: {
      ...relationAction.facetCounts,
      [facetCountKey]: undefined,
    },
  }));
  browser.loading = false;
  updateSubState(browser);
};

/**
 * Handler for 'update-facet-counts' event
 * @param {StateAccessor} stateAccessor - accessor to the state of application
 * @param {Object} rowData - An object that contains the column names as keys and the row data as values
 * @param {String} facetCountKey - The key of the facet count that needs to be updated
 */
export const updateFacetCounts = async (
  { getSubState, updateSubState },
  { rowData, facetCountKey },
) => {
  await clearFacetCounts({ getSubState, updateSubState }, facetCountKey);
  const browser = getSubState();
  const searchIndex = browser?.context?.index;
  const contextTypeId = browser?.context?.contextType?.id;
  const entityTypeIds = browser?.context?.contextType?.contextFields.map(
    (entityType) => entityType?.id,
  );
  const contextFields = entityTypeIds.map((entityTypeId) =>
    Object.keys(rowData)
      .filter((key) => key === entityTypeId)
      .reduce(
        (newObject, key) =>
          Object.assign(newObject, {
            id: rowData[key].value,
            type: {
              id: key,
            },
          }),
        {},
      ),
  );
  const contextId = {
    type: browser?.context?.contextType,
    contextFields,
  };
  await setFacetCounts(
    { getSubState, updateSubState },
    searchIndex,
    contextTypeId,
    contextId,
    facetCountKey,
  );
};

export const updateSettings = async (
  { getSubState, updateSubState },
  { autoRefresh, columns, rowHeight },
) => {
  const browser = getSubState();
  browser.context.columns = columns;
  browser.settings = { autoRefresh, rowHeight };
  updateSubState(browser);
};
