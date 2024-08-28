import { expect } from 'chai';
import { createRequire } from 'module';
import {
  createContext,
  transformSearchContextsData,
} from '../../../../../services/assurance/search/opensearch/contexts.js';

const require = createRequire(import.meta.url);
const searchContextDocs1 = require('../../../../mocks/services/assurance/search/opensearch/contexts/transformSearchContextsData/docs.json');
const expectedSearchContextsResponse1 = require('../../../../mocks/services/assurance/search/opensearch/contexts/transformSearchContextsData/expectedSearchContextsResponse.json');

describe('Unit tests for the /:index/search/contexts endpoint data manipulation functions', () => {
  describe('tests for createContext', () => {
    it('it should return a valid `Context` object given an OpenSearch doc', () => {
      const doc = {
        c_Site: 'BC',
        c_SNSSAI: '1:2',
        full_context: 'SNSSAI_Site',
        context: ['SNSSAI', 'Site'],
        xc_eyJTaXRlIjp7Im5hbWUiOiJTaXRlIiwibmFtZVR5cGUiOiJzdHJhaWdodCJ9LCJTTlNTQUkiOnsibmFtZSI6ImdlbmVyaWMiLCJuYW1lVHlwZSI6ImNvbG9uU2VwYXJhdGVkIn19: true,
        value_context: 'SNSSAI_Site_AMFMeanRegNbr2',
        value_name: 'AMFMeanRegNbr2',
        vi_SNSSAI_Site_AMFMeanRegNbr2: 0,
        xv_SNSSAI_Site_AMFMeanRegNbr2_eyIiOnsibmFtZSI6IkFNRk1lYW5SZWdOYnIyIiwidHlwZSI6ImludGVnZXIifX0A: true,
        doc_id: 'AMFMeanRegNbr2__SNSSAI_1:2__Site_BC',
        offset: '28',
        vintage: 'DB327BFF1106DDB6CCB208C666A6919B',
      };

      const expectedContext = {
        type: {
          id: 'SNSSAI_Site',
          contextFields: [
            {
              id: 'SNSSAI',
            },
            {
              id: 'Site',
            },
          ],
        },
        contextFields: [
          {
            id: '1:2',
            type: {
              id: 'c_SNSSAI',
            },
          },
          {
            id: 'BC',
            type: {
              id: 'c_Site',
            },
          },
        ],
      };

      const actualContext = createContext(doc);

      expect(actualContext).to.deep.equal(expectedContext);
    });

    it('it should return an empty `Context` object given an empty input argument', () => {
      const expectedContext = {
        type: {
          id: 'Unknown',
          contextFields: [],
        },
        contextFields: [],
      };
      const actualContext = createContext({});
      expect(actualContext).to.deep.equal(expectedContext);
    });
  });

  describe('tests for transformSearchContextsData', () => {
    it('it should transform OpenSearch docs into a valid search contexts response', () => {
      const actualTransformedSearchContextsData1 = transformSearchContextsData(
        searchContextDocs1,
        {
          offset: 1,
          length: 5,
        },
        6,
      );
      expect(actualTransformedSearchContextsData1).to.deep.equal(expectedSearchContextsResponse1);
    });

    it('it should return an object that has no `Context` objects given an empty docs input', () => {
      const actualTransformedSearchContextsData2 = transformSearchContextsData(
        [],
        {
          offset: 0,
          length: 0,
        },
        0,
      );
      const expectedSearchContextsResponse2 = {
        offset: 0,
        length: 0,
        total: 0,
        results: [],
      };
      expect(actualTransformedSearchContextsData2).to.deep.equal(expectedSearchContextsResponse2);
    });
  });
});
