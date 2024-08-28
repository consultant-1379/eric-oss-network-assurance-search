import { createRequire } from 'module';
import EntityType from '../../../model/EntityType.js';
import ContextType from '../../../model/ContextType.js';
import ContextFacet from '../../../model/ContextFacet.js';
import { getRandomInt, generateRandomName } from './utils/helperFunctions.js';
import {
  transformStitchedSearchMetricsData,
  stitchSearchMetrics,
} from '../../../services/assurance/search/opensearch/metrics.js';

const require = createRequire(import.meta.url);
const data1Q1 = require('../services/assurance/search/opensearch/metrics/stitchSearchMetricsTestQuery1.json');
const data1Q2 = require('../services/assurance/search/opensearch/metrics/stitchSearchMetricsTestQuery2.json');

const query = {
  offset: 0,
  length: 30,
};

const contextTypeIdEnum = ['CFID_NF_NSSAI', 'CFID_NF_NSI', 'CFID_NSSAI_NSI'];
const entityNameEnum = ['NF', 'NSSAI', 'NSI'];

const indexesMock = [{ name: 'ran' }, { name: 'soa' }];

const generateMockEntityType = () => ({
  ...EntityType.constructFromObject({
    id: entityNameEnum[Math.floor(Math.random() * entityNameEnum.length)],
    name: generateRandomName(),
    description: generateRandomName(),
  }),
});

const generateMockContextType = () => {
  const contextFields = [];
  for (let i = 0; i < getRandomInt(1, 10); i += 1) {
    contextFields.push(generateMockEntityType());
  }
  return {
    ...ContextType.constructFromObject({
      id: contextTypeIdEnum[Math.floor(Math.random() * contextTypeIdEnum.length)],
      name: generateRandomName(),
      contextFields,
    }),
  };
};

const generateMockIndexes = () => indexesMock;

const generateMockSearchMetrics = () =>
  transformStitchedSearchMetricsData(stitchSearchMetrics(data1Q1, data1Q2), query);

const generateMockSearchContexts = () =>
  transformStitchedSearchMetricsData(stitchSearchMetrics(data1Q1, data1Q2), query);

const generateMockContextFacet = () => ({
  ...ContextFacet.constructFromObject({
    contextType: generateMockContextType(),
    count: getRandomInt(1, 1000),
  }),
});

export {
  generateMockSearchMetrics,
  generateMockSearchContexts,
  generateMockContextFacet,
  generateMockIndexes,
};
