import { validate } from 'jsonschema';
import { createRequire } from 'module';

const require = createRequire(import.meta.url);
const faultIndicationSchema = require('../schemas/faultIndication.schema');
const helpPackageMetadataSchema = require('../schemas/helpPackageMetadata.schema');

class SchemaValidator {
  validateFaultIndication(json) {
    return validate(json, faultIndicationSchema);
  }

  validateHelpPackageMetadata(json) {
    return validate(json, helpPackageMetadataSchema);
  }
}

const schemaValidator = new SchemaValidator();
export { schemaValidator };
