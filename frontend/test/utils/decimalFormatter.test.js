import { expect } from '@open-wc/testing';
import { toTableValue } from '../../src/utils/decimalFormatter.js';

describe('Table Decimal Tests', () => {
  const tests = new Map([
    ['42.9999', '42.999'],
    ['42.99', '42.99'],
    ['42.9', '42.9'],
    ['NotANumber', 'NaN'],
    [123, '123.0'],
  ]);

  it('should correctly format a decimal number', async () => {
    tests.forEach((expected, input) => expect(toTableValue(input)).to.equal(expected));
  });
});
