import { getSearchDoc, cleanDoc, makeContextKey } from './utils.js';
import client from '../../../../utils/openSearchConnectionUtil.js';
import { validateOpenSearchResponseBody } from '../../../../utils/openSearchValidationUtil.js';
import { buildSearchContextsQuery } from './query.js';

/**
 * @description Creates context value inside results for transformSearchContextsData()
 * @param {object} doc
 * @eample { "c_Site": "BC", "c_SNSSAI": "1:2", "full_context": "SNSSAI_Site", "context": [ "SNSSAI", "Site" ], "xc_eyJTaXRlIjp7Im5hbWUiOiJTaXRlIiwibmFtZVR5cGUiOiJzdHJhaWdodCJ9LCJTTlNTQUkiOnsibmFtZSI6ImdlbmVyaWMiLCJuYW1lVHlwZSI6ImNvbG9uU2VwYXJhdGVkIn19": true, "value_context": "SNSSAI_Site_AMFMeanRegNbr2", "value_name": "AMFMeanRegNbr2", "vi_SNSSAI_Site_AMFMeanRegNbr2": 0, "xv_SNSSAI_Site_AMFMeanRegNbr2_eyIiOnsibmFtZSI6IkFNRk1lYW5SZWdOYnIyIiwidHlwZSI6ImludGVnZXIifX0A": true, "doc_id": "AMFMeanRegNbr2__SNSSAI_1:2__Site_BC", "offset": "28", "vintage": "DB327BFF1106DDB6CCB208C666A6919B" }
 * @returns {object}
 * @example { "type": { "id": "SNSSAI_Site", "contextFields": [ { "id": "SNSSAI" }, { "id": "Site" } ] }, "contextFields": [ { "id": "1:2", "type": { "id": "c_SNSSAI" } }, { "id": "BC", "type": { "id": "c_Site" } } ] }
 */
function createContext(doc = {}) {
  const aggregatedContext = {
    type: {
      id: doc?.full_context || 'Unknown',
      contextFields: [],
    },
    contextFields: [],
  };

  doc.context?.forEach((contextType) => {
    const cKey = makeContextKey(contextType) || '';
    const value = doc[cKey] || 'Unknown';

    // Filling the contextFields array with Entity objects
    aggregatedContext.contextFields.push({
      id: value,
      type: { id: cKey },
    });

    // Filling the type.contextFields array with EntityType objects
    aggregatedContext.type.contextFields.push({ id: contextType });
  });
  return aggregatedContext;
}

/**
 * @description Transforms documents received from open search to match API spec response for th /:index/search/contexts endpoint
 * @param {Array} docs
 * @param {object} query
 * @param {Integer} total
 * @returns {object}
 * @example { "offset": 0, "length": 1, "total": 6, "results": [ { "type": { "id": "SNSSAI_Site", "contextFields": [ { "id": "SNSSAI" }, { "id": "Site" } ] }, "contextFields": [ { "id": "1:2", "type": { "id": "c_SNSSAI" } }, { "id": "BC", "type": { "id": "c_Site" } } ] } ] }
 */
function transformSearchContextsData(docs, { offset, length }, total = 0) {
  if (total < length) {
    length = total - offset;
  }

  const results = [];
  docs.forEach((doc) => {
    results.push(createContext(doc));
  });

  return {
    offset,
    length,
    total,
    results,
  };
}

/**
 * @const getSearchContexts
 * @description Formulates a response given a proper request query
 * @param params
 * @param query
 * @returns {*{}}
 */
const getSearchContexts = async ({ params, query }) => {
  const res = await client.search(buildSearchContextsQuery(params.index, query));
  validateOpenSearchResponseBody(res.body);
  const total = res.body.hits.total.value;
  const cleanDocs = getSearchDoc(res.body).map((row) => cleanDoc(row, []));
  return transformSearchContextsData(cleanDocs, query, total);
};

export { createContext, transformSearchContextsData, getSearchContexts };
