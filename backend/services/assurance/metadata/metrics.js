import cloneDeep from 'lodash/cloneDeep.js';
import isEmpty from 'lodash/isEmpty.js';
import MetricType from '../../../model/MetricType.js';
import configManager from '../../../config/configManager.js';

/**
 * @description Take metrics from the customization file and modify a structure for optimization
 * @param {object} customizationFile
 * @returns {object}
 * @example { "metric1": { "category": [ "category1", "category2" ], "groups": { "group1": [ "family1", "family3" ], "group2": [ "family2" ] }, "query": "${metricName}{snssai=~\"sn.*-4\"}" } }
 */
function modifyCustomizationMetricsFileStructure(customizationFile) {
  return customizationFile.metrics.reduce((metricsObj, metric) => {
    metricsObj[metric.name] = metric;
    delete metricsObj[metric.name].name;
    return metricsObj;
  }, {});
}

const customizedMetric = modifyCustomizationMetricsFileStructure(
  cloneDeep(configManager.getCustomizationConfig()),
);

/**
 * @description Transforms the data given by the Indexer API (/v1/indexer-info/spec/values-for-fullcontext) into a valid Metadata Metrics response
 * @param {object} data A response from the assurance indexer API
 * @returns {array}
 * @example [{"id": "PDUSessionEstSR","metadata":{"documentId":"vi_SNSSAI_NSI_PDUSessionEstSR"},"name": "PDU Session Est SR","valueType": "integer","description": "PDUSessionEstSR Description","unit": "errors/minute"},{ "id": "SessionModificationReqRcvd", "metadata":{"documentId":"vi_SNSSAI_NSI_SessionModificationReqRcvd"}}]
 */
function transformMetadataMetrics(data = {}) {
  if (data?.value.length === 0) {
    return [];
  }

  return data?.value.map(({ name, valueDocumentName, displayName, type, description, unit }) => {
    let baseObj = {
      id: valueDocumentName,
    };
    baseObj = displayName ? { ...baseObj, name: displayName } : { ...baseObj, name };
    baseObj = type ? { ...baseObj, valueType: type } : baseObj;
    baseObj = description ? { ...baseObj, description } : baseObj;
    baseObj = unit ? { ...baseObj, unit } : baseObj;
    const visualization = customizedMetric[name];
    baseObj = !isEmpty(visualization) ? { ...baseObj, visualization } : baseObj;

    return MetricType.constructFromObject({
      ...baseObj,
    });
  });
}

export { transformMetadataMetrics, modifyCustomizationMetricsFileStructure };
