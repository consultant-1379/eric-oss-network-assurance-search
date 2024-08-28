import { expect } from '@open-wc/testing';
import replaceInLocale from '../../src/utils/replaceInLocale.js';

describe('Replace Locale tests', () => {
  it('Replace given value', () => {
    const localeString = 'First {{var1}}, Second {{var2}}';
    const actual = replaceInLocale(localeString, { var1: 'v1', var2: 'v2' });
    const expected = 'First v1, Second v2';
    expect(actual).to.equal(expected);
  });

  it('Should not fail on missing substitution variable', () => {
    const localeString = 'This {{var1}}, That {{var2}}';
    const actual = replaceInLocale(localeString, {});
    const expected = 'This undefined, That undefined';
    expect(actual).to.equal(expected);
  });

  it('Should not fail when no substitution template is defined ', () => {
    const localeString = 'No substitution';
    const actual = replaceInLocale(localeString, { var1: 'v1', var2: 'v2' });
    const expected = 'No substitution';
    expect(actual).to.equal(expected);
  });

  it('Should support autoboxing', () => {
    const localeString = 'Integer 1: {{var1}}, Float 0.99: {{var2}}';
    const actual = replaceInLocale(localeString, { var1: 1, var2: 0.99 });
    const expected = 'Integer 1: 1, Float 0.99: 0.99';
    expect(actual).to.equal(expected);
  });
});
