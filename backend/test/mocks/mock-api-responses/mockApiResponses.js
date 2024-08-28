import { createRequire } from 'module';
import { getRandomInt } from './utils/helperFunctions.js';
import {
  generateMockSearchMetrics,
  generateMockSearchContexts,
  generateMockContextFacet,
  generateMockIndexes,
} from './mockSchema.js';

const require = createRequire(import.meta.url);
const metadataRelationsMockData = require('./mock-data/metadata-relations-mock-data.json');
const metadataContextsMockData = require('./mock-data/metadata-contexts-mock-data.json');
const metadataMetricsMockData = require('./mock-data/metadata-metrics-mock-data.json');
const metadataAllMockData = require('./mock-data/metadata-all-mock-data.json');

const responseArrayBuilder = (elementGeneratorFunction) => {
  const arr = [];
  for (let i = 0; i < getRandomInt(1, 15); i += 1) {
    arr.push(elementGeneratorFunction());
  }
  return arr;
};

const mockAssuranceResponses = {
  searchMetrics: {
    200: () => generateMockSearchMetrics(),
  },
  searchContexts: {
    200: () => generateMockSearchContexts(),
  },
  searchRelatedContextsFacets: {
    200: () => responseArrayBuilder(generateMockContextFacet),
  },
  metadataRelations: {
    200: () => metadataRelationsMockData,
  },
  metadataContexts: {
    200: () => metadataContextsMockData,
  },
  metadataMetrics: {
    200: () => metadataMetricsMockData,
  },
  metadataAll: {
    200: () => metadataAllMockData,
  },
  metadataIndexes: {
    200: () => generateMockIndexes(),
  },
};

export { mockAssuranceResponses };
