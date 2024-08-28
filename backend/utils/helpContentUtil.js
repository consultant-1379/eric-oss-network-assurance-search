import * as fs from 'fs';
import * as path from 'path';
import AdmZip from 'adm-zip';
import { schemaValidator } from './schemaValidator.js';
import CONSTANTS from '../config/constants.js';

import {
  normalizeURLSegment,
  normalizeURLEnding,
  fetchResponsesForProtocol,
} from './NetworkUtil.js';

import { getLogger } from '../services/logging.js';

const logger = getLogger();
const { PACKAGE_CONFIG_FILE_NAME } = CONSTANTS;

class HelpContentUtil {
  #getName({ name }) {
    return name;
  }

  createTargetDir(targetDir, fileMetadataName, configUid) {
    try {
      fs.mkdirSync(targetDir, { recursive: true });
      return true;
    } catch (e) {
      logger.error(
        `Failed to create subdirectory '${targetDir}' for help content package '${fileMetadataName}' (uid: ${configUid}): ${JSON.stringify(
          e,
        )}`,
      );
      return false;
    }
  }

  async processPackagesMetadata(contentFolderPath, packagesMetadata, config) {
    let failedResponse;

    await Promise.all(
      packagesMetadata.map(async (packageMetadata) => {
        const contentDir = path.join(contentFolderPath, packageMetadata.name);

        const url = `${normalizeURLEnding(config.serviceurl)}${normalizeURLSegment(
          config.uiContentConfigContext,
        )}${normalizeURLSegment(packageMetadata.path)}`;

        const parsedPath = path.parse(packageMetadata.path);
        const targetDir = path.join(contentDir, parsedPath.dir);
        const targetDirCreated = this.createTargetDir(targetDir, packageMetadata.name, config.uid);

        if (!targetDirCreated) {
          return;
        }

        logger.info(`Fetching from url: ${url}`);
        try {
          // eslint-disable-next-line no-await-in-loop
          const serviceResponse = await fetchResponsesForProtocol(config.protocol, url);
          if (serviceResponse.ok) {
            const successfulResponse = serviceResponse;
            const fileName = path.join(targetDir, parsedPath.base);
            // eslint-disable-next-line no-await-in-loop
            const buffer = await successfulResponse.clone().buffer();
            try {
              fs.writeFileSync(fileName, buffer);
              logger.info(
                `File ${fileName} has been created for help content package ${packageMetadata.name} (uid: ${config.uid})`,
              );
            } catch (e) {
              logger.error(
                `Failed to stream response to file ${fileName} for help content package ${
                  packageMetadata.name
                } (uid: ${config.uid}): ${JSON.stringify(e)}`,
              );
            }
          } else {
            failedResponse = serviceResponse;
          }
        } catch (err) {
          failedResponse = err;
        }
        if (failedResponse) {
          logger.warning(`Error: ${failedResponse?.message || failedResponse?.statusText}`);
        }
      }),
    );
  }

  getPackageConfig(packageMetadata) {
    let packageConfigData;
    try {
      const zip = new AdmZip(packageMetadata.path);
      const configFileZipEntry = zip
        .getEntries()
        .find((zipEntry) => zipEntry.entryName === PACKAGE_CONFIG_FILE_NAME);

      if (configFileZipEntry) {
        const configData = JSON.parse(configFileZipEntry.getData());
        const result = schemaValidator.validateHelpPackageMetadata(configData);

        if (result.valid) {
          packageConfigData = configData;
          // TODO: remove when the commit is ready to merge
          logger.info(`## ConfigData for package ${packageMetadata.path}`);
          logger.info(JSON.stringify(packageConfigData));
        } else {
          logger.error(
            `Validation failed for package metadata file '${path.join(
              packageMetadata.path,
              PACKAGE_CONFIG_FILE_NAME,
            )}': ${result.errors}`,
          );
        }
      }
      logger.error(`Metadata file wasn't found in a ${packageMetadata.path} package`);
    } catch (e) {
      logger.error(`Failed to read an archive ${packageMetadata.path}: ${e.message}`);
    }
    return packageConfigData;
  }

  resolveNameConflicts({ originItems, newItems, serviceName, itemType }) {
    const nonConflictedItems = [];
    const conflictedItems = [];
    const originItemNames = new Set(originItems.map(this.#getName));

    newItems.forEach((item) => {
      if (originItemNames.has(item.name)) {
        conflictedItems.push(item);
      } else {
        nonConflictedItems.push(item);
      }
    });

    if (conflictedItems.length !== 0) {
      const conflictItemNames = conflictedItems.map(this.#getName);
      logger.warning(
        `Conflict occurred during ${itemType} discovery for service ${serviceName}. The conflicting names are: ${conflictItemNames.join(
          ', ',
        )}`,
      );
    }

    return nonConflictedItems;
  }

  removeItems(originItems, removeItems = []) {
    const removeItemsNames = new Set(removeItems.map(this.#getName));
    return originItems.filter((item) => !removeItemsNames.has(item.name));
  }
}
const helpContentUtil = new HelpContentUtil();
export default helpContentUtil;
