import { expect } from 'chai';
import { createRequire } from 'module';
import EntityType from '../../../../model/EntityType.js';
import {
  createContextFields,
  transformMetadataContexts,
  modifyCustomizationContextsFileStructure,
} from '../../../../services/assurance/metadata/contexts.js';

const require = createRequire(import.meta.url);
const indexerFullContextsDocs1 = require('../../../mocks/services/assurance/metadata/contexts/indexerFullContextsDocs1.json');
const metadataContextsResponse1 = require('../../../mocks/services/assurance/metadata/contexts/responseTestCase1.json');
const indexerFullContextsDocs2 = require('../../../mocks/services/assurance/metadata/contexts/indexerFullContextsDocs2.json');
const metadataContextsResponse2 = require('../../../mocks/services/assurance/metadata/contexts/responseTestCase2.json');
const customizationFile1 = require('../../../mocks/services/assurance/metadata/contexts/customizationFile1.json');
const customizationFile2 = require('../../../mocks/services/assurance/metadata/contexts/customizationFile2.json');

const testingStrings = {
  snssaiDescription: 'Soup Network Slice Selection Assistance Information',
  nfDescription: 'New Finger',
};

const templateIndexerContexts = [
  {
    name: 'snssai',
    displayName: 'My SNSSAI',
    documentName: 'c_SNSSAI',
    description: testingStrings.snssaiDescription,
  },
  {
    name: 'nf',
    displayName: 'My NF',
    documentName: 'c_NF',
    description: testingStrings.nfDescription,
  },
];

const templateContextFields = [
  EntityType.constructFromObject({
    id: 'c_SNSSAI',
    name: 'My SNSSAI',
    description: testingStrings.snssaiDescription,
  }),
  EntityType.constructFromObject({
    id: 'c_NF',
    name: 'My NF',
    description: testingStrings.nfDescription,
  }),
];

describe('Unit test for transforming metadata contexts stitched data to match API spec response', () => {
  describe('tests for createContextFields', () => {
    it('should return an array of EntityTypes that have all properties defined and use human readable display names', () => {
      expect(createContextFields(templateIndexerContexts)).to.deep.equal(templateContextFields);
    });

    it('should return an array of EntityTypes that have all properties defined but uses backup names', () => {
      const indexerContexts = templateIndexerContexts.map((context) => {
        delete context.displayName;
        return context;
      });
      const contextFields = [
        EntityType.constructFromObject({
          id: 'c_SNSSAI',
          name: 'snssai',
          description: testingStrings.snssaiDescription,
        }),
        EntityType.constructFromObject({
          id: 'c_NF',
          name: 'nf',
          description: testingStrings.nfDescription,
        }),
      ];
      expect(createContextFields(indexerContexts)).to.deep.equal(contextFields);
    });

    it('should return an array of EntityTypes that do not have all properties defined', () => {
      const indexerContexts = [
        {
          name: 'SNSNSN',
          documentName: 'c_SNSNSN',
        },
        {
          name: 'PN',
          documentName: 'c_PN',
        },
      ];
      const contextFields = [
        EntityType.constructFromObject({
          id: 'c_SNSNSN',
          name: 'SNSNSN',
        }),
        EntityType.constructFromObject({
          id: 'c_PN',
          name: 'PN',
        }),
      ];
      expect(createContextFields(indexerContexts)).to.deep.equal(contextFields);
    });

    it('should return an array with only one EntityType', () => {
      const indexerContexts = [
        {
          name: 'SNSSAI',
          displayName: 'My SNSSAI',
          documentName: 'c_SNSSAI',
          description: testingStrings.snssaiDescription,
        },
      ];
      const contextFields = [
        EntityType.constructFromObject({
          id: 'c_SNSSAI',
          name: 'My SNSSAI',
          description: testingStrings.snssaiDescription,
        }),
      ];
      expect(createContextFields(indexerContexts)).to.deep.equal(contextFields);
    });

    it('should return an empty array', () => {
      const indexerContexts = [];
      expect(createContextFields(indexerContexts)).to.deep.equal([]);
    });
  });

  describe('tests for transformMetadataContexts', () => {
    it('should return valid data that matches the API spec response given indexer full context data', () => {
      expect(JSON.stringify(transformMetadataContexts(indexerFullContextsDocs1))).to.eq(
        JSON.stringify(metadataContextsResponse1),
      );
    });

    it('should return valid data that matches the API spec response given indexer full context data (2)', () => {
      expect(JSON.stringify(transformMetadataContexts(indexerFullContextsDocs2))).to.eq(
        JSON.stringify(metadataContextsResponse2),
      );
    });

    it('should return empty results when an empty array is passed as a stitchedData', () => {
      expect(transformMetadataContexts([])).to.deep.equal([]);
    });
  });

  describe('tests for modifyCustomizationContextsFileStructure', () => {
    it('should return contexts from the customization file with the modified structure for optimization ', () => {
      const context1 = JSON.stringify(['nsi', 'snssai']);
      const context2 = JSON.stringify(['nf', 'nsi']);
      const modifiedContext = {};
      modifiedContext[context1] = {
        name: 'My SNSSAI and NSI',
        description: 'Description for SNSSAI and NSI',
      };
      modifiedContext[context2] = {
        name: 'My NF and NSI',
        description: 'Description for NF and NSI',
      };

      expect(modifyCustomizationContextsFileStructure(customizationFile1)).to.deep.equal(
        modifiedContext,
      );
    });

    it('should return empty object when contexts in the customization file is empty', () => {
      expect(modifyCustomizationContextsFileStructure(customizationFile2)).to.deep.equal({});
    });
  });
});
