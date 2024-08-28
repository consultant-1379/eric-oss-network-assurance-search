import { createRequire } from 'module';

const require = createRequire(import.meta.url);
const helpPackageMetadataService1Pkg1 = require('../config-files/help-package-metadata-service-1-pkg-1.json');
const helpPackageMetadataService1Pkg2 = require('../config-files/help-package-metadata-service-1-pkg-2.json');
const helpPackageMetadataValidServicePkg1 = require('../config-files/help-package-metadata-valid-service-pkg-1.json');

export default class AdmZip {
  #filePath;

  constructor(filePath) {
    this.#filePath = filePath;
  }

  getEntries() {
    return [
      {
        entryName: 'help-package-meta-data.json',
        getData: () => {
          let packageMetadata;
          switch (true) {
            case /.*help-content-service-1.*pkg-1.zip$/.test(this.#filePath):
              packageMetadata = JSON.stringify(helpPackageMetadataService1Pkg1);
              break;
            case /.*help-content-service-1.*pkg-2.zip$/.test(this.#filePath):
              packageMetadata = JSON.stringify(helpPackageMetadataService1Pkg2);
              break;
            case /.*help-content-valid-service.*pkg-1.zip$/.test(this.#filePath):
            case /.*help-content-service-2.*pkg-1.zip$/.test(this.#filePath):
              packageMetadata = JSON.stringify(helpPackageMetadataValidServicePkg1);
              break;
            default:
              break;
          }
          return packageMetadata;
        },
      },
    ];
  }
}
