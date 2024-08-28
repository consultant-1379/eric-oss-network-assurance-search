import { expect } from 'chai';
import {
  getRelevantContextFieldsForQuery,
  getContextFacetObject,
} from '../../../../../services/assurance/search/opensearch/relatedContextsFacets.js';
import ContextFacet from '../../../../../model/ContextFacet.js';

describe('Unit tests for the /:index/search/related-contexts-facets endpoint data manipulation functions', () => {
  describe('tests for getRelevantContextFieldsForQuery', () => {
    it('it should return an array of one relevant context field', () => {
      const entityContextFields = [
        { id: 'AMF_BC', type: { id: 'c_NF' } },
        { id: 'Slice1', type: { id: 'c_NSI' } },
      ];
      const entityTypeContextFields = [{ id: 'c_Site' }, { id: 'c_NSI' }];
      const actualResult = getRelevantContextFieldsForQuery(
        entityContextFields,
        entityTypeContextFields,
      );
      const expectedResult = [{ id: 'Slice1', type: { id: 'c_NSI' } }];
      expect(actualResult).to.deep.equal(expectedResult);
    });

    it('it should return an array of multiple relevant context fields', () => {
      const entityContextFields = [
        { id: 'AMF_BC', type: { id: 'c_NF' } },
        { id: 'Slice1', type: { id: 'c_NSI' } },
      ];
      const entityTypeContextFields = [{ id: 'c_NF' }, { id: 'c_NSI' }];
      const actualResult = getRelevantContextFieldsForQuery(
        entityContextFields,
        entityTypeContextFields,
      );
      expect(actualResult).to.deep.equal(entityContextFields);
    });

    it('it should return an empty array due to input arguments not intersecting', () => {
      const entityContextFields = [
        { id: 'AMF_BC', type: { id: 'c_NF' } },
        { id: 'Slice1', type: { id: 'c_NSI' } },
      ];
      const entityTypeContextFields = [
        { id: 'c_Site' },
        {
          id: 'c_SNSSAI',
        },
      ];
      const actualResult = getRelevantContextFieldsForQuery(
        entityContextFields,
        entityTypeContextFields,
      );
      const expectedResult = [];
      expect(actualResult).to.deep.equal(expectedResult);
    });

    it('it should return an empty array due to empty input arguments', () => {
      const actualResult = getRelevantContextFieldsForQuery([], []);
      const expectedResult = [];
      expect(actualResult).to.deep.equal(expectedResult);
    });
  });

  describe('tests for getContextFacetObject', () => {
    it('it should return a valid `ContextFacet` object', () => {
      const contextTypeData = {
        id: 'NSI_Site',
        contextFields: [
          {
            id: 'c_Site',
          },
          {
            id: 'c_NSI',
          },
        ],
      };
      const count = 1;
      const actualResult = getContextFacetObject(contextTypeData, count);
      const expectedResult = ContextFacet.constructFromObject({
        contextType: contextTypeData,
        count,
      });
      expect(actualResult).to.deep.equal(expectedResult);
    });

    it('it should return an empty object due to an invalid `ContextType` object being provided', () => {
      const contextTypeData = {
        invalidProperty: 'NSI_Site',
        contextFields: [
          {
            id: 'c_Site',
          },
          {
            invalidProperty: 'c_NSI',
          },
        ],
      };
      const count = 1;
      const actualResult = getContextFacetObject(contextTypeData, count);
      expect(actualResult).to.deep.equal({});
    });

    it('it should return an empty object due to an empty `ContextType` object being provided', () => {
      const actualResult = getContextFacetObject({}, 1);
      expect(actualResult).to.deep.equal({});
    });
  });
});
