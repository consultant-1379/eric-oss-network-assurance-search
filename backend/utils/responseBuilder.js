import { validationResult } from 'express-validator';
import { ERROR_CODES, HTTP_RESPONSE_CODES } from './httpConstants.js';
import { AppError } from './appError.js';

const defaultErrorCode = HTTP_RESPONSE_CODES['400_BAD_REQUEST'];
const errorFormatter = ({ location, msg, param }) => `${location}[${param}]: ${msg}`;

/**
 * This function takes in a list of all errors produced from request
 * and returns an array that only contains the custom errors with
 * parsed custom error data.
 * @param { Array } errors
 * @returns { Array }
 */
const parseCustomErrors = (errors) => {
  // Parsing the msg data of errors if they are still in string format
  errors = errors.map((error) => {
    try {
      return {
        ...error,
        msg: JSON.parse(error.msg),
      };
    } catch {
      return error;
    }
  });

  return errors.filter((error) => error.msg?.customValidationError);
};

/**
 *
 * @param {*} validations
 * @returns
 */
const validateRequest = (validations) => async (req, res, next) => {
  await Promise.all(validations.map((validation) => validation.run(req)));

  const errors = validationResult(req).formatWith(errorFormatter);
  if (errors.isEmpty()) {
    return next();
  }

  const customErrors = parseCustomErrors(errors.errors);
  const customErrorMessageObject = customErrors?.[0]?.msg;

  const validationError = new AppError(
    ERROR_CODES['400_VALIDATION_ERROR'],
    customErrorMessageObject.message || errors.array().join(', '),
    defaultErrorCode,
    customErrorMessageObject.name,
  );

  return next(validationError);
};

/**
 *
 * @param {Object} res
 * @param {object} responseContent
 * @returns Express Response object
 */
const responseBuilder = (res, responseContent) => {
  res.statusCode = HTTP_RESPONSE_CODES['200_OK'];
  res.json(responseContent);
};

export { validateRequest, responseBuilder };
