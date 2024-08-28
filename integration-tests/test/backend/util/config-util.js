import { createRequire } from 'module';
import path from 'path';

const require = createRequire(import.meta.url);

const MOCK_BASE = '../../../../mock/domain-ui-generic/mock-help-content';
const SERVICE_VERSION = '1.0.0-0';

class ConfigUtil {
  constructor(servicesToTest) {
    this.SERVICES = servicesToTest;

    if (process.env.KUBERNETES_MASTER_NODE && process.env.SERVICE_PATH) {
      this.SERVICE_URL = `https://${process.env.KUBERNETES_MASTER_NODE}${process.env.SERVICE_PATH}`;
    } else {
      this.SERVICE_URL = 'http://localhost:3001';
    }

    this.DOCUMENTS_RESP = [];
    this.GROUPS_RESP = [];

    this.handlePackageData();
  }

  #getName({ name }) {
    return name;
  }

  handlePackageData() {
    this.SERVICES.forEach((serviceToTest) => {
      const configJson = JSON.parse(
        // eslint-disable-next-line import/no-dynamic-require
        JSON.stringify(require(`${serviceToTest.folderPath}/${serviceToTest.contentMetadata}`)),
      );

      const { files } = configJson;
      const packageList = files.map((file) => {
        let packageConfigData;

        try {
          const folderPath = file.path.split('.').slice(0, -1).join('.');
          // eslint-disable-next-line import/no-dynamic-require
          const packageConfigDataPath = path.join(
            MOCK_BASE,
            file.name,
            folderPath,
            'help-package-meta-data.json',
          );
          // eslint-disable-next-line import/no-dynamic-require
          packageConfigData = require(packageConfigDataPath);
        } catch (e) {
          console.log('Take the default config');
          // eslint-disable-next-line import/no-dynamic-require
          packageConfigData = require(`${MOCK_BASE}/default/help-package-meta-data.json`);
        }

        return {
          packageData: JSON.parse(JSON.stringify(packageConfigData)),
          packageName: file.name,
        };
      });

      packageList.forEach(
        ({ packageData: { documents: packageDocuments, groups: packageGroups }, packageName }) => {
          const existingDocumentNames = new Set(this.DOCUMENTS_RESP.map(this.#getName));
          const existingGroupNames = new Set(this.GROUPS_RESP.map(this.#getName));

          if (packageDocuments && packageDocuments.length) {
            packageDocuments.forEach((document) => {
              if (!existingDocumentNames.has(document.name)) {
                const commonPath = path.join(
                  `${serviceToTest.deploymentName}-${SERVICE_VERSION}`,
                  packageName,
                  document.path,
                );
                const completeDocumentObj = {
                  ...document,
                  path: path.join('/help-content/v1', commonPath),
                };
                this.DOCUMENTS_RESP.push(completeDocumentObj);
              }
            });
          }

          if (packageGroups && packageGroups.length) {
            const uniqueGroups = packageGroups.filter(
              (group) => !existingGroupNames.has(group.name),
            );
            this.GROUPS_RESP.push(...uniqueGroups);

            this.GROUPS_RESP.forEach((group, index) => {
              this.GROUPS_RESP[index] = {
                ...group,
                documents: this.DOCUMENTS_RESP.filter((document) =>
                  document.groupNames.includes(group.name),
                ),
              };
            });
          }
        },
      );
    });
  }

  getServiceUrl() {
    return this.SERVICE_URL;
  }

  getDocumentsResponse() {
    return this.DOCUMENTS_RESP;
  }

  getGroupsResponse() {
    return this.GROUPS_RESP;
  }
}

export default ConfigUtil;
