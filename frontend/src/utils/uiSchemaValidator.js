import { Validator } from 'jsonschema';
import deploymentConfigSchema from '../schemas/ui.deployment.config.json';

class UiSchemaValidator {
  constructor() {
    this.validator = new Validator();
    this.validator.addSchema(deploymentConfigSchema, '/ui.deployment.config.json');
  }

  validateUIDeploymentConfig(json) {
    return this.validator.validate(json, deploymentConfigSchema);
  }
}

const schemaValidator = new UiSchemaValidator();

export { schemaValidator };
