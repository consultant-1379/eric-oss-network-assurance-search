import { expect } from '@open-wc/testing';
import sinon from 'sinon';
import { SearchApi } from '../../src/index';
import {
  transformMetricBrowserState,
  transformRelationActionsState,
  clearFacetCounts,
  updateFacetCounts,
  updateSettings,
} from '../../src/state/tableActions';

import initialBrowserState from '../../mocks/state/tableActions/transformRelationActionsState/initialBrowserState.json';
import searchContextsFacetsResponse1 from '../../mocks/services/assurance/search/relatedContextsFacets/response1.json';
import updatedBrowserStateExpected from '../../mocks/state/tableActions/transformRelationActionsState/updatedBrowserStateExpected.json';
import clearFacetCountsInitialSubState1 from '../../mocks/state/tableActions/clearFacetCounts/initialSubState1.json';
import clearFacetCountsExpectedSubState1 from '../../mocks/state/tableActions/clearFacetCounts/expectedSubState1.json';
import clearFacetCountsInitialSubState2 from '../../mocks/state/tableActions/clearFacetCounts/initialSubState2.json';
import clearFacetCountsExpectedState2 from '../../mocks/state/tableActions/clearFacetCounts/expectedSubState2.json';
import updateFacetCountsInitialSubState1 from '../../mocks/state/tableActions/updateFacetCounts/initialSubState1.json';
import updateFacetCountsRowData1 from '../../mocks/state/tableActions/updateFacetCounts/rowData1.json';
import updateFacetCountsExpectedSubState1 from '../../mocks/state/tableActions/updateFacetCounts/expectedSubState1.json';
import searchContextsFacetsResponse2 from '../../mocks/services/assurance/search/relatedContextsFacets/response2.json';
import browserStateForSettings from '../../mocks/state/tableActions/updateTableSettings/browserStateForSettings.json';

/* eslint-disable sonarjs/no-duplicate-string */
const context = {
  index: 'ran',
  contextType: {
    id: 'NSSAI_NSI',
    contextFields: [
      {
        id: 'NSSAI',
        description: 'Network Slice Selection Assistance Information',
      },
      {
        id: 'NSI',
        description: 'Network Slice Instance',
      },
    ],
    name: 'NSSAI & NSI',
  },
  relations: [
    {
      relationType: 'RELATED_TO',
      related: {
        id: 'CID_1234',
        contextFields: [
          {
            id: 'NSSAI_1234',
            name: 'NSSAI 1234',
            description: 'Instance of NSSAI 1234',
          },
          {
            id: 'NSI_4321',
            name: 'NSI 4321',
            description: 'Instance of NSI 4321',
          },
        ],
        name: 'NSSAI & NSI Context',
      },
    },
  ],
  metricTypes: [
    {
      id: 'vi_sessionModificationReqRcvd',
      valueType: 'integer',
      description: 'Session Modification Request Received',
    },
    {
      id: 'vi_dlUnstrDropPackets',
      valueType: 'integer',
      description: 'Dropped Packets',
    },
  ],
};

/* eslint-disable sonarjs/no-duplicate-string */
const metricBrowser = {
  filters: [],
  active: true,
  loading: true,
  context,
  filterCategories: [],
  data: {
    tableData: [],
    sort: {
      sortBy: undefined,
      sortOrder: undefined,
    },
    currentpage: 1,
    numentries: 20,
    numpages: 3,
    fetchTime: 1684030240704,
  },
};

describe('Table actions tests', () => {
  it('should transform the metric browser state correctly when a response is provided', () => {
    /* eslint-disable sonarjs/no-duplicate-string */
    const searchResponseSample = {
      offset: 0,
      length: 1,
      total: 42,
      results: [
        {
          context: {
            type: {
              id: 'NSSAI_NSI',
              contextFields: [
                {
                  id: 'NSI',
                },
                {
                  id: 'NSSAI',
                },
              ],
            },
            contextFields: [
              {
                id: '1234',
                type: {
                  id: 'NSSAI',
                  description: 'Network Slice Selection Assistance Information',
                },
                name: 'NSSAI_1234',
                description: 'Instance of NSSAI 1234',
              },
              {
                id: 'NSI_4321',
                type: {
                  id: 'NSI',
                  description: 'Network Slice Instance',
                },
                name: 'NSI 4321',
                description: 'Instance of NSI 4321',
              },
            ],
            id: 'CID_1234',
            name: 'NSSAI & NSI Context',
          },
          metrics: [
            {
              type: {
                id: 'vi_dlUnstrDropPackets',
                description: 'Dropped Packets',
              },
              id: 'MID_12342',
              value: -8618.52,
              beginTimestamp: 1513520073,
            },
            {
              type: {
                id: 'vi_sessionModificationReqRcvd',
                valueType: 'integer',
                description: 'Session Modification Request Received',
              },
              id: 'MID_12342',
              value: 3379.882952,
              endTimestamp: 1513520073,
            },
            {
              type: {
                id: 'vi_PDUSessionEstSR',
                valueType: 'integer',
                description: 'PDU Session',
              },
              id: 'MID_12342',
              value: 16948.1818,
              beginTimestamp: 1513520073,
              endTimestamp: 1513540073,
            },
          ],
        },
      ],
      tableData: [
        {
          NSSAI: 'NSSAI_1234',
          NSI: 'NSI 4321',
          vi_dlUnstrDropPackets: -8618.52,
          vi_sessionModificationReqRcvd: 3379.882952,
          vi_PDUSessionEstSR: 16948.1818,
        },
      ],
    };

    /* eslint-disable sonarjs/no-duplicate-string */
    const output = {
      active: true,
      context,
      filters: [],
      loading: false,
      fetchError: undefined,
      filterCategories: [],
      data: {
        tableData: [
          {
            NSSAI: { value: 'NSSAI_1234', beginTimestamp: undefined, endTimestamp: undefined },
            NSI: { value: 'NSI 4321', beginTimestamp: undefined, endTimestamp: undefined },
            vi_dlUnstrDropPackets: {
              value: -8618.52,
              beginTimestamp: 1513520073,
              endTimestamp: undefined,
            },
            vi_sessionModificationReqRcvd: {
              value: 3379.882952,
              beginTimestamp: undefined,
              endTimestamp: 1513520073,
            },
            vi_PDUSessionEstSR: {
              value: 16948.1818,
              beginTimestamp: 1513520073,
              endTimestamp: 1513540073,
            },
          },
        ],
        total: 42,
        sort: {
          sortBy: { id: 'NSSAI' },
          sortOrder: 'asc',
        },
        currentpage: 1,
        numentries: 20,
        numpages: 3,
        fetchTime: 1684031552404,
      },
      payload: {
        sortBy: {
          id: 'NSSAI',
        },
        sortOrder: 'asc',
      },
    };

    const inputMetricBrowser = {
      ...metricBrowser,
      payload: {
        sortBy: {
          id: 'NSSAI',
        },
        sortOrder: 'asc',
      },
      context,
    };

    transformMetricBrowserState(inputMetricBrowser, searchResponseSample, 1684031552404);

    // Delete metadata, it's not being tested
    delete inputMetricBrowser.data.tableData[0].metadata;

    expect(inputMetricBrowser).to.deep.equal(output);
  });

  it('should select a row of the table if a row matching row is selected', () => {
    /* eslint-disable sonarjs/no-duplicate-string */
    const searchResponseSample = {
      offset: 0,
      length: 1,
      total: 42,
      results: [
        {
          context: {
            type: {
              id: 'NSSAI_NSI',
              contextFields: [
                {
                  id: 'NSI',
                },
                {
                  id: 'NSSAI',
                },
              ],
            },
            contextFields: [
              {
                id: '1234',
                type: {
                  id: 'NSSAI',
                  description: 'Network Slice Selection Assistance Information',
                },
                name: 'NSSAI_1234',
                description: 'Instance of NSSAI 1234',
              },
              {
                id: 'NSI_4321',
                type: {
                  id: 'NSI',
                  description: 'Network Slice Instance',
                },
                name: 'NSI 4321',
                description: 'Instance of NSI 4321',
              },
            ],
            id: 'CID_1234',
            name: 'NSSAI & NSI Context',
          },
          metrics: [
            {
              type: {
                id: 'vi_dlUnstrDropPackets',
                description: 'Dropped Packets',
              },
              id: 'MID_12342',
              value: -8618.52,
              beginTimestamp: 1513520073,
            },
            {
              type: {
                id: 'vi_sessionModificationReqRcvd',
                valueType: 'integer',
                description: 'Session Modification Request Received',
              },
              id: 'MID_12342',
              value: 3379.882952,
              endTimestamp: 1513520073,
            },
            {
              type: {
                id: 'vi_PDUSessionEstSR',
                valueType: 'integer',
                description: 'PDU Session',
              },
              id: 'MID_12342',
              value: 16948.1818,
              beginTimestamp: 1513520073,
              endTimestamp: 1513540073,
            },
          ],
        },
      ],
      tableData: [
        {
          NSSAI: 'NSSAI_1234',
          NSI: 'NSI 4321',
          vi_dlUnstrDropPackets: -8618.52,
          vi_sessionModificationReqRcvd: 3379.882952,
          vi_PDUSessionEstSR: 16948.1818,
        },
      ],
    };

    const inputMetricBrowser = {
      ...metricBrowser,
      selectedRow: {
        selected: true,
        metadata: {
          context: {
            contextFields: [
              {
                description: 'Instance of NSSAI 1234',
                id: '1234',
                name: 'NSSAI_1234',
                type: {
                  description: 'Network Slice Selection Assistance Information',
                  id: 'NSSAI',
                },
              },
              {
                description: 'Instance of NSI 4321',
                id: 'NSI_4321',
                name: 'NSI 4321',
                type: {
                  description: 'Network Slice Instance',
                  id: 'NSI',
                },
              },
            ],
            id: 'CID_1234',
            name: 'NSSAI & NSI Context',
            type: {
              contextFields: [
                {
                  id: 'NSI',
                },
                {
                  id: 'NSSAI',
                },
              ],
              id: 'NSSAI_NSI',
            },
          },
        },
      },
      payload: {
        sortBy: {
          id: 'NSSAI',
        },
        sortOrder: 'asc',
      },
      context,
    };

    transformMetricBrowserState(inputMetricBrowser, searchResponseSample, 1684031552404);

    const rowSelected =
      inputMetricBrowser.data.tableData.filter((row) => row.selected).length === 1;

    expect(rowSelected).to.equal(true);
  });

  it('should update the relationAction state variable correctly when facet counts are provided', () => {
    transformRelationActionsState(
      initialBrowserState,
      searchContextsFacetsResponse1,
      'contextMenu',
    );
    expect(initialBrowserState).to.deep.equal(updatedBrowserStateExpected);
  });

  describe('clearFacetCounts tests', () => {
    it('should clear the existing facet counts for the contextMenu', async () => {
      const facetCountKey = 'contextMenu';
      clearFacetCountsExpectedSubState1.relationActions.forEach((_, index) => {
        clearFacetCountsExpectedSubState1.relationActions[index].facetCounts[facetCountKey] =
          undefined;
      });

      let actual = {};
      /**
       *
       * @type {StateAccessor}
       */
      const stateAccessor = {
        getSubState: () => clearFacetCountsInitialSubState1,
        updateSubState(s) {
          actual = { ...s };
        },
      };
      await clearFacetCounts(stateAccessor, facetCountKey);
      expect(actual).to.deep.eql(clearFacetCountsExpectedSubState1);
    });

    it('should clear the non-existing facet counts for the contextMenu', async () => {
      const facetCountKey = 'contextMenu';
      clearFacetCountsExpectedState2.relationActions.forEach((_, index) => {
        clearFacetCountsExpectedState2.relationActions[index].facetCounts[facetCountKey] =
          undefined;
      });

      let actual = {};
      /**
       *
       * @type {StateAccessor}
       */
      const stateAccessor = {
        getSubState: () => clearFacetCountsInitialSubState2,
        updateSubState(s) {
          actual = { ...s };
        },
      };
      await clearFacetCounts(stateAccessor, facetCountKey);
      expect(actual).to.deep.eql(clearFacetCountsExpectedState2);
    });
  });

  describe('updateFacetCounts tests', () => {
    it('should update the existing facet counts for the contextMenu', async () => {
      // Stubbing the /:index/search/related-contexts-facets endpoint
      sinon
        .stub(SearchApi.prototype, 'searchContextFacets')
        .resolves(searchContextsFacetsResponse2);

      const facetCountKey = 'contextMenu';
      let actual = {};
      /**
       *
       * @type {StateAccessor}
       */
      const stateAccessor = {
        getSubState: () => updateFacetCountsInitialSubState1,
        updateSubState(s) {
          actual = { ...s };
        },
      };
      await updateFacetCounts(stateAccessor, { rowData: updateFacetCountsRowData1, facetCountKey });
      expect(actual).to.deep.eql(updateFacetCountsExpectedSubState1);
    });
  });
});

describe('Table Settings tests', () => {
  it('should update table settings with provided information', async () => {
    let actual = {};

    const stateAccessor = {
      getSubState: () => browserStateForSettings.initialBrowserStateForSettings,
      updateSubState(s) {
        actual = { ...s };
      },
    };

    await updateSettings(stateAccessor, {
      autoRefresh: true,
      rowHeight: 'tiny',
      columns: [
        {
          title: 'My NF',
          attribute: 'c_NF',
          sortable: true,
          additionalInfo: 'New Finger',
          width: '300px',
          pinned: true,
        },
        {
          title: 'AMF Mean Reg Nbr 2 (errors/minute)',
          attribute: 'vi_NF_AMFMeanRegNbr2',
          valueType: 'integer',
          sortable: true,
          additionalInfo: 'AMFMeanRegNbr2 Description',
          width: '300px',
          sortNotificationInfo: 'AMF Mean Reg Nbr 2',
        },
        {
          title: 'AMF Mean Reg Nbr (errors/minute)',
          attribute: 'vi_NF_AMFMeanRegNbr',
          valueType: 'integer',
          sortable: true,
          additionalInfo: 'AMFMeanRegNbr Description',
          width: '300px',
          sortNotificationInfo: 'AMF Mean Reg Nbr',
        },
        {
          title: 'AMF Mean Reg Nbr 3 (errors/minute)',
          attribute: 'vi_NF_AMFMeanRegNbr3',
          valueType: 'integer',
          sortable: true,
          additionalInfo: 'AMFMeanRegNbr3 Description',
          width: '300px',
          sortNotificationInfo: 'AMF Mean Reg Nbr 3',
        },
        {
          title: 'Smf Modification Cmd Rcvd (errors/minute)',
          attribute: 'vi_NF_SmfModificationCmdRcvd',
          valueType: 'integer',
          sortable: true,
          additionalInfo: 'SmfModificationCmdRcvd Description',
          width: '300px',
          sortNotificationInfo: 'Smf Modification Cmd Rcvd',
          hidden: true,
        },
        {
          title: 'Dl Unstr Drop Packets (errors/minute)',
          attribute: 'vi_NF_dlUnstrDropPackets',
          valueType: 'integer',
          sortable: true,
          additionalInfo: 'DlUnstrDropPackets Description',
          width: '300px',
          sortNotificationInfo: 'Dl Unstr Drop Packets',
          hidden: true,
        },
        {
          title: 'Ul Ipv 6Drop Packets (errors/minute)',
          attribute: 'vd_NF_UlIpv6DropPackets',
          valueType: 'float',
          sortable: true,
          additionalInfo: 'UlIpv6DropPackets Description',
          width: '300px',
          sortNotificationInfo: 'Ul Ipv 6Drop Packets',
          hidden: true,
        },
      ],
    });
    expect(actual).to.deep.eql(browserStateForSettings.expectedBrowserStateForSettings);
  });
});
