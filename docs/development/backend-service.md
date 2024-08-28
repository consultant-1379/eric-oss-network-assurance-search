# Node.js Skeleton Service

Node.js Skeleton Service is the backend for the Help Center.
It performs auto-discovery of deployed UI applications in the Kubernetes (K8S) cluster
based on Kubernetes parameters, and collects help content to be displayed on the Help Portal.

## Functionalities

Currently the NodeJS Node.js Skeleton service supports several different functionalities and use cases.
To get an overview check the marketplace docs: [Service User Guide](../release/content/service_user_guide.md).

Current:

- discovers UI application based on Kubernetes API
- provides performance metrics
- produces fault indications
- can be deployed with Helm
- is configurable via Helm charts
- serves the Help Portal
- implements REST APIs
  - APIs implemented can be viewed [here](../api/api-specs.md)

### Fault indication producing

Node.js Skeleton `fMHandler` module provides API to produce fault indications. Fault indication service
processes fault indications into alarms according to fault-to-alarm map (`eric-oss-network-assurance-search-faultmappings-configmap`).

Node.js Skeleton Kafka producer sends indication listed in `faultIndicationDefaultsMap.json` file.
Fault indication can be passed via short alias. For example,

```js
fMHandler.produce({ fault: 'SERVICE_UNAVAILABLE' });
```

will produce fault indication with name `service_unavailable` and all parameters by default.
To override default parameters use additional field, "customConfig"-

```js
fMHandler.produce({ fault: 'SERVICE_UNAVAILABLE', customConfig: { severity: 'Critical' } });
```

Corresponding to the `faultIndicationDefaultsMap.json`, configmap `eric-oss-network-assurance-search-faultmappings-configmap`
contains alarms data.

Fault Handler service will produce an alarm only if there will be an item of equal to the received FI
`faultName` and `serviceName`.

To add Fault Indication/Alarm:

1. Edit `faultIndicationDefaultsMap.json`. Add fault indication default config with an alias name as
   a key.
   Required fields:

   - `faultName`
   - `serviceName`
   - `version`
     It is also strongly recommended to add `expiration` field with value > 0.

   Valid minimal setup for a new entity:

   ```json
   {
     "NEW_FAULT_ALIAS_NAME": {
       "faultName": "new_fault",
       "version": "0.2",
       "serviceName": "eric-oss-network-assurance-search",
       "expiration": 5000
     }
   }
   ```

2. Edit `eric-oss-network-assurance-search-faultmappings.json`. Add an Alarm configuration. `faultName`
   field is required. `code` field is mandatory. Alarms codes could be taken as of sequential to
   existing ones, or obtained using registration process (Minor Type) described in
   `https://erilink.ericsson.se/eridoc/erl/objectId/09004cff86e5863f?docno=1/00021-FCP1305518Uen&action=approved&format=pdf`

   Valid minimal setup for new entry, corresponding to the FI setup above -

   ```json
   {
     "faultName": "new_fault",
     "code": 15007749, // next sequential number
     "defaultDescription": "New alarm default description",
     "vendor": 193, // for E// it should be 193
     "defaultSeverity": "Critical" // Clear|Warning|Minor|Major|Critical
   }
   ```

Fault indications are being validated by schema `faultIndication.json` before sent.
In case of invalid FI, error will be logged.

For more info on how to add FI/Alarm refer to the [Service User Guide](../release/content/service_user_guide#performance-management)

More info on Alarm Handler Service:
`https://adp.ericsson.se/marketplace/alarm-handler/documentation/7.0.0/dpi/service-user-guide#alarm-state-indication`

Kafka documentation:
`https://kafka.apache.org/documentation/`

### API Endpoints

The REST API endpoints are listed below:

#### UI config endpoint

- GET `/internal-api/uiConfig`
  - Sends the current ui-config JSON to the UI. The config is constructed from the helm values.

#### Metrics API

- GET `/metrics`
  - Provides metrics data in Prometheus compatible format

## Technology

The service itself is a NodeJS application based on the ExpressJS framework.
It is bundled into a docker image, which can be deployed to Kubernetes cluster with Helm.

## NPM tasks

These are the common NPM tasks for the Node.js Skeleton.

```bash
npm install                 # Install dependencies
npm start                   # start in normal mode
npm run start:watch         # if source is changed the server is reloaded
npm run start:debug         # start in debug mode
npm run lint                # lint source code
npm run test                # run all tests
npm run test:timeout        # run all tests, with an overall timeout
npm run test:generateReport # generate HTML report
npm run test:generateReport:timeout # generate HTML report, with an overall timeout
npm run test:coverage       # run mocha tests with coverage report
```

_Note: development server runs on `http://localhost:3000`_

## Mock services

As the Node.js Skeleton uses the Kubernetes API a running Kubernetes cluster with some service
is required for development. For that there are some mock service which can return
proper configurations and data. See [Mock Services](mock-services.md)

The Node.js Skeleton can be then started in standalone mode locally or can be deployed into the cluster.

## Start Locally

Local execution method:

- start Node.js Skeleton with npm:

  run `npm run start:watch`

## Performance metrics

Node.js Skeleton `pmService` module provides API for collecting different performance metrics

In order to collect metrics from the application `pmService` must be initialized
by calling `pmService.setupPromClient()` and pointed to the parent express app
by calling `pmService.applyPromMiddleware(app)` by default this will start collecting some [Default Metrics](../release/content/service_user_guide.md)
as well counting requests to specific endpoints stated in `backend-service-config-default.json`,
and create additional endpoint `/metrics`.
applyPromMiddleware has optional second parameter, object that contains additional metric gathering [settings](https://www.npmjs.com/package/express-prom-bundle).

A custom counter or gauge can be created for other purposes by using `pmService.createMetric` method.
Example:

```js
pmService.createMetric('gauge', { name: GAUGE_METRIC_NAME });
pmService.createMetric('counter', {
  name: apiName,
  help: `Amount of requests to the "${url}" API`,
  labelNames: ['endpoint', 'method', 'code'],
});
```

To delete a metric call `pmService.deleteMetric(metricName)` and pass it's name as a parameter.

To check if metrics collection is enabled by service configs use `pmService.isEnabled()`.

To add a counter for counting requests to specific endpoints, list said endpoints under
`dependencies.prometheus.endpointsToCountRequests` in `backend-service-config-default.json`
by providing its full path.

```json
{
  "dependencies": {
    "prometheus": {
      "enabled": true,
      "appName": "eric-oss-network-assurance-search",
      "endpointsToCountRequests": ["/ui", "/internal-api/uiConfig"],
      "tls": {
        "verifyServerCert": false,
        "sendClientCert": false
      }
    }
  }
}
```

!> If you add new metrics or modify existing ones, you must also update the metadata file
`docs/release/metadata/eric-oss-network-assurance-search_pm_metrics.json` according to
[documentation](https://confluence.lmera.ericsson.se/pages/viewpage.action?pageId=261989118).\
Then run `bob generate-metrics-doc` to update **Provided metrics** section in the
`service_user_guide.md` documentation locally.\
Do not update `pm_metrics_fragment.md` manually. It will be overwritten in the CI/CD steps

Please note, that currently the pm-server doesn't work with custom certificates.

## Debug

The next sections describe how to debug Node.js Skeleton with the preferred IDE, VSCode.
These instruction are mostly generic for NodeJS applications.

### Local

VS Code supports the _Auto Attach_ feature for local Nodejs processes started in the _integrated_
terminal. With this, it is very easy to debug locally:

- turn on Auto Attach (eg. in the bottom status bar or in settings.json)
- start the server normally _in VS Code integrated terminal_
- VS Code detect the nodejs process and automatically attaches to it
- start adding breakpoint to the source

!> Auto attach only triggered for the integrated terminal. For NPM scripts it may not be triggered,
then open a `Javascript Debug Terminal`, where debug is attached to any NodesJS process started
from there.

If the process is started from an external terminal, first open up the debug port,
then use the `Attach to NodeJS` launch option to attach the debug session to the process.

### Tests

_Auto Attach_ works for tests as well. By starting the tests with `npm run test` the
debugger session attached both to the Mocha tests and the Node.js Skeleton as well.
It means breakpoint can be added to tests and the source code as well.

Also there are two related launch mode in VS Code:

- `Run current test file in Backend`: to start running the currently open test file either it contains
  unit, component or integration testcases.
- `Run all tests in Backend`: run all unit and component tests

#### Test Explorer

Other option is to use the (Mocha) Test Explorer extension. If installed it can be accessed
at the left side navigational icons. When selected the left panel will show all mocha tests
for the backend project. (Currently it is not working for GUI tests.)

The tests can be executed at once or one by one. When a test case fails the test file can be
opened with the failing lines highlighted. Also the test file will have inline controls above
test cases or describe blocks to execute or debug them in a more granular way.

Note: the Test Explore executes tests in different NodeJs processes and only gets the result
and the error message for the failing testcase. To get the error message the failing testcase
has to be selected first, it is not visible on the normal output console.

### Remote debugging

To remotely debug the Node.js Skeleton start it in debug mode: `npm run start:debug`.
It starts the server by opening debug port on **9229**.
Then launch the _Attach to Node.js Skeleton..._ debug mode and start your debug session.

?> Check the launch config for proper port and address, as the default is
configured for Kubernetes based debugging.

?> Increase the liveness probe timeout to avoid unwanted restarts.

If the application runs in Kubernetes then the debug port has to be tunneled locally.
For that define a NodePort or use the `kubectl port-forward` command.

The mock service is setup to have configured and tunneled debugging ports.

?> Also check the [Live debugging](./debugging.md) chapter for more options.

#### Generally how-to debug NodeJS app remotely

- start the app in debug mode
  - add the --inspect parameter
  - _note_: by default it binds to localhost, but it can be changed (eg. --inspect=0.0.0.0:9229)
  - it can be defined in the Deployment config
- tunnel the port locally
  - a. use a NodePort, for this the inspect port must bind to an external ip (or 0.0.0.0)
  - b. forward it by kubectl: `kubectl port-forward *PODNAME* 9229`
- update debug config in launch.json for VSCode
- or use the Chrome Debugger

## Configuration

Several configuration options are available for the application. Generally these config files
are mounted as Kubernetes configmaps into the pods and generated by helm or other
services. The JSON files are generated by Helm templates from yaml, typically defined
in the values.yaml. Every config file has an internal JSON format and an external yaml format
used in Helm. Here you will find reference for the internal JSON formats.

### Runtime

The application reads its configuration from json files at startup.
The **default** configuration `backend\config\backend-service-config-default.json`
is deep-merged with the runtime configuration. The **runtime** configuration is read from
`backend\config\backend-service-config\backend-service-config.json`.
When deployed with Helm a configmap is mounted to this location overwriting the files
in that directory.

This is the current content of the configuration, but always check the above jsons as
_this example may be out of date_.

```json
{
  "k8sLabelPropertyName": "help.ericsson.com/part-of",
  "k8sLabelValue": "workspace-gui",
  "k8sQueryServiceEnabled": true,
  "configQueryProtocolAnnotation": "ui.ericsson.com/protocol",
  "configQueryPortAnnotation": "ui.ericsson.com/port",
  "appNameLabel": "app.kubernetes.io/name",
  "appVersionLabel": "app.kubernetes.io/version",
  "logging": {
    "defaultLogLevel": "info",
    "stdoutEnabled": true,
    "syslogEnabled": true
  },
  "faultIndications": {
    "enabled": false
  },
  "ingressHost": "localhost",
  "ingressPort": "80",
  "discoverIngress": false,
  "useHttps": false,
  "verifyClientCertificate": "optional",
  "enforcedTLS": "required",
  "servicePort": 3000,
  "dependencies": {
    "logtransformer": {
      "enabled": true,
      "syslogHost": "eric-log-transformer",
      "syslogFacility": "local0",
      "syslogAppName": "eric-oss-network-assurance-search",
      "tls": {
        "verifyServerCert": true,
        "sendClientCert": true
      }
    },
    "prometheus": {
      "enabled": true,
      "appName": "eric-oss-network-assurance-search",
      "endpointsToCountRequests": ["/ui", "/internal-api/uiConfig"],
      "tls": {
        "verifyServerCert": false,
        "sendClientCert": false
      }
    },
    "faultHandler": {
      "enabled": false,
      "tls": {
        "verifyServerCert": true,
        "sendClientCert": true
      },
      "clientId": "eric-oss-network-assurance-search",
      "brokerHostname": "eric-data-message-bus-kf",
      "producerTopic": "AdpFaultIndication",
      "serviceName": "eric-oss-network-assurance-search"
    },
    "internalUi": {
      "enabled": true,
      "tls": {
        "verifyServerCert": true,
        "sendClientCert": true
      }
    },
    "httpClient": {
      "enabled": true,
      "tls": {
        "verifyServerCert": true,
        "sendClientCert": true
      }
    }
  }
}
```

### UI Configuration

It is possible to set some deployment options for the help center ui from the backend. This
config has the same merging mechanism as the backend config. The default config file is `backend/config/frontend-config-default.json`
which is merged with `backend/config/backend-service-config/frontend-config.json`.
This file contains configuration options for the frontend.

At the moment the file contains the following settings:

- log level for the ui
- The API routes are read from the `backend/config/api-config.json` file and merged to this config

```json
{
  "logging": {
    "logLevel": "info"
  }
}
```

### API Config

The `backend/config/api-config.json` contains the URL configs for the different API endpoints.
It is split by the main APIs, and each API has a `prefix` and `routes` attribute.
This file is used by the Node.js Skeleton internally, and the content of this file is merged into the
UIConfig to pass the actual configuration to the UI.

There is a copy at `frontend/src/config/api-config.json`, as at docker build only the
frontend folder is copied into the image. There is a unit test in Node.js Skeleton to check the consistency
between these files.

### REST API HTTPS

The webservice can be started with HTTPS on by setting the `useHttps` in the runtime config to `true`.
For that the service requires TLS certificates which shall be mounted to the
`/runtime/server/certificates/sip_tls` directory. The service will
watch for certificate changes and reconfigure the server with the new files.

The certificates can be generated by the `eric-sec-sip-tls` ADP service. The CI Chart contains the
required components as requirements:

- eric-sec-key-management
- eric-sec-sip-tls
- eric-data-distributed-coordinator-ed

To install them set the `eric-sec-sip-tls.enabled` to `true` in the `values.yaml`.
If necessary execute a helm repo update.

If using tilt set the `deployCiChart` attribute to true in the tilt config to deploy the CI chart.

### Internal mTLS

The internal communication can be also secured with TLS by setting `global.security.tls.enabled` in
the `values.yaml` to true.
For that the service requires TLS certificates which shall be mounted to the
`/runtime/server/certificates/<target-service-name>` directory. The service will
watch for certificate changes and reconfigure the service with the new files.

The certificates can be generated by the `eric-sec-sip-tls` ADP service the same way as for [HTTPS](#rest-api-https).
For more information, see:
`https://adp.ericsson.se/marketplace/service-identity-provider-tls`

## Introduce new target service with internal mTLS

Internal communication in a K8S cluster can be protected by TLS.
The SIP/TLS microservice generates and renews the required certificates and keys that are needed to establish
a cluster internal TLS connection between a Service Provider and a Service Consumer.
K8S Secrets are used as the distribution mechanism for the keys and certificates.
The Service Providers (servers) and Service Consumers (clients) can mount these secrets to their file
system in order to access the files.

In Node.js Skeleton the CertificateManager reads and watches the certificates based on the
`configuration.dependencies` section of the helm config.
The `eric-log-transformer` syslog-integration provides an example how TLS certificates can be configured
and used.

The following steps are required:

### Define SIP/TLS client InternalCertificate

An InternalCertificate K8S resource should be created to provide the client certificate for
the server (Example: sip-tls-log-transformer-client-cert.yaml).\
The `certificate.issuer.reference` should be set to the primary Certificate Authority (CA) of the
given service.\
CertificateManager expects that the `kubernetes.certificateName` is set to `cert.pem` and the `kubernetes.privateKeyName`
is set to `key.pem`.

Example of a client InternalCertificate (without metadata annotations):

```yaml
{{- $global := fromJson (include "eric-oss-network-assurance-search.global" .) -}}
{{- if $global.security.tls.enabled }}
apiVersion: siptls.sec.ericsson.com/v1
kind: InternalCertificate
metadata:
  name: {{ include "eric-oss-network-assurance-search.name" . }}-service-name-client-cert
spec:
  kubernetes:
    generatedSecretName: <secret_name>
    certificateName: cert.pem
    privateKeyName: key.pem
  certificate:
    subject:
      ## The Subject Common Name (CN) of the certificate.
      ## This typically corresponds to the domain name of the service or a client identifier.
      cn: {{ include "eric-oss-network-assurance-search.name" . }}
    subjectAlternativeName:
      populateKubernetesDns: false
    issuer:
      ## The identifier for the Issuer CA. Decides from which CA to request the certificate.
      reference: eric-log-transformer-input-ca-cert
    extendedKeyUsage:
      tlsClientAuth: true
      tlsServerAuth: false
{{- end }}
```

### Mount K8S Secrets

A K8S Secret should be mounted with the same name as defined in the `kubernetes.generatedSecretName`
property of the client certificate.\
CertificateManager expects the certificates and keys to be mounted under the
`/runtime/server/certificates/<service_name>` directory.

Example volumes/volumeMounts config of the related Secret in the `deployment.yaml` file:

```yaml
volumeMounts:
  {{- if $global.security.tls.enabled }}
  - name: service-clientcert-volume
    mountPath: /runtime/server/certificates/<service_name>
    readOnly: true
  {{- end }}
volumes:
  {{- if $global.security.tls.enabled }}
- name: service-clientcert-volume
  secret:
    secretName: <secret_name>
{{- end }}
```

The common ADP services can be authenticated using the `eric-sec-sip-tls-trusted-root-cert`
which is already added to the helm config. If the Service Provider requires a different certificate,
it should also be added and mounted in the helm config.

### Add dependencies config to the `values.yaml`

CertificateManager expects TLS enabled services to have a TLS configuration section
under `configuration.dependencies`.

Also CertificateManager only loads certificates for services where the `enable` attribute is true.
Depending on the `verifyServerCert` and `sendClientCert` attributes, different set of certificates
are handled by CertM.

The expected format of the TLS config of any new service:

```yaml
configuration:
  dependencies:
    <service_name>:
      enabled: true # set it if the dependency is needed. E.g. when syslog logging is turned on
      tls:
        verifyServerCert: true # optional, default value is true
        sendClientCert: true # optional, default value is true
```

### Using the certificates

If all the above steps are configured properly, keys and certificates should be available by CertificateManager.
It creates a `tlsAgent` object with a `secureContext` object in its `options` property using the certificates.
This object contains the certificates and other TLS related settings for the communication.
The tlsAgent can be accessed by `getTlsAgent(serviceName)` method.

### Testing in remote cluster with internal TLS enabled

To test in remote cluster with live dependencies, check the [Remote Dev Env](remote-dev-env.md) Guide.

Enable SIP-TL, Global mTLS and Logtransformer in the CI `values.yaml`.

## Test considerations

There are different level of tests which requires different techniques. Generally everything
shall be tested on the lowest possible level, as it gives the quickest feedback.

### Test framework

The Mocha test framework is used for organizing and executing tests for NodeJS.
Tests and related utilities are under the `tests` directory, generally every `*.js` file
is considered as test suite and will be executed if not specified otherwise.
The framework can be configured by editing the `.mocharc.js` file.

Also Node.js Skeleton has some execution mode dependant logic, which checks for the `NODE_ENV` env variable.
For test runs it is advised to set the `NODE_ENV=test`. The test executor npm scripts set it,
so these are the preferred way to execute tests.

!> Please minimise the number of logic which runs differently in tests.

With the default settings of Mocha the test execution waits for every background process to stop.
This means open sockets, running promises and other asynchronous operations. If tests do not clean up
the components then Mocha will never stop.
Although there is an option to forcefully stop processes when all tests are executed, it is not
advised to do so, as it can cover potential issues.
Instead, to avoid CI to hang in these cases an overall timeout is added to the test executor scripts.

!> To start tests with this timeout use the `npm run test:*:timeout` npm scripts.

Some testing tips:

- `.only`, `.skip` modifiers can be added to `describe` and `it` blocks to set explicitly what to run

### Unit tests

Unit tests are under the `tests/unit` folder.

The main goal of a unit test is to test js modules in _isolation_.
Every module has an exported API, these methods shall be tested by tests. Good unit tests can describe
how a given API call shall behave, so it can help other developers to understand the code better.

### Component tests

Component tests are under the `tests/component` folder.

Component tests are higher level tests to test interactions between real module implementations.
As these tests can depend on the internal module implementations it can make them fragile,
so it is preferred to move as many test cases to unit level as possible.

### Integration tests

The backend integration tests are in the root of the git repo in the integration-tests/test/backend folder.

Integration tests of the backend are tests ensuring the backend integration into the Kubernetes cluster
e.g. all services deployed to the K8S cluster are discovered and help content is available.

### Mock dependencies

For mocking module dependencies the [testdouble](https://github.com/testdouble/testdouble.js) library
is used. It is preferred to mock all or most dependencies otherwise tests will be fragile.
And mock the direct dependencies not transitive ones if possible.

> Example: `ConfigManager` reads json files with the `fs` module. If there is a module depending on
> `ConfigManager`, then it may be a simple solution to mock `fs` to return the awaited json files.
> However it is recommended to mock the `ConfigManager` instead, as any changes in its implementation
> may break tests of other modules.

### Mock properties

For mocking properties need to use `td.replace` to automatically replace properties if they're
referenced on an object. But by default mocked function are copied
from real function and mocked function doesn't contain the logic of real function. If it is
necessary to call a real function and don't need to use `td.when()` functionality then
`td.spyProp()` method can be used. But if it is needed to use `td.when()` then
`td.func()`, `td.replace()` methods can be used for configuring calling real function.

Example:

```javascript
const pmServiceMock = {
  createMetric(metricName) {
    console.log('This function is called');
    return metricName;
  },
};
it('mocking createMetric property', () => {
  const createMetric = pmServiceMock.createMetric.bind(pmServiceMock);
  pmServiceMock.createMetric = td.func(createMetric);
  pmServiceMock.createMetric('name');
  td.verify(pmServiceMock.createMetric('name'), { times: 1 });
  td.reset();
});
```

or use `td.replace()`

Example:

```javascript
const pmServiceMock = {
  createMetric() {
    console.log('This function is called');
  },
};
it('mocking createMetric property', () => {
  const createMetricSpy = td.replace(
    pmServiceMock,
    'createMetric',
    pmServiceMock.createMetric.bind(pmServiceMock),
  );
  createMetricSpy();
  td.verify(createMetricSpy(), { times: 1 });
  td.reset();
});
```

### Mock filesystem

There are modules which read files from the filesystem. [Mock-fs](https://github.com/tschaub/mock-fs)
is a mock framework to mock the entire filesystem with an in-memory fs.
However it conflicts with `testdouble`, better not to use both.

`testdouble` also can be used to mock filesystem operations, by mocking the `fs` nodejs module.

```javascript
const const fsMock = ({ manualConfig }) => ({
  readFileSync: (filePath) => JSON.stringify(manualConfig),
});

it('mocking fs', () => {
  await td.replaceEsm('fs', fsMock({ manualConfig: 'file Content' }));
  configManager = (await import('../../config/configManager.js')).default;
  configManager.updateManualConfig();
  td.reset();
});
```

### Mock network requests

Node.js Skeleton modules use the `node-fetch` library to make requests. In these cases it is enough to
mock the library with `testdouble`.

There are 3pp modules which uses native NodeJS requests. To cover these cases the [nock](https://github.com/nock/nock)
npm mock library was introduced.

By default when a mock is defined by `nock`, it creates an interceptor, which has an expectation,
that the endpoint is called exactly once.
To change this behavior check [Expectations](https://github.com/nock/nock#expectations).

A simple example which sets up an interceptor before each tests and clears them after them.

```javascript
describe('Static Serve endpoint', () => {
  beforeEach(() => {
    nock('https://domain1:4000').get('/config.json').reply(200, { myconfig: 'myconfig' });
  });
  afterEach(() => {
    nock.cleanAll();
  });
  it('returns 200 if service and file is found', async () => {
    await request
      .get(`https://domain1:4000/config.json`)
      .set('Accept', 'application/json')
      .expect(200);
  });
});
```
