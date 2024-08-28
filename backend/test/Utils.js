import { createRequire } from 'module';
import path from 'path';
import readyEndpoint from './mocks/serviceobjects/ready.endpointobject.js';
import k8sClientMock from './mocks/modules/k8s.client.mock.js';

const require = createRequire(import.meta.url);
const apiConfig = require('../config/old-api-config.json');

const RESOURCE_CHANGE_TYPE = {
  ADD: 'ADDED',
  DELETE: 'DELETED',
  MODIFY: 'MODIFIED',
};

const SERVICE_CHANGE_TYPE = {
  ADD: 'service-added',
  DELETE: 'service-deleted',
  MODIFY: 'service-modified',
};

function getMergedPackageData({ existingDocuments = [], existingGroups = [], packageList }) {
  const finalizedDocuments = [...existingDocuments];
  const finalizedGroups = [...existingGroups];
  const getName = ({ name }) => name;

  packageList.forEach(
    ({
      packageData: { documents: packageDocuments, groups: packageGroups },
      packageName,
      serviceUid,
    }) => {
      const existingDocumentNames = new Set(finalizedDocuments.map(getName));
      const existingGroupNames = new Set(finalizedGroups.map(getName));

      if (packageDocuments && packageDocuments.length) {
        packageDocuments.forEach((document) => {
          if (!existingDocumentNames.has(document.name)) {
            const commonPath = path.join(serviceUid, packageName, document.path);
            const completeDocumentObj = {
              ...document,
              path: `${apiConfig.content.prefix}/${commonPath}`,
            };
            finalizedDocuments.push(completeDocumentObj);
          }
        });
      }

      if (packageGroups && packageGroups.length) {
        const uniqueGroups = packageGroups.filter((group) => !existingGroupNames.has(group.name));
        finalizedGroups.push(...uniqueGroups);

        finalizedGroups.forEach((group, index) => {
          finalizedGroups[index] = {
            ...group,
            documents: finalizedDocuments.filter((document) =>
              document.groupNames.includes(group.name),
            ),
          };
        });
      }
    },
  );

  return {
    documents: finalizedDocuments,
    groups: finalizedGroups,
  };
}

async function requestDomainService(serviceObject, headless = false) {
  const servicePromise = k8sClientMock.Watch.servicesCallback(
    RESOURCE_CHANGE_TYPE.ADD,
    serviceObject,
  );
  if (!headless) {
    await k8sClientMock.Watch.endpointsCallback(
      RESOURCE_CHANGE_TYPE.ADD,
      Object.assign(readyEndpoint, { metadata: { name: serviceObject.metadata.name } }),
    );
  }
  return servicePromise;
}

export default {
  RESOURCE_CHANGE_TYPE,
  SERVICE_CHANGE_TYPE,
  getMergedPackageData,
  requestDomainService,
};
