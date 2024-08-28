import { expect } from '@open-wc/testing';
import cloneDeep from 'lodash/cloneDeep';
import { updateFilters, createContextFiltersFromRowAction } from '../../src/state/filterActions.js';
import osFeatureFlags from '../../mocks/featureFlagCombinations/osFeatureFlags.json';
import vmFeatureFlags from '../../mocks/featureFlagCombinations/vmFeatureFlags.json';
import addInitialState from '../../mocks/state/filterActions/addFilter/initialState.json';
import addOSExpectedState from '../../mocks/state/filterActions/addFilter/osExpectedState.json';
import addVMExpectedState from '../../mocks/state/filterActions/addFilter/vmExpectedState.json';
import editInitialState from '../../mocks/state/filterActions/editFilter/initialState.json';
import editOSExpectedState from '../../mocks/state/filterActions/editFilter/osExpectedState.json';
import editVMExpectedState from '../../mocks/state/filterActions/editFilter/vmExpectedState.json';
import selectInitialState from '../../mocks/state/filterActions/selectFilter/initialState.json';
import selectOSExpectedState from '../../mocks/state/filterActions/selectFilter/osExpectedState.json';
import selectVMExpectedState from '../../mocks/state/filterActions/selectFilter/vmExpectedState.json';
import disclosureInitialState from '../../mocks/state/filterActions/disclosureMessage/initialState.json';

describe('Filter Actions Tests', () => {
  it('OS: add-filter: adds a filter in the correct format to the state', () => {
    /* eslint-disable sonarjs/no-duplicate-string */
    const initialState = cloneDeep(addInitialState);

    const payload = {
      updateOperation: 'add-filter',
      data: {
        label: ' Slice A (NSI)',
        name: 'NSI',
        type: {
          id: 'NSI',
          description: 'Network Slice Instance',
          valueType: 'string',
        },
        value: {
          from: 0,
          to: 0,
          searchPattern: 'Slice A',
          not: false,
          operation: 'eq',
        },
        filterCategory: 'context',
        selected: true,
      },
    };

    let actual = {};

    /**
     *
     * @type {StateAccessor}
     */
    const stateAccessor = {
      getSubState: () => initialState.browsers[0],
      updateSubState(s) {
        actual = { ...s };
      },
    };

    updateFilters(stateAccessor, payload, osFeatureFlags);

    const expectedState = cloneDeep(addOSExpectedState);

    expect(actual).to.deep.equal(expectedState.browsers[0]);
  });

  it('VM: add-filter: adds a filter in the correct format to the state', () => {
    /* eslint-disable sonarjs/no-duplicate-string */
    const initialState = cloneDeep(addInitialState);

    const payload = {
      updateOperation: 'add-filter',
      data: {
        label: ' Slice A (NSI)',
        name: 'NSI',
        type: {
          id: 'NSI',
          description: 'Network Slice Instance',
          valueType: 'string',
        },
        value: {
          from: 0,
          to: 0,
          searchPattern: 'Slice A',
          not: false,
          operation: 'eq',
        },
        filterCategory: 'context',
        selected: true,
      },
    };

    let actual = {};

    /**
     *
     * @type {StateAccessor}
     */
    const stateAccessor = {
      getSubState: () => initialState.browsers[0],
      updateSubState(s) {
        actual = { ...s };
      },
    };

    updateFilters(stateAccessor, payload, vmFeatureFlags);

    const expectedState = cloneDeep(addVMExpectedState);

    expect(actual).to.deep.equal(expectedState.browsers[0]);
  });

  it('OS: edit-filter: edits a filter with the correct format in the state', () => {
    /* eslint-disable sonarjs/no-duplicate-string */
    const initialState = cloneDeep(editInitialState);

    const payload = {
      updateOperation: 'edit-filter',
      data: {
        changeItem: '1234',
        updatedFilter: {
          id: '1234',
          name: 'NSI',
          type: {
            id: 'NSI',
            description: 'Network Slice Instance',
            valueType: 'string',
          },
          value: {
            from: 0,
            to: 0,
            searchPattern: 'Slice B',
            not: false,
            operation: 'eq',
          },
          filterCategory: 'context',
          selected: true,
        },
      },
    };

    let actual = {};

    /**
     *
     * @type {StateAccessor}
     */
    const stateAccessor = {
      getSubState: () => initialState.browsers[0],
      updateSubState(s) {
        actual = { ...s };
      },
    };

    updateFilters(stateAccessor, payload, osFeatureFlags);

    const expected = cloneDeep(editOSExpectedState);

    expect(actual).to.deep.equal(expected);
  });

  it('VM: edit-filter: edits a filter with the correct format in the state', () => {
    /* eslint-disable sonarjs/no-duplicate-string */
    const initialState = cloneDeep(editInitialState);

    const payload = {
      updateOperation: 'edit-filter',
      data: {
        changeItem: '1234',
        updatedFilter: {
          id: '1234',
          name: 'NSI',
          type: {
            id: 'NSI',
            description: 'Network Slice Instance',
            valueType: 'string',
          },
          value: {
            from: 0,
            to: 0,
            searchPattern: 'Slice B',
            not: false,
            operation: 'eq',
          },
          filterCategory: 'context',
          selected: true,
        },
      },
    };

    let actual = {};

    /**
     *
     * @type {StateAccessor}
     */
    const stateAccessor = {
      getSubState: () => initialState.browsers[0],
      updateSubState(s) {
        actual = { ...s };
      },
    };

    updateFilters(stateAccessor, payload, vmFeatureFlags);

    const expected = cloneDeep(editVMExpectedState);

    expect(actual).to.deep.equal(expected);
  });

  it('OS: select-filter: selects and deselects a filter correctly in the state', () => {
    const initialState = cloneDeep(selectInitialState);

    const expected = cloneDeep(selectOSExpectedState);

    const payload = {
      updateOperation: 'select-filter',
      data: {
        type: 'context',
        id: 2,
      },
    };

    let actual = {};

    /**
     *
     * @type {StateAccessor}
     */
    const stateAccessor = {
      getSubState: () => initialState.browsers[0],
      updateSubState(s) {
        actual = { ...s };
      },
    };

    updateFilters(stateAccessor, payload, osFeatureFlags);

    expect(actual).to.deep.equal(expected);
  });

  it('VM: select-filter: selects and deselects a filter correctly in the state', () => {
    const initialState = cloneDeep(selectInitialState);
    const expected = cloneDeep(selectVMExpectedState);

    const payload = {
      updateOperation: 'select-filter',
      data: {
        type: 'context',
        id: 2,
      },
    };

    let actual = {};

    /**
     *
     * @type {StateAccessor}
     */
    const stateAccessor = {
      getSubState: () => initialState.browsers[0],
      updateSubState(s) {
        actual = { ...s };
      },
    };

    updateFilters(stateAccessor, payload, vmFeatureFlags);

    expect(actual).to.deep.equal(expected);
  });

  it('remove-filter: removes a filter correctly (given type and name) from the state', () => {
    /* eslint-disable sonarjs/no-duplicate-string */
    const initialMetricBrowser = {
      title: ' NSSAI & NSI',
      filters: [],
      loading: false,
      active: true,
      id: 'testid',
      context: {
        filterCategories: [
          {
            type: 'context',
            title: 'Network Filters',
            selection: 'checkbox',
            fields: [
              {
                label: 'Network Slice Selection Assistance Information',
                name: 'NSSAI',
                filterCategory: 'context',
                type: {
                  id: 'NSSAI',
                  description: 'Network Slice Selection Assistance Information',
                  valueType: 'string',
                },
              },
              {
                label: 'Network Slice Instance',
                name: 'NSI',
                filterCategory: 'context',
                type: {
                  id: 'NSI',
                  description: 'Network Slice Instance',
                  valueType: 'string',
                },
              },
            ],
            help: 'NETWORK_FILTER_TOOLTIP_MESSAGE',
          },
          {
            type: 'metric',
            title: 'Measurement Filters',
            selection: 'radio',
            fields: [
              {
                label: 'Session Modification Request Received',
                name: 'vi_sessionModificationReqRcvd',
                filterCategory: 'metric',
                type: {
                  id: 'vi_sessionModificationReqRcvd',
                  valueType: 'integer',
                  description: 'Session Modification Request Received',
                },
              },
              {
                label: 'Dropped Packets',
                name: 'vi_dlUnstrDropPackets',
                filterCategory: 'metric',
                type: {
                  id: 'vi_dlUnstrDropPackets',
                  valueType: 'integer',
                  description: 'Dropped Packets',
                },
              },
            ],
            help: 'MEASUREMENT_FILTER_TOOLTIP_MESSAGE',
          },
        ],
        columns: [
          {
            title: 'Network Slice Selection Assistance Information',
            attribute: 'NSSAI',
            valueType: 'string',
            sortable: true,
          },
          {
            title: 'Network Slice Instance',
            attribute: 'NSI',
            valueType: 'string',
            sortable: true,
          },
          {
            title: 'Session Modification Request Received',
            attribute: 'vi_sessionModificationReqRcvd',
            valueType: 'integer',
            sortable: true,
          },
          {
            title: 'Dropped Packets',
            attribute: 'vi_dlUnstrDropPackets',
            valueType: 'integer',
            sortable: true,
          },
        ],
      },
      match: '',
      error: undefined,
      data: {
        tableData: [],
        sort: {},
        currentpage: 1,
        numentries: 20,
        numpages: 1,
        fetchTime: 1686597285023,
      },
    };

    const initialState = {
      browsers: [
        {
          ...initialMetricBrowser,
          filters: [
            {
              id: '123',
              name: 'NSI',
              type: {
                id: 'NSI',
                description: 'Network Slice Instance',
                valueType: 'string',
              },
              value: {
                from: 0,
                to: 0,
                searchPattern: 'Slice A',
                not: false,
                operation: 'eq',
              },
              filterCategory: 'context',
              selected: false,
            },
            {
              id: '234',
              name: 'NSI',
              type: {
                id: 'NSI',
                description: 'Network Slice Instance',
                valueType: 'string',
              },
              value: {
                from: 0,
                to: 0,
                searchPattern: 'Slice B',
                not: false,
                operation: 'eq',
              },
              filterCategory: 'context',
              selected: true,
            },
            {
              id: '345',
              name: 'NSI',
              type: {
                id: 'NSI',
                description: 'Network Slice Instance',
                valueType: 'string',
              },
              value: {
                from: 0,
                to: 0,
                searchPattern: 'Slice C',
                not: false,
                operation: 'eq',
              },
              filterCategory: 'context',
              selected: false,
            },
          ],
          loading: false,
        },
      ],
    };

    const expected = {
      ...initialState.browsers[0],
      payload: {},
      filters: [
        {
          id: '234',
          name: 'NSI',
          type: {
            id: 'NSI',
            description: 'Network Slice Instance',
            valueType: 'string',
          },
          value: {
            from: 0,
            to: 0,
            searchPattern: 'Slice B',
            not: false,
            operation: 'eq',
          },
          filterCategory: 'context',
          selected: true,
        },
        {
          id: '345',
          name: 'NSI',
          type: {
            id: 'NSI',
            description: 'Network Slice Instance',
            valueType: 'string',
          },
          value: {
            from: 0,
            to: 0,
            searchPattern: 'Slice C',
            not: false,
            operation: 'eq',
          },
          filterCategory: 'context',
          selected: false,
        },
      ],
      loading: true,
    };

    const payload = {
      updateOperation: 'remove-filter',
      data: {
        type: 'context',
        id: '123',
      },
    };

    let actual = {};

    /**
     *
     * @type {StateAccessor}
     */
    const stateAccessor = {
      getSubState: () => initialState.browsers[0],
      updateSubState(s) {
        actual = { ...s };
      },
    };

    updateFilters(stateAccessor, payload);

    expect(actual).to.deep.equal(expected);
  });
  it('select-all-of-type: selects all filters of a type in the state', () => {
    /* eslint-disable sonarjs/no-duplicate-string */
    const initialMetricBrowser = {
      title: ' NSSAI & NSI',
      filters: [],
      loading: false,
      active: true,
      id: 'testid',
      context: {
        filterCategories: [
          {
            type: 'context',
            title: 'Network Filters',
            selection: 'checkbox',
            fields: [
              {
                label: 'Network Slice Selection Assistance Information',
                name: 'NSSAI',
                filterCategory: 'context',
                type: {
                  id: 'NSSAI',
                  description: 'Network Slice Selection Assistance Information',
                  valueType: 'string',
                },
              },
              {
                label: 'Network Slice Instance',
                name: 'NSI',
                filterCategory: 'context',
                type: {
                  id: 'NSI',
                  description: 'Network Slice Instance',
                  valueType: 'string',
                },
              },
            ],
            help: 'NETWORK_FILTER_TOOLTIP_MESSAGE',
          },
          {
            type: 'metric',
            title: 'Measurement Filters',
            selection: 'radio',
            fields: [
              {
                label: 'Session Modification Request Received',
                name: 'vi_sessionModificationReqRcvd',
                filterCategory: 'metric',
                type: {
                  id: 'vi_sessionModificationReqRcvd',
                  valueType: 'integer',
                  description: 'Session Modification Request Received',
                },
              },
              {
                label: 'Dropped Packets',
                name: 'vi_dlUnstrDropPackets',
                filterCategory: 'metric',
                type: {
                  id: 'vi_dlUnstrDropPackets',
                  valueType: 'integer',
                  description: 'Dropped Packets',
                },
              },
            ],
            help: 'MEASUREMENT_FILTER_TOOLTIP_MESSAGE',
          },
        ],
        columns: [
          {
            title: 'Network Slice Selection Assistance Information',
            attribute: 'NSSAI',
            valueType: 'string',
            sortable: true,
          },
          {
            title: 'Network Slice Instance',
            attribute: 'NSI',
            valueType: 'string',
            sortable: true,
          },
          {
            title: 'Session Modification Request Received',
            attribute: 'vi_sessionModificationReqRcvd',
            valueType: 'integer',
            sortable: true,
          },
          {
            title: 'Dropped Packets',
            attribute: 'vi_dlUnstrDropPackets',
            valueType: 'integer',
            sortable: true,
          },
        ],
      },
      match: '',
      error: undefined,
      data: {
        tableData: [],
        sort: {},
        currentpage: 1,
        numentries: 20,
        numpages: 1,
        fetchTime: 1686597285023,
      },
    };

    const initialState = {
      browsers: [
        {
          ...initialMetricBrowser,
          filters: [
            {
              label: ' Slice A (NSI)',
              name: 'NSI',
              type: {
                id: 'NSI',
                description: 'Network Slice Instance',
                valueType: 'string',
              },
              value: {
                from: 0,
                to: 0,
                searchPattern: 'Slice A',
                not: false,
                operation: 'eq',
              },
              filterCategory: 'context',
              selected: false,
            },
            {
              label: ' Slice B (NSI)',
              name: 'NSI',
              type: {
                id: 'NSI',
                description: 'Network Slice Instance',
                valueType: 'string',
              },
              value: {
                from: 0,
                to: 0,
                searchPattern: 'Slice B',
                not: false,
                operation: 'eq',
              },
              filterCategory: 'context',
              selected: false,
            },
            {
              label: ' Slice C (NSI)',
              name: 'NSI',
              type: {
                id: 'NSI',
                description: 'Network Slice Instance',
                valueType: 'string',
              },
              value: {
                from: 0,
                to: 0,
                searchPattern: 'Slice C',
                not: false,
                operation: 'eq',
              },
              filterCategory: 'context',
              selected: false,
            },
          ],
          loading: false,
        },
      ],
    };

    const expected = {
      ...initialState.browsers[0],
      payload: {},
      filters: initialState.browsers[0].filters.map((f) => ({ ...f, selected: true })),
      loading: true,
    };

    const payload = {
      updateOperation: 'select-all-of-type',
      data: 'context',
    };

    let actual = {};

    /**
     *
     * @type {StateAccessor}
     */
    const stateAccessor = {
      getSubState: () => initialState.browsers[0],
      updateSubState(s) {
        actual = { ...s };
      },
    };

    updateFilters(stateAccessor, payload);

    expect(actual).to.deep.equal(expected);
  });
  it('clear-all-of-type: deselects all filters of a type in the state', () => {
    /* eslint-disable sonarjs/no-duplicate-string */
    const initialMetricBrowser = {
      title: ' NSSAI & NSI',
      filters: [],
      loading: false,
      active: true,
      id: 'testid',
      context: {
        filterCategories: [
          {
            type: 'context',
            title: 'Network Filters',
            selection: 'checkbox',
            fields: [
              {
                label: 'Network Slice Selection Assistance Information',
                name: 'NSSAI',
                filterCategory: 'context',
                type: {
                  id: 'NSSAI',
                  description: 'Network Slice Selection Assistance Information',
                  valueType: 'string',
                },
              },
              {
                label: 'Network Slice Instance',
                name: 'NSI',
                filterCategory: 'context',
                type: {
                  id: 'NSI',
                  description: 'Network Slice Instance',
                  valueType: 'string',
                },
              },
            ],
            help: 'NETWORK_FILTER_TOOLTIP_MESSAGE',
          },
          {
            type: 'metric',
            title: 'Measurement Filters',
            selection: 'radio',
            fields: [
              {
                label: 'Session Modification Request Received',
                name: 'vi_sessionModificationReqRcvd',
                filterCategory: 'metric',
                type: {
                  id: 'vi_sessionModificationReqRcvd',
                  valueType: 'integer',
                  description: 'Session Modification Request Received',
                },
              },
              {
                label: 'Dropped Packets',
                name: 'vi_dlUnstrDropPackets',
                filterCategory: 'metric',
                type: {
                  id: 'vi_dlUnstrDropPackets',
                  valueType: 'integer',
                  description: 'Dropped Packets',
                },
              },
            ],
            help: 'MEASUREMENT_FILTER_TOOLTIP_MESSAGE',
          },
        ],
        columns: [
          {
            title: 'Network Slice Selection Assistance Information',
            attribute: 'NSSAI',
            valueType: 'string',
            sortable: true,
          },
          {
            title: 'Network Slice Instance',
            attribute: 'NSI',
            valueType: 'string',
            sortable: true,
          },
          {
            title: 'Session Modification Request Received',
            attribute: 'vi_sessionModificationReqRcvd',
            valueType: 'integer',
            sortable: true,
          },
          {
            title: 'Dropped Packets',
            attribute: 'vi_dlUnstrDropPackets',
            valueType: 'integer',
            sortable: true,
          },
        ],
      },
      match: '',
      error: undefined,
      data: {
        tableData: [],
        sort: {},
        currentpage: 1,
        numentries: 20,
        numpages: 1,
        fetchTime: 1686597285023,
      },
    };

    const initialState = {
      browsers: [
        {
          ...initialMetricBrowser,
          filters: [
            {
              label: ' Slice A (NSI)',
              name: 'NSI',
              type: {
                id: 'NSI',
                description: 'Network Slice Instance',
                valueType: 'string',
              },
              value: {
                from: 0,
                to: 0,
                searchPattern: 'Slice A',
                not: false,
                operation: 'eq',
              },
              filterCategory: 'context',
              selected: false,
            },
            {
              label: ' Slice B (NSI)',
              name: 'NSI',
              type: {
                id: 'NSI',
                description: 'Network Slice Instance',
                valueType: 'string',
              },
              value: {
                from: 0,
                to: 0,
                searchPattern: 'Slice B',
                not: false,
                operation: 'eq',
              },
              filterCategory: 'context',
              selected: true,
            },
            {
              label: ' Slice C (NSI)',
              name: 'NSI',
              type: {
                id: 'NSI',
                description: 'Network Slice Instance',
                valueType: 'string',
              },
              value: {
                from: 0,
                to: 0,
                searchPattern: 'Slice C',
                not: false,
                operation: 'eq',
              },
              filterCategory: 'context',
              selected: true,
            },
          ],
          loading: false,
        },
      ],
    };

    const expected = {
      ...initialState.browsers[0],
      payload: {},
      filters: initialState.browsers[0].filters.map((f) => ({ ...f, selected: false })),
      loading: true,
    };

    const payload = {
      updateOperation: 'clear-all-of-type',
      data: 'context',
    };

    let actual = {};

    /**
     *
     * @type {StateAccessor}
     */
    const stateAccessor = {
      getSubState: () => initialState.browsers[0],
      updateSubState(s) {
        actual = { ...s };
      },
    };

    updateFilters(stateAccessor, payload);

    expect(actual).to.deep.equal(expected);
  });
  it('remove-all-of-type: removes all filters of a type from the state', () => {
    /* eslint-disable sonarjs/no-duplicate-string */
    const initialMetricBrowser = {
      title: ' NSSAI & NSI',
      filters: [],
      loading: false,
      active: true,
      id: 'testid',
      context: {
        filterCategories: [
          {
            type: 'context',
            title: 'Network Filters',
            selection: 'checkbox',
            fields: [
              {
                label: 'Network Slice Selection Assistance Information',
                name: 'NSSAI',
                filterCategory: 'context',
                type: {
                  id: 'NSSAI',
                  description: 'Network Slice Selection Assistance Information',
                  valueType: 'string',
                },
              },
              {
                label: 'Network Slice Instance',
                name: 'NSI',
                filterCategory: 'context',
                type: {
                  id: 'NSI',
                  description: 'Network Slice Instance',
                  valueType: 'string',
                },
              },
            ],
            help: 'NETWORK_FILTER_TOOLTIP_MESSAGE',
          },
          {
            type: 'metric',
            title: 'Measurement Filters',
            selection: 'radio',
            fields: [
              {
                label: 'Session Modification Request Received',
                name: 'vi_sessionModificationReqRcvd',
                filterCategory: 'metric',
                type: {
                  id: 'vi_sessionModificationReqRcvd',
                  valueType: 'integer',
                  description: 'Session Modification Request Received',
                },
              },
              {
                label: 'Dropped Packets',
                name: 'vi_dlUnstrDropPackets',
                filterCategory: 'metric',
                type: {
                  id: 'vi_dlUnstrDropPackets',
                  valueType: 'integer',
                  description: 'Dropped Packets',
                },
              },
            ],
            help: 'MEASUREMENT_FILTER_TOOLTIP_MESSAGE',
          },
        ],
        columns: [
          {
            title: 'Network Slice Selection Assistance Information',
            attribute: 'NSSAI',
            valueType: 'string',
            sortable: true,
          },
          {
            title: 'Network Slice Instance',
            attribute: 'NSI',
            valueType: 'string',
            sortable: true,
          },
          {
            title: 'Session Modification Request Received',
            attribute: 'vi_sessionModificationReqRcvd',
            valueType: 'integer',
            sortable: true,
          },
          {
            title: 'Dropped Packets',
            attribute: 'vi_dlUnstrDropPackets',
            valueType: 'integer',
            sortable: true,
          },
        ],
      },
      match: '',
      error: undefined,
      data: {
        tableData: [],
        sort: {},
        currentpage: 1,
        numentries: 20,
        numpages: 1,
        fetchTime: 1686597285023,
      },
    };

    const initialState = {
      browsers: [
        {
          ...initialMetricBrowser,
          filters: [
            {
              label: ' Slice A (NSI)',
              name: 'NSI',
              type: {
                id: 'NSI',
                description: 'Network Slice Instance',
                valueType: 'string',
              },
              value: {
                from: 0,
                to: 0,
                searchPattern: 'Slice A',
                not: false,
                operation: 'eq',
              },
              filterCategory: 'context',
              selected: false,
            },
            {
              label: ' Slice B (NSI)',
              name: 'NSI',
              type: {
                id: 'NSI',
                description: 'Network Slice Instance',
                valueType: 'string',
              },
              value: {
                from: 0,
                to: 0,
                searchPattern: 'Slice B',
                not: false,
                operation: 'eq',
              },
              filterCategory: 'context',
              selected: true,
            },
            {
              label: ' Slice C (NSI)',
              name: 'NSI',
              type: {
                id: 'NSI',
                description: 'Network Slice Instance',
                valueType: 'string',
              },
              value: {
                from: 0,
                to: 0,
                searchPattern: 'Slice C',
                not: false,
                operation: 'eq',
              },
              filterCategory: 'context',
              selected: false,
            },
          ],
          loading: false,
        },
      ],
    };

    const expected = {
      ...initialState.browsers[0],
      payload: {},
      filters: [],
      loading: true,
    };

    const payload = {
      updateOperation: 'remove-all-of-type',
      data: 'context',
    };

    let actual = {};

    /**
     *
     * @type {StateAccessor}
     */
    const stateAccessor = {
      getSubState: () => initialState.browsers[0],
      updateSubState(s) {
        actual = { ...s };
      },
    };

    updateFilters(stateAccessor, payload);

    expect(actual).to.deep.equal(expected);
  });
  it('clear-all-filters: deselects all filters in the state', () => {
    /* eslint-disable sonarjs/no-duplicate-string */
    const initialMetricBrowser = {
      title: ' NSSAI & NSI',
      filters: [],
      loading: false,
      active: true,
      id: 'testid',
      context: {
        filterCategories: [
          {
            type: 'context',
            title: 'Network Filters',
            selection: 'checkbox',
            fields: [
              {
                label: 'Network Slice Selection Assistance Information',
                name: 'NSSAI',
                filterCategory: 'context',
                type: {
                  id: 'NSSAI',
                  description: 'Network Slice Selection Assistance Information',
                  valueType: 'string',
                },
              },
              {
                label: 'Network Slice Instance',
                name: 'NSI',
                filterCategory: 'context',
                type: {
                  id: 'NSI',
                  description: 'Network Slice Instance',
                  valueType: 'string',
                },
              },
            ],
            help: 'NETWORK_FILTER_TOOLTIP_MESSAGE',
          },
          {
            type: 'metric',
            title: 'Measurement Filters',
            selection: 'radio',
            fields: [
              {
                label: 'Session Modification Request Received',
                name: 'vi_sessionModificationReqRcvd',
                filterCategory: 'metric',
                type: {
                  id: 'vi_sessionModificationReqRcvd',
                  valueType: 'integer',
                  description: 'Session Modification Request Received',
                },
              },
              {
                label: 'Dropped Packets',
                name: 'vi_dlUnstrDropPackets',
                filterCategory: 'metric',
                type: {
                  id: 'vi_dlUnstrDropPackets',
                  valueType: 'integer',
                  description: 'Dropped Packets',
                },
              },
            ],
            help: 'MEASUREMENT_FILTER_TOOLTIP_MESSAGE',
          },
        ],
        columns: [
          {
            title: 'Network Slice Selection Assistance Information',
            attribute: 'NSSAI',
            valueType: 'string',
            sortable: true,
          },
          {
            title: 'Network Slice Instance',
            attribute: 'NSI',
            valueType: 'string',
            sortable: true,
          },
          {
            title: 'Session Modification Request Received',
            attribute: 'vi_sessionModificationReqRcvd',
            valueType: 'integer',
            sortable: true,
          },
          {
            title: 'Dropped Packets',
            attribute: 'vi_dlUnstrDropPackets',
            valueType: 'integer',
            sortable: true,
          },
        ],
      },
      match: '',
      error: undefined,
      data: {
        tableData: [],
        sort: {},
        currentpage: 1,
        numentries: 20,
        numpages: 1,
        fetchTime: 1686597285023,
      },
    };

    const initialState = {
      browsers: [
        {
          ...initialMetricBrowser,
          filters: [
            {
              label: ' Slice A (NSI)',
              name: 'NSI',
              type: {
                id: 'NSI',
                description: 'Network Slice Instance',
                valueType: 'string',
              },
              value: {
                from: 0,
                to: 0,
                searchPattern: 'Slice A',
                not: false,
                operation: 'eq',
              },
              filterCategory: 'context',
              selected: false,
            },
            {
              label: ' Slice B (NSI)',
              name: 'NSI',
              type: {
                id: 'NSI',
                description: 'Network Slice Instance',
                valueType: 'string',
              },
              value: {
                from: 0,
                to: 0,
                searchPattern: 'Slice B',
                not: false,
                operation: 'eq',
              },
              filterCategory: 'context',
              selected: true,
            },
            {
              label: ' Slice C (NSI)',
              name: 'NSI',
              type: {
                id: 'NSI',
                description: 'Network Slice Instance',
                valueType: 'string',
              },
              value: {
                from: 0,
                to: 0,
                searchPattern: 'Slice C',
                not: false,
                operation: 'eq',
              },
              filterCategory: 'context',
              selected: false,
            },
            {
              label: ' Not Metric A (MetricName)',
              name: 'MetricName',
              type: {
                id: 'MetricName',
                description: 'A Metric',
                valueType: 'string',
              },
              value: {
                from: 0,
                to: 0,
                searchPattern: 'Metric A',
                not: true,
                operation: 'neq',
              },
              filterCategory: 'metric',
              selected: true,
            },
          ],
          loading: false,
        },
      ],
    };

    const expected = {
      ...initialState.browsers[0],
      filters: [
        {
          label: ' Slice A (NSI)',
          name: 'NSI',
          type: {
            id: 'NSI',
            description: 'Network Slice Instance',
            valueType: 'string',
          },
          value: {
            from: 0,
            to: 0,
            searchPattern: 'Slice A',
            not: false,
            operation: 'eq',
          },
          filterCategory: 'context',
          selected: false,
        },
        {
          label: ' Slice B (NSI)',
          name: 'NSI',
          type: {
            id: 'NSI',
            description: 'Network Slice Instance',
            valueType: 'string',
          },
          value: {
            from: 0,
            to: 0,
            searchPattern: 'Slice B',
            not: false,
            operation: 'eq',
          },
          filterCategory: 'context',
          selected: false,
        },
        {
          label: ' Slice C (NSI)',
          name: 'NSI',
          type: {
            id: 'NSI',
            description: 'Network Slice Instance',
            valueType: 'string',
          },
          value: {
            from: 0,
            to: 0,
            searchPattern: 'Slice C',
            not: false,
            operation: 'eq',
          },
          filterCategory: 'context',
          selected: false,
        },
        {
          label: ' Not Metric A (MetricName)',
          name: 'MetricName',
          type: {
            id: 'MetricName',
            description: 'A Metric',
            valueType: 'string',
          },
          value: {
            from: 0,
            to: 0,
            searchPattern: 'Metric A',
            not: true,
            operation: 'neq',
          },
          filterCategory: 'metric',
          selected: false,
        },
      ],
      payload: {},
      loading: true,
    };

    const payload = { updateOperation: 'clear-all-filters' };

    let actual = {};

    /**
     *
     * @type {StateAccessor}
     */
    const stateAccessor = {
      getSubState: () => initialState.browsers[0],
      updateSubState(s) {
        actual = { ...s };
      },
    };

    updateFilters(stateAccessor, payload);

    expect(actual).to.deep.equal(expected);
  });

  const newContext = {
    filterCategories: [
      {
        type: 'context',
        title: 'Network Filters',
        selection: 'checkbox',
        fields: [
          {
            label: 'NSSAI',
            name: 'c_NSSAI',
            filterCategory: 'context',
            type: {
              id: 'c_NSSAI',
              description: 'Network Slice Selection Assistance Information',
              valueType: 'string',
            },
          },
          {
            label: 'NSI',
            name: 'c_NSI',
            filterCategory: 'context',
            type: {
              id: 'c_NSI',
              description: 'Network Slice Instance',
              valueType: 'string',
            },
          },
          {
            label: 'NF',
            name: 'c_NF',
            filterCategory: 'context',
            type: {
              id: 'c_NF',
              description: 'Network Function',
              valueType: 'string',
            },
          },
        ],
        help: 'NETWORK_FILTER_TOOLTIP_MESSAGE',
      },
      {
        type: 'metric',
        title: 'Measurement Filters',
        selection: 'radio',
        fields: [
          {
            label: 'Session Modification Request Received',
            name: 'vi_sessionModificationReqRcvd',
            filterCategory: 'metric',
            type: {
              id: 'vi_sessionModificationReqRcvd',
              valueType: 'integer',
              description: 'Session Modification Request Received',
            },
          },
          {
            label: 'Dropped Packets',
            name: 'vi_dlUnstrDropPackets',
            filterCategory: 'metric',
            type: {
              id: 'vi_dlUnstrDropPackets',
              valueType: 'integer',
              description: 'Dropped Packets',
            },
          },
        ],
        help: 'MEASUREMENT_FILTER_TOOLTIP_MESSAGE',
      },
    ],
  };

  const actionDetail = {
    context: {
      id: 'NSSAI_NSI',
      name: 'NSSAI & NSI',
      contextFields: [
        {
          id: 'c_NSSAI',
          name: 'NSSAI',
          description: 'Network Slice Selection Assistance Information',
        },
        {
          id: 'c_NSI',
          name: 'NSI',
          description: 'Network Slice Instance',
        },
      ],
    },
    row: { c_NSSAI: { value: '4:3' }, c_NSI: { value: 'Slice1' }, c_NF: { value: 'AMF_BC' } },
  };

  describe('createContextFiltersFromRowAction', () => {
    it('should correctly build filters when row has NSI and context has NSI', async () => {
      const actual = createContextFiltersFromRowAction(newContext, actionDetail);
      const expected = {
        id: actual[1].id,
        label: 'NSI',
        name: 'c_NSI',
        filterCategory: 'context',
        type: {
          id: 'c_NSI',
          description: 'Network Slice Instance',
          valueType: 'string',
        },
        value: {
          searchPattern: 'Slice1',
          not: false,
          operation: 'eq',
        },
        selected: true,
      };

      expect(expected).to.deep.equal(actual[1]);
    });

    const expectedFilterResult = {
      label: 'NSSAI',
      name: 'c_NSSAI',
      filterCategory: 'context',
      type: {
        id: 'c_NSSAI',
        description: 'Network Slice Selection Assistance Information',
        valueType: 'string',
      },
      value: {
        searchPattern: '4:3',
        not: false,
        operation: 'eq',
      },
      selected: true,
    };

    it('should correctly build filters when row has NSI, SNSSAI, NF but context has NSI, SNSSAI', async () => {
      const actual = createContextFiltersFromRowAction(newContext, actionDetail);
      const expected = { ...expectedFilterResult, id: actual[0].id };
      expect(actual[0]).to.deep.equal(expected);
    });

    it('should create filters when table context switching via relations are correct', async () => {
      const actual = createContextFiltersFromRowAction(newContext, actionDetail);
      const expected = { ...expectedFilterResult, id: actual[0].id };
      expect(actual.length).to.equal(2);
      expect(actual[0]).to.deep.equal(expected);
    });

    it('Skip filter when table context switching via relations are incorrect', async () => {
      const row = { SNSNSN: '4:3', PNNF: 'Canadian' };
      const incorrectRelation = { ...actionDetail, row };
      const actual = createContextFiltersFromRowAction(newContext, incorrectRelation);
      expect(actual.length).to.equal(0);
      expect(actual).to.deep.equal([]);
    });
  });

  it('OS: should display disclosure message and sort the column when select metric filter', async () => {
    /* eslint-disable sonarjs/no-duplicate-string */
    const initialState = cloneDeep(disclosureInitialState);

    const payload = {
      updateOperation: 'select-filter',
      data: {
        label: 'AMF Mean Reg Nbr  In Range 0 - 100',
        type: 'metric',
      },
    };

    let actual = {};
    const stateAccessor = {
      getSubState: () => initialState.browsers[0],
      updateSubState(s) {
        actual = { ...s };
      },
    };

    updateFilters(stateAccessor, payload, osFeatureFlags);

    const expectedState = {
      browsers: [
        {
          id: 'c7f14b2f-8fa8-4324-bb94-214acc570743',
          title: 'Metric Browser',
          filters: [
            {
              label: 'AMF Mean Reg Nbr  In Range 0 - 100',
              name: 'vi_Site_AMFMeanRegNbr',
              type: {
                id: 'vi_Site_AMFMeanRegNbr',
                name: 'AMF Mean Reg Nbr',
                valueType: 'integer',
                description: 'AMFMeanRegNbr Description',
                unit: 'errors/minute',
                dataType: 'metricType',
              },
              value: {
                from: 0,
                to: 100,
                not: false,
                operation: 'inr',
              },
              filterCategory: 'metric',
              selected: true,
            },
          ],
          loading: true,
          match: '',
          data: {
            total: 1,
            numpages: 1,
            numentries: 20,
            currentpage: 1,
            tableData: [
              {
                c_Site: 'BC',
                vi_Site_AMFMeanRegNbr: 60,
                vi_Site_AMFMeanRegNbr2: 60,
                vi_Site_AMFMeanRegNbr3: 60,
                metadata: {
                  contextName: 'My Site',
                  context: {
                    type: {
                      id: 'Site',
                      contextFields: [
                        {
                          id: 'Site',
                        },
                      ],
                    },
                    contextFields: [
                      {
                        id: 'Site_BC',
                        type: {
                          id: 'c_Site',
                        },
                        name: 'BC',
                      },
                    ],
                  },
                  metrics: [
                    {
                      id: 'vi_Site_AMFMeanRegNbr',
                      name: 'AMF Mean Reg Nbr',
                      description: 'AMFMeanRegNbr Description',
                      value: 60,
                      valueType: 'integer',
                      unit: 'errors/minute',
                    },
                  ],
                },
              },
            ],
            sort: {
              sortBy: {
                id: 'c_Site',
              },
              sortOrder: 'asc',
              isNewSortApplied: false,
            },
          },
          active: true,
          context: {
            contextType: {
              id: 'Site',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site',
                  description: 'Site',
                  dataType: 'entityType',
                },
              ],
            },
            relations: [],
            metricTypes: [
              {
                id: 'vi_Site_AMFMeanRegNbr',
                name: 'AMF Mean Reg Nbr',
                valueType: 'integer',
                description: 'AMFMeanRegNbr Description',
                unit: 'errors/minute',
                dataType: 'metricType',
              },
            ],
            filterCategories: [
              {
                type: 'context',
                title: 'KPI Context Filters',
                selection: 'checkbox',
                fields: [
                  {
                    label: 'My Site',
                    name: 'c_Site',
                    filterCategory: 'context',
                    type: {
                      id: 'c_Site',
                      name: 'My Site',
                      description: 'Site',
                      dataType: 'entityType',
                      valueType: 'string',
                    },
                  },
                ],
                help: 'NETWORK_FILTER_TOOLTIP_MESSAGE',
              },
              {
                type: 'metric',
                title: 'KPI Filters',
                selection: 'radio',
                fields: [
                  {
                    label: 'AMF Mean Reg Nbr',
                    name: 'vi_Site_AMFMeanRegNbr',
                    filterCategory: 'metric',
                    type: {
                      id: 'vi_Site_AMFMeanRegNbr',
                      name: 'AMF Mean Reg Nbr',
                      valueType: 'integer',
                      description: 'AMFMeanRegNbr Description',
                      unit: 'errors/minute',
                      dataType: 'metricType',
                    },
                  },
                ],
                help: 'MEASUREMENT_FILTER_TOOLTIP_MESSAGE',
                disclosureForAttribute: 'AMF Mean Reg Nbr',
              },
            ],
            name: 'My Site',
            columns: [
              {
                title: 'My Site',
                attribute: 'c_Site',
                sortable: true,
                additionalInfo: 'Site',
                width: '300px',
                sort: 'asc',
              },
              {
                title: 'AMF Mean Reg Nbr (errors/minute)',
                attribute: 'vi_Site_AMFMeanRegNbr',
                valueType: 'integer',
                sortable: true,
                additionalInfo: 'AMFMeanRegNbr Description',
                width: '300px',
                sortNotificationInfo: 'AMF Mean Reg Nbr',
                sort: null,
              },
            ],
            index: 'soa',
            id: 'Site',
          },
          payload: {
            sortBy: {
              id: 'vi_Site_AMFMeanRegNbr',
            },
            sortOrder: 'asc',
          },
        },
      ],
    };

    expect(actual).to.deep.equal(expectedState.browsers[0]);
  });

  it('VM: should not display disclosure message or change column sort metric filter is selected', async () => {
    /* eslint-disable sonarjs/no-duplicate-string */
    const initialState = cloneDeep(disclosureInitialState);

    const payload = {
      updateOperation: 'select-filter',
      data: {
        label: 'AMF Mean Reg Nbr  In Range 0 - 100',
        type: 'metric',
      },
    };

    let actual = {};
    const stateAccessor = {
      getSubState: () => initialState.browsers[0],
      updateSubState(s) {
        actual = { ...s };
      },
    };

    updateFilters(stateAccessor, payload, vmFeatureFlags);

    const expectedState = {
      browsers: [
        {
          id: 'c7f14b2f-8fa8-4324-bb94-214acc570743',
          title: 'Metric Browser',
          filters: [
            {
              label: 'AMF Mean Reg Nbr  In Range 0 - 100',
              name: 'vi_Site_AMFMeanRegNbr',
              type: {
                id: 'vi_Site_AMFMeanRegNbr',
                name: 'AMF Mean Reg Nbr',
                valueType: 'integer',
                description: 'AMFMeanRegNbr Description',
                unit: 'errors/minute',
                dataType: 'metricType',
              },
              value: {
                from: 0,
                to: 100,
                not: false,
                operation: 'inr',
              },
              filterCategory: 'metric',
              selected: true,
            },
          ],
          loading: true,
          match: '',
          data: {
            total: 1,
            numpages: 1,
            numentries: 20,
            currentpage: 1,
            tableData: [
              {
                c_Site: 'BC',
                vi_Site_AMFMeanRegNbr: 60,
                vi_Site_AMFMeanRegNbr2: 60,
                vi_Site_AMFMeanRegNbr3: 60,
                metadata: {
                  contextName: 'My Site',
                  context: {
                    type: {
                      id: 'Site',
                      contextFields: [
                        {
                          id: 'Site',
                        },
                      ],
                    },
                    contextFields: [
                      {
                        id: 'Site_BC',
                        type: {
                          id: 'c_Site',
                        },
                        name: 'BC',
                      },
                    ],
                  },
                  metrics: [
                    {
                      id: 'vi_Site_AMFMeanRegNbr',
                      name: 'AMF Mean Reg Nbr',
                      description: 'AMFMeanRegNbr Description',
                      value: 60,
                      valueType: 'integer',
                      unit: 'errors/minute',
                    },
                  ],
                },
              },
            ],
            sort: {
              sortBy: {
                id: 'c_Site',
              },
              sortOrder: 'asc',
            },
          },
          active: true,
          context: {
            contextType: {
              id: 'Site',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site',
                  description: 'Site',
                  dataType: 'entityType',
                },
              ],
            },
            relations: [],
            metricTypes: [
              {
                id: 'vi_Site_AMFMeanRegNbr',
                name: 'AMF Mean Reg Nbr',
                valueType: 'integer',
                description: 'AMFMeanRegNbr Description',
                unit: 'errors/minute',
                dataType: 'metricType',
              },
            ],
            filterCategories: [
              {
                type: 'context',
                title: 'KPI Context Filters',
                selection: 'checkbox',
                fields: [
                  {
                    label: 'My Site',
                    name: 'c_Site',
                    filterCategory: 'context',
                    type: {
                      id: 'c_Site',
                      name: 'My Site',
                      description: 'Site',
                      dataType: 'entityType',
                      valueType: 'string',
                    },
                  },
                ],
                help: 'NETWORK_FILTER_TOOLTIP_MESSAGE',
              },
              {
                type: 'metric',
                title: 'KPI Filters',
                selection: 'radio',
                fields: [
                  {
                    label: 'AMF Mean Reg Nbr',
                    name: 'vi_Site_AMFMeanRegNbr',
                    filterCategory: 'metric',
                    type: {
                      id: 'vi_Site_AMFMeanRegNbr',
                      name: 'AMF Mean Reg Nbr',
                      valueType: 'integer',
                      description: 'AMFMeanRegNbr Description',
                      unit: 'errors/minute',
                      dataType: 'metricType',
                    },
                  },
                ],
                help: 'MEASUREMENT_FILTER_TOOLTIP_MESSAGE',
              },
            ],
            name: 'My Site',
            columns: [
              {
                title: 'My Site',
                attribute: 'c_Site',
                sortable: true,
                additionalInfo: 'Site',
                width: '300px',
                sort: 'asc',
              },
              {
                title: 'AMF Mean Reg Nbr (errors/minute)',
                attribute: 'vi_Site_AMFMeanRegNbr',
                valueType: 'integer',
                sortable: true,
                additionalInfo: 'AMFMeanRegNbr Description',
                width: '300px',
                sortNotificationInfo: 'AMF Mean Reg Nbr',
                sort: null,
              },
            ],
            index: 'soa',
            id: 'Site',
          },
          payload: {
            sortBy: {
              id: 'c_Site',
            },
            sortOrder: 'asc',
          },
        },
      ],
    };

    expect(actual).to.deep.equal(expectedState.browsers[0]);
  });
});
