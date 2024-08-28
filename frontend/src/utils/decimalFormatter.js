const LOCALE = window.EUI?.locale || 'en-US';

const formatter = new Intl.NumberFormat(LOCALE, {
  minimumFractionDigits: 1,
  maximumFractionDigits: 3,
  roundingMode: 'trunc',
});

/**
 * Format a number to the required decimal representation. The input is expected to be truncated to a max of three fraction digits, e.g.:
 * - 99.9985 → 99.998
 * - 99.9999 → 99.999
 * - 99.0 → 99.0
 * @param {*} num - the input, a number representation is expected
 * @returns a formatted number representing the input
 */
const toTableValue = (num) => formatter.format(num);

export { toTableValue };
