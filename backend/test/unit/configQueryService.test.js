import { expect } from 'chai';
import { createRequire } from 'module';
import https from 'https';
import * as td from 'testdouble';
import nodeFetchMock from '../mocks/modules/nodeFetch.mock.js';
import admZipMock from '../mocks/modules/admZip.mock.js';
import PmServiceMock from '../mocks/services/pmServiceMock.js';
import CONSTANTS from '../mocks/modules/constants.js';
import Utils from '../Utils.js';

const require = createRequire(import.meta.url);
const helpContentMetadataService1 = require('../mocks/config-files/help-content-metadata-service-1.json');
const helpPackageMetadataService1Pkg1 = require('../mocks/config-files/help-package-metadata-service-1-pkg-1.json');
const helpPackageMetadataService1Pkg2 = require('../mocks/config-files/help-package-metadata-service-1-pkg-2.json');
const helpPackageMetadataService2Pkg1 = require('../mocks/config-files/help-package-metadata-valid-service-pkg-1.json');

const { getMergedPackageData } = Utils;

const SERVICE_WITH_BASEURL = {
  name: 'help-content-service-1',
  uid: 'help-content-service-1-1.0.2-2',
  serviceurl: 'help-content-service-1:4000',
  ingressBaseurl: 'http://localhost/context',
  protocol: 'http',
  uiContentConfigContext: CONSTANTS.DEFAULT_UI_CONTEXT,
};

const SERVICE_WITH_HTTPS = {
  name: 'help-content-valid-service',
  uid: 'help-content-valid-service-1.0',
  serviceurl: 'help-content-valid-service:4000',
  ingressBaseurl: undefined,
  protocol: 'https',
  uiContentConfigContext: CONSTANTS.DEFAULT_UI_CONTEXT,
};

const SERVICE_WITH_BASEURL_RESULT = {
  [SERVICE_WITH_BASEURL.name]: {
    ...SERVICE_WITH_BASEURL,
    meta: helpContentMetadataService1,
  },
};

const service1PackageData = getMergedPackageData({
  packageList: [
    {
      packageData: helpPackageMetadataService1Pkg1,
      packageName: 'doc-1',
      serviceUid: SERVICE_WITH_BASEURL.uid,
    },
    {
      packageData: helpPackageMetadataService1Pkg2,
      packageName: 'doc-2',
      serviceUid: SERVICE_WITH_BASEURL.uid,
    },
  ],
});

const service12PackageData = getMergedPackageData({
  existingDocuments: [...service1PackageData.documents],
  existingGroups: [...service1PackageData.groups],
  packageList: [
    {
      packageData: helpPackageMetadataService2Pkg1,
      packageName: 'service-doc-1',
      serviceUid: SERVICE_WITH_HTTPS.uid,
    },
  ],
});

const uiServiceCollectionMock = {
  on: () => undefined,
};

const certificateManagerMock = {
  getTLSOptions: () => ({
    secureContext: {},
    tlsAgent: new https.Agent(),
  }),
  on: () => true,
};

const fsMock = {
  promises: {
    mkdir: () => true,
  },
  writeFileSync: () => true,
};

describe.skip('Unit tests for ConfigQueryService', () => {
  let configQueryService;

  const mockModules = async () => {
    // These packages are invoked by the K8sQueryService of the @adp/kubernetes module
    await td.replaceEsm('node-fetch', null, nodeFetchMock);
    await td.replaceEsm('fs', fsMock);
    await td.replaceEsm('adm-zip', null, admZipMock);
    await td.replaceEsm('../../config/constants.js', null, CONSTANTS);
    await td.replaceEsm('../../services/uiServiceCollection.js', null, uiServiceCollectionMock);
    await td.replaceEsm('../../services/certificateManager.js', null, certificateManagerMock);
    await td.replaceEsm('../../services/pmService.js', null, PmServiceMock);

    configQueryService = (await import('../../services/configQueryService.js')).default;
    td.reset();
  };

  before(async () => {
    await mockModules();
  });

  it('can get help content metadata', async () => {
    await configQueryService.serviceHandler(SERVICE_WITH_BASEURL);
    expect(configQueryService.configMap).to.deep.eq(SERVICE_WITH_BASEURL_RESULT);
    configQueryService.deleteService(SERVICE_WITH_BASEURL);
  });

  it('can fetch zip files based on fetched config', async () => {
    await configQueryService.serviceHandler(SERVICE_WITH_HTTPS);
    expect(configQueryService.helpContentMap[SERVICE_WITH_HTTPS.name]).to.have.lengthOf(1);
    configQueryService.deleteService(SERVICE_WITH_HTTPS);
    expect(configQueryService.helpContentMap[SERVICE_WITH_HTTPS.name]).to.be.undefined;
  });

  it('can get help package metadata and parse it', async () => {
    await configQueryService.serviceHandler(SERVICE_WITH_BASEURL);
    await configQueryService.serviceHandler(SERVICE_WITH_HTTPS);

    expect(configQueryService.getDocuments()).to.deep.eq(service12PackageData.documents);
    expect(configQueryService.getGroups()).to.deep.eq(service12PackageData.groups);
  });

  it('when service is deleted, groups and documents are also deleted', async () => {
    configQueryService.deleteService(SERVICE_WITH_HTTPS);

    expect(configQueryService.getDocuments()).to.deep.eq(service1PackageData.documents);
    expect(configQueryService.getGroups()).to.deep.eq(service1PackageData.groups);

    configQueryService.deleteService(SERVICE_WITH_BASEURL);
    expect(configQueryService.getDocuments().length).to.be.eq(0);
    expect(configQueryService.getGroups().length).to.deep.eq(0);
  });
});
