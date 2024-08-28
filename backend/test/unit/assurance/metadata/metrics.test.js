/* eslint-disable no-template-curly-in-string */
import { expect } from 'chai';
import { createRequire } from 'module';
import {
  transformMetadataMetrics,
  modifyCustomizationMetricsFileStructure,
} from '../../../../services/assurance/metadata/metrics.js';

const require = createRequire(import.meta.url);
const indexerDocs = require('../../../mocks/services/assurance/metadata/metrics/indexerDocs.json');
const metadataMetricsResponse = require('../../../mocks/services/assurance/metadata/metrics/responseTestCase1.json');
const customizationFile1 = require('../../../mocks/services/assurance/metadata/metrics/customizationFile1.json');
const customizationFile2 = require('../../../mocks/services/assurance/metadata/metrics/customizationFile2.json');

describe('Unit test for transforming metadata metrics stitched data to match API spec response', () => {
  describe('tests for transformMetadataMetrics', () => {
    it('it should return data, matching API spec response', () => {
      expect(JSON.stringify(transformMetadataMetrics(indexerDocs))).to.deep.equal(
        JSON.stringify(metadataMetricsResponse),
      );
    });
    it('it should return an empty array, if there is no value returning back from the assurance indexer endpoint', () => {
      const noVal = { fullContext: { name: 'SNSSAI_NSI', context: [] }, value: [] };
      expect(transformMetadataMetrics(noVal)).to.deep.equal([]);
    });
  });

  describe('tests for modifyCustomizationMetricsFileStructure', () => {
    it('should return metrics from the customization file with the modified structure for optimization ', () => {
      const modifiedContext = {
        metric1: {
          category: ['category1', 'category2'],
          groups: {
            group1: ['family1', 'family3'],
            group2: ['family2'],
          },
          query: '${metricName}{snssai=~"sn.*-4"}',
        },
        metric2: {
          category: ['category1'],
          groups: {
            group1: ['family2'],
            group2: ['family1'],
          },
          query: '${metricName}{snssai=~"sn.*-4"}',
        },
      };

      expect(modifyCustomizationMetricsFileStructure(customizationFile1)).to.deep.equal(
        modifiedContext,
      );
    });

    it('should return an empty object when there are no metrics within the customization file', () => {
      expect(modifyCustomizationMetricsFileStructure(customizationFile2)).to.deep.equal({});
    });
  });
});
/* eslint-enable no-template-curly-in-string */
