import { ERROR_CODES, HTTP_RESPONSE_CODES } from './httpConstants.js';
import { AppError } from './appError.js';
import { getLogger } from '../services/logging.js';

const logger = getLogger();

/**
 *
 * @param {Object} error Error details Object
 * @param {Object} req Request Object
 * @param {Object} res Response object
 * @param {Object} next Pass to next route
 * @returns
 */
const errorHandler = async (error, req, res, next) => {
  logger.error(error?.stack || error); // eslint-disable-line no-unused-vars

  let apiError = error;
  if (!(error instanceof AppError)) {
    if (error.name === 'ConnectionError') {
      apiError = new AppError(
        HTTP_RESPONSE_CODES['503_SERVICE_UNAVAILABLE'],
        'Service unavailable',
        HTTP_RESPONSE_CODES['503_SERVICE_UNAVAILABLE'],
        error.name,
      );
    } else {
      apiError = new AppError(
        ERROR_CODES['500_FATAL_ERROR'],
        'Fatal Error',
        HTTP_RESPONSE_CODES['500_INTERNAL_SERVER_ERROR'],
        error?.name,
      );
    }
  }

  apiError.setStatus(res);
  next();
};

export { errorHandler };
