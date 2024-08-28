import { expect } from 'chai';
import { createRequire } from 'module';
import {
  getSearchDoc,
  renameCsacColumnKey,
  cleanDoc,
  makeContextKey,
  createContextKeys,
  valuesMatchForKeys,
  extractContext,
  convertToContextMap,
  getContextObject,
  getEntityFilterObject,
  getKpiExact,
  getKpiRange,
  getContextFacetMustQueryObjects,
} from '../../../../../services/assurance/search/opensearch/utils.js';

const require = createRequire(import.meta.url);
const data1Q1 = require('../../../../mocks/services/assurance/search/opensearch/metrics/stitchSearchMetricsTestQuery1.json');
const data1Q2 = require('../../../../mocks/services/assurance/search/opensearch/metrics/stitchSearchMetricsTestQuery2.json');

describe('Unit test for kpi stitching utils', () => {
  const metricTypes1 = [
    { id: 'vi_NF_SNSSAI_AMFMeanRegNbr' },
    { id: 'vi_NF_SNSSAI_PDUSessionEstSR' },
  ];
  const metricTypes2 = [
    { id: 'vi_NF_SNSSAI_ulIpv6DropPackets' },
    { id: 'vi_NF_SNSSAI_dlUnstrDropPackets' },
  ];
  const cleanedDoc1 = {
    full_context: 'NF_SNSSAI',
    context: ['SNSSAI', 'NF'],
    c_SNSSAI: '1A1',
    c_NF: 'AMF_BC',
    vi_NF_SNSSAI_AMFMeanRegNbr: 10,
    csac_table: 'kpi_csac_simple_snssai_mofdn_15',
    csac_column_vi_NF_SNSSAI_AMFMeanRegNbr: 'csac_0fcf6508_67cc_4969_a1f2_566c106e38b0',
    ft_begin_timestamp: 1676241825,
    ft_end_timestamp: 1676242825,
  };
  const cleanedDoc2 = {
    full_context: 'NF_SNSSAI',
    context: ['SNSSAI', 'NF'],
    c_SNSSAI: '1A1',
    c_NF: 'AMF_BC',
    vi_NF_SNSSAI_PDUSessionEstSR: 30,
    csac_table: 'kpi_csac_simple_snssai_mofdn_15',
    csac_column_vi_NF_SNSSAI_PDUSessionEstSR: 'csac_9a6ec349_5637_4c92_8bfd_eeeeeeeeeeee',
    ft_begin_timestamp: 1676241825,
    ft_end_timestamp: 1676242825,
  };
  const semiCleanDoc1 = {
    full_context: 'NF_SNSSAI',
    context: ['SNSSAI', 'NF'],
    c_SNSSAI: '1A1',
    c_NF: 'AMF_BC',
    vi_NF_SNSSAI_AMFMeanRegNbr: 10,
    csac_table: 'kpi_csac_simple_snssai_mofdn_15',
    csac_column: 'csac_0fcf6508_67cc_4969_a1f2_566c106e38b0',
    ft_begin_timestamp: 1676241825,
    ft_end_timestamp: 1676242825,
  };
  const semiCleanDoc2 = {
    full_context: 'NF_SNSSAI',
    context: ['SNSSAI', 'NF'],
    c_SNSSAI: '1A1',
    c_NF: 'AMF_BC',
    vi_NF_SNSSAI_PDUSessionEstSR: 30,
    csac_table: 'kpi_csac_simple_snssai_mofdn_15',
    csac_column: 'csac_9a6ec349_5637_4c92_8bfd_eeeeeeeeeeee',
    ft_begin_timestamp: 1676241825,
    ft_end_timestamp: 1676242825,
  };

  describe('tests for getSearchDoc', () => {
    it('should remove other properties, but leave a document with keys "hits" for Q1', () => {
      expect(getSearchDoc(data1Q1)).to.deep.equal(data1Q1.hits.hits);
    });

    it('should remove other properties, but leave a document with keys "hits" for Q2', () => {
      expect(getSearchDoc(data1Q2)).to.deep.equal(data1Q2.hits.hits);
    });
  });

  describe('tests for renameCsacColumnKey', () => {
    it('should append the matching MetricTypeId to the `csac_column` key', () => {
      expect(renameCsacColumnKey(semiCleanDoc1, metricTypes1)).to.deep.equal(cleanedDoc1);
    });

    it('should append the matching MetricTypeId to the `csac_column` key', () => {
      expect(renameCsacColumnKey(semiCleanDoc2, metricTypes1)).to.deep.equal(cleanedDoc2);
    });

    it('should not append the MetricTypeId to the `csac_column` key because of no matching MetricTypeId in query', () => {
      expect(renameCsacColumnKey(semiCleanDoc1, metricTypes2)).to.deep.equal(semiCleanDoc1);
    });

    it('should not append the MetricTypeId to the `csac_column` key because of no matching MetricTypeId in query', () => {
      expect(renameCsacColumnKey(semiCleanDoc2, metricTypes2)).to.deep.equal(semiCleanDoc2);
    });
  });

  describe('tests for cleanDoc', () => {
    it('should remove unnecessary key and value such as "startTime"', () => {
      expect(cleanDoc(data1Q1.hits.hits[0], metricTypes1)).to.deep.equal(cleanedDoc1);
    });

    it('should remove unnecessary key and value such as "startTime"', () => {
      expect(cleanDoc(data1Q2.hits.hits[0], metricTypes1)).to.deep.equal(cleanedDoc2);
    });
  });

  describe('tests for makeContextKey', () => {
    it('should make a context keys', () => {
      expect(makeContextKey('SNSSAI')).to.equal('c_SNSSAI');
      expect(makeContextKey('NF')).to.equal('c_NF');
    });
  });
  describe('tests for createContextKeys', () => {
    it('should return documents with context keys for Q1', () => {
      expect(createContextKeys(cleanedDoc1.context)).to.deep.equal(['c_SNSSAI', 'c_NF']);
    });

    it('should return documents with context keys for Q2', () => {
      expect(createContextKeys(cleanedDoc2.context)).to.deep.equal(['c_SNSSAI', 'c_NF']);
    });
  });

  describe('tests for valuesMatchForKeys', () => {
    it('should return true if every value is matched for all given keys', () => {
      expect(valuesMatchForKeys(cleanedDoc1, cleanedDoc2, ['c_SNSSAI', 'c_NF'])).to.be.equal(true);
    });

    it('should return false if every value is NOT matched for all given keys', () => {
      const docWithDiffVal = {
        full_context: 'NF_SNSSAI',
        context: ['SNSSAI', 'NF'],
        c_SNSSAI: '2A1',
        c_NF: 'AMF_BC',
        vi_NF_SNSSAI_PDUSessionEstSR: 77,
        csac_table: 'kpi_csac_simple_snssai_mofdn_15',
        csac_column_vi_NF_SNSSAI_PDUSessionEstSR: 'csac_9a6ec349_5637_4c92_8bfd_eeeeeeeeeeee',
        ft_begin_timestamp: 1676241825,
        ft_end_timestamp: 1676242825,
      };
      expect(valuesMatchForKeys(cleanedDoc1, docWithDiffVal, ['c_SNSSAI', 'c_NF'])).to.deep.equal(
        false,
      );
    });
  });

  describe('tests for extractContext', () => {
    it('returns empty Map for empty list', () => {
      const result = extractContext({});
      expect(result).to.deep.equals({});
    });
    it('should return proper formatted list for a valid context list', () => {
      const doc = {
        context: ['SNSSAI', 'NF'],
        c_SNSSAI: '3a',
        c_NF: 'AMC',
      };
      const result = extractContext(doc);
      expect(result).to.deep.equals({
        c_SNSSAI: '3a',
        c_NF: 'AMC',
      });
    });
  });

  describe('tests for convertToContextMap', () => {
    it('returns empty Map for empty list', () => {
      const result = convertToContextMap([]);
      expect(result).to.deep.equals({});
    });
    it('should return proper formatted map for a valid context list', () => {
      const contextList = [
        {
          c_SNSSAI: '1a',
          c_NF: 'AMF',
        },
        {
          c_SNSSAI: '2a',
          c_NF: 'AMC',
        },
        {
          c_SNSSAI: '3a',
          c_NF: 'AMC',
        },
      ];
      const snssaiSet = new Set(['1a', '2a', '3a']);
      const nfSet = new Set(['AMC', 'AMF']);
      const result = convertToContextMap(contextList);
      expect(result).to.deep.equals({
        c_SNSSAI: snssaiSet,
        c_NF: nfSet,
      });
    });
  });

  const emptyArrayTest = 'returns empty Array for empty list';
  describe('tests for getContextObject', () => {
    it(emptyArrayTest, () => {
      const result = getContextObject([]);
      expect(result).to.deep.equals([]);
    });
    it('should return proper formatted list for a valid context map', () => {
      const snssaiSet = new Set(['1a', '2a', '3a']);
      const contextMap = {
        c_SNSSAI: snssaiSet,
        c_NF: ['AMC', 'AMF'],
      };
      const result = getContextObject(contextMap);
      expect(result).to.deep.equals([
        { match: { c_SNSSAI: '1a' } },
        { match: { c_SNSSAI: '2a' } },
        { match: { c_SNSSAI: '3a' } },
        { match: { c_NF: 'AMC' } },
        { match: { c_NF: 'AMF' } },
      ]);
    });
  });

  describe('tests for getEntityFilterObject', () => {
    it(emptyArrayTest, () => {
      const result = getEntityFilterObject([]);
      expect(result).to.deep.equals([]);
    });
    it('should return proper formatted list for a valid entity filter list', () => {
      const entityFilters = [
        { name: 'SNSSAI', type: 'entity', entityType: { id: 'c_SNSSAI' }, searchPattern: '3a' },
        { name: 'SNSSAI', type: 'entity', entityType: { id: 'c_SNSSAI' }, searchPattern: '3*' },
      ];
      const result = getEntityFilterObject(entityFilters);
      expect(result).to.deep.equals([
        { wildcard: { c_SNSSAI: { case_insensitive: true, value: '3a' } } },
        { wildcard: { c_SNSSAI: { case_insensitive: true, value: '3*' } } },
      ]);
    });
  });

  const kpiList = [
    'value_NF_SNSSAI_AMFMeanRegNbr',
    'value_SNSSAI_AMFMeanRegNbr',
    'value_City_AMFMeanRegNbr',
  ];
  describe('tests for getKpiRange', () => {
    it(emptyArrayTest, () => {
      const result = getKpiRange([], []);
      expect(result).to.deep.equals([]);
    });
    it('returns proper list for valid inputs', () => {
      const metricFilters = [
        {
          type: 'metric',
          metricType: { id: 'value_NF_SNSSAI_AMFMeanRegNbr' },
          from: 50,
          to: 200,
        },
      ];
      const expectedOutput = [
        {
          range: {
            value_NF_SNSSAI_AMFMeanRegNbr: {
              gte: 50,
              lte: 200,
            },
          },
        },
        {
          range: {
            value_SNSSAI_AMFMeanRegNbr: {
              gte: 0,
            },
          },
        },
        {
          range: {
            value_City_AMFMeanRegNbr: {
              gte: 0,
            },
          },
        },
      ];
      const result = getKpiRange(kpiList, metricFilters);
      expect(result).to.deep.equals(expectedOutput);
    });
  });

  describe('tests for getKpiExact', () => {
    it(emptyArrayTest, () => {
      const result = getKpiExact([], []);
      expect(result).to.deep.equals([]);
    });
    it('returns proper list for valid inputs', () => {
      const metricFilters = [
        {
          type: 'metric',
          metricType: { id: 'value_NF_SNSSAI_AMFMeanRegNbr' },
          from: 50,
          to: 50,
        },
      ];
      const expectedOutput = [
        {
          match: {
            value_NF_SNSSAI_AMFMeanRegNbr: 50,
          },
        },
      ];
      const result = getKpiExact(kpiList, metricFilters);
      expect(result).to.deep.equals(expectedOutput);
    });
  });

  describe('tests for getContextFacetMustQueryObjects', () => {
    it(emptyArrayTest, () => {
      const result = getContextFacetMustQueryObjects([]);
      expect(result).to.deep.equals([]);
    });

    it('should return a valid Array of OpenSearch query must objects', () => {
      const contextFields = [
        {
          id: 'AMF_BC',
          type: {
            id: 'c_NF',
          },
        },
      ];
      const expectedOutput = [
        {
          match: {
            c_NF: 'AMF_BC',
          },
        },
      ];
      const actualOutput = getContextFacetMustQueryObjects(contextFields);
      expect(actualOutput).to.deep.equals(expectedOutput);
    });
  });
});
