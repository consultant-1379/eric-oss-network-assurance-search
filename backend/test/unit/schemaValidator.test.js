import { expect } from 'chai';
import { createRequire } from 'module';
import { schemaValidator } from '../../utils/schemaValidator.js';

const require = createRequire(import.meta.url);
const { SAMPLE } = require('../mocks/dummy-files/fault-indication-map.json');

describe('Unit tests for schemaValidator.js', () => {
  it('can successfully validate a json file', () => {
    const result = schemaValidator.validateFaultIndication(SAMPLE);
    expect(result.valid).to.be.true;
  });

  it('can detect invalid schema', () => {
    // Deep-copy it as it can break other tests, since the same reference is used
    const jsonConfig = JSON.parse(JSON.stringify(SAMPLE));
    delete jsonConfig.serviceName;
    const result = schemaValidator.validateFaultIndication(jsonConfig);
    expect(result.valid).to.be.false;
    expect(result.errors[0].message).to.eq('requires property "serviceName"');
  });
});
