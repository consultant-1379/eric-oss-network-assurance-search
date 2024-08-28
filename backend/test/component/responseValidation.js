import { validatePropertyType } from '../../routes/route-validation-schemas/parameter-validation/utils.js';
import Context from '../../model/Context.js';
import Metric from '../../model/Metric.js';
import ContextType from '../../model/ContextType.js';
import Relation from '../../model/Relation.js';
import MetricType from '../../model/MetricType.js';
import Index from '../../model/Index.js';
import ContextFacet from '../../model/ContextFacet.js';

/**
 * @function checkUnexpectedProps
 * @description This function ensures that there are no unexpected props in an object
 * @param {*} obj - The object that will contain props
 * @param {*} requiredProps - The props that need to be present in the object
 * @param {*} expectedProps - The props that are optional
 * @returns {boolean}
 */
function checkUnexpectedProps(obj, requiredProps, expectedProps) {
  const unexpectedProps = Object.keys(obj)
    .filter((key) => !requiredProps.includes(key))
    .filter((prop) => !expectedProps.includes(prop));
  if (unexpectedProps.length !== 0) {
    return false;
  }
  return true;
}

/**
 * @function areObjectsInArrayValid
 * @description This function validates each object within an array of objects given a validation function
 * @param {*} arrayOfObjects - The array that contains the objects which will be validated
 * @param {*} validationFunction - The function that will be used to validate each of the objects within the array
 * @returns {boolean}
 */
function areObjectsInArrayValid(arrayOfObjects, validationFunction) {
  for (const obj of arrayOfObjects) {
    if (!validationFunction(obj)) {
      return false;
    }
  }
  return true;
}

/**
 * @function isValidPayload
 * @description This function runs the provided payload through a list of validation steps
 * @param {*} payload - The payload that will be subjected to the validation steps
 * @param {*} validationFunctions - An array of validation functions
 * @returns {boolean}
 */
function isValidPayload(payload, validationFunctions) {
  for (const validate of validationFunctions) {
    if (!validate(payload)) {
      return false;
    }
  }
  return true;
}

/**
 * @function isSearchMetricsResultsArray
 * @description This function checks if the search/metrics payload has a valid `results` format, according to the OpenAPI spec
 * @param {*} payload
 * @returns {boolean}
 */
function isSearchMetricsResultsArray(payload) {
  return isValidPayload(payload, [
    Array.isArray,
    (arr) => {
      for (let i = 0; i < arr.length; i += 1) {
        if (
          !(
            Context.validateJSON(arr[i].context) &&
            (Metric.validateJSON(arr[i].metrics) || arr[i].metrics.length === 0)
          )
        ) {
          return false;
        }
      }
      return true;
    },
  ]);
}

/**
 * @function isSearchContextsResultsArray
 * @description This function checks if the search/contexts payload has a valid `results` format, according to the OpenAPI spec
 * @param {*} payload
 * @returns {boolean}
 */
function isSearchContextsResultsArray(payload) {
  return isValidPayload(payload, [
    Array.isArray,
    (arr) => areObjectsInArrayValid(arr, Context.validateJSON),
  ]);
}

/**
 * @function isSearchMetricsPayload
 * @description This function checks if the payload is a valid /:index/search/metrics response
 * @param {*} payload
 * @returns {boolean}
 */
function isSearchMetricsPayload(payload) {
  return isValidPayload(payload, [
    (obj) => typeof obj === 'object',
    (obj) => validatePropertyType(obj, 'offset', 'number'),
    (obj) => validatePropertyType(obj, 'length', 'number'),
    (obj) => validatePropertyType(obj, 'total', 'number'),
    (obj) => validatePropertyType(obj, 'results', 'array'),
    (obj) => isSearchMetricsResultsArray(obj.results),
    (obj) => checkUnexpectedProps(obj, ['offset', 'length', 'total', 'results'], []),
  ]);
}

/**
 * @function isSearchContextsPayload
 * @description This function checks if the payload is a valid /:index/search/contexts response
 * @param {*} payload
 * @returns {boolean}
 */
function isSearchContextsPayload(payload) {
  return isValidPayload(payload, [
    (obj) => typeof obj === 'object',
    (obj) => validatePropertyType(obj, 'offset', 'number'),
    (obj) => validatePropertyType(obj, 'length', 'number'),
    (obj) => validatePropertyType(obj, 'total', 'number'),
    (obj) => validatePropertyType(obj, 'results', 'array'),
    (obj) => isSearchContextsResultsArray(obj.results),
    (obj) => checkUnexpectedProps(obj, ['offset', 'length', 'total', 'results'], []),
  ]);
}

/**
 * @function isSearchRelatedContextsFacetsPayload
 * @description This function checks if the payload is a valid /:index/search/related-contexts-facets response
 * @param {*} payload
 * @returns {boolean}
 */
function isSearchRelatedContextsFacetsPayload(payload) {
  return isValidPayload(payload, [
    Array.isArray,
    (arr) => areObjectsInArrayValid(arr, ContextFacet.validateJSON),
  ]);
}

/**
 * @function isMetadataRelationsPayload
 * @description This function checks if the payload is a valid /:index/metadata/relations response
 * @param {*} payload
 * @returns {boolean}
 */
function isMetadataRelationsPayload(payload) {
  return isValidPayload(payload, [
    Array.isArray,
    (arr) => areObjectsInArrayValid(arr, Relation.validateJSON),
  ]);
}

/**
 * @function isMetadataContextsPayload
 * @description This function checks if the payload is a valid /:index/metadata/contexts response
 * @param {*} payload
 * @returns {boolean}
 */
function isMetadataContextsPayload(payload) {
  return isValidPayload(payload, [
    Array.isArray,
    (arr) => areObjectsInArrayValid(arr, ContextType.validateJSON),
  ]);
}

/**
 * @function isMetadataMetricsPayload
 * @description This function checks if the payload is a valid /:index/metadata/metrics response
 * @param {*} payload
 * @returns {boolean}
 */
function isMetadataMetricsPayload(payload) {
  return isValidPayload(payload, [
    Array.isArray,
    (arr) => areObjectsInArrayValid(arr, MetricType.validateJSON),
  ]);
}

/**
 * @function isMetadataAllPayload
 * @description This function checks if the payload is a valid /:index/metadata response
 * @param {*} payload
 * @returns {boolean}
 */
function isMetadataAllPayload(payload) {
  return isValidPayload(payload, [
    Array.isArray,
    (arr) => {
      for (const metadataAllObject of arr) {
        if (!ContextType.validateJSON(metadataAllObject.contextType)) {
          return false;
        }
        if (!isMetadataRelationsPayload(metadataAllObject.relations)) {
          return false;
        }
        if (!isMetadataMetricsPayload(metadataAllObject.metricTypes)) {
          return false;
        }
      }
      return true;
    },
  ]);
}

/**
 * @function isMetadataIndexesPayload
 * @description This function checks if the payload is a valid /metadata/indexes response
 * @param {*} payload
 * @returns {boolean}
 */
function isMetadataIndexesPayload(payload) {
  return isValidPayload(payload, [
    Array.isArray,
    (arr) => areObjectsInArrayValid(arr, Index.validateJSON),
  ]);
}

export {
  isSearchMetricsPayload,
  isSearchContextsPayload,
  isSearchRelatedContextsFacetsPayload,
  isMetadataRelationsPayload,
  isMetadataContextsPayload,
  isMetadataMetricsPayload,
  isMetadataAllPayload,
  isMetadataIndexesPayload,
};
