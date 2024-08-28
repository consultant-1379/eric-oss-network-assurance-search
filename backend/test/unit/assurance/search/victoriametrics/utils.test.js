import { expect } from 'chai';
import { createRequire } from 'module';
import {
  extractTimestampProperties,
  cleanSearchPattern,
} from '../../../../../services/assurance/search/victoriametrics/utils.js';

const require = createRequire(import.meta.url);
const cleanSearchPatternTestData = require('../../../../mocks/services/assurance/search/victoriametrics/utils/cleanSearchPatternTestData.json');

describe('Unit tests for VictoriaMetrics util functions', () => {
  describe('tests for extractTimestampProperties', () => {
    it('it should extract the timestamp value from the metric data object and apply it to both the begin and end timestamp values', () => {
      const document = {
        value: [1676241825],
      };
      expect(extractTimestampProperties(document)).to.deep.equal({
        beginTimestamp: 1676241825,
        endTimestamp: 1676241825,
      });
    });

    it('it should handle a metric data object that does not have a timestamp value', () => {
      const document = {
        value: [],
      };
      expect(extractTimestampProperties(document)).to.deep.equal({
        beginTimestamp: null,
        endTimestamp: null,
      });
    });
  });

  describe('tests for cleanSearchPattern', () => {
    cleanSearchPatternTestData.forEach((testData) => {
      it(`should transform ${testData.input} into ${testData.output}`, () => {
        const actualOutput = cleanSearchPattern(testData.input);
        expect(actualOutput).to.equal(testData.output);
      });
    });
  });
});
