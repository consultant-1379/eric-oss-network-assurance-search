import { expect } from '@open-wc/testing';
import {
  createSearchParams,
  decodeSearchParams,
  deserializeParams,
  encodeSerializedParams,
  serializeParams,
  transformSearchResponseTableData,
} from '../../../src/services/assurance/search.js';
import { createFiltersFromValues } from '../../../src/state/filterActions.js';
import discoveryMocks from '../../../mocks/state/discoveryMocks.json';
import searchMetricsResponse1 from '../../../mocks/services/assurance/search/metrics/response1.json';

const createResponseData = (contextTypes = [], metrics = [], rows = 10) => ({
  results: Array.from(Array(rows).keys()).map(() => ({
    context: {
      name: contextTypes.join('_'),
      contextFields: contextTypes.map((id, name) => ({
        type: { id },
        name,
      })),
    },
    metrics: metrics.map((name, value) => ({
      type: { id: name },
      name,
      value,
    })),
  })),
});

describe('Assurance Search', () => {
  describe('Parameter processing related functions', () => {
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
    describe('createSearchParams', () => {
      it('should create search params correctly when there is no payload', () => {
        /* eslint-disable sonarjs/no-duplicate-string */
        const output = {
          contextTypeId: 'NSSAI_NSI',
          index: 'ran',
          metricTypes: [
            {
              id: 'vi_sessionModificationReqRcvd',
            },
            {
              id: 'vi_dlUnstrDropPackets',
            },
          ],
          opts: {
            filters: [],
            includeRelations: false,
            length: 20,
            offset: 0,
            sortBy: {
              id: 'vi_sessionModificationReqRcvd',
            },
            sortOrder: 'asc',
          },
        };
        expect(createSearchParams({ ...metricBrowser })).to.deep.equal(output);
      });

      it('should create search params correctly when there is a filters', () => {
        /* eslint-disable sonarjs/no-duplicate-string */
        const output = {
          contextTypeId: 'NSSAI_NSI',
          index: 'ran',
          metricTypes: [
            {
              id: 'vi_sessionModificationReqRcvd',
            },
            {
              id: 'vi_dlUnstrDropPackets',
            },
          ],
          opts: {
            filters: [
              {
                entityType: {
                  id: 'c_SNSSAI',
                },
                name: 'c_SNSSAI',
                searchPattern: '??1',
                type: 'entity',
              },
            ],
            includeRelations: false,
            length: 20,
            offset: 0,
            sortBy: { id: 'c_NSSAI' },
            sortOrder: 'desc',
          },
        };
        expect(
          createSearchParams({
            ...metricBrowser,
            filters: [
              {
                label: 'My SNSSAI',
                name: 'c_SNSSAI',
                filterCategory: 'context',
                type: {
                  id: 'c_SNSSAI',
                  name: 'My SNSSAI',
                  description: 'Soup Network Slice Selection Assistance Information',
                  dataType: 'entityType',
                  valueType: 'string',
                },
                id: '544bae82-bb32-42ba-9a74-9b61dac2896e',
                value: {
                  name: 'c_SNSSAI',
                  type: 'entity',
                  searchPattern: '??1',
                  entityType: {
                    id: 'c_SNSSAI',
                  },
                  operation: 'eq',
                },
                selected: true,
              },
            ],
            payload: {
              sortBy: {
                id: 'c_NSSAI',
              },
              sortOrder: 'desc',
            },
          }),
        ).to.deep.equal(output);
      });

      it('should create search params correctly when there is a sort in payload', () => {
        /* eslint-disable sonarjs/no-duplicate-string */
        const output = {
          contextTypeId: 'NSSAI_NSI',
          index: 'ran',
          metricTypes: [
            {
              id: 'vi_sessionModificationReqRcvd',
            },
            {
              id: 'vi_dlUnstrDropPackets',
            },
          ],
          opts: {
            filters: [],
            includeRelations: false,
            length: 20,
            offset: 0,
            sortBy: { id: 'NSSAI' },
            sortOrder: 'desc',
          },
        };
        expect(
          createSearchParams({
            ...metricBrowser,
            payload: {
              sortBy: {
                id: 'NSSAI',
              },
              sortOrder: 'desc',
            },
          }),
        ).to.deep.equal(output);
      });

      it('should create search params correctly when there is pagination in payload', () => {
        /* eslint-disable sonarjs/no-duplicate-string */
        const output = {
          contextTypeId: 'NSSAI_NSI',
          index: 'ran',
          metricTypes: [
            {
              id: 'vi_sessionModificationReqRcvd',
            },
            {
              id: 'vi_dlUnstrDropPackets',
            },
          ],
          opts: {
            filters: [],
            includeRelations: false,
            length: 20,
            offset: 0,
            sortBy: {
              id: 'vi_sessionModificationReqRcvd',
            },
            sortOrder: 'asc',
          },
        };

        expect(
          createSearchParams({
            ...metricBrowser,
            payload: {
              currentPage: 2,
              hasNextPage: true,
              hasPreviousPage: true,
              numEntries: 20,
              numPages: 3,
              pageClicked: 'right',
            },
          }),
        ).to.deep.equal(output);
      });
    });

    const baseSearchParams = {
      id: 123,
      contextTypeId: 'SNSSAI',
      index: 'soa',
      metricTypes: [
        {
          id: 'vi_sessionModificationReqRcvd',
        },
        {
          id: 'vi_dlUnstrDropPackets',
        },
      ],
      opts: {
        filters: [
          {
            entityType: {
              id: 'c_SNSSAI',
            },
            name: 'c_SNSSAI',
            searchPattern: '1:1',
            type: 'entity',
          },
        ],
        includeRelations: false,
        length: 20,
        offset: 0,
        sortBy: { id: 'c_SNSSAI' },
        sortOrder: 'desc',
      },
    };
    const serializedParams = {
      id: 123,
      contextTypeId: 'SNSSAI',
      index: 'soa',
      sortBy: 'c_SNSSAI',
      sortOrder: 'desc',
    };

    const serializedParamsWithFilters = {
      id: 123,
      contextTypeId: 'SNSSAI',
      filters: [
        {
          entityType: {
            id: 'c_SNSSAI',
          },
          name: 'c_SNSSAI',
          searchPattern: '1:1',
          type: 'entity',
        },
      ],
      index: 'soa',
      sortBy: 'c_SNSSAI',
      sortOrder: 'desc',
    };

    const serializedParamsWithCharts = {
      ...serializedParams,
      contextTypeId: 'NF_Site',
      chartsIds: { c_NF: 'Nf1', c_Site: 'Site A' },
    };

    describe('serializeParams', () => {
      const searchParams = { ...baseSearchParams };
      it('should serialize params with filters', () => {
        expect(serializeParams(searchParams)).to.deep.equal(serializedParamsWithFilters);
      });
      it('should serialize params without filters', () => {
        searchParams.opts.filters = [];
        const output = { ...serializedParams };
        expect(serializeParams(searchParams)).to.deep.equal(output);
      });
      it('should serialize params with chart ids', () => {
        const searchParamsWithCharts = {
          ...baseSearchParams,
          contextTypeId: 'NF_Site',
          opts: {
            ...baseSearchParams.opts,
            chartsIds: { c_NF: 'Nf1', c_Site: 'Site A' },
          },
        };
        expect(serializeParams(searchParamsWithCharts)).to.deep.equal(serializedParamsWithCharts);
      });
    });

    describe('encoding and decoding parameter tests', () => {
      const encodedParams = {
        id: 123,
        contextTypeId: 'SNSSAI',
        index: 'soa',
        sortBy: 'c_SNSSAI',
        sortOrder: 'desc',
      };
      const encodedParamsWithFilters = {
        id: 123,
        contextTypeId: 'SNSSAI',
        filters:
          '%5B%7B%22entityType%22%3A%7B%22id%22%3A%22c_SNSSAI%22%7D%2C%22name%22%3A%22c_SNSSAI%22%2C%22searchPattern%22%3A%221%3A1%22%2C%22type%22%3A%22entity%22%7D%5D',
        index: 'soa',
        sortBy: 'c_SNSSAI',
        sortOrder: 'desc',
      };

      const encodedParamsWithCharts = {
        contextTypeId: 'NF_Site',
        id: 123,
        index: 'soa',
        chartsIds: '%7B%22c_NF%22%3A%22Nf1%22%2C%22c_Site%22%3A%22Site%20A%22%7D',
        sortBy: 'c_SNSSAI',
        sortOrder: 'desc',
      };

      describe('encodeSerializedParams', () => {
        it('should encode serialized params with filters', () => {
          const params = { ...serializedParamsWithFilters };
          expect(encodeSerializedParams(params)).to.deep.equal(encodedParamsWithFilters);
        });
        it('should encode serialized params without filters', () => {
          const params = { ...serializedParams };
          const output = { ...encodedParams };
          expect(encodeSerializedParams(params)).to.deep.equal(output);
        });
        it('should encode serialized params with charts', () => {
          const params = { ...serializedParamsWithCharts };
          const output = { ...encodedParamsWithCharts };
          expect(encodeSerializedParams(params)).to.deep.equal(output);
        });
      });

      describe('decodeSearchParams', () => {
        it('should decode params with filters', () => {
          const params = { ...encodedParamsWithFilters };
          expect(decodeSearchParams(params)).to.deep.equal(serializedParamsWithFilters);
        });
        it('should decode params with charts', () => {
          const params = { ...encodedParamsWithCharts };
          const expected = {
            chartsIds: {
              c_NF: 'Nf1',
              c_Site: 'Site A',
            },
            contextTypeId: 'NF_Site',
            id: 123,
            index: 'soa',
            sortBy: 'c_SNSSAI',
            sortOrder: 'desc',
          };
          expect(decodeSearchParams(params)).to.deep.equal(expected);
        });
        it('should decode params without filters', () => {
          const params = { ...encodedParams };
          expect(decodeSearchParams(params)).to.deep.equal(serializedParams);
        });
      });
    });

    describe('deserializeParams', () => {
      const { contexts } = discoveryMocks;
      const deleteUUID = (f) => delete f.id;
      const output = {
        data: {},
        payload: {
          sortBy: {
            id: 'c_SNSSAI',
          },
          sortOrder: 'desc',
        },
      };
      it('should deserialize params with filters', () => {
        const params = { ...serializedParamsWithFilters };
        const filters = createFiltersFromValues(contexts[1], [
          {
            entityType: {
              id: 'c_SNSSAI',
            },
            name: 'c_SNSSAI',
            searchPattern: '1:1',
            type: 'entity',
          },
        ]).map(deleteUUID);
        const deserialized = deserializeParams(params, contexts);
        deserialized.filters = deserialized.filters.map(deleteUUID);
        expect(deserialized).to.deep.equal({ ...output, context: contexts[1], filters });
      });

      it('should deserialize params with proper charts ids', () => {
        const params = { ...serializedParamsWithCharts };
        const deserialized = deserializeParams(params, contexts);
        const expected = {
          c_NF: 'Nf1',
          c_Site: 'Site A',
        };
        expect(deserialized.chartsIds).to.deep.equal(expected);
      });

      it('should deserialize params and create a context error when charts id types dont match context', () => {
        const params = {
          ...serializedParamsWithCharts,
          chartsIds: { ...serializedParamsWithCharts.chartsIds, c_SNSSAI: '1-0004' },
        };
        const deserialized = deserializeParams(params, contexts);
        const expected = {
          data: 'The context fields IDs given for the charts IDs for the historical dashboard do not match the context fields for the selected context',
          type: 'DASHBOARD_VALIDATION_ERROR',
        };
        expect(deserialized.browserError).to.deep.equal(expected);
      });

      const serializedParamsWithoutFilters = { ...serializedParams };
      it('should deserialize params without filters', () => {
        const deserialized = deserializeParams(serializedParamsWithoutFilters, contexts);
        expect(deserialized).to.deep.equal({ ...output, context: contexts[1] });
      });
      it('should deserialize params but without and index, add an expected browserError', () => {
        const serializedParamsWithoutIndex = { ...serializedParams };
        delete serializedParamsWithoutIndex.index;
        const deserialized = deserializeParams(serializedParamsWithoutIndex, contexts);
        expect(deserialized).to.deep.equal({
          ...output,
          browserError: { data: { index: undefined, name: 'SNSSAI' }, type: 'CONTEXT_ERROR' },
          loading: false,
        });
      });
      it('should deserialize params but without a contextTypeId, add an expected browserError', () => {
        const serializedParamsWithoutContextTypeId = { ...serializedParams };
        delete serializedParamsWithoutContextTypeId.contextTypeId;
        const deserialized = deserializeParams(serializedParamsWithoutContextTypeId, contexts);
        expect(deserialized).to.deep.equal({
          ...output,
          browserError: { data: { index: 'soa', name: undefined }, type: 'CONTEXT_ERROR' },
          loading: false,
        });
      });
      it('should deserialize params but without any contexts to compare to, add an expected browserError', () => {
        const deserialized = deserializeParams(serializedParams, []);
        expect(deserialized).to.deep.equal({
          ...output,
          browserError: { data: { index: 'soa', name: 'SNSSAI' }, type: 'CONTEXT_ERROR' },
          loading: false,
        });
      });
    });
  });

  describe('transformSearchResponseTableData', () => {
    const inputResponse = createResponseData(
      ['SNSSAI', 'NF'],
      [
        'vi_AMFMeanRegNbr',
        'vi_PDUSessionEstSR',
        'vi_smfModificationCmdRcvd',
        'vi_sessionModificationReqRcvd',
        'vi_ulIpv6DropPackets',
        'vi_dlUnstrDropPackets',
      ],
    );

    it('should return transformed data on valid search response', () => {
      const res = {
        results: searchMetricsResponse1.results,
        tableData: [
          {
            SNSSAI: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            NF: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_AMFMeanRegNbr: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            vi_PDUSessionEstSR: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_smfModificationCmdRcvd: {
              value: 2,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_sessionModificationReqRcvd: {
              value: 3,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_ulIpv6DropPackets: { value: 4, beginTimestamp: undefined, endTimestamp: undefined },
            vi_dlUnstrDropPackets: { value: 5, beginTimestamp: undefined, endTimestamp: undefined },
          },
          {
            SNSSAI: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            NF: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_AMFMeanRegNbr: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            vi_PDUSessionEstSR: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_smfModificationCmdRcvd: {
              value: 2,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_sessionModificationReqRcvd: {
              value: 3,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_ulIpv6DropPackets: { value: 4, beginTimestamp: undefined, endTimestamp: undefined },
            vi_dlUnstrDropPackets: { value: 5, beginTimestamp: undefined, endTimestamp: undefined },
          },
          {
            SNSSAI: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            NF: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_AMFMeanRegNbr: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            vi_PDUSessionEstSR: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_smfModificationCmdRcvd: {
              value: 2,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_sessionModificationReqRcvd: {
              value: 3,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_ulIpv6DropPackets: { value: 4, beginTimestamp: undefined, endTimestamp: undefined },
            vi_dlUnstrDropPackets: { value: 5, beginTimestamp: undefined, endTimestamp: undefined },
          },
          {
            SNSSAI: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            NF: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_AMFMeanRegNbr: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            vi_PDUSessionEstSR: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_smfModificationCmdRcvd: {
              value: 2,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_sessionModificationReqRcvd: {
              value: 3,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_ulIpv6DropPackets: { value: 4, beginTimestamp: undefined, endTimestamp: undefined },
            vi_dlUnstrDropPackets: { value: 5, beginTimestamp: undefined, endTimestamp: undefined },
          },
          {
            SNSSAI: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            NF: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_AMFMeanRegNbr: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            vi_PDUSessionEstSR: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_smfModificationCmdRcvd: {
              value: 2,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_sessionModificationReqRcvd: {
              value: 3,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_ulIpv6DropPackets: { value: 4, beginTimestamp: undefined, endTimestamp: undefined },
            vi_dlUnstrDropPackets: { value: 5, beginTimestamp: undefined, endTimestamp: undefined },
          },
          {
            SNSSAI: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            NF: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_AMFMeanRegNbr: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            vi_PDUSessionEstSR: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_smfModificationCmdRcvd: {
              value: 2,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_sessionModificationReqRcvd: {
              value: 3,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_ulIpv6DropPackets: { value: 4, beginTimestamp: undefined, endTimestamp: undefined },
            vi_dlUnstrDropPackets: { value: 5, beginTimestamp: undefined, endTimestamp: undefined },
          },
          {
            SNSSAI: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            NF: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_AMFMeanRegNbr: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            vi_PDUSessionEstSR: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_smfModificationCmdRcvd: {
              value: 2,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_sessionModificationReqRcvd: {
              value: 3,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_ulIpv6DropPackets: { value: 4, beginTimestamp: undefined, endTimestamp: undefined },
            vi_dlUnstrDropPackets: { value: 5, beginTimestamp: undefined, endTimestamp: undefined },
          },
          {
            SNSSAI: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            NF: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_AMFMeanRegNbr: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            vi_PDUSessionEstSR: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_smfModificationCmdRcvd: {
              value: 2,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_sessionModificationReqRcvd: {
              value: 3,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_ulIpv6DropPackets: { value: 4, beginTimestamp: undefined, endTimestamp: undefined },
            vi_dlUnstrDropPackets: { value: 5, beginTimestamp: undefined, endTimestamp: undefined },
          },
          {
            SNSSAI: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            NF: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_AMFMeanRegNbr: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            vi_PDUSessionEstSR: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_smfModificationCmdRcvd: {
              value: 2,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_sessionModificationReqRcvd: {
              value: 3,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_ulIpv6DropPackets: { value: 4, beginTimestamp: undefined, endTimestamp: undefined },
            vi_dlUnstrDropPackets: { value: 5, beginTimestamp: undefined, endTimestamp: undefined },
          },
          {
            SNSSAI: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            NF: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_AMFMeanRegNbr: { value: 0, beginTimestamp: undefined, endTimestamp: undefined },
            vi_PDUSessionEstSR: { value: 1, beginTimestamp: undefined, endTimestamp: undefined },
            vi_smfModificationCmdRcvd: {
              value: 2,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_sessionModificationReqRcvd: {
              value: 3,
              beginTimestamp: undefined,
              endTimestamp: undefined,
            },
            vi_ulIpv6DropPackets: { value: 4, beginTimestamp: undefined, endTimestamp: undefined },
            vi_dlUnstrDropPackets: { value: 5, beginTimestamp: undefined, endTimestamp: undefined },
          },
        ],
      };

      const tableData = transformSearchResponseTableData(inputResponse);
      expect(tableData).to.be.an('Array');
      expect(tableData).to.deep.equals(res.tableData);
    });
  });
});
