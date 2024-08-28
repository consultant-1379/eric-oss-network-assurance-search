import Ajv from 'ajv';
import { createRequire } from 'module';
import { ERROR_CODES } from './httpConstants.js';
import { AppError } from './appError.js';

const require = createRequire(import.meta.url);
const openSearchResponseModelSchema = require('./opensearchJsonSchemas/responseModel.schema.json');
const openSearchHitsModelSchema = require('./opensearchJsonSchemas/hitsModel.schema.json');
const openSearchDocumentModelSchema = require('./opensearchJsonSchemas/documentModel.schema.json');
const openSearchDocumentSourceModelSchema = require('./opensearchJsonSchemas/documentSourceModel.schema.json');

const ajv = new Ajv({
  allErrors: true,
  strict: true,
});

// Compiling the OpenSearch JSON schemas
// Starting from the child schemas and moving up towards the root schema
ajv.compile(openSearchDocumentSourceModelSchema);
ajv.compile(openSearchDocumentModelSchema);
ajv.compile(openSearchHitsModelSchema);
const validate = ajv.compile(openSearchResponseModelSchema);

function validateOpenSearchResponseBody(openSearchResponseBody) {
  if (!validate(openSearchResponseBody)) {
    throw new AppError(
      ERROR_CODES['400_VALIDATION_ERROR'],
      JSON.stringify(validate.errors).replace(/"/g, "'"),
      ERROR_CODES['400_VALIDATION_ERROR'],
      'OpenSearch Response Validation Error',
    );
  }
}

export { validateOpenSearchResponseBody };
