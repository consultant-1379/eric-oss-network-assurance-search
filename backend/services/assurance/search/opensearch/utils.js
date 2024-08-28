const removeKeys = ['startTime'];

/**
 * @description Extracts the hits from the doc
 * @param doc
 * @returns {*[]}
 */
function getSearchDoc(doc) {
  return doc?.hits?.hits || [];
}

/**
 * @description Extracts the hits from the doc
 * @param kpis
 * @returns {*{}}
 * @example { vi_A: 'N/A', vi_B: 'N/A'}
 */
function createDefaultKpiValue(kpis) {
  const objectWithDefaultKpi = {};
  kpis.forEach((metricType) => {
    const kpiFieldPreKey = `${metricType.id}`;
    objectWithDefaultKpi[kpiFieldPreKey] = 'N/A';
  });
  return objectWithDefaultKpi;
}

/**
 * @description Appends the document's MetricTypeId to the 'csac_column' key so that it's a unique identifier
 * @param {*} doc
 * @param {*{}} metricTypes
 */
function renameCsacColumnKey(doc, metricTypes) {
  const oldKey = 'csac_column';
  const metricTypeIds = metricTypes.map((m) => m.id);
  const metricTypeId = Object.keys(doc).filter((key) => metricTypeIds.includes(key));
  if (metricTypeId.length > 0 && oldKey in doc) {
    Object.defineProperty(
      doc,
      `${oldKey}_${metricTypeId[0]}`,
      Object.getOwnPropertyDescriptor(doc, oldKey),
    );
    delete doc[oldKey];
  }
  return doc;
}

/**
 * @description Removes unwanted keys and extracts the source of doc
 * @param doc
 * @param {*{}} metricTypes
 * @returns {Object}
 */
function cleanDoc(doc, metricTypes) {
  let sourceDoc = doc._source;
  removeKeys.forEach((key) => {
    delete sourceDoc[key];
  });
  sourceDoc = renameCsacColumnKey(sourceDoc, metricTypes);
  return sourceDoc;
}

/**
 * @description Prepends c_ for a given string
 * @param context
 * @returns {string}
 */
function makeContextKey(context) {
  const contextFieldPreKey = 'c_';
  return contextFieldPreKey + context;
}

/**
 * @description Returns a list of prepared context keys, given contexts
 * @param context
 * @returns {string[]}
 */
function createContextKeys(context) {
  return context.map(makeContextKey);
}

/**
 * @description Returns true if every value, for all given keys, match
 * @param data1
 * @param data2
 * @param contextKeys
 * @returns {boolean}
 */
function valuesMatchForKeys(data1, data2, contextKeys) {
  return contextKeys.every((key) => data1[key] === data2[key]);
}

/**
 * @description Returns an Object with its context(s) and its value(s)
 * @param doc
 * @returns {*[]}
 * @example { SNSSAI: '1:1', NF: 'AMF'}
 */
function extractContext(doc = {}) {
  const context = doc?.context || [];
  const contextKeys = createContextKeys(context);
  return contextKeys.reduce((acc, key) => {
    acc[key] = doc[key];
    return acc;
  }, {});
}

/**
 * @description Returns an array of Object with context and its value
 * @param contextList
 * @returns {*{}}
 * @example { c_SNSSAI: snssaiSet, c_NF: nfSet}
 */
function convertToContextMap(contextList) {
  return contextList.reduce((acc, context) => {
    for (const [key, value] of Object.entries(context)) {
      if (!acc[key]) {
        acc[key] = new Set();
      }
      acc[key].add(value);
    }
    return acc;
  }, {});
}

/**
 * @description Returns an array of Object with context and its value
 * @param contextList
 * @returns {*[]}
 * @example [{ match: { SNSSAI: '1:1'}}, { match:{ NF: 'AMF'}}, { match: { SNSSAI: '2:1'}}]
 */
function getContextObject(contextMap) {
  const contextObjectList = [];
  if (Object.entries(contextMap).length > 0) {
    for (const [key, value] of Object.entries(contextMap)) {
      for (const contextValue of value) {
        if (typeof contextValue !== 'undefined') {
          contextObjectList.push({
            match: {
              [key]: contextValue,
            },
          });
        }
      }
    }
  }
  return contextObjectList;
}

/**
 * @description Returns an array of Object with entity filters and its values
 * @param entityFilters
 * @returns {*[]}
 * @example [{ wildcard: { c_NF: { value: '3*'}}}, { wildcard: { c_NF: { value: 'N*'}}}]
 */
function getEntityFilterObject(entityFilters) {
  const contextFilterObjectList = [];
  entityFilters.forEach(({ entityType, searchPattern }) => {
    contextFilterObjectList.push({
      wildcard: { [entityType.id]: { value: searchPattern, case_insensitive: true } },
    });
  });
  return contextFilterObjectList;
}

/**
 * @description Returns an Array of Objects with kpi ranges
 * @param kpiList
 * @param metricFilters
 * @returns {*[]}
 * @example [{ range: { kpi1: { gte: 0, lte: 100 }}}, { range: { kpi2: { gte: 20, lte: 200 }}}, { range: { kpi4: { gte: 50}}}]
 */
function getKpiRange(kpiList, metricFilters) {
  const kpiObjectList = [];
  kpiList.forEach((kpi) => {
    const filterSpec = metricFilters.find((filter) => filter?.metricType.id === kpi);
    const rangeObj = {
      gte: filterSpec?.from ? filterSpec.from * 1 : 0,
    };
    const rangeObjPair = {};
    if (!filterSpec?.not) {
      if (filterSpec?.to) {
        rangeObj.lte = filterSpec.to * 1;
      }
    } else {
      if (filterSpec?.to) {
        rangeObj.gt = filterSpec.to * 1;
        delete rangeObj.gte;
      }
      if (filterSpec?.from) {
        rangeObjPair.lt = filterSpec.from * 1;
      }
      kpiObjectList.push({
        range: {
          [kpi]: rangeObjPair,
        },
      });
    }

    kpiObjectList.push({
      range: {
        [kpi]: rangeObj,
      },
    });
  });

  return kpiObjectList;
}

function getKpiExact(kpiList, metricFilters) {
  const kpiObjectList = [];
  kpiList.forEach((kpi) => {
    const filterSpec = metricFilters.find((filter) => filter?.metricType.id === kpi);
    if (filterSpec?.from && filterSpec?.to && filterSpec?.from === filterSpec?.to) {
      kpiObjectList.push({
        match: {
          [kpi]: filterSpec?.to,
        },
      });
    }
  });

  return kpiObjectList;
}

/**
 * @description Returns an Array of OpenSearch match query objects
 * @param {Array<Entity>} contextFields - An array of `Entity` objects
 * @example [ { "id": "AMF_BC", "type": { "id": "c_NF" } } ]
 * @returns {Array<Object>} An array of OpenSearch match query objects
 * @example [ { "match": { "c_NF": "AMF_BC" } } ]
 */
function getContextFacetMustQueryObjects(contextFields) {
  return contextFields.map((entity) => ({
    match: {
      [entity.type.id]: entity.id,
    },
  }));
}

export {
  getSearchDoc,
  renameCsacColumnKey,
  cleanDoc,
  createDefaultKpiValue,
  makeContextKey,
  createContextKeys,
  valuesMatchForKeys,
  extractContext,
  convertToContextMap,
  getContextObject,
  getEntityFilterObject,
  getKpiExact,
  getKpiRange,
  getContextFacetMustQueryObjects,
};
