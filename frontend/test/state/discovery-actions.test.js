import { expect } from '@open-wc/testing';
import {
  calculateColumnWidth,
  createRelationActionsStateObject,
  setupContextForApp,
  validateSavedBrowser,
  makeFullContextName,
  handleError,
} from '../../src/state/discoveryActions.js';
import relations from '../../mocks/state/discoveryActions/createRelationActionsStateObject/relations.json';
import relationActionsStateExpected from '../../mocks/state/discoveryActions/createRelationActionsStateObject/relationActionsStateExpected.json';
import discoveryMocks from '../../mocks/state/discoveryMocks.json';
import CONSTANTS from '../../src/utils/constants.js';

const { MIN_COLUMN_WIDTH } = CONSTANTS;

describe('Discovery actions tests', () => {
  it('should update state with context information when there are contexts', () => {
    /* eslint-disable sonarjs/no-duplicate-string */
    const filterCategories = [
      {
        type: 'context',
        title: 'KPI Context Filters',
        selection: 'checkbox',
        fields: [],
        help: 'TBD',
      },
      {
        type: 'metric',
        title: 'KPI Filters',
        selection: 'radio',
        fields: [],
        help: 'TBD',
      },
    ];

    /* eslint-disable sonarjs/no-duplicate-string */
    const context = {
      contextType: {
        id: 'NSSAI_NSI',
        contextFields: [
          {
            id: 'c_NSSAI',
            name: 'NSSAI',
            description: 'Network Slice Selection Assistance Information',
            valueType: 'string',
            dataType: 'entityType',
          },
          {
            id: 'c_NSI',
            name: 'NSI',
            description: 'Network Slice Instance',
            valueType: 'string',
            dataType: 'entityType',
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
                dataType: 'entityType',
              },
              {
                id: 'NSI_4321',
                name: 'NSI 4321',
                description: 'Instance of NSI 4321',
                dataType: 'entityType',
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
          dataType: 'metricType',
          name: 'Session Modification Req Rcvd',
        },
        {
          id: 'vi_dlUnstrDropPackets',
          valueType: 'integer',
          description: 'Dropped Packets',
          dataType: 'metricType',
        },
      ],
    };

    /* eslint-disable sonarjs/no-duplicate-string */
    const output = {
      columns: [
        {
          additionalInfo: 'Network Slice Selection Assistance Information',
          attribute: 'c_NSSAI',
          mandatory: true,
          name: 'NSSAI',
          sortable: true,
          title: 'NSSAI',
          type: {
            dataType: 'entityType',
            description: 'Network Slice Selection Assistance Information',
            id: 'c_NSSAI',
            name: 'NSSAI',
            valueType: 'string',
          },
          valueType: 'string',
          width: `${MIN_COLUMN_WIDTH}px`,
        },
        {
          additionalInfo: 'Network Slice Instance',
          attribute: 'c_NSI',
          mandatory: true,
          name: 'NSI',
          sortable: true,
          type: {
            dataType: 'entityType',
            description: 'Network Slice Instance',
            id: 'c_NSI',
            name: 'NSI',
            valueType: 'string',
          },
          valueType: 'string',
          title: 'NSI',
          width: `${MIN_COLUMN_WIDTH}px`,
        },
        {
          additionalInfo: 'Session Modification Request Received',
          attribute: 'vi_sessionModificationReqRcvd',
          name: 'Session Modification Req Rcvd',
          sortable: true,
          title: 'Session Modification Req Rcvd',
          valueType: 'integer',
          width: calculateColumnWidth('Session Modification Req Rcvd'),
          sortNotificationInfo: 'Session Modification Req Rcvd',
        },
        {
          additionalInfo: 'Dropped Packets',
          attribute: 'vi_dlUnstrDropPackets',
          name: 'vi_dlUnstrDropPackets',
          sortable: true,
          title: 'vi_dlUnstrDropPackets',
          valueType: 'integer',
          width: calculateColumnWidth('vi_dlUnstrDropPackets'),
          sortNotificationInfo: 'vi_dlUnstrDropPackets',
        },
      ],
      contextType: {
        contextFields: [
          {
            description: 'Network Slice Selection Assistance Information',
            id: 'c_NSSAI',
            name: 'NSSAI',
            valueType: 'string',
            dataType: 'entityType',
          },
          {
            description: 'Network Slice Instance',
            id: 'c_NSI',
            name: 'NSI',
            valueType: 'string',
            dataType: 'entityType',
          },
        ],
        id: 'NSSAI_NSI',
        name: 'NSSAI & NSI',
      },
      filterCategories: [
        {
          fields: [
            {
              filterCategory: 'context',
              label: 'NSSAI',
              name: 'c_NSSAI',
              type: {
                description: 'Network Slice Selection Assistance Information',
                id: 'c_NSSAI',
                name: 'NSSAI',
                valueType: 'string',
                dataType: 'entityType',
              },
            },
            {
              filterCategory: 'context',
              label: 'NSI',
              name: 'c_NSI',
              type: {
                description: 'Network Slice Instance',
                id: 'c_NSI',
                name: 'NSI',
                valueType: 'string',
                dataType: 'entityType',
              },
            },
          ],
          help: 'TBD',
          selection: 'checkbox',
          title: 'KPI Context Filters',
          type: 'context',
        },
        {
          fields: [
            {
              filterCategory: 'metric',
              label: 'Session Modification Req Rcvd',
              name: 'vi_sessionModificationReqRcvd',
              type: {
                description: 'Session Modification Request Received',
                id: 'vi_sessionModificationReqRcvd',
                valueType: 'integer',
                dataType: 'metricType',
                name: 'Session Modification Req Rcvd',
                visualization: {
                  groups: {
                    default: ['vi_sessionModificationReqRcvd'],
                  },
                },
              },
            },
            {
              filterCategory: 'metric',
              label: 'vi_dlUnstrDropPackets',
              name: 'vi_dlUnstrDropPackets',
              type: {
                description: 'Dropped Packets',
                id: 'vi_dlUnstrDropPackets',
                valueType: 'integer',
                dataType: 'metricType',
                visualization: {
                  groups: {
                    default: ['vi_dlUnstrDropPackets'],
                  },
                },
              },
            },
          ],
          help: 'TBD',
          selection: 'radio',
          title: 'KPI Filters',
          type: 'metric',
        },
      ],
      index: 'soa',
      metricTypes: [
        {
          description: 'Session Modification Request Received',
          id: 'vi_sessionModificationReqRcvd',
          valueType: 'integer',
          dataType: 'metricType',
          name: 'Session Modification Req Rcvd',
          visualization: {
            groups: {
              default: ['vi_sessionModificationReqRcvd'],
            },
          },
        },
        {
          description: 'Dropped Packets',
          id: 'vi_dlUnstrDropPackets',
          valueType: 'integer',
          dataType: 'metricType',
          visualization: {
            groups: {
              default: ['vi_dlUnstrDropPackets'],
            },
          },
        },
      ],
      name: 'NSSAI & NSI',
      relationActions: [
        {
          data: {
            context: {
              contextFields: [
                {
                  dataType: 'entityType',
                  description: 'Instance of NSSAI 1234',
                  id: 'NSSAI_1234',
                  name: 'NSSAI 1234',
                },
                {
                  dataType: 'entityType',
                  description: 'Instance of NSI 4321',
                  id: 'NSI_4321',
                  name: 'NSI 4321',
                },
              ],
              id: 'CID_1234',
              name: 'NSSAI & NSI Context',
            },
            operation: 'open-tab',
          },
          facetCounts: {},
          label: 'NSSAI & NSI Context',
        },
      ],
      relations: [
        {
          related: {
            contextFields: [
              {
                dataType: 'entityType',
                description: 'Instance of NSSAI 1234',
                id: 'NSSAI_1234',
                name: 'NSSAI 1234',
              },
              {
                dataType: 'entityType',
                description: 'Instance of NSI 4321',
                id: 'NSI_4321',
                name: 'NSI 4321',
              },
            ],
            id: 'CID_1234',
            name: 'NSSAI & NSI Context',
          },
          relationType: 'RELATED_TO',
        },
      ],
    };

    expect(setupContextForApp('soa', filterCategories, context)).to.deep.equal(output);
  });
});

describe('Column width calculation tests', () => {
  const extractWidthFromString = (widthString) => {
    const matches = /([0-9]+)px/.exec(widthString);
    return parseInt(matches[0], 10);
  };

  it('should calculate a width that is greater than the minimum column width for a large column label', () => {
    const widthString = calculateColumnWidth('Session Modification Req Rcvd');
    const width = extractWidthFromString(widthString);
    expect(width > MIN_COLUMN_WIDTH).to.equal(true);
  });
  it('should calculate a width that is equal to the minimum column width for a small column label', () => {
    const widthString = calculateColumnWidth('Small');
    const width = extractWidthFromString(widthString);
    expect(width).to.equal(MIN_COLUMN_WIDTH);
  });
  it('should calculate a width that is equal to the minimum column width for an empty string', () => {
    const widthString = calculateColumnWidth('');
    const width = extractWidthFromString(widthString);
    expect(width).to.equal(MIN_COLUMN_WIDTH);
  });
});

describe('Actions for relations tests', () => {
  describe('createRelationActionsStateObject tests', () => {
    it('should create a valid relationActions object given a valid array of `Relation` objects', () => {
      const relationActionsStateActual = createRelationActionsStateObject(relations);
      expect(relationActionsStateActual).to.deep.equal(relationActionsStateExpected);
    });

    it('should return an empty array given an empty array', () => {
      const relationActionsStateActual = createRelationActionsStateObject([]);
      expect(relationActionsStateActual).to.deep.equal([]);
    });

    it('should return an empty array given an undefined input argument', () => {
      const relationActionsStateActual = createRelationActionsStateObject();
      expect(relationActionsStateActual).to.deep.equal([]);
    });
  });
});

describe('Update saved browsers tests', () => {
  const { contexts } = discoveryMocks;

  it('should not update browsers when there are no changes to be made', () => {
    const browser = {
      id: 'cc28e40e-1a3e-46a0-8ab5-e7418345c964',
      title: 'Metric Browser',
      filters: [],
      loading: false,
      match: '',
      browserError: undefined,
      settings: {
        autoRefresh: true,
        rowHeight: 'compact',
      },
      data: {
        total: 3,
        numpages: 1,
        numentries: 20,
        currentpage: 1,
        tableData: [],
        sort: {
          sortBy: {
            id: 'vi_NF_Site_AMFMeanRegNbr',
          },
          sortOrder: 'asc',
          isNewSortApplied: false,
        },
        fetchTime: 1695918766576,
      },
      active: true,
      relationActions: [
        {
          label: 'My NSI & My NF',
          data: {
            operation: 'open-tab',
            context: {
              id: 'NF_NSI',
              contextFields: [
                {
                  id: 'c_NSI',
                  name: 'My NSI',
                  description: 'No Sharks Inside',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NF',
                  name: 'My NF',
                  description: 'New Finger',
                  dataType: 'entityType',
                },
              ],
              name: 'My NSI & My NF',
            },
          },
          facetCounts: {},
        },
        {
          label: 'My SNSSAI & My NF',
          data: {
            operation: 'open-tab',
            context: {
              id: 'NF_SNSSAI',
              contextFields: [
                {
                  id: 'c_SNSSAI',
                  name: 'My SNSSAI',
                  description: 'Soup Network Slice Selection Assistance Information',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NF',
                  name: 'My NF',
                  description: 'New Finger',
                  dataType: 'entityType',
                },
              ],
              name: 'My SNSSAI & My NF',
            },
          },
          facetCounts: {},
        },
        {
          label: 'My NF',
          data: {
            operation: 'open-tab',
            context: {
              id: 'NF',
              contextFields: [
                {
                  id: 'c_NF',
                  name: 'My NF',
                  description: 'New Finger',
                  dataType: 'entityType',
                },
              ],
              name: 'My NF',
            },
          },
          facetCounts: {},
        },
        {
          label: 'My Site & My NSI',
          data: {
            operation: 'open-tab',
            context: {
              id: 'NSI_Site',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site',
                  description: 'Site',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NSI',
                  name: 'My NSI',
                  description: 'No Sharks Inside',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site & My NSI',
            },
          },
          facetCounts: {},
        },
        {
          label: 'My Site & My SNSSAI',
          data: {
            operation: 'open-tab',
            context: {
              id: 'Site_SNSSAI',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site',
                  description: 'Site',
                  dataType: 'entityType',
                },
                {
                  id: 'c_SNSSAI',
                  name: 'My SNSSAI',
                  description: 'Soup Network Slice Selection Assistance Information',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site & My SNSSAI',
            },
          },
          facetCounts: {},
        },
        {
          label: 'My Site',
          data: {
            operation: 'open-tab',
            context: {
              id: 'Site',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site',
                  description: 'Site',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site',
            },
          },
          facetCounts: {},
        },
      ],
      context: {
        contextType: {
          id: 'NF_Site',
          contextFields: [
            {
              id: 'c_Site',
              name: 'My Site',
              description: 'Site',
              dataType: 'entityType',
            },
            {
              id: 'c_NF',
              name: 'My NF',
              description: 'New Finger',
              dataType: 'entityType',
            },
          ],
        },
        relations: [
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'NF_NSI',
              contextFields: [
                {
                  id: 'c_NSI',
                  name: 'My NSI',
                  description: 'No Sharks Inside',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NF',
                  name: 'My NF',
                  description: 'New Finger',
                  dataType: 'entityType',
                },
              ],
              name: 'My NSI & My NF',
            },
          },
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'NF_SNSSAI',
              contextFields: [
                {
                  id: 'c_SNSSAI',
                  name: 'My SNSSAI',
                  description: 'Soup Network Slice Selection Assistance Information',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NF',
                  name: 'My NF',
                  description: 'New Finger',
                  dataType: 'entityType',
                },
              ],
              name: 'My SNSSAI & My NF',
            },
          },
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'NF',
              contextFields: [
                {
                  id: 'c_NF',
                  name: 'My NF',
                  description: 'New Finger',
                  dataType: 'entityType',
                },
              ],
              name: 'My NF',
            },
          },
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'NSI_Site',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site',
                  description: 'Site',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NSI',
                  name: 'My NSI',
                  description: 'No Sharks Inside',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site & My NSI',
            },
          },
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'Site_SNSSAI',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site',
                  description: 'Site',
                  dataType: 'entityType',
                },
                {
                  id: 'c_SNSSAI',
                  name: 'My SNSSAI',
                  description: 'Soup Network Slice Selection Assistance Information',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site & My SNSSAI',
            },
          },
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'Site',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site',
                  description: 'Site',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site',
            },
          },
        ],
        metricTypes: [
          {
            id: 'vi_NF_Site_AMFMeanRegNbr',
            name: 'AMF Mean Reg Nbr',
            valueType: 'integer',
            description: 'AMFMeanRegNbr Description',
            unit: 'errors/minute',
            dataType: 'metricType',
          },
          {
            id: 'vi_NF_Site_AMFMeanRegNbr2',
            name: 'AMF Mean Reg Nbr 2',
            valueType: 'integer',
            description: 'AMFMeanRegNbr2 Description',
            unit: 'errors/minute',
            dataType: 'metricType',
          },
          {
            id: 'vi_NF_Site_AMFMeanRegNbr3',
            name: 'AMF Mean Reg Nbr 3',
            valueType: 'integer',
            description: 'AMFMeanRegNbr3 Description',
            unit: 'errors/minute',
            dataType: 'metricType',
          },
          {
            id: 'vi_NF_Site_PDUSessionEstSR',
            name: 'PDU Session Est SR',
            valueType: 'integer',
            description: 'PDUSessionEstSR Description',
            unit: 'errors/minute',
            dataType: 'metricType',
          },
          {
            id: 'vi_NF_Site_SessionModificationReqRcvd',
            name: 'Session Modification Req Rcvd',
            valueType: 'integer',
            description: 'SessionModificationReqRcvd Description',
            unit: 'errors/minute',
            dataType: 'metricType',
          },
        ],
        relationActions: [
          {
            label: 'My NSI & My NF',
            data: {
              operation: 'open-tab',
              context: {
                id: 'NF_NSI',
                contextFields: [
                  {
                    id: 'c_NSI',
                    name: 'My NSI',
                    description: 'No Sharks Inside',
                    dataType: 'entityType',
                  },
                  {
                    id: 'c_NF',
                    name: 'My NF',
                    description: 'New Finger',
                    dataType: 'entityType',
                  },
                ],
                name: 'My NSI & My NF',
              },
            },
            facetCounts: {},
          },
          {
            label: 'My SNSSAI & My NF',
            data: {
              operation: 'open-tab',
              context: {
                id: 'NF_SNSSAI',
                contextFields: [
                  {
                    id: 'c_SNSSAI',
                    name: 'My SNSSAI',
                    description: 'Soup Network Slice Selection Assistance Information',
                    dataType: 'entityType',
                  },
                  {
                    id: 'c_NF',
                    name: 'My NF',
                    description: 'New Finger',
                    dataType: 'entityType',
                  },
                ],
                name: 'My SNSSAI & My NF',
              },
            },
            facetCounts: {},
          },
          {
            label: 'My NF',
            data: {
              operation: 'open-tab',
              context: {
                id: 'NF',
                contextFields: [
                  {
                    id: 'c_NF',
                    name: 'My NF',
                    description: 'New Finger',
                    dataType: 'entityType',
                  },
                ],
                name: 'My NF',
              },
            },
            facetCounts: {},
          },
          {
            label: 'My Site & My NSI',
            data: {
              operation: 'open-tab',
              context: {
                id: 'NSI_Site',
                contextFields: [
                  {
                    id: 'c_Site',
                    name: 'My Site',
                    description: 'Site',
                    dataType: 'entityType',
                  },
                  {
                    id: 'c_NSI',
                    name: 'My NSI',
                    description: 'No Sharks Inside',
                    dataType: 'entityType',
                  },
                ],
                name: 'My Site & My NSI',
              },
            },
            facetCounts: {},
          },
          {
            label: 'My Site & My SNSSAI',
            data: {
              operation: 'open-tab',
              context: {
                id: 'Site_SNSSAI',
                contextFields: [
                  {
                    id: 'c_Site',
                    name: 'My Site',
                    description: 'Site',
                    dataType: 'entityType',
                  },
                  {
                    id: 'c_SNSSAI',
                    name: 'My SNSSAI',
                    description: 'Soup Network Slice Selection Assistance Information',
                    dataType: 'entityType',
                  },
                ],
                name: 'My Site & My SNSSAI',
              },
            },
            facetCounts: {},
          },
          {
            label: 'My Site',
            data: {
              operation: 'open-tab',
              context: {
                id: 'Site',
                contextFields: [
                  {
                    id: 'c_Site',
                    name: 'My Site',
                    description: 'Site',
                    dataType: 'entityType',
                  },
                ],
                name: 'My Site',
              },
            },
            facetCounts: {},
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
              {
                label: 'My NF',
                name: 'c_NF',
                filterCategory: 'context',
                type: {
                  id: 'c_NF',
                  name: 'My NF',
                  description: 'New Finger',
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
                name: 'vi_NF_Site_AMFMeanRegNbr',
                filterCategory: 'metric',
                type: {
                  id: 'vi_NF_Site_AMFMeanRegNbr',
                  name: 'AMF Mean Reg Nbr',
                  valueType: 'integer',
                  description: 'AMFMeanRegNbr Description',
                  unit: 'errors/minute',
                  dataType: 'metricType',
                },
              },
              {
                label: 'AMF Mean Reg Nbr 2',
                name: 'vi_NF_Site_AMFMeanRegNbr2',
                filterCategory: 'metric',
                type: {
                  id: 'vi_NF_Site_AMFMeanRegNbr2',
                  name: 'AMF Mean Reg Nbr 2',
                  valueType: 'integer',
                  description: 'AMFMeanRegNbr2 Description',
                  unit: 'errors/minute',
                  dataType: 'metricType',
                },
              },
              {
                label: 'AMF Mean Reg Nbr 3',
                name: 'vi_NF_Site_AMFMeanRegNbr3',
                filterCategory: 'metric',
                type: {
                  id: 'vi_NF_Site_AMFMeanRegNbr3',
                  name: 'AMF Mean Reg Nbr 3',
                  valueType: 'integer',
                  description: 'AMFMeanRegNbr3 Description',
                  unit: 'errors/minute',
                  dataType: 'metricType',
                },
              },
              {
                label: 'PDU Session Est SR',
                name: 'vi_NF_Site_PDUSessionEstSR',
                filterCategory: 'metric',
                type: {
                  id: 'vi_NF_Site_PDUSessionEstSR',
                  name: 'PDU Session Est SR',
                  valueType: 'integer',
                  description: 'PDUSessionEstSR Description',
                  unit: 'errors/minute',
                  dataType: 'metricType',
                },
              },
              {
                label: 'Session Modification Req Rcvd',
                name: 'vi_NF_Site_SessionModificationReqRcvd',
                filterCategory: 'metric',
                type: {
                  id: 'vi_NF_Site_SessionModificationReqRcvd',
                  name: 'Session Modification Req Rcvd',
                  valueType: 'integer',
                  description: 'SessionModificationReqRcvd Description',
                  unit: 'errors/minute',
                  dataType: 'metricType',
                },
              },
            ],
            help: 'MEASUREMENT_FILTER_TOOLTIP_MESSAGE',
          },
        ],
        name: 'My Site & My NF',
        columns: [
          {
            title: 'My Site',
            name: 'My Site',
            attribute: 'c_Site',
            valueType: 'string',
            sortable: true,
            additionalInfo: 'Site',
            width: '9em',
            mandatory: true,
            type: {
              id: 'c_Site',
              name: 'My Site',
              description: 'Site',
              dataType: 'entityType',
            },
            sort: null,
          },
          {
            title: 'My NF',
            name: 'My NF',
            attribute: 'c_NF',
            valueType: 'string',
            sortable: true,
            additionalInfo: 'New Finger',
            width: '7em',
            mandatory: true,
            type: {
              id: 'c_NF',
              name: 'My NF',
              description: 'New Finger',
              dataType: 'entityType',
            },
            sort: null,
          },
          {
            title: 'AMF Mean Reg Nbr (errors/minute)',
            name: 'AMF Mean Reg Nbr',
            attribute: 'vi_NF_Site_AMFMeanRegNbr',
            valueType: 'integer',
            sortable: true,
            additionalInfo: 'AMFMeanRegNbr Description',
            width: '13em',
            sortNotificationInfo: 'AMF Mean Reg Nbr',
            sort: 'asc',
          },
          {
            title: 'AMF Mean Reg Nbr 2 (errors/minute)',
            name: 'AMF Mean Reg Nbr 2',
            attribute: 'vi_NF_Site_AMFMeanRegNbr2',
            valueType: 'integer',
            sortable: true,
            additionalInfo: 'AMFMeanRegNbr2 Description',
            width: '15em',
            sortNotificationInfo: 'AMF Mean Reg Nbr 2',
            sort: null,
          },
          {
            title: 'AMF Mean Reg Nbr 3 (errors/minute)',
            name: 'AMF Mean Reg Nbr 3',
            attribute: 'vi_NF_Site_AMFMeanRegNbr3',
            valueType: 'integer',
            sortable: true,
            additionalInfo: 'AMFMeanRegNbr3 Description',
            width: '15em',
            sortNotificationInfo: 'AMF Mean Reg Nbr 3',
            sort: null,
          },
          {
            title: 'PDU Session Est SR (errors/minute)',
            name: 'PDU Session Est SR',
            attribute: 'vi_NF_Site_PDUSessionEstSR',
            valueType: 'integer',
            sortable: true,
            additionalInfo: 'PDUSessionEstSR Description',
            width: '15em',
            sortNotificationInfo: 'PDU Session Est SR',
            sort: null,
          },
          {
            title: 'Session Modification Req Rcvd (errors/minute)',
            name: 'Session Modification Req Rcvd',
            attribute: 'vi_NF_Site_SessionModificationReqRcvd',
            valueType: 'integer',
            sortable: true,
            additionalInfo: 'SessionModificationReqRcvd Description',
            width: '8em',
            sortNotificationInfo: 'Session Modification Req Rcvd',
            sort: null,
          },
        ],
        index: 'soa',
      },
      payload: {
        sortBy: {
          id: 'vi_NF_Site_AMFMeanRegNbr',
        },
        sortOrder: 'asc',
      },
    };
    const expected = { ...browser };
    const actual = validateSavedBrowser(contexts, browser);
    expect(actual).to.deep.equal(expected);
  });

  it('should successfully update stored contexts when there are changes to be made', () => {
    const browser = {
      id: 'cc28e40e-1a3e-46a0-8ab5-e7418345c964',
      title: 'Metric Browser',
      filters: [],
      loading: false,
      match: '',
      browserError: undefined,
      settings: {
        autoRefresh: true,
        rowHeight: 'compact',
      },
      data: {
        total: 3,
        numpages: 1,
        numentries: 20,
        currentpage: 1,
        tableData: [],
        sort: {
          sortBy: {
            id: 'vi_NF_Site_AMFMeanRegNbr',
          },
          sortOrder: 'asc',
          isNewSortApplied: false,
        },
        fetchTime: 1695918766576,
      },
      active: true,
      relationActions: [
        {
          label: 'My NSI & My NF old',
          data: {
            operation: 'open-tab',
            context: {
              id: 'NF_NSI',
              contextFields: [
                {
                  id: 'c_NSI',
                  name: 'My NSI old',
                  description: 'No Sharks Inside old',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NF',
                  name: 'My NF old',
                  description: 'New Finger old',
                  dataType: 'entityType',
                },
              ],
              name: 'My NSI & My NF old',
            },
          },
          facetCounts: {},
        },
        {
          label: 'My SNSSAI & My NF old',
          data: {
            operation: 'open-tab',
            context: {
              id: 'NF_SNSSAI',
              contextFields: [
                {
                  id: 'c_SNSSAI',
                  name: 'My SNSSAI old',
                  description: 'Soup Network Slice Selection Assistance Information old',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NF',
                  name: 'My NF old',
                  description: 'New Finger old',
                  dataType: 'entityType',
                },
              ],
              name: 'My SNSSAI & My NF old',
            },
          },
          facetCounts: {},
        },
        {
          label: 'My NF old',
          data: {
            operation: 'open-tab',
            context: {
              id: 'NF',
              contextFields: [
                {
                  id: 'c_NF',
                  name: 'My NF old',
                  description: 'New Finger old',
                  dataType: 'entityType',
                },
              ],
              name: 'My NF old',
            },
          },
          facetCounts: {},
        },
        {
          label: 'My Site & My NSI old',
          data: {
            operation: 'open-tab',
            context: {
              id: 'NSI_Site',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site old',
                  description: 'Site old',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NSI',
                  name: 'My NSI old',
                  description: 'No Sharks Inside old',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site & My NSI old',
            },
          },
          facetCounts: {},
        },
        {
          label: 'My Site & My SNSSAI old',
          data: {
            operation: 'open-tab',
            context: {
              id: 'Site_SNSSAI',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site old',
                  description: 'Site old',
                  dataType: 'entityType',
                },
                {
                  id: 'c_SNSSAI',
                  name: 'My SNSSAI old',
                  description: 'Soup Network Slice Selection Assistance Information old',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site & My SNSSAI old',
            },
          },
          facetCounts: {},
        },
        {
          label: 'My Site old',
          data: {
            operation: 'open-tab',
            context: {
              id: 'Site',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site old',
                  description: 'Site old',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site',
            },
          },
          facetCounts: {},
        },
      ],
      context: {
        contextType: {
          id: 'NF_Site',
          contextFields: [
            {
              id: 'c_Site',
              name: 'My Site old',
              description: 'Site old',
              dataType: 'entityType',
            },
            {
              id: 'c_NF',
              name: 'My NF old',
              description: 'New Finger old',
              dataType: 'entityType',
            },
          ],
        },
        relations: [
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'NF_NSI',
              contextFields: [
                {
                  id: 'c_NSI',
                  name: 'My NSI old',
                  description: 'No Sharks Inside old',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NF',
                  name: 'My NF old',
                  description: 'New Finger old',
                  dataType: 'entityType',
                },
              ],
              name: 'My NSI & My NF old',
            },
          },
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'NF_SNSSAI',
              contextFields: [
                {
                  id: 'c_SNSSAI',
                  name: 'My SNSSAI old',
                  description: 'Soup Network Slice Selection Assistance Information old',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NF',
                  name: 'My NF old',
                  description: 'New Finger old',
                  dataType: 'entityType',
                },
              ],
              name: 'My SNSSAI & My NF old',
            },
          },
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'NF',
              contextFields: [
                {
                  id: 'c_NF',
                  name: 'My NF old',
                  description: 'New Finger old',
                  dataType: 'entityType',
                },
              ],
              name: 'My NF old',
            },
          },
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'NSI_Site',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site old',
                  description: 'Site old',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NSI',
                  name: 'My NSI old',
                  description: 'No Sharks Inside old',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site & My NSI old',
            },
          },
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'Site_SNSSAI',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site old',
                  description: 'Site old',
                  dataType: 'entityType',
                },
                {
                  id: 'c_SNSSAI',
                  name: 'My SNSSAI old',
                  description: 'Soup Network Slice Selection Assistance Information old',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site & My SNSSAI old',
            },
          },
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'Site',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site old',
                  description: 'Site old',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site old',
            },
          },
        ],
        metricTypes: [
          {
            id: 'vi_should_not_exist_in_new',
            name: 'shouldnt exist in new',
            valueType: 'float',
            description: 'shouldnt exist in new',
            unit: 'errors/minute',
            dataType: 'metricType',
          },
          {
            id: 'vi_NF_Site_AMFMeanRegNbr',
            name: 'AMF Mean Reg Nbr old',
            valueType: 'float',
            description: 'AMFMeanRegNbr Description old',
            unit: 'errors/minute',
            dataType: 'metricType',
          },
          {
            id: 'vi_NF_Site_AMFMeanRegNbr2',
            name: 'AMF Mean Reg Nbr 2 old',
            valueType: 'integer',
            description: 'AMFMeanRegNbr2 Description old',
            unit: 'errors/minute',
            dataType: 'metricType',
          },
          {
            id: 'vi_NF_Site_AMFMeanRegNbr3',
            name: 'AMF Mean Reg Nbr 3 old',
            valueType: 'integer',
            description: 'AMFMeanRegNbr3 Description old',
            unit: 'errors/penguins',
            dataType: 'metricType',
          },
          {
            id: 'vi_NF_Site_PDUSessionEstSR',
            name: 'PDU Session Est SR old',
            valueType: 'integer',
            description: 'PDUSessionEstSR Description old',
            unit: 'errors/minute',
            dataType: 'metricType',
          },
        ],
        relationActions: [
          {
            label: 'My NSI & My NF',
            data: {
              operation: 'open-tab',
              context: {
                id: 'NF_NSI',
                contextFields: [
                  {
                    id: 'c_NSI',
                    name: 'My NSI',
                    description: 'No Sharks Inside',
                    dataType: 'entityType',
                  },
                  {
                    id: 'c_NF',
                    name: 'My NF',
                    description: 'New Finger',
                    dataType: 'entityType',
                  },
                ],
                name: 'My NSI & My NF',
              },
            },
            facetCounts: {},
          },
          {
            label: 'My SNSSAI & My NF',
            data: {
              operation: 'open-tab',
              context: {
                id: 'NF_SNSSAI',
                contextFields: [
                  {
                    id: 'c_SNSSAI',
                    name: 'My SNSSAI',
                    description: 'Soup Network Slice Selection Assistance Information',
                    dataType: 'entityType',
                  },
                  {
                    id: 'c_NF',
                    name: 'My NF',
                    description: 'New Finger',
                    dataType: 'entityType',
                  },
                ],
                name: 'My SNSSAI & My NF',
              },
            },
            facetCounts: {},
          },
          {
            label: 'My NF',
            data: {
              operation: 'open-tab',
              context: {
                id: 'NF',
                contextFields: [
                  {
                    id: 'c_NF',
                    name: 'My NF',
                    description: 'New Finger',
                    dataType: 'entityType',
                  },
                ],
                name: 'My NF',
              },
            },
            facetCounts: {},
          },
          {
            label: 'My Site & My NSI',
            data: {
              operation: 'open-tab',
              context: {
                id: 'NSI_Site',
                contextFields: [
                  {
                    id: 'c_Site',
                    name: 'My Site',
                    description: 'Site',
                    dataType: 'entityType',
                  },
                  {
                    id: 'c_NSI',
                    name: 'My NSI',
                    description: 'No Sharks Inside',
                    dataType: 'entityType',
                  },
                ],
                name: 'My Site & My NSI',
              },
            },
            facetCounts: {},
          },
          {
            label: 'My Site & My SNSSAI',
            data: {
              operation: 'open-tab',
              context: {
                id: 'Site_SNSSAI',
                contextFields: [
                  {
                    id: 'c_Site',
                    name: 'My Site',
                    description: 'Site',
                    dataType: 'entityType',
                  },
                  {
                    id: 'c_SNSSAI',
                    name: 'My SNSSAI',
                    description: 'Soup Network Slice Selection Assistance Information',
                    dataType: 'entityType',
                  },
                ],
                name: 'My Site & My SNSSAI',
              },
            },
            facetCounts: {},
          },
          {
            label: 'My Site',
            data: {
              operation: 'open-tab',
              context: {
                id: 'Site',
                contextFields: [
                  {
                    id: 'c_Site',
                    name: 'My Site',
                    description: 'Site',
                    dataType: 'entityType',
                  },
                ],
                name: 'My Site',
              },
            },
            facetCounts: {},
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
              {
                label: 'My NF',
                name: 'c_NF',
                filterCategory: 'context',
                type: {
                  id: 'c_NF',
                  name: 'My NF',
                  description: 'New Finger',
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
                name: 'vi_NF_Site_AMFMeanRegNbr',
                filterCategory: 'metric',
                type: {
                  id: 'vi_NF_Site_AMFMeanRegNbr',
                  name: 'AMF Mean Reg Nbr',
                  valueType: 'integer',
                  description: 'AMFMeanRegNbr Description',
                  unit: 'errors/minute',
                  dataType: 'metricType',
                },
              },
              {
                label: 'AMF Mean Reg Nbr 2',
                name: 'vi_NF_Site_AMFMeanRegNbr2',
                filterCategory: 'metric',
                type: {
                  id: 'vi_NF_Site_AMFMeanRegNbr2',
                  name: 'AMF Mean Reg Nbr 2',
                  valueType: 'integer',
                  description: 'AMFMeanRegNbr2 Description',
                  unit: 'errors/minute',
                  dataType: 'metricType',
                },
              },
              {
                label: 'AMF Mean Reg Nbr 3',
                name: 'vi_NF_Site_AMFMeanRegNbr3',
                filterCategory: 'metric',
                type: {
                  id: 'vi_NF_Site_AMFMeanRegNbr3',
                  name: 'AMF Mean Reg Nbr 3',
                  valueType: 'integer',
                  description: 'AMFMeanRegNbr3 Description',
                  unit: 'errors/minute',
                  dataType: 'metricType',
                },
              },
              {
                label: 'PDU Session Est SR',
                name: 'vi_NF_Site_PDUSessionEstSR',
                filterCategory: 'metric',
                type: {
                  id: 'vi_NF_Site_PDUSessionEstSR',
                  name: 'PDU Session Est SR',
                  valueType: 'integer',
                  description: 'PDUSessionEstSR Description',
                  unit: 'errors/minute',
                  dataType: 'metricType',
                },
              },
              {
                label: 'Session Modification Req Rcvd',
                name: 'vi_NF_Site_SessionModificationReqRcvd',
                filterCategory: 'metric',
                type: {
                  id: 'vi_NF_Site_SessionModificationReqRcvd',
                  name: 'Session Modification Req Rcvd',
                  valueType: 'integer',
                  description: 'SessionModificationReqRcvd Description',
                  unit: 'errors/minute',
                  dataType: 'metricType',
                },
              },
            ],
            help: 'MEASUREMENT_FILTER_TOOLTIP_MESSAGE',
          },
        ],
        name: 'My Site & My NF',
        columns: [
          {
            title: 'My Site',
            name: 'My Site',
            attribute: 'c_Site',
            valueType: 'string',
            sortable: true,
            additionalInfo: 'Site',
            width: '9em',
            mandatory: true,
            type: {
              id: 'c_Site',
              name: 'My Site',
              description: 'Site',
              dataType: 'entityType',
            },
            sort: null,
          },
          {
            title: 'My NF',
            name: 'My NF',
            attribute: 'c_NF',
            valueType: 'string',
            sortable: true,
            additionalInfo: 'New Finger',
            width: '7em',
            mandatory: true,
            type: {
              id: 'c_NF',
              name: 'My NF',
              description: 'New Finger',
              dataType: 'entityType',
            },
            sort: null,
          },
          {
            title: 'AMF Mean Reg Nbr (errors/minute)',
            name: 'AMF Mean Reg Nbr',
            attribute: 'vi_NF_Site_AMFMeanRegNbr',
            valueType: 'integer',
            sortable: true,
            additionalInfo: 'AMFMeanRegNbr Description',
            width: '13em',
            sortNotificationInfo: 'AMF Mean Reg Nbr',
            sort: 'asc',
          },
          {
            title: 'AMF Mean Reg Nbr 2 (errors/minute)',
            name: 'AMF Mean Reg Nbr 2',
            attribute: 'vi_NF_Site_AMFMeanRegNbr2',
            valueType: 'integer',
            sortable: true,
            additionalInfo: 'AMFMeanRegNbr2 Description',
            width: '15em',
            sortNotificationInfo: 'AMF Mean Reg Nbr 2',
            sort: null,
          },
          {
            title: 'AMF Mean Reg Nbr 3 (errors/minute)',
            name: 'AMF Mean Reg Nbr 3',
            attribute: 'vi_NF_Site_AMFMeanRegNbr3',
            valueType: 'integer',
            sortable: true,
            additionalInfo: 'AMFMeanRegNbr3 Description',
            width: '15em',
            sortNotificationInfo: 'AMF Mean Reg Nbr 3',
            sort: null,
          },
          {
            title: 'PDU Session Est SR (errors/minute)',
            name: 'PDU Session Est SR',
            attribute: 'vi_NF_Site_PDUSessionEstSR',
            valueType: 'integer',
            sortable: true,
            additionalInfo: 'PDUSessionEstSR Description',
            width: '15em',
            sortNotificationInfo: 'PDU Session Est SR',
            sort: null,
          },
          {
            title: 'Session Modification Req Rcvd (errors/minute)',
            name: 'Session Modification Req Rcvd',
            attribute: 'vi_NF_Site_SessionModificationReqRcvd',
            valueType: 'integer',
            sortable: true,
            additionalInfo: 'SessionModificationReqRcvd Description',
            width: '8em',
            sortNotificationInfo: 'Session Modification Req Rcvd',
            sort: null,
          },
        ],
        index: 'soa',
      },
      payload: {
        sortBy: {
          id: 'vi_NF_Site_AMFMeanRegNbr',
        },
        sortOrder: 'asc',
      },
    };
    const actual = validateSavedBrowser(contexts, browser);
    const expected = {
      id: 'cc28e40e-1a3e-46a0-8ab5-e7418345c964',
      title: 'Metric Browser',
      filters: [],
      loading: false,
      match: '',
      browserError: undefined,
      settings: {
        autoRefresh: true,
        rowHeight: 'compact',
      },
      data: {
        total: 3,
        numpages: 1,
        numentries: 20,
        currentpage: 1,
        tableData: [],
        sort: {
          sortBy: {
            id: 'vi_NF_Site_AMFMeanRegNbr',
          },
          sortOrder: 'asc',
          isNewSortApplied: false,
        },
        fetchTime: 1695918766576,
      },
      active: true,
      relationActions: [
        {
          label: 'My NSI & My NF',
          data: {
            operation: 'open-tab',
            context: {
              id: 'NF_NSI',
              contextFields: [
                {
                  id: 'c_NSI',
                  name: 'My NSI',
                  description: 'No Sharks Inside',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NF',
                  name: 'My NF',
                  description: 'New Finger',
                  dataType: 'entityType',
                },
              ],
              name: 'My NSI & My NF',
            },
          },
          facetCounts: {},
        },
        {
          label: 'My SNSSAI & My NF',
          data: {
            operation: 'open-tab',
            context: {
              id: 'NF_SNSSAI',
              contextFields: [
                {
                  id: 'c_SNSSAI',
                  name: 'My SNSSAI',
                  description: 'Soup Network Slice Selection Assistance Information',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NF',
                  name: 'My NF',
                  description: 'New Finger',
                  dataType: 'entityType',
                },
              ],
              name: 'My SNSSAI & My NF',
            },
          },
          facetCounts: {},
        },
        {
          label: 'My NF',
          data: {
            operation: 'open-tab',
            context: {
              id: 'NF',
              contextFields: [
                {
                  id: 'c_NF',
                  name: 'My NF',
                  description: 'New Finger',
                  dataType: 'entityType',
                },
              ],
              name: 'My NF',
            },
          },
          facetCounts: {},
        },
        {
          label: 'My Site & My NSI',
          data: {
            operation: 'open-tab',
            context: {
              id: 'NSI_Site',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site',
                  description: 'Site',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NSI',
                  name: 'My NSI',
                  description: 'No Sharks Inside',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site & My NSI',
            },
          },
          facetCounts: {},
        },
        {
          label: 'My Site & My SNSSAI',
          data: {
            operation: 'open-tab',
            context: {
              id: 'Site_SNSSAI',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site',
                  description: 'Site',
                  dataType: 'entityType',
                },
                {
                  id: 'c_SNSSAI',
                  name: 'My SNSSAI',
                  description: 'Soup Network Slice Selection Assistance Information',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site & My SNSSAI',
            },
          },
          facetCounts: {},
        },
        {
          label: 'My Site',
          data: {
            operation: 'open-tab',
            context: {
              id: 'Site',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site',
                  description: 'Site',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site',
            },
          },
          facetCounts: {},
        },
      ],
      context: {
        contextType: {
          id: 'NF_Site',
          contextFields: [
            {
              id: 'c_Site',
              name: 'My Site',
              description: 'Site',
              dataType: 'entityType',
            },
            {
              id: 'c_NF',
              name: 'My NF',
              description: 'New Finger',
              dataType: 'entityType',
            },
          ],
        },
        relations: [
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'NF_NSI',
              contextFields: [
                {
                  id: 'c_NSI',
                  name: 'My NSI',
                  description: 'No Sharks Inside',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NF',
                  name: 'My NF',
                  description: 'New Finger',
                  dataType: 'entityType',
                },
              ],
              name: 'My NSI & My NF',
            },
          },
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'NF_SNSSAI',
              contextFields: [
                {
                  id: 'c_SNSSAI',
                  name: 'My SNSSAI',
                  description: 'Soup Network Slice Selection Assistance Information',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NF',
                  name: 'My NF',
                  description: 'New Finger',
                  dataType: 'entityType',
                },
              ],
              name: 'My SNSSAI & My NF',
            },
          },
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'NF',
              contextFields: [
                {
                  id: 'c_NF',
                  name: 'My NF',
                  description: 'New Finger',
                  dataType: 'entityType',
                },
              ],
              name: 'My NF',
            },
          },
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'NSI_Site',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site',
                  description: 'Site',
                  dataType: 'entityType',
                },
                {
                  id: 'c_NSI',
                  name: 'My NSI',
                  description: 'No Sharks Inside',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site & My NSI',
            },
          },
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'Site_SNSSAI',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site',
                  description: 'Site',
                  dataType: 'entityType',
                },
                {
                  id: 'c_SNSSAI',
                  name: 'My SNSSAI',
                  description: 'Soup Network Slice Selection Assistance Information',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site & My SNSSAI',
            },
          },
          {
            relationType: 'RELATED_TO',
            related: {
              id: 'Site',
              contextFields: [
                {
                  id: 'c_Site',
                  name: 'My Site',
                  description: 'Site',
                  dataType: 'entityType',
                },
              ],
              name: 'My Site',
            },
          },
        ],
        metricTypes: [
          {
            id: 'vi_NF_Site_AMFMeanRegNbr',
            name: 'AMF Mean Reg Nbr',
            valueType: 'integer',
            description: 'AMFMeanRegNbr Description',
            unit: 'errors/minute',
            dataType: 'metricType',
          },
          {
            id: 'vi_NF_Site_AMFMeanRegNbr2',
            name: 'AMF Mean Reg Nbr 2',
            valueType: 'integer',
            description: 'AMFMeanRegNbr2 Description',
            unit: 'errors/minute',
            dataType: 'metricType',
          },
          {
            id: 'vi_NF_Site_AMFMeanRegNbr3',
            name: 'AMF Mean Reg Nbr 3',
            valueType: 'integer',
            description: 'AMFMeanRegNbr3 Description',
            unit: 'errors/minute',
            dataType: 'metricType',
          },
          {
            id: 'vi_NF_Site_PDUSessionEstSR',
            name: 'PDU Session Est SR',
            valueType: 'integer',
            description: 'PDUSessionEstSR Description',
            unit: 'errors/minute',
            dataType: 'metricType',
          },
          {
            id: 'vi_NF_Site_SessionModificationReqRcvd',
            name: 'Session Modification Req Rcvd',
            valueType: 'integer',
            description: 'SessionModificationReqRcvd Description',
            unit: 'errors/minute',
            dataType: 'metricType',
          },
        ],
        relationActions: [
          {
            label: 'My NSI & My NF',
            data: {
              operation: 'open-tab',
              context: {
                id: 'NF_NSI',
                contextFields: [
                  {
                    id: 'c_NSI',
                    name: 'My NSI',
                    description: 'No Sharks Inside',
                    dataType: 'entityType',
                  },
                  {
                    id: 'c_NF',
                    name: 'My NF',
                    description: 'New Finger',
                    dataType: 'entityType',
                  },
                ],
                name: 'My NSI & My NF',
              },
            },
            facetCounts: {},
          },
          {
            label: 'My SNSSAI & My NF',
            data: {
              operation: 'open-tab',
              context: {
                id: 'NF_SNSSAI',
                contextFields: [
                  {
                    id: 'c_SNSSAI',
                    name: 'My SNSSAI',
                    description: 'Soup Network Slice Selection Assistance Information',
                    dataType: 'entityType',
                  },
                  {
                    id: 'c_NF',
                    name: 'My NF',
                    description: 'New Finger',
                    dataType: 'entityType',
                  },
                ],
                name: 'My SNSSAI & My NF',
              },
            },
            facetCounts: {},
          },
          {
            label: 'My NF',
            data: {
              operation: 'open-tab',
              context: {
                id: 'NF',
                contextFields: [
                  {
                    id: 'c_NF',
                    name: 'My NF',
                    description: 'New Finger',
                    dataType: 'entityType',
                  },
                ],
                name: 'My NF',
              },
            },
            facetCounts: {},
          },
          {
            label: 'My Site & My NSI',
            data: {
              operation: 'open-tab',
              context: {
                id: 'NSI_Site',
                contextFields: [
                  {
                    id: 'c_Site',
                    name: 'My Site',
                    description: 'Site',
                    dataType: 'entityType',
                  },
                  {
                    id: 'c_NSI',
                    name: 'My NSI',
                    description: 'No Sharks Inside',
                    dataType: 'entityType',
                  },
                ],
                name: 'My Site & My NSI',
              },
            },
            facetCounts: {},
          },
          {
            label: 'My Site & My SNSSAI',
            data: {
              operation: 'open-tab',
              context: {
                id: 'Site_SNSSAI',
                contextFields: [
                  {
                    id: 'c_Site',
                    name: 'My Site',
                    description: 'Site',
                    dataType: 'entityType',
                  },
                  {
                    id: 'c_SNSSAI',
                    name: 'My SNSSAI',
                    description: 'Soup Network Slice Selection Assistance Information',
                    dataType: 'entityType',
                  },
                ],
                name: 'My Site & My SNSSAI',
              },
            },
            facetCounts: {},
          },
          {
            label: 'My Site',
            data: {
              operation: 'open-tab',
              context: {
                id: 'Site',
                contextFields: [
                  {
                    id: 'c_Site',
                    name: 'My Site',
                    description: 'Site',
                    dataType: 'entityType',
                  },
                ],
                name: 'My Site',
              },
            },
            facetCounts: {},
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
              {
                label: 'My NF',
                name: 'c_NF',
                filterCategory: 'context',
                type: {
                  id: 'c_NF',
                  name: 'My NF',
                  description: 'New Finger',
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
                name: 'vi_NF_Site_AMFMeanRegNbr',
                filterCategory: 'metric',
                type: {
                  id: 'vi_NF_Site_AMFMeanRegNbr',
                  name: 'AMF Mean Reg Nbr',
                  valueType: 'integer',
                  description: 'AMFMeanRegNbr Description',
                  unit: 'errors/minute',
                  dataType: 'metricType',
                },
              },
              {
                label: 'AMF Mean Reg Nbr 2',
                name: 'vi_NF_Site_AMFMeanRegNbr2',
                filterCategory: 'metric',
                type: {
                  id: 'vi_NF_Site_AMFMeanRegNbr2',
                  name: 'AMF Mean Reg Nbr 2',
                  valueType: 'integer',
                  description: 'AMFMeanRegNbr2 Description',
                  unit: 'errors/minute',
                  dataType: 'metricType',
                },
              },
              {
                label: 'AMF Mean Reg Nbr 3',
                name: 'vi_NF_Site_AMFMeanRegNbr3',
                filterCategory: 'metric',
                type: {
                  id: 'vi_NF_Site_AMFMeanRegNbr3',
                  name: 'AMF Mean Reg Nbr 3',
                  valueType: 'integer',
                  description: 'AMFMeanRegNbr3 Description',
                  unit: 'errors/minute',
                  dataType: 'metricType',
                },
              },
              {
                label: 'PDU Session Est SR',
                name: 'vi_NF_Site_PDUSessionEstSR',
                filterCategory: 'metric',
                type: {
                  id: 'vi_NF_Site_PDUSessionEstSR',
                  name: 'PDU Session Est SR',
                  valueType: 'integer',
                  description: 'PDUSessionEstSR Description',
                  unit: 'errors/minute',
                  dataType: 'metricType',
                },
              },
              {
                label: 'Session Modification Req Rcvd',
                name: 'vi_NF_Site_SessionModificationReqRcvd',
                filterCategory: 'metric',
                type: {
                  id: 'vi_NF_Site_SessionModificationReqRcvd',
                  name: 'Session Modification Req Rcvd',
                  valueType: 'integer',
                  description: 'SessionModificationReqRcvd Description',
                  unit: 'errors/minute',
                  dataType: 'metricType',
                },
              },
            ],
            help: 'MEASUREMENT_FILTER_TOOLTIP_MESSAGE',
          },
        ],
        name: 'My Site & My NF',
        columns: [
          {
            title: 'My Site',
            name: 'My Site',
            attribute: 'c_Site',
            valueType: 'string',
            sortable: true,
            additionalInfo: 'Site',
            width: '9em',
            mandatory: true,
            type: {
              id: 'c_Site',
              name: 'My Site',
              description: 'Site',
              dataType: 'entityType',
            },
            sort: null,
          },
          {
            title: 'My NF',
            name: 'My NF',
            attribute: 'c_NF',
            valueType: 'string',
            sortable: true,
            additionalInfo: 'New Finger',
            width: '7em',
            mandatory: true,
            type: {
              id: 'c_NF',
              name: 'My NF',
              description: 'New Finger',
              dataType: 'entityType',
            },
            sort: null,
          },
          {
            title: 'AMF Mean Reg Nbr (errors/minute)',
            name: 'AMF Mean Reg Nbr',
            attribute: 'vi_NF_Site_AMFMeanRegNbr',
            valueType: 'integer',
            sortable: true,
            additionalInfo: 'AMFMeanRegNbr Description',
            width: '13em',
            sortNotificationInfo: 'AMF Mean Reg Nbr',
            sort: 'asc',
          },
          {
            title: 'AMF Mean Reg Nbr 2 (errors/minute)',
            name: 'AMF Mean Reg Nbr 2',
            attribute: 'vi_NF_Site_AMFMeanRegNbr2',
            valueType: 'integer',
            sortable: true,
            additionalInfo: 'AMFMeanRegNbr2 Description',
            width: '15em',
            sortNotificationInfo: 'AMF Mean Reg Nbr 2',
            sort: null,
          },
          {
            title: 'AMF Mean Reg Nbr 3 (errors/minute)',
            name: 'AMF Mean Reg Nbr 3',
            attribute: 'vi_NF_Site_AMFMeanRegNbr3',
            valueType: 'integer',
            sortable: true,
            additionalInfo: 'AMFMeanRegNbr3 Description',
            width: '15em',
            sortNotificationInfo: 'AMF Mean Reg Nbr 3',
            sort: null,
          },
          {
            title: 'PDU Session Est SR (errors/minute)',
            name: 'PDU Session Est SR',
            attribute: 'vi_NF_Site_PDUSessionEstSR',
            valueType: 'integer',
            sortable: true,
            additionalInfo: 'PDUSessionEstSR Description',
            width: '15em',
            sortNotificationInfo: 'PDU Session Est SR',
            sort: null,
          },
          {
            title: 'Session Modification Req Rcvd (errors/minute)',
            name: 'Session Modification Req Rcvd',
            attribute: 'vi_NF_Site_SessionModificationReqRcvd',
            valueType: 'integer',
            sortable: true,
            additionalInfo: 'SessionModificationReqRcvd Description',
            width: '26em',
            sortNotificationInfo: 'Session Modification Req Rcvd',
            sort: null,
          },
        ],
        index: 'soa',
      },
      payload: {
        sortBy: {
          id: 'vi_NF_Site_AMFMeanRegNbr',
        },
        sortOrder: 'asc',
      },
    };
    expect(actual).to.deep.equal(expected);
  });

  it('should create a context error when a browser type is no longer in the list of contexts', () => {
    const browser = {
      id: 'cc28e40e-1a3e-46a0-8ab5-e7418345c964',
      title: 'Metric Browser',
      filters: [],
      loading: false,
      match: '',
      settings: {
        autoRefresh: true,
        rowHeight: 'compact',
      },
      browserError: { type: 'CONTEXT_ERROR', data: { name: 'shouldnt_exist', index: 'soa' } },
      data: {
        total: 3,
        numpages: 1,
        numentries: 20,
        currentpage: 1,
        tableData: [],
        sort: {
          sortBy: {
            id: 'vi_NF_Site_AMFMeanRegNbr',
          },
          sortOrder: 'asc',
          isNewSortApplied: false,
        },
        fetchTime: 1695918766576,
      },
      active: true,
      relationActions: [],
      context: {
        contextType: {
          id: 'shouldnt_exist',
          contextFields: [
            {
              id: 'c_Site',
              name: 'My Site',
              description: 'Site',
              dataType: 'entityType',
            },
            {
              id: 'c_NF',
              name: 'My NF',
              description: 'New Finger',
              dataType: 'entityType',
            },
          ],
        },
        relations: [],
        metricTypes: [],
        relationActions: [],
        filterCategories: [
          {
            type: 'context',
            title: 'KPI Context Filters',
            selection: 'checkbox',
            fields: [
              [
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
                {
                  label: 'My NF',
                  name: 'c_NF',
                  filterCategory: 'context',
                  type: {
                    id: 'c_NF',
                    name: 'My NF',
                    description: 'New Finger',
                    dataType: 'entityType',
                    valueType: 'string',
                  },
                },
              ],
            ],
            help: 'NETWORK_FILTER_TOOLTIP_MESSAGE',
          },
          {
            type: 'metric',
            title: 'KPI Filters',
            selection: 'radio',
            fields: [],
            help: 'MEASUREMENT_FILTER_TOOLTIP_MESSAGE',
          },
        ],
        name: 'My Site & My NF',
        columns: [],
        index: 'soa',
      },
    };
    const actual = validateSavedBrowser(contexts, browser);
    const expected = { type: 'CONTEXT_ERROR', data: { name: 'shouldnt_exist', index: 'soa' } };
    expect(actual.browserError).to.deep.equal(expected);
  });

  it('should clear a context error when a stored browser type is now available in the list of contexts', () => {
    const browser = {
      id: 'cc28e40e-1a3e-46a0-8ab5-e7418345c964',
      title: 'Metric Browser',
      filters: [],
      loading: false,
      match: '',
      settings: {
        autoRefresh: true,
        rowHeight: 'compact',
      },
      browserError: { type: 'CONTEXT_ERROR', data: { name: 'NF_Site', index: 'soa' } },
      data: {
        total: 3,
        numpages: 1,
        numentries: 20,
        currentpage: 1,
        tableData: [],
        sort: {
          sortBy: {
            id: 'vi_NF_Site_AMFMeanRegNbr',
          },
          sortOrder: 'asc',
          isNewSortApplied: false,
        },
        fetchTime: 1695918766576,
      },
      active: true,
      relationActions: [],
      context: {
        contextType: {
          id: 'NF_Site',
          contextFields: [
            {
              id: 'c_Site',
              name: 'My Site',
              description: 'Site',
              dataType: 'entityType',
            },
            {
              id: 'c_NF',
              name: 'My NF',
              description: 'New Finger',
              dataType: 'entityType',
            },
          ],
        },
        relations: [],
        metricTypes: [],
        relationActions: [],
        filterCategories: [
          {
            type: 'context',
            title: 'KPI Context Filters',
            selection: 'checkbox',
            fields: [
              [
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
                {
                  label: 'My NF',
                  name: 'c_NF',
                  filterCategory: 'context',
                  type: {
                    id: 'c_NF',
                    name: 'My NF',
                    description: 'New Finger',
                    dataType: 'entityType',
                    valueType: 'string',
                  },
                },
              ],
            ],
            help: 'NETWORK_FILTER_TOOLTIP_MESSAGE',
          },
          {
            type: 'metric',
            title: 'KPI Filters',
            selection: 'radio',
            fields: [],
            help: 'MEASUREMENT_FILTER_TOOLTIP_MESSAGE',
          },
        ],
        name: 'My Site & My NF',
        columns: [],
        index: 'soa',
      },
    };
    const actual = validateSavedBrowser(contexts, browser);

    expect(actual.browserError).to.equal(undefined);
  });

  it('should return error when browserError property have any errors', () => {
    const browser = {
      browserError: { type: 'VALIDATION_ERROR', data: { name: 'shouldnt_exist', index: 'soa' } },
      settings: {
        autoRefresh: true,
        rowHeight: 'compact',
      },
    };
    const actual = validateSavedBrowser(contexts, browser);
    const expected = { type: 'VALIDATION_ERROR', data: { name: 'shouldnt_exist', index: 'soa' } };
    expect(actual.browserError).to.deep.equal(expected);
  });
});

describe('makeFullContextName tests', () => {
  it('should return the customized context name if the context name is found in the customization file', () => {
    expect(
      makeFullContextName({
        id: 'nsi_snssai',
        name: 'My NSI and SNSSAI',
        contextFields: [
          { id: 'c_nsi', name: 'NSI' },
          { id: 'c_snssai', name: 'SNSSAI' },
        ],
      }),
    ).to.equal('My NSI and SNSSAI');
  });

  it('should return a combination of context names if there is a name property inside contextFields and more than two contexts, but no customized context name', () => {
    expect(
      makeFullContextName({
        id: 'nsi_snssai',
        contextFields: [
          { id: 'c_nsi', name: 'NSI' },
          { id: 'c_snssai', name: 'SNSSAI' },
        ],
      }),
    ).to.equal('NSI & SNSSAI');
  });

  it('should return a context name if there is a name property inside contextFields but no customized context name', () => {
    expect(
      makeFullContextName({ id: 'nsi', contextFields: [{ id: 'c_nsi', name: 'NSI' }] }),
    ).to.equal('NSI');
  });

  it('should return a context id if there is no customized context name and no name property inside contextFields', () => {
    expect(makeFullContextName({ id: 'nsi', contextFields: [{ id: 'c_nsi' }] })).to.equal('nsi');
  });

  it('should return a context id if one of the name properties inside contextFields is undefined', () => {
    expect(
      makeFullContextName({
        id: 'nsi_snssai',
        contextFields: [{ id: 'c_nsi', name: 'NSI' }, { id: 'c_snssai' }],
      }),
    ).to.equal('nsi_snssai');
  });

  it('should return the error when parameter pass the error object', async () => {
    expect(() => {
      handleError(new Error('test error'));
    }).to.throw('test error');
  });
});
