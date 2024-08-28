import qs from 'qs';
import countBy from 'lodash/countBy.js';
import { AppError } from '../utils/appError.js';

function queryLimit(str) {
  const maxParams = 100;
  const paramCount = countBy(str)['='] || 0;
  if (paramCount > maxParams) {
    throw new AppError(413, 'Number of query parameters exceeds limit');
  }

  return qs.parse(str, {
    allowPrototypes: true,
    arrayLimit: maxParams,
    parameterLimit: maxParams,
    depth: Infinity,
  });
}

export { queryLimit };
