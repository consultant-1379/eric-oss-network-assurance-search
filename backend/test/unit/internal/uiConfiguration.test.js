import { expect } from 'chai';
import { createRequire } from 'module';
import { getDashboardMetadata } from '../../../services/internal/uiConfiguration.js';

const require = createRequire(import.meta.url);
const customizationFile1 = require('../../mocks/services/internal/uiConfiguration/customizationFile1.json');
const dashboardMetadata1 = require('../../mocks/services/internal/uiConfiguration/dashboardMetadata1.json');
const customizationFile2 = require('../../mocks/services/internal/uiConfiguration/customizationFile2.json');

describe('Unit tests for the transformation functions used by the internal uiConfig endpoint', () => {
  describe('tests for getDashboardMetadata', () => {
    it('it should return an object that only contains the properties that are provided', () => {
      expect(getDashboardMetadata(customizationFile1)).to.deep.equal(dashboardMetadata1);
    });

    it('it should return an empty object when a customization file without customization properties is provided', () => {
      expect(getDashboardMetadata(customizationFile2)).to.deep.equal({});
    });

    it('it should return an empty object when an empty custimzation file is provided with a list of dashboard metadata properties', () => {
      expect(getDashboardMetadata({})).to.deep.equal({});
    });
  });
});
