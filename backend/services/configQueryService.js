import * as path from 'path';
import { createRequire } from 'module';
import ConfigQueryService from '@adp/kubernetes/configQuery';
import uiServiceCollection from './uiServiceCollection.js';
import certificateManager from './certificateManager.js';
import { getLogger } from './logging.js';
import helpContentUtil from '../utils/helpContentUtil.js';
import pmService from './pmService.js';
import CONSTANTS from '../config/constants.js';

const require = createRequire(import.meta.url);
const helpContentMetadataSchema = require('../schemas/helpContentMetadata.schema.json');
const apiConfig = require('../config/old-api-config.json');

const {
  HELPCONTENT_BASEDIR,
  CONFIG_FETCH_RETRY_PERIOD,
  CONFIG_FETCH_MAX_RETRY_PERIOD,
  CONFIG_QUERY_NAME,
  CONFIG_QUERY_FILE_NAME,
  TLS_TYPE_INTERNAL_GUI,
  MAX_LOOP_ID,
} = CONSTANTS;

const logger = getLogger();

class HelpConfigQueryService extends ConfigQueryService {
  #finalizedDocuments;

  #finalizedGroups;

  #serviceDocuments;

  #serviceGroups;

  #serviceTest;

  constructor(options) {
    super(options);
    this.helpContentMap = {};
    this.#serviceDocuments = {};
    this.#serviceGroups = {};
    this.#finalizedDocuments = [];
    this.#finalizedGroups = [];

    this.on('service-config-deleted', ({ service }) => {
      delete this.helpContentMap[service.name];
      this.#deletePackageMetadata(service.name);
    });
  }

  get configMap() {
    return this.getConfig(CONFIG_QUERY_NAME);
  }

  async serviceHandler(serviceWithUrl) {
    await super.serviceHandler(serviceWithUrl);
    await this.handleHelpContentMap(serviceWithUrl);
  }

  async handleHelpContentMap(serviceWithUrl) {
    const serviceConfig = this.configMap[serviceWithUrl.name];
    const serviceUid = serviceConfig.uid;
    const packagesMetadata = serviceConfig.meta?.files;
    const contentFolderPath = path.join(process.cwd(), HELPCONTENT_BASEDIR, serviceUid);

    if (Array.isArray(packagesMetadata) && packagesMetadata.length) {
      await helpContentUtil.processPackagesMetadata(contentFolderPath, packagesMetadata, {
        ...serviceConfig,
        protocol: serviceWithUrl.protocol,
        uiContentConfigContext: serviceWithUrl.uiContentConfigContext,
      });
    }

    const packagesMetadataWithLocalPaths = packagesMetadata.map((packageMetadata) => ({
      ...packageMetadata,
      path: path.join(contentFolderPath, packageMetadata.name, packageMetadata.path),
    }));

    const packagesConfigList = packagesMetadataWithLocalPaths.map((packageMetadata) => ({
      ...helpContentUtil.getPackageConfig(packageMetadata),
      packageName: packageMetadata.name,
    }));

    packagesConfigList.forEach(
      ({ packageName, documents: packageDocuments, groups: packageGroups } = {}) => {
        const finalizedDocuments = this.#addDocs({
          packageName,
          packageDocuments,
          serviceUid,
          contentFolderPath,
          serviceName: serviceWithUrl.name,
        });

        // Fill the current full list of groups with documents only from the package
        this.#finalizedGroups.forEach((group, index) => {
          this.#finalizedGroups[index] = {
            ...group,
            documents: [
              ...(group.documents || []),
              ...finalizedDocuments.filter((document) => document.groupNames.includes(group.name)),
            ],
          };
        });

        this.#addGroups({
          packageName,
          packageGroups,
          serviceName: serviceWithUrl.name,
        });
      },
    );

    this.helpContentMap[serviceWithUrl.name] = packagesMetadataWithLocalPaths;
  }

  /**
   * Adds package documents if their names aren't in the list, complement its paths and returns the
   * added ones
   */
  #addDocs({ packageName, packageDocuments, serviceName, serviceUid, contentFolderPath } = {}) {
    const packageDocumentsFinalized = [];
    const documentsWithAllPaths = [];
    if (Array.isArray(packageDocuments) && packageDocuments.length) {
      const notConflictedDocuments = helpContentUtil.resolveNameConflicts({
        originItems: this.#finalizedDocuments,
        newItems: packageDocuments,
        serviceName,
        itemType: 'documents',
      });

      notConflictedDocuments.forEach((document) => {
        const initPath = document.path;
        const finalizedPath = path.join(
          apiConfig.content.prefix,
          serviceUid,
          packageName,
          initPath,
        );
        const finalizedDocument = {
          ...document,
          path: finalizedPath,
        };

        packageDocumentsFinalized.push(finalizedDocument);
        documentsWithAllPaths.push({
          ...finalizedDocument,
          initPath,
          localPath: path.join(contentFolderPath, packageName, document.path),
        });
      });

      if (!this.#serviceDocuments[serviceName]) {
        this.#serviceDocuments[serviceName] = [];
      }
      this.#serviceDocuments[serviceName].push(...documentsWithAllPaths);
      this.#finalizedDocuments.push(...packageDocumentsFinalized);
    } else {
      logger.info(`No documents were added from '${packageName}' package`);
    }
    return packageDocumentsFinalized;
  }

  /**
   * Adds package groups if their names aren't in the list and fill it with documents
   */
  #addGroups({ packageGroups, packageName, serviceName } = {}) {
    if (Array.isArray(packageGroups) && packageGroups.length) {
      const packageGroupsFinalized = helpContentUtil.resolveNameConflicts({
        originItems: this.#finalizedGroups,
        newItems: packageGroups,
        serviceName,
        itemType: 'groups',
      });
      if (!this.#serviceGroups[serviceName]) {
        this.#serviceGroups[serviceName] = [];
      }
      this.#serviceGroups[serviceName].push(...packageGroupsFinalized);

      // Fill only package groups with documents from the full list
      packageGroupsFinalized.forEach((group, index) => {
        packageGroupsFinalized[index] = {
          ...group,
          documents: this.#finalizedDocuments.filter((document) =>
            document.groupNames.includes(group.name),
          ),
        };
      });

      this.#finalizedGroups.push(...packageGroupsFinalized);
    } else {
      logger.info(`No groups were added from '${packageName}' package`);
    }
  }

  #deletePackageMetadata(serviceName) {
    this.#finalizedDocuments = helpContentUtil.removeItems(
      this.#finalizedDocuments,
      this.#serviceDocuments[serviceName],
    );
    this.#finalizedGroups = helpContentUtil.removeItems(
      this.#finalizedGroups,
      this.#serviceGroups[serviceName],
    );
    delete this.#serviceDocuments[serviceName];
    delete this.#serviceGroups[serviceName];
  }

  getDocuments() {
    return this.#finalizedDocuments;
  }

  getGroups() {
    return this.#finalizedGroups;
  }

  getTest() {
    return this.#serviceTest;
  }
}

const configQueryService = new HelpConfigQueryService({
  logger,
  certificateManager,
  pmService,
  serviceCollection: uiServiceCollection,
  configFetchRetryPeriod: CONFIG_FETCH_RETRY_PERIOD,
  configFetchMaxRetryPeriod: CONFIG_FETCH_MAX_RETRY_PERIOD,
  internalUiName: TLS_TYPE_INTERNAL_GUI,
  configQueryList: [
    {
      configName: CONFIG_QUERY_NAME,
      configFileName: CONFIG_QUERY_FILE_NAME,
      schema: helpContentMetadataSchema,
      maxLoopId: MAX_LOOP_ID,
    },
  ],
});

export default configQueryService;
