import { expect } from '@open-wc/testing';
import cloneDeep from 'lodash/cloneDeep';
import {
  createInitialBrowser,
  removeBrowser,
  globalContextSelection,
  tableActions,
  tableActionsRowSelected,
  triggerBrowserUpdate,
  updateHistoricalDashboardVisibility,
  updateURLParams,
} from '../../src/state/tabActions';
import defaultState from '../../mocks/state/tabActions/createInitialBrowser/defaultState.json';
import defaultBrowser from '../../mocks/state/tabActions/createInitialBrowser/defaultBrowser.json';
import globalContextSelectionInitialState from '../../mocks/state/tabActions/globalContextSelection/initialState.json';
import globalContextSelectionMetadata1 from '../../mocks/state/tabActions/globalContextSelection/metadata1.json';
import globalContextSelectionExpectedState1 from '../../mocks/state/tabActions/globalContextSelection/expectedState1.json';
import globalContextSelectionMetadata2 from '../../mocks/state/tabActions/globalContextSelection/metadata2.json';
import globalContextSelectionExpectedState2 from '../../mocks/state/tabActions/globalContextSelection/expectedState2.json';
import updateHistoricalDashboardVisibilityStates from '../../mocks/state/tabActions/updateHistoricalDashboardVisibility/state.json';

describe('Tab actions tests', () => {
  describe('state transformation tests', () => {
    it('should create initial browser with default when none are provided', () => {
      let actual = {};
      /**
       *
       * @type {StateAccessor}
       */
      const stateAccessor = {
        getState: () => defaultState,
        updateState(s) {
          actual = { ...s };
        },
      };

      createInitialBrowser(stateAccessor);

      expect(actual.browsers.length).to.equal(1);
    });

    it('should use last active stored browser when initialized with browsers instead of defaulting a new browser', () => {
      const storedInitStateWithBrowser = cloneDeep(defaultState);
      const fakeInitialBrowser = cloneDeep(defaultBrowser);
      fakeInitialBrowser.title = 'My Test Stored Browser';
      fakeInitialBrowser.active = true;
      storedInitStateWithBrowser.browsers = [fakeInitialBrowser];
      let actual = {};
      /**
       *
       * @type {StateAccessor}
       */
      const stateAccessor = {
        getState: () => storedInitStateWithBrowser,
        updateState(s) {
          actual = { ...s };
        },
      };

      createInitialBrowser(stateAccessor);

      expect(fakeInitialBrowser.title).to.equal(actual.browsers[0].title);
      expect(actual.browsers.length).to.equal(1);
    });

    it('should remove appropriate browser when removeBrowser is called', () => {
      const initStateWithBrowser = cloneDeep(defaultState);

      const fakeInitialBrowser1 = cloneDeep(defaultBrowser);
      fakeInitialBrowser1.title = 'My Test Stored Browser 1';
      fakeInitialBrowser1.id = 1;
      fakeInitialBrowser1.active = true;

      const fakeInitialBrowser2 = cloneDeep(defaultBrowser);
      fakeInitialBrowser2.title = 'My Test Stored Browser 2';
      fakeInitialBrowser2.id = 2;
      fakeInitialBrowser2.active = false;

      initStateWithBrowser.browsers = [fakeInitialBrowser1, fakeInitialBrowser2];

      let actual = {};
      /**
       *
       * @type {StateAccessor}
       */
      const stateAccessor = {
        getState: () => initStateWithBrowser,
        updateState(s) {
          actual = { ...s };
        },
      };

      removeBrowser(stateAccessor, 1);

      expect(actual.browsers[0].id).to.equal(2);
      expect(actual.browsers.length).to.equal(1);
    });

    it('OS: should apply sorting effect on browser update', () => {
      const fakeInitialBrowserWithSort = cloneDeep(defaultBrowser);
      fakeInitialBrowserWithSort.title = 'Test Browser with sort OS';

      let actual = {};
      /**
       *
       * @type {StateAccessor}
       */
      const stateAccessor = {
        getSubState: () => fakeInitialBrowserWithSort,
        updateSubState(s) {
          actual = { ...s };
        },
      };

      triggerBrowserUpdate(stateAccessor, {}, { persistenceEngine: 'os' });
      expect(actual.data.sort.isNewSortApplied).to.be.false;
    });

    it("VM: shouldn't apply sorting effect on browser update", () => {
      const fakeInitialBrowserWithSort = cloneDeep(defaultBrowser);
      fakeInitialBrowserWithSort.title = 'Test Browser with sort VM';

      let actual = {};
      /**
       *
       * @type {StateAccessor}
       */
      const stateAccessor = {
        getSubState: () => fakeInitialBrowserWithSort,
        updateSubState(s) {
          actual = { ...s };
        },
      };

      triggerBrowserUpdate(stateAccessor, {}, { persistenceEngine: 'vm' });
      expect(actual.data.sort.isNewSortApplied).to.not.exist;
    });
  });

  describe('should update the selected KPI context and the historical dashboard model', async () => {
    let actual = {};
    /**
     *
     * @type {StateAccessor}
     */
    const stateAccessor = {
      getState: () => globalContextSelectionInitialState,
      updateState(s) {
        actual = { ...s };
      },
    };

    globalContextSelection(stateAccessor, {
      metadata: globalContextSelectionMetadata1,
    });

    // Comparing the selectedKpiContext states
    expect(actual.selectedKpiContext).to.deep.eql(
      globalContextSelectionExpectedState1.selectedKpiContext,
    );

    // Comparing the historicalDashboardModel states
    const actualHistoricalDashboardModel =
      actual.browsers[0].historicalDashboardData.historicalDashboardModel;

    const { dashboards, widgets, sources } = actualHistoricalDashboardModel;

    it('Should generate one dashboard', async () => {
      await expect(dashboards.length).to.eql(1);
    });

    it('Should generate four widgets', async () => {
      await expect(widgets.length).to.eql(4);
    });

    it('Should generate four sources', async () => {
      await expect(sources.length).to.eql(4);
    });
  });
  describe('globalContextSelection tests', () => {
    let actual = {};
    /**
     *
     * @type {StateAccessor}
     */
    const stateAccessor = {
      getState: () => globalContextSelectionInitialState,
      updateState(s) {
        actual = { ...s };
      },
    };

    globalContextSelection(stateAccessor, {
      metadata: globalContextSelectionMetadata2,
    });

    it('should handle empty input arguments', async () => {
      // Comparing the selectedKpiContext states
      expect(actual.selectedKpiContext).to.deep.eql(
        globalContextSelectionExpectedState2.selectedKpiContext,
      );
    });

    // Comparing the historicalDashboardModel states
    const actualHistoricalDashboardModel =
      actual.browsers[0].historicalDashboardData.historicalDashboardModel;

    const { dashboards, widgets, sources } = actualHistoricalDashboardModel;

    it('Should generate one dashboard', async () => {
      await expect(dashboards.length).to.eql(0);
    });

    it('Should generate four widgets', async () => {
      await expect(widgets.length).to.eql(0);
    });

    it('Should generate four sources', async () => {
      await expect(sources.length).to.eql(0);
    });
  });

  describe('updateHistoricalDashboardVisibility tests', () => {
    it('should update the showHistoricalDashboard flag for the historical dashboard state data properly', async () => {
      let actual = {};
      const newVisibilityStatus = true;

      /**
       *
       * @type {StateAccessor}
       */
      const stateAccessor = {
        getState: () => cloneDeep(updateHistoricalDashboardVisibilityStates.state1),
        updateState(s) {
          actual = { ...s };
        },
      };

      updateHistoricalDashboardVisibility(stateAccessor, {
        newVisibilityStatus,
      });

      expect(actual).to.deep.eql(updateHistoricalDashboardVisibilityStates.state2);
    });

    it("should handle an undefined input argument and update the showHistoricalDashboard flag to it's default value of false", async () => {
      let actual = {};
      const newVisibilityStatus = undefined;

      /**
       *
       * @type {StateAccessor}
       */
      const stateAccessor = {
        getState: () => cloneDeep(updateHistoricalDashboardVisibilityStates.state2),
        updateState(s) {
          actual = { ...s };
        },
      };

      updateHistoricalDashboardVisibility(stateAccessor, {
        newVisibilityStatus,
      });

      expect(actual).to.deep.eql(updateHistoricalDashboardVisibilityStates.state1);
    });
  });

  describe('should correctly set parameters to open the historical dashboard when open-charts is invoked', () => {
    it('should create a new tab when open-tab is invoked', () => {
      let actual = {};

      const state = {
        browsers: [
          {
            id: 'test-2',
            active: true,
            context: {
              index: 'test-index-2',
              contextType: { id: 'test-context-type-2' },
              metricTypes: [{ id: 'ac' }, { id: 'bc' }, { id: 'cc' }],
              id: 'context-id-2',
            },
            filters: [],
            historicalDashboardData: {
              historicalDashboardModel: {},
              showHistoricalDashboard: false,
            },
            data: {
              total: 0,
              numpages: 1,
              numentries: 13,
              currentpage: 1,
              tableData: [],
              sort: {
                sortBy: undefined,
                sortOrder: undefined,
              },
            },
          },
        ],
      };

      /**
       *
       * @type {StateAccessor}
       */
      const stateAccessor = {
        getState: () => state,
        updateState(s) {
          actual = { ...s };
        },
      };

      tableActions(stateAccessor, {
        operation: 'open-charts',
        data: {
          metadata: {
            context: {
              id: 'fake-metadata-1',
              contextFields: [
                { type: { id: 'ac' }, name: 'ac' },
                { type: { id: 'cc' }, name: 'cc' },
              ],
            },
          },
          selected: true,
        },
      });
      const { browsers } = actual;
      const { selectedRow, urlSearchParams, historicalDashboardData } = browsers[0];
      const expectedRow = {
        metadata: {
          context: {
            contextFields: [
              {
                name: 'ac',
                type: {
                  id: 'ac',
                },
              },
              {
                name: 'cc',
                type: {
                  id: 'cc',
                },
              },
            ],
            id: 'fake-metadata-1',
          },
        },
        selected: true,
      };

      const expectedURLSearchString =
        'id=test-2&contextTypeId=test-context-type-2&index=test-index-2&sortBy=ac&sortOrder=asc&chartsIds=%257B%2522ac%2522%253A%2522ac%2522%252C%2522cc%2522%253A%2522cc%2522%257D';
      const expectedHistoricalDashboardData = {
        historicalDashboardModel: {},
        noResults: false,
        showHistoricalDashboard: true,
      };

      expect(expectedRow).to.deep.equal(selectedRow);
      expect(expectedHistoricalDashboardData).to.deep.equal(historicalDashboardData);
      expect(expectedURLSearchString).to.equal(urlSearchParams);
    });

    it('should do nothing when the table action is not recognized', () => {
      let actual = {};

      const state = {
        browsers: [
          {
            id: 'test-2',
            active: true,
            context: {
              index: 'test-index-2',
              contextType: { id: 'test-context-type-2' },
              metricTypes: [{ id: 'ac' }, { id: 'bc' }, { id: 'cc' }],
              id: 'context-id-2',
            },
            filters: [],
            historicalDashboardData: {
              historicalDashboardModel: {},
              showHistoricalDashboard: false,
            },
            data: {
              total: 0,
              numpages: 1,
              numentries: 13,
              currentpage: 1,
              tableData: [],
              sort: {
                sortBy: undefined,
                sortOrder: undefined,
              },
            },
          },
        ],
      };

      /**
       *
       * @type {StateAccessor}
       */
      const stateAccessor = {
        getState: () => state,
        updateState(s) {
          actual = { ...s };
        },
      };

      tableActions(stateAccessor, {
        operation: 'open-some-unsupported-thing',
        data: {
          metadata: {
            context: {
              id: 'fake-metadata',
              contextFields: [
                { type: { id: 'ac' }, name: 'ac' },
                { type: { id: 'cc' }, name: 'cc' },
              ],
            },
          },
          selected: true,
        },
      });

      // Expect that update state won't get called and that actual will remain {}
      expect(actual).to.deep.equal({});
    });

    it('should update state correctly when a row is selected', () => {
      let actual = {};

      const subState = {
        id: 'test-3',
        active: true,
        context: {
          index: 'test-index-3',
          contextType: { id: 'test-context-type-3' },
          metricTypes: [{ id: 'ac' }, { id: 'bc' }, { id: 'cc' }],
          id: 'context-id-3',
        },
        filters: [],
        historicalDashboardData: {
          historicalDashboardModel: {},
          showHistoricalDashboard: false,
        },
        data: {
          total: 0,
          numpages: 1,
          numentries: 13,
          currentpage: 1,
          tableData: [],
          sort: {
            sortBy: undefined,
            sortOrder: undefined,
          },
        },
      };

      /**
       *
       * @type {StateAccessor}
       */
      const stateAccessor = {
        getSubState: () => subState,
        updateSubState(s) {
          actual = { ...s };
        },
      };

      tableActionsRowSelected(stateAccessor, {
        metadata: {
          context: {
            id: 'fake-metadata-3',
            contextFields: [
              { type: { id: 'ac' }, name: 'ac' },
              { type: { id: 'cc' }, name: 'cc' },
            ],
          },
        },
        selected: true,
      });

      const { selectedRow } = actual;
      expect(selectedRow.selected).to.be.true;
    });

    it('should update state correctly when a row is deselected', () => {
      let actual = {};

      const subState = {
        id: 'test-4',
        active: true,
        context: {
          index: 'test-index-4',
          contextType: { id: 'test-context-type-4' },
          metricTypes: [{ id: 'acd' }, { id: 'bcd' }, { id: 'ccd' }],
          id: 'context-id-4',
        },
        filters: [],
        historicalDashboardData: {
          historicalDashboardModel: {},
          showHistoricalDashboard: false,
        },
        selectedRow: {
          metadata: {
            context: {
              id: 'fake-metadata-4',
              contextFields: [
                { type: { id: 'acd' }, name: 'acd' },
                { type: { id: 'ccd' }, name: 'ccd' },
              ],
            },
          },
          selected: true,
        },
        data: {
          total: 0,
          numpages: 1,
          numentries: 13,
          currentpage: 1,
          tableData: [],
          sort: {
            sortBy: undefined,
            sortOrder: undefined,
          },
        },
      };

      /**
       *
       * @type {StateAccessor}
       */
      const stateAccessor = {
        getSubState: () => subState,
        updateSubState(s) {
          actual = { ...s };
        },
      };

      tableActionsRowSelected(stateAccessor, {
        metadata: {
          context: {
            id: 'fake-metadata-4',
            contextFields: [
              { type: { id: 'acd' }, name: 'acd' },
              { type: { id: 'ccd' }, name: 'ccd' },
            ],
          },
        },
        selected: false,
      });

      const { selectedRow } = actual;
      expect(selectedRow.selected).to.be.false;
    });
    it('should reset no results for historical dashboard when a row has been selected', () => {
      let actual = {};

      const subState = {
        id: 'test-5',
        active: true,
        context: {
          index: 'test-index-5',
          contextType: { id: 'test-context-type-5' },
          metricTypes: [{ id: 'acde' }, { id: 'bcde' }, { id: 'ccde' }],
          id: 'context-id-5',
        },
        filters: [],
        historicalDashboardData: {
          historicalDashboardModel: {},
          showHistoricalDashboard: true,
          noResults: true,
        },
        selectedRow: {
          metadata: {
            context: {
              id: 'fake-metadata-5',
              contextFields: [
                { type: { id: 'acde' }, name: 'acde' },
                { type: { id: 'ccde' }, name: 'ccde' },
              ],
            },
          },
          selected: false,
        },
        data: {
          total: 0,
          numpages: 1,
          numentries: 13,
          currentpage: 1,
          tableData: [],
          sort: {
            sortBy: undefined,
            sortOrder: undefined,
          },
        },
      };

      /**
       *
       * @type {StateAccessor}
       */
      const stateAccessor = {
        getSubState: () => subState,
        updateSubState(s) {
          actual = { ...s };
        },
      };

      tableActionsRowSelected(stateAccessor, {
        metadata: {
          context: {
            id: 'fake-metadata-5',
            contextFields: [
              { type: { id: 'acde' }, name: 'acde' },
              { type: { id: 'ccde' }, name: 'ccde' },
            ],
          },
        },
        selected: true,
      });

      const { historicalDashboardData } = actual;
      expect(historicalDashboardData.noResults).to.be.false;
    });

    it('should correctly update URL params search string', () => {
      const browser = {
        id: 'test-browser',
        payload: {
          sortBy: {
            id: 'b',
          },
          sortOrder: 'desc',
        },
        context: {
          index: 'test-index',
          contextType: { id: 'test-context-type' },
          metricTypes: [{ id: 'a' }, { id: 'b' }, { id: 'c' }],
          id: 'context-id',
        },
        filters: [
          {
            selected: true,
            name: 'a',
            type: { id: 'a', dataType: 'metricType' },
            value: { from: '1.0', operation: 'gte' },
          },
          {
            selected: false,
            name: 'c',
            type: { id: 'c', dataType: 'metricType' },
            value: { to: '1.0', operation: 'lte' },
          },
          {
            selected: true,
            name: 'b',
            type: { id: 'b', dataType: 'entityType' },
            value: { searchPatterm: 'cat', operation: 'eq' },
          },
        ],
        data: {
          total: 0,
          numpages: 1,
          numentries: 13,
          currentpage: 1,
          tableData: [],
          sort: {
            sortBy: undefined,
            sortOrder: undefined,
          },
        },
      };
      updateURLParams(browser);
      const expected =
        'id=test-browser&contextTypeId=test-context-type&index=test-index&filters=%255B%257B%2522name%2522%253A%2522a%2522%252C%2522type%2522%253A%2522metric%2522%252C%2522from%2522%253A%25221.0%2522%252C%2522metricType%2522%253A%257B%2522id%2522%253A%2522a%2522%257D%257D%252C%257B%2522name%2522%253A%2522b%2522%252C%2522type%2522%253A%2522entity%2522%252C%2522entityType%2522%253A%257B%2522id%2522%253A%2522b%2522%257D%257D%255D&sortBy=b&sortOrder=desc';
      expect(browser.urlSearchParams).to.equal(expected);
    });
  });
});
