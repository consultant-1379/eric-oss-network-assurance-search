import { param, query } from 'express-validator';

import MetricFilter from '../../model/MetricFilter.js';
import EntityFilter from '../../model/EntityFilter.js';
import MetricType from '../../model/MetricType.js';
import EntityType from '../../model/EntityType.js';
import Context from '../../model/Context.js';

const OFFSET_DEFAULT = '0';
const LENGTH_DEFAULT = '10';
const SORT_ORDER_DEFAULT = 'asc';

const searchIndexRegexPattern = /^[a-zA-Z][a-zA-Z0-9_-]{0,254}$/;

const commonErrorMessages = {
  contextFieldQueryParameter:
    'The `contextFields` query parameter must be an array of EntityType objects that has a length of at least 1.',
  contextTypeIdParameter: 'The `contextTypeId` query parameter must be a string.',
};

/**
 * This function checks if the `value` object is a valid instance
 * of the `type` model. The `type` model is an auto-generated
 * model.
 * @param { Model } type
 * @param { Object } value
 * @returns Boolean
 */
const isValidModel = (type, value) => {
  try {
    return type.validateJSON(value);
  } catch {
    return false;
  }
};

/**
 * This function checks if every element of the `arr` array is
 * a valid instance of a model by using the passed in `validationFunction`.
 * @param { Array } arr
 * @param { Function } validationFunction
 * @returns Boolean
 */
const validateObjectsInArray = (arr, validationFunction) => {
  arr.forEach((element) => {
    if (!validationFunction(element)) {
      throw new Error(
        JSON.stringify({
          customValidationError: true,
          name: 'ModelValidationError',
          message: 'Failed on custom validation: invalid object type.',
        }),
      );
    }
  });
  return true;
};

/**
 * This function validates the `sortOrder` query parameter
 * by checking if it equals one of the possible enumeration values.
 * @param { String } sortOrder
 * @returns Boolean
 */
const validateSortOrderQueryParameter = (sortOrder) => {
  if (!['asc', 'desc'].includes(sortOrder)) {
    throw new Error(
      JSON.stringify({
        customValidationError: true,
        name: 'ModelValidationError',
        message:
          "The `sortOrder` query parameters must be a string equal to either 'asc' or 'desc'",
      }),
    );
  }
  return true;
};

/**
 * This function validates the `sortBy` query parameter
 * by checking if it is either a valid MetricType instance
 * or a valid EntityType instance.
 * @param { Object } sortBy
 * @returns Boolean
 */
const validateSortByQueryParameter = (sortBy) => {
  if (isValidModel(MetricType, sortBy) || isValidModel(EntityType, sortBy)) {
    return true;
  }
  throw new Error(
    JSON.stringify({
      customValidationError: true,
      name: 'ModelValidationError',
      message: 'Failed on custom validation: invalid sortBy object type.',
    }),
  );
};

const indexPathParamValidation = param('index')
  .not()
  .isEmpty()
  .isString()
  .custom((index) => searchIndexRegexPattern.test(index))
  .withMessage({
    customValidationError: true,
    name: 'ModelValidationError',
    message: 'The `index` path parameter must be a valid index name and cannot be empty.',
  });

const contextTypeIdCustomValidation = (contextTypeId) => {
  if (contextTypeId === '') {
    throw new Error(
      JSON.stringify({
        customValidationError: true,
        name: 'ModelValidationError',
        message: 'The `contextTypeId` query parameter cannot be an empty string.',
      }),
    );
  }
  return true;
};

const contextTypeIdQueryParamValidation = query('contextTypeId')
  .not()
  .isEmpty()
  .isString()
  .withMessage({
    customValidationError: true,
    name: 'ModelValidationError',
    message: commonErrorMessages.contextTypeIdParameter,
  })
  .custom(contextTypeIdCustomValidation);

const optionalContextTypeIdQueryParamValidation = query('contextTypeId')
  .optional()
  .isString()
  .withMessage({
    customValidationError: true,
    name: 'ModelValidationError',
    message: commonErrorMessages.contextTypeIdParameter,
  })
  .custom(contextTypeIdCustomValidation);

const sortByQueryParamValidation = query('sortBy')
  .optional()
  .custom((sortByObject) => validateSortByQueryParameter(sortByObject));

const sortOrderQueryParamValidation = query('sortOrder')
  .customSanitizer((value) => value || SORT_ORDER_DEFAULT)
  .isString()
  .withMessage({
    customValidationError: true,
    name: 'ModelValidationError',
    message: 'The `sortOrder` query parameter must be a string.',
  })
  .custom((sortOrder) => validateSortOrderQueryParameter(sortOrder));

const offsetQueryParamValidation = query('offset')
  .customSanitizer((value) => value || OFFSET_DEFAULT)
  .toInt()
  .isInt({ min: 0 })
  .withMessage({
    customValidationError: true,
    name: 'ModelValidationError',
    message: 'The `offset` query parameter must be a number that is greater than or equal to 0.',
  });

const lengthQueryParamValidation = query('length')
  .customSanitizer((value) => value || LENGTH_DEFAULT)
  .toInt()
  .isInt({ min: 0, max: 100 })
  .withMessage({
    customValidationError: true,
    name: 'ModelValidationError',
    message:
      'The `length` query parameter must be a number that is between 0 (inclusive) and 100 (inclusive).',
  });

const searchMetricsRouteValidationSchema = [
  indexPathParamValidation,
  contextTypeIdQueryParamValidation,
  query('metricTypes')
    .optional()
    .isArray({ min: 1 })
    .withMessage({
      customValidationError: true,
      name: 'ModelValidationError',
      message:
        'The `metricTypes` query parameter must be an array of MetricType objects that has a length of at least 1.',
    })
    .custom((metricTypes) => validateObjectsInArray(metricTypes, MetricType.validateJSON)),
  query('filters')
    .optional()
    .isArray({ min: 1 })
    .withMessage({
      customValidationError: true,
      name: 'ModelValidationError',
      message:
        'The `filters` query parameter must be an array of either MetricFilter or EntityFilter objects that has a length of at least 1.',
    })
    .custom((filters) => {
      filters.forEach((filterObject) => {
        if (isValidModel(MetricFilter, filterObject) || isValidModel(EntityFilter, filterObject)) {
          return true;
        }
        throw new Error(
          JSON.stringify({
            customValidationError: true,
            name: 'ModelValidationError',
            message: 'Failed on custom validation: invalid filter object type.',
          }),
        );
      });
      return true;
    }),
  sortByQueryParamValidation,
  sortOrderQueryParamValidation,
  offsetQueryParamValidation,
  lengthQueryParamValidation,
];

const searchContextsRouteValidationSchema = [
  indexPathParamValidation,
  query('filters')
    .not()
    .isEmpty()
    .isArray({ min: 1 })
    .withMessage({
      customValidationError: true,
      name: 'ModelValidationError',
      message:
        'The `filters` query parameter must be an array of valid EntityFilter objects that has a length of at least 1.',
    })
    .custom((filters) => validateObjectsInArray(filters, EntityFilter.validateJSON)),
  optionalContextTypeIdQueryParamValidation,
  sortByQueryParamValidation,
  sortOrderQueryParamValidation,
  offsetQueryParamValidation,
  lengthQueryParamValidation,
];

const searchRelatedContextsFacetsRouteValidationSchema = [
  indexPathParamValidation,
  contextTypeIdQueryParamValidation,
  query('contextId')
    .not()
    .isEmpty()
    .withMessage({
      customValidationError: true,
      name: 'ModelValidationError',
      message:
        'The `contextId` query parameter must be a valid Context object and cannot be empty.',
    })
    .custom((contextObject) => Context.validateJSON(contextObject)),
];

const metadataRelationsRouteValidationSchema = [
  indexPathParamValidation,
  contextTypeIdQueryParamValidation,
];

const metadataContextsRouteValidationSchema = [indexPathParamValidation];

const metadataMetricsRouteValidationSchema = [
  indexPathParamValidation,
  contextTypeIdQueryParamValidation,
];

const metadataAllRouteValidationSchema = [indexPathParamValidation];

export {
  searchMetricsRouteValidationSchema,
  searchContextsRouteValidationSchema,
  searchRelatedContextsFacetsRouteValidationSchema,
  metadataRelationsRouteValidationSchema,
  metadataContextsRouteValidationSchema,
  metadataMetricsRouteValidationSchema,
  metadataAllRouteValidationSchema,
};
