import { expect } from 'chai';
import { createRequire } from 'module';
import {
  createContext,
  extractTimestampProperties,
  createMetrics,
  transformStitchedSearchMetricsData,
  stitchSearchMetrics,
} from '../../../../../services/assurance/search/opensearch/metrics.js';

const require = createRequire(import.meta.url);
const data1Q1 = require('../../../../mocks/services/assurance/search/opensearch/metrics/stitchSearchMetricsTestQuery1.json');
const data1Q2 = require('../../../../mocks/services/assurance/search/opensearch/metrics/stitchSearchMetricsTestQuery2.json');
const stitchedData1 = require('../../../../mocks/services/assurance/search/opensearch/metrics/stitchedSearchMetrics1.json');
const data1Q3 = require('../../../../mocks/services/assurance/search/opensearch/metrics/stitchSearchMetricsTestQuery3.json');
const stitchedData2 = require('../../../../mocks/services/assurance/search/opensearch/metrics/stitchedSearchMetrics2.json');

describe('Unit test for transforming search metrics stitched data to match API spec response', () => {
  const query = {
    contextTypeId: 'Dummy ID',
    metricTypes: [
      { id: 'vi_NF_SNSSAI_AMFMeanRegNbr' },
      { id: 'vi_NF_SNSSAI_PDUSessionEstSR' },
      { id: 'vi_NF_SNSSAI_smfModificationCmdRcvd' },
      { id: 'vi_NF_SNSSAI_sessionModificationReqRcvd' },
      { id: 'vi_NF_SNSSAI_ulIpv6DropPackets' },
      { id: 'vi_NF_SNSSAI_dlUnstrDropPackets' },
    ],
    offset: 0,
    length: 30,
  };
  const res = {
    offset: 0,
    length: 3,
    total: 3,
    results: require('../../../../mocks/services/assurance/search/opensearch/metrics/transformStitchedSearchMetricsDataTestCase1.json'),
  };

  const resWithEmptyResults = {
    offset: 0,
    length: 0,
    total: 0,
    results: [],
  };

  describe('tests for createContext', () => {
    it('it should return context value', () => {
      const context = {
        type: {
          id: 'NF_SNSSAI',
          contextFields: [{ id: 'SNSSAI' }, { id: 'NF' }],
        },
        contextFields: [
          {
            id: 'SNSSAI_1A1',
            name: '1A1',
            type: {
              id: 'c_SNSSAI',
            },
          },
          {
            id: 'NF_AMF_BC',
            name: 'AMF_BC',
            type: {
              id: 'c_NF',
            },
          },
        ],
      };
      expect(createContext(stitchedData1[0], query.metrics)).to.deep.equal(context);
    });

    it('it should return an empty string for the `id` key within the ContextType object when full_context is not found from row', () => {
      const noFullContext = {
        context: ['SNSSAI', 'NF'],
        c_SNSSAI: '1A1',
        c_NF: 'AMF_BC',
        vi_NF_SNSSAI_AMFMeanRegNbr: 10,
        csac_table: 'kpi_csac_simple_snssai_mofdn_15',
        csac_column: 'csac_0fcf6508_67cc_4969_a1f2_566c106e38b0',
        ft_begin_timestamp: 1676241825,
        ft_end_timestamp: 1676242825,
      };
      const contextWithoutName = {
        type: {
          id: 'Unknown',
          contextFields: [{ id: 'SNSSAI' }, { id: 'NF' }],
        },
        contextFields: [
          {
            id: 'SNSSAI_1A1',
            name: '1A1',
            type: {
              id: 'c_SNSSAI',
            },
          },
          {
            id: 'NF_AMF_BC',
            name: 'AMF_BC',
            type: {
              id: 'c_NF',
            },
          },
        ],
      };
      expect(createContext(noFullContext)).to.deep.equal(contextWithoutName);
    });

    it('it should return an empty array for the `contextFields` key and the `type.contextFields` key when the context is not found from row', () => {
      const noContext = {
        full_context: 'NF_SNSSAI',
        vi_NF_SNSSAI_AMFMeanRegNbr: 10,
        csac_table: 'kpi_csac_simple_snssai_mofdn_15',
        csac_column: 'csac_0fcf6508_67cc_4969_a1f2_566c106e38b0',
        ft_begin_timestamp: 1676241825,
        ft_end_timestamp: 1676242825,
      };
      const contextWithoutAggregation = {
        type: {
          id: 'NF_SNSSAI',
          contextFields: [],
        },
        contextFields: [],
      };
      expect(createContext(noContext)).to.deep.equal(contextWithoutAggregation);
    });

    it('it should return the "Unknown" string for the `name` key and `type.id` key, as well as an empty array for the `contextFields` key and the `type.contextFields` key when no data is passed', () => {
      const contextWithoutAggregation = {
        type: {
          id: 'Unknown',
          contextFields: [],
        },
        contextFields: [],
      };
      expect(createContext({})).to.deep.equal(contextWithoutAggregation);
    });
  });

  describe('tests for extractTimestampProperties', () => {
    it('it should extract the `ft_` prefixed timestamp values from a document', () => {
      const document = {
        ft_begin_timestamp: 1676241825,
        ft_end_timestamp: 1676242825,
      };
      expect(extractTimestampProperties(document)).to.deep.equal({
        beginTimestamp: 1676241825,
        endTimestamp: 1676242825,
      });
    });

    it('it should extract the `fk_` prefixed timestamp values from a document', () => {
      const document = {
        fk_begin_timestamp: '1676241825',
        fk_end_timestamp: '1676242825',
      };
      expect(extractTimestampProperties(document)).to.deep.equal({
        beginTimestamp: 1676241825,
        endTimestamp: 1676242825,
      });
    });

    it('it should extract the `ft_` prefixed begin timestamp and apply it to both begin and end values', () => {
      const document = {
        ft_begin_timestamp: 1676241825,
      };
      expect(extractTimestampProperties(document)).to.deep.equal({
        beginTimestamp: 1676241825,
        endTimestamp: 1676241825,
      });
    });

    it('it should extract the `ft_` prefixed end timestamp and apply it to both begin and end values', () => {
      const document = {
        fk_end_timestamp: '1676242825',
      };
      expect(extractTimestampProperties(document)).to.deep.equal({
        beginTimestamp: 1676242825,
        endTimestamp: 1676242825,
      });
    });

    it('it should extract the `ft_` prefixed timestamp values from a document when all prefixes are present', () => {
      const document = {
        ft_begin_timestamp: 1676241825,
        ft_end_timestamp: 1676242825,
        fk_begin_timestamp: '1676240000',
        fk_end_timestamp: '1676250000',
      };
      expect(extractTimestampProperties(document)).to.deep.equal({
        beginTimestamp: 1676241825,
        endTimestamp: 1676242825,
      });
    });

    it('it should extract the `ft_` and `fk_` prefixed timestamp values from a document', () => {
      const document = {
        ft_begin_timestamp: 1676241825,
        fk_end_timestamp: '1676250000',
      };
      expect(extractTimestampProperties(document)).to.deep.equal({
        beginTimestamp: 1676241825,
        endTimestamp: 1676250000,
      });
    });

    it('it should handle undefined input arguments', () => {
      expect(extractTimestampProperties({})).to.deep.equal({
        beginTimestamp: null,
        endTimestamp: null,
      });
    });

    it('it should handle empty string input arguments', () => {
      const document = {
        fk_begin_timestamp: '',
        fk_end_timestamp: '',
      };
      expect(extractTimestampProperties(document)).to.deep.equal({
        beginTimestamp: null,
        endTimestamp: null,
      });
    });
  });

  describe('tests for createMetrics', () => {
    it('it should return metrics value', () => {
      const metrics = [
        {
          type: {
            id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
          },
          value: 10,
          beginTimestamp: 1676241825,
          endTimestamp: 1676242825,
          metadata: [
            {
              key: 'csac_table',
              value: 'kpi_csac_simple_snssai_mofdn_15',
            },
            {
              key: 'csac_column',
              value: 'csac_0fcf6508_67cc_4969_a1f2_566c106e38b0',
            },
          ],
        },
        {
          type: {
            id: 'vi_NF_SNSSAI_PDUSessionEstSR',
          },
          value: 30,
          beginTimestamp: 1676241825,
          endTimestamp: 1676242825,
          metadata: [
            {
              key: 'csac_table',
              value: 'kpi_csac_simple_snssai_mofdn_15',
            },
            {
              key: 'csac_column',
              value: 'csac_9a6ec349_5637_4c92_8bfd_eeeeeeeeeeee',
            },
          ],
        },
        {
          type: {
            id: 'vi_NF_SNSSAI_smfModificationCmdRcvd',
          },
          value: 20,
          beginTimestamp: 1676241825,
          endTimestamp: 1676242825,
          metadata: [
            {
              key: 'csac_table',
              value: 'kpi_csac_simple_snssai_mofdn_15',
            },
            {
              key: 'csac_column',
              value: 'csac_9a6ec349_5637_4c92_8bfd_ffffffffffff',
            },
          ],
        },
        {
          type: {
            id: 'vi_NF_SNSSAI_sessionModificationReqRcvd',
          },
          value: 10,
          beginTimestamp: 1676241825,
          endTimestamp: 1676242825,
          metadata: [
            {
              key: 'csac_table',
              value: 'kpi_csac_simple_snssai_mofdn_15',
            },
            {
              key: 'csac_column',
              value: 'csac_9a6ec349_5637_4c92_8bfd_gggggggggggg',
            },
          ],
        },
        {
          type: {
            id: 'vi_NF_SNSSAI_ulIpv6DropPackets',
          },
          value: 56,
          beginTimestamp: 1676241825,
          endTimestamp: 1676242825,
          metadata: [
            {
              key: 'csac_table',
              value: 'kpi_csac_simple_snssai_mofdn_15',
            },
            {
              key: 'csac_column',
              value: 'csac_9a6ec349_5637_4c92_8bfd_hhhhhhhhhhhh',
            },
          ],
        },
        {
          type: {
            id: 'vi_NF_SNSSAI_dlUnstrDropPackets',
          },
          value: 88,
          beginTimestamp: 1676241825,
          endTimestamp: 1676242825,
          metadata: [
            {
              key: 'csac_table',
              value: 'kpi_csac_simple_snssai_mofdn_15',
            },
            {
              key: 'csac_column',
              value: 'csac_9a6ec349_5637_4c92_8bfd_iiiiiiiiiiii',
            },
          ],
        },
      ];
      expect(createMetrics(stitchedData1[0], query.metricTypes)).to.deep.equal(metrics);
    });

    it('it should return an empty array when KPI (v*) is not found', () => {
      const noKpi = {
        full_context: 'NF_SNSSAI',
        context: ['SNSSAI', 'NF'],
      };
      expect(createMetrics(noKpi)).to.deep.equal([]);
    });

    it('it should return an empty array when no data is passed', () => {
      expect(createMetrics({})).to.deep.equal([]);
    });
  });

  describe('tests for transformStitchedSearchMetricsData', () => {
    it('it should return data, matching API spec response', () => {
      expect(transformStitchedSearchMetricsData(stitchedData1, query, 3)).to.deep.equal(res);
    });

    it('it should return empty results when an empty array is passed as a stitchedData', () => {
      expect(transformStitchedSearchMetricsData([], query, 0)).to.deep.equal(resWithEmptyResults);
    });

    it('it should return undefined behavior when given an undefined query', () => {
      const noQueryRes = {
        offset: undefined,
        length: undefined,
        total: 0,
        results: require('../../../../mocks/services/assurance/search/opensearch/metrics/transformStitchedSearchMetricsDataTestCase2.json'),
      };
      expect(transformStitchedSearchMetricsData(stitchedData1, {}, 0)).to.deep.equal(noQueryRes);
    });
  });
});

describe('Unit test for a kpi stitching', () => {
  const metricTypes1 = [
    {
      id: 'vi_NF_SNSSAI_PDUSessionEstSR',
    },
    {
      id: 'vi_NF_SNSSAI_smfModificationCmdRcvd',
    },
    {
      id: 'vi_NF_SNSSAI_sessionModificationReqRcvd',
    },
    {
      id: 'vi_NF_SNSSAI_ulIpv6DropPackets',
    },
    {
      id: 'vi_NF_SNSSAI_dlUnstrDropPackets',
    },
  ];
  const metricTypes2 = [
    {
      id: 'vi_NF_SNSSAI_AMFMeanRegNbr',
    },
  ];

  it('it should return an empty array when docs1 is empty', () => {
    expect(stitchSearchMetrics({}, data1Q2, metricTypes1)).to.deep.equal([]);
  });

  it('it should return data1 to kpis when docs2 is empty', () => {
    expect(stitchSearchMetrics(data1Q1, {}, metricTypes2)).to.deep.equal(data1Q3);
  });

  // When all search documents are found for every kpi list, it should return all returned search docs stitched together accordingly
  it('should return all returned search documents stitched together accordingly', () => {
    expect(stitchSearchMetrics(data1Q1, data1Q2, metricTypes1.concat(metricTypes2))).to.deep.equal(
      stitchedData2,
    );
  });
});
