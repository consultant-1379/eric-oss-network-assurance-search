import Ajv from 'ajv';
import addFormats from 'ajv-formats';

const ajv = new Ajv({
  allErrors: true,
  strict: true,
});
addFormats(ajv);

const dataModifyingAjv = new Ajv({
  allErrors: true,
  strict: true,
  useDefaults: true,
});
addFormats(dataModifyingAjv);

/**
 * Initialize the exported global Ajv instance with the main JSON schemas.
 *
 * @param {string} schemas - Array of schema objects which will be added to the Ajv instance
 */
async function loadSchemas(schemas) {
  schemas.forEach((schema) => {
    ajv.addSchema(schema);
    dataModifyingAjv.addSchema(schema);
  });
}

/**
 * Prettify AJV validation errors.
 *
 * @param {import('ajv').default} ajvInstance - The AJV instance.
 *
 * @returns {string[]} A list of prettified JSON schema validation error texts.
 */
function prettifyAjvErrorsText(ajvInstance) {
  if (!ajvInstance.errors) {
    throw new Error(
      "The AJV instance needs to contain an 'errors' property. " +
        "This error indicates 'ajv.validate()' was not called.",
    );
  }
  const errorsText = ajvInstance.errorsText(ajvInstance.errors, {
    separator: '\n',
    dataVar: '',
  });
  const errorTexts = errorsText
    .split('\n')
    .filter((error) => !error.includes('must match "then" schema'));
  return Array.from(new Set(errorTexts));
}

export { ajv, dataModifyingAjv, loadSchemas, prettifyAjvErrorsText };
