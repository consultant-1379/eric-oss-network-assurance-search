import Relation from '../../../model/Relation.js';

/**
 * Calculate related entities for each context then build and return it into indexRelation.
 *
 * @param {Array.<FullContext>} fullContexts - An array of `fullContext' objects. see $NAS/mock/indexer/openapi.yaml ⊃ FullContext.
 * @param {Map.<string, Set.<string>>} indexRelation - A Map for `context → related'.
 */
const indexContext = (fullContexts) => {
  const indexRelation = new Map();

  // calculate commons: bookRelation: context-field → contexts using this context-field
  const bookRelation = fullContexts.reduce((acc, curFullContext) => {
    curFullContext.contextFields.forEach((context) => {
      if (acc.has(context.id)) {
        acc.get(context.id).add(curFullContext.id);
      } else {
        acc.set(context.id, new Set([curFullContext.id]));
      }
    });
    return acc;
  }, new Map());

  // index related entities' ids
  for (const relatedToArray of bookRelation.values()) {
    Array.from(relatedToArray).forEach((curContext, i, relation) => {
      if (!indexRelation.has(curContext)) {
        indexRelation.set(curContext, new Set());
      }
      for (let j = 0; j < relation.length; j += 1) {
        if (j !== i) {
          indexRelation.get(curContext).add(relation[j]);
        }
      }
    });
  }
  return indexRelation;
};

/**
 * Given an array of `ContextType' objects, calculate relations and then group by ContextTypeId.
 *
 * @param {Array.<ContextType>} fullContexts - An array of `ContextType' objects. see $NAS/docs/api/spec/schemas/ContextType.yaml ⊃ ContextType.
 * @returns {Map.<ContextTypeId, Set.<ContextType>>} An array of `Relation' objects containing all entailed `RELATED_TO' relation of the context type with `contextTypeId'.
 *  See $NAS/docs/api/spec/schemas/Relation.yaml.
 */
const makeRelatedToMap = (fullContexts) => {
  const indexContextField = // fullContextItemName → fullContextItem
    new Map(fullContexts.map((contextFieldSpec) => [contextFieldSpec.id, contextFieldSpec]));

  const indexRelation = indexContext(fullContexts);

  // upgrade to related entities with the indexed related entities' ids
  for (const [context, relatedEntityIds] of indexRelation) {
    if (relatedEntityIds?.size) {
      const entityTypeIds = new Set(); // for removing duplicates
      const relatedEntities = Array.from(relatedEntityIds)
        .map((relatedEntityId) => indexContextField.get(relatedEntityId))
        .filter((entityType) => {
          if (!entityTypeIds.has(entityType.id)) {
            entityTypeIds.add(entityType.id);
            return true;
          }
          return false;
        });
      indexRelation.set(context, relatedEntities);
    } else {
      indexRelation.delete(context);
    }
  }

  // construct the `RELATED_TO' relations:
  return indexRelation;
};

/**
 * Looks up in the relationsMap by contextTypeId the list of fullcontexts to make a list of Relation objects
 *
 * @param {Object} req - The unique id of the context type: see $NAS/docs/api/spec/schemas/ContextTypeId.yaml.
 * @param {Object} relationsMap - An map of `fullContext' objects grouped by related contextTypeId.
 * @returns {Array.<Relation>} An array of `Relation' objects. See $NAS/docs/api/spec/schemas/Relation.yaml.
 */
const getFromRelatedMapByContextId = (req, relationsMap) => {
  const relations = relationsMap.get(req.query.contextTypeId) || [];
  return relations.map((relatedContextType) => new Relation('RELATED_TO', relatedContextType));
};

export { getFromRelatedMapByContextId, makeRelatedToMap };
