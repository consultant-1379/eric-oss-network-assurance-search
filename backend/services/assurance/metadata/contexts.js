import ContextType from '../../../model/ContextType.js';
import EntityType from '../../../model/EntityType.js';
import { AppError } from '../../../utils/appError.js';
import configManager from '../../../config/configManager.js';

/**
 * @description Take contexts from the customization file and modify a structure for optimization
 * @param {object} customizationFile
 * @returns {object}
 * @example { "tac": { "name": "My TAC", "description": "Description for TAC" }, "nf": { "name": "My NF", "description": "Description for NF" }, "snssai": { "name": "My snssai", "description": "Description for SnssaiI" }}
 */
function modifyCustomizationContextsFileStructure(customizationFile) {
  const contextObj = {};
  customizationFile.contexts.forEach((context) => {
    const { contextFields, name, description } = context;
    contextObj[JSON.stringify(contextFields.sort())] = { name, description };
  });
  return contextObj;
}

const customizedContext = modifyCustomizationContextsFileStructure(
  configManager.getCustomizationConfig(),
);

/**
 * @description Parses context fields from the context type ID and returns
 * a list of valid EntityType model instances.
 * @param {array} indexerContexts
 * @example [ { "name": "SNSNSN", "displayName": "My SNSNSN", "documentName": "c_SNSNSN", "description": "Sauce Near Soup Never Sounds Normal" } ]
 * @returns {array}
 * @example [ { "id": "c_SNSNSN", "name": "My SNSNSN", "description": "Sauce Near Soup Never Sounds Normal" } ]
 */
function createContextFields(indexerContexts) {
  return indexerContexts.map((indexerContextObject) =>
    EntityType.constructFromObject({
      id: indexerContextObject?.documentName,
      name: indexerContextObject?.displayName || indexerContextObject?.name,
      description: indexerContextObject?.description,
    }),
  );
}

/**
 * @description Transforms the data given by the Indexer API into a valid Metadata Contexts response along with applying context customization
 * @param {array} indexerData
 * @example [ { "documentName": "PN_SNSNSN", "fullContext": [ { "name": "PN & SNSNSN", "context": [ { "name": "SNSNSN", "displayName": "My SNSNSN", "documentName": "c_SNSNSN", "description": "Sauce Near Soup Never Sounds Normal" }, { "name": "PN", "displayName": "Nationality", "documentName": "c_PN", "description": "Person Nationality" } ] } ] } ]
 * @returns {array}
 * @example [ { "id": "PN_SNSNSN", "name:" "My PN & SNSNSN", "description": "PN and SNSNSN description here", "contextFields": [{"id": "c_PN", "name": "Nationality", "description": "Person Nationality"},{ "id": "c_SNSNSN", "name": "My SNSNSN", "description": "Description for SNSNSN" }]}]
 */
function transformMetadataContexts(indexerData = []) {
  if (Array.isArray(indexerData)) {
    return indexerData
      .map((indexerFullContextObject) =>
        indexerFullContextObject?.fullContext.map((indexerFullContextElem) => {
          const contextFields = JSON.stringify(
            indexerFullContextElem.context.map((context) => context.name).sort(),
          );
          const { name, description } = customizedContext[contextFields] || {};
          return ContextType.constructFromObject({
            id: indexerFullContextElem?.name,
            contextFields: createContextFields(indexerFullContextElem?.context),
            ...(name && { name }),
            ...(description && { description }),
          });
        }),
      )
      .flat(1);
  }
  throw new AppError(400, 'Invalid request to Indexer Microservice', 400, 'Bad Request');
}

export { createContextFields, transformMetadataContexts, modifyCustomizationContextsFileStructure };
