# Remote Dev Env

It is possible to develop in a remote cluster where every dependency is deployed to develop and
test integration with ADP and other components.

?> Some of the following description is valid only for the presentation area cluster, but most
steps are generic to CCD or any Kubernetes Cluster.

## Quick steps

The overall process is to use this env:

0. (Prepare Helm repo - [Setup helm repos](#setup-helm-repos))
1. [Configure CI chart](#configure-chart)
   - enable the required dependencies
2. Install ADP dependencies with CI Chart
   - init dependencies
   - install helm chart to the cluster
3. Configure Node.js Skeleton in `eric-oss-network-assurance-search` helm chart
   - set TLS on/off
   - set ingress config
   - set other configs (eg. using syslog etc.)
4. Configure Tilt
   - switch off `deployCiChart` as it is already done
   - set `ingressHost`, `ingressEnableTLS` if required
5. Start up Node.js Skeleton with [Tilt](tilt.md)
6. Check status via [Ingress](#ingress-controllers) or port-forwared endpoints.

## CI chart

The CI Umbrella Helm chart can be used to install some or all dependencies into a remote
kubernetes cluster.
The CI chart is located in the `charts/ci` folder.

?> The [Ingress controllers](#ingress-controllers) are usually cluster-wide
and shared between services, but the CI chart also provides a controller for Contour,
see [Using own Ingress Controller](#using-own-ingress-controller).

### Setup helm repos

First the helm repositories must be configured. To get a token, login to each ARM instance,
then get your API token from the user's preferences.

These steps are required once.

```bash
# Add ADP helm repository for general services
helm repo add proj-adp-gs-all-helm \
https://arm.sero.gic.ericsson.se/artifactory/proj-adp-gs-all-helm

# Add EEA helm repository for dummy services
helm repo add eea-drop \
https://arm.seli.gic.ericsson.se/artifactory/proj-eea-drop-helm \
--username $DOCKER_USERNAME \
--password $DOCKER_PASSWORD

# Fetch repo content to local cache. Do it time to time.
helm repo update
```

### Configure Chart

The CI Chart has a `values.yaml` file, which contains the settings for each dependencies,
and also defines which one should be installed.
The default content is optimized for the Drop pipeline in the service CI, where the number of installed
ADP services is kept at minimum, so don't commit any ADP service as enabled into Git.
However the configuration for each service should be kept up-to-date.

To enable SIP-TLS: set `global.security.tls.enabled` to `true`
To enable global mTLS: set `eric-sec-sip-tls.enabled` to `true`
To enable Logtransformer: set `eric-log-transformer.enabled` to `true`

### Init dependencies

After enabling the wanted service in values.yaml, the dependencies must be downloaded.
The archives for each dependency is downloaded into the `charts/ci/charts` folder.
Also a `Chart.lock` file is created, but don't commit this.

```bash
cd charts/ci
helm dependency update
cd ../..
```

### Install CI Chart

!> Some of the ADP services requires a clean namespace and does not support reinstalls.
To be sure that everything will be installed correctly, always delete and recreate the
used development namespace.

The release name can be any string (in this example it is `adp-services`),
and use your developer namespace.

```bash
kubectl delete namespace $NAMESPACE
kubectl create namespace $NAMESPACE

helm install adp-services charts/ci -n $NAMESPACE
```

It starts the helm install. As there is dependency between the services, it may take
several minutes when everything is started fully.

To check the status, just list all pods and wait until all have `RUNNING`/`COMPLETED` status.

```bash
kubectl get pods -n $NAMESPACE
```

Now every enabled service is up. Now the Node.js Skeleton can be installed with Tilt. Also set the
required configuration for the Node.js Skeleton to use the installed dependencies. (eg. setting Syslog
on, mTLS on etc.)

If a values is changed in the values.yaml, then the helm upgrade command can be used to apply
the changes.

```bash
helm upgrade adp-services charts/ci -n $NAMESPACE
```

### Uninstall

To uninstall the ADP services just use the `helm uninstall` command

?> **Note:** `helm uninstall` will not delete `PersistentVolumeClaim` resources, to delete
`PersistentVolumeClaims` delete the whole namespace or delete them manually from the namespace.

```bash
helm uninstall adp-services

# Clean up namespace, by recerating it
kubectl delete namespace $NAMESPACE
kubectl create namespace $NAMESPACE
```

## Ingress Controllers

In the Presentation cluster, two different Ingress Controllers are installed (Nginx and
Contour). At the moment Node.js Skeleton supports both types, so always try out changes with both.

The `ingress.*` section in the `values.yaml` of Node.js Skeleton controls how the service is deployed
in a cluster. Generally an ingress route definition requires a **hostname** and a **path**.

The controllers are bound to different nodes, so to reach their external ports different
hosts and technique is required.

With a 3pp service it is easier to use arbitrary domain names: [nip.io](#nipio)

- Nginx: `*.10.196.123.160.nip.io`
- Contour: `*.10.196.123.199.nip.io`

For more information about the domain names and considerations, check the related chapters:

- [Nginx](#nginx)
- [Contour hostname](#hostname)

?> As the Ingress Controller can be reached with different hostnames, when changing config from one to
another, update the hostname config accordingly.

### External TLS

For testing the external TLS ingress configuration, a TLS certificate is needed. As the Certificate
Manager has very high footprint, instead the SIP-TLS can be used directly to generate a proper certificate.
There is a predefined secret in the chart, which works well with Contour.

1. To generate a certificate, the SIP-TLS service must be enabled in the CI chart and
   deployed to the namespace.
2. Also set the `ingressEnableTLS` to `true` in the Tilt configuration.

### Mutual TLS between Ingress and Node.js Skeleton backend

When `global.security.tls.enabled` is true and `service.endpoints.http.tls.verifyClientCertificate`
is set to `required`, Ingress Controller is enforced to send a client certificate towards the Node.js Skeleton.
The Node.js Skeleton then needs the CA of this certificate to be able to verify it.

The CA secret name is either given in `ingress.adpIccrCaSecret` or will be concatenated
from the IC service name that is set in `ingress.adpIccrServiceName` and the `-client-ca` postfix.

Mutual TLS is only supported with Contour, so in case of Nginx
`service.endpoints.http.tls.verifyClientCertificate` must be `optional`.

### Usage with Tilt

Ingress support can be switched on with Tilt easily. The used hostname is different for the
two different IC, to determine it check the next chapters.

General Ingress usage with Tilt:

1. in tilt config set `ingressUseContour` to `"false"` for Nginx, and `"true"` for Contour
2. in tilt config set `ingressHost`. For more info: [Tilt Configuration](tilt.md#configuration).
   The path is generated from the username: `eric-oss-network-assurance-search_<username>`.
3. in tilt config set `ingressEnableTLS` true or false depending on if external TLS is needed or not
4. Start up Node.js Skeleton with Tilt
5. Open UI (replace username in this link): <http://\(hostname\)/eric-oss-network-assurance-search\_(username)/ui/>

### Nginx

?> Currently working external hostname: `seliics01656e01.seli.gic.ericsson.se`.
Or use nip.io: `*.10.196.123.160.nip.io`

This is the deprecated version, which is still part of CCD and used by some Applications.

This Ingress controller can be configured by the `Ingress` kubernetes kind. It watches deployed
`Ingress` kinds and creates the routing rules according to them. Rules are based on hostname and
url patterns. Multiple Ingress resources can define and use the same hostname, which makes it
easier to use it in development.

Use the above hostname with the generic Tilt steps.

?> When using the common Nginx of a cluster, leave `ingress.ingressClass` empty in Node.js Skeleton chart.

### Contour

?> Currently working external ip: `10.196.123.199`. Or use nip.io: `*.10.196.123.199.nip.io`

This is the next generation Ingress controller used in CCD.

It supports both the `Ingress` and `HTTPProxy` kinds as configuration. In Node.js Skeleton the more flexible
`HTTPProxy` kind is used to define Contour configuration.

#### Using own Ingress Controller

It is recommended to use the EEA ICCR that is available in the CI chart. For this
`eric-eea-ingress-ctrl-applications.enabled` is to be true in the CI chart.
If needed, update its version in Chart.yaml.

In the Node.js Skeleton chart these settings are needed:

- `ingress.enabled`: `true`
- `ingress.useContour`: `true`
- `ingress.hostname`: `<signum>.eric-oss-network-assurance-search.<IP-address-of-IC>.nip.io`
- `ingress.ingressClass`: `EEA-Applications`
- `ingress.adpIccrServiceName`: `eric-eea-ingress-ctrl-common`

See below chapters about hostname and IP address of controllers.

#### Hostname

However `HTTPProxy` kind handles hostnames differently than the `Ingress` kind. A hostname can be used
only in one resource descriptor. The deployment of the second resource will fail.
But these resources can be included in each other, where only the top level resource must have a defined
hostname. In production the pattern is to define a product level root `HTTPProxy` with hostname, and
include service level `HTTPProxies` as child resource without hostnames. Then each service can be
reached from the common hostname.

This way of working is not yet implemented in the Cluster nor in the CI.
Until it is worked out a different solution is needed: Each deployment needs its own hostname
in its `HTTPProxy` config. However the DNS setting for the cluster does not allows to define
arbitrary sub-domain names. (eg. my-eric-oss-network-assurance-search-test.seliics01656e01.seli.gic.ericsson.se).

There are multiple solutions.

##### Hosts file

Editing the `hosts` file is one option.

1. define an unique hostname: _local-hostname_
2. get the external ip of contour (10.196.123.199)
3. add an entry to the OS's hosts file: `<external-ip> <local-hostname>`
   - Linux: `/etc/hosts/`
   - Windows: `C:\windows\system32\drivers\etc\hosts`

Now use the generic Tilt steps with _local-hostname_

##### Nip.io

There is a 3pp service, which can generate domain names for internal IPs on the fly: <nip.io>
With this editing of hosts file is not needed. Other benefit, that these hostnames can be shared
internally and can be opened by others.

The format of the hostname shall be: `*.10.196.123.199.nip.io`

Define an unique hostname prefix, eg. username. The hostname will be: `<username>.10.196.123.199.nip.io`.
Then use this hostname with the generic Tilt steps

### Determine host/ip for IC

If the above hostnames / IP Addresses are not valid anymore, use these steps to get the actual
ones.

General way to determine external IP address and hostnames. First get the list of nodes with
IP address in the cluster, then find the bound IP address for each Ingress service.
A service may have multiple External-IPs, in this case any of them can be used.

```bash
# Get the node list with
# Hostname = <NAME>.seli.gic.ericsson.se
# IP Address = INTERNAL-IP
kubectl get nodes -o wide

# Get the EXTERNAL-IP for Nginx.
# EXTERNAL-IP = INTERNAL-IP of a node
kubectl get service -n ingress-nginx ingress-nginx

# Get the EXTERNAL-IP for Contour.
# EXTERNAL-IP = INTERNAL-IP of a node
kubectl get service -n eric-tm-ingress-controller eric-tm-ingress-controller-cr
```

## Log subsystem

If Logtransformer is installed to the cluster, and Node.js Skeleton is configured to send logs as
syslog, the ADP Log subsystem can be used to check logs.

To check the logs in search engine, you have to forward traffic from port 9200 of
the Search Engine:

```bash
kubectl port-forward eric-data-search-engine-master-0 9200:9200 -n <namespace>
```

Now you can check the logs under the provided syslogLogplane:\
Example:\
[https://localhost:9200/\_cat/indices](https://localhost:9200/_cat/indices)\
[https://localhost:9200/eric-oss-network-assurance-search-2021.03.17/\_search?pretty=true&size=1000&sort=timestamp:desc](https://localhost:9200/eric-oss-network-assurance-search-2021.03.17/_search?pretty=true&size=1000&&sort=timestamp:desc)

## Alarms provisioning

Node.js Skeleton can be configured to send FaultIndications, with according list of dependencies
installed to the cluster.

To check the alarms in Alarm Handler service, you have to forward traffic from the port 5006 of the
alarm handler service:

```bash
kubectl port-forward eric-fh-alarm-handler 5006:5006 -n <namespace>
```

## Authentication and Authorization

It is possible to deploy Node.js Skeleton with user management, using the ADP KeyCloak implementation
IAM, and the AuthZ proxy as a sidecar.

- [IAM](https://adp.ericsson.se/marketplace/identity-and-access-management)
- [Authorization Proxy](https://adp.ericsson.se/marketplace/authorization-proxy-oauth2)

### Prerequisites

To deploy the service with this feature, the following steps needs to be done:

- In the CI chart `global.security.tls.enabled`, `eric-data-document-database-iam.enabled`,
  `eric-sec-sip-tls.enabled` and `eric-sec-access-mgmt.enabled`
  has to be set to true, so SIP-TLS will be deployed and will generate the keys for the IAM service.

- In the Node.js Skeleton chart `global.security.tls.enabled`, `ingress.useContour`, `ingress.tls` and
  `authorizationProxy.enabled` has to be set to true. Nginx ingress won't work, Contour has to be used.

### Parameter Configuration

Most of the configuration can be done via helm value parameters. One of this is to set up the FQDNs
for the services. This system uses 3 FQDNs - one for IAM, one for IAM's Authentication Proxy, and one
for the Node.js Skeleton. The IP address can be freely selected from any of the Contour loadbalancer
IP addresses - `<IP>` in the following. Due to DNS resolving problems, one would have to update the systems
hosts file every time to make the redirection working, although there is a workaround for this, called
[nip.io](https://nip.io). This website helps the browser, and resolves addresses via rules that are
described on their website. FQDNs also must be unique across the cluster, so append your `signum` to
them to separate from other developers' FQDNs. With the help of this the FQDNs can be the following:

- IAM FQDN located in Node.js Skeleton values.yaml `authorizationProxy.keycloakFQDN`: `<signum>.iam.<IP>.nip.io`
- AuthN FQDN located in Node.js Skeleton values.yaml `authorizationProxy.authnProxyFQDN`:`<signum>.authn.<IP>.nip.io`
- Node.js Skeleton FQDN under ingress settings `ingress.hostname`:`<signum>.eric-oss-network-assurance-search.<IP>.nip.io`

The IAM service also has some parameters for these addresses in its config under the CI chart:

- `eric-sec-access-mgmt.authenticationProxy.cookieDomain`: `nip.io`
- `eric-sec-access-mgmt.authenticationProxy.ingress.hostname`: `<signum>.authn.10.196.123.200.nip.io`
- `eric-sec-access-mgmt.ingress.hostname`: `<signum>.iam.10.196.123.200.nip.io`

### Deployment

?> `<IP>` is `10.196.123.200` in the following examples, but can be replaced by any
existing Contour IP.

The deployment can be done with Helm install command or Tilt, I recommend using Tilt for it's robustness.
With Tilt turn on `ingressEnableTLS` and `ingressUseContour` and set

- the `ingressHost` to `<signum>.eric-oss-network-assurance-search.10.196.123.200.nip.io`
- the `authzProxy` to `true`
- the `mTLS` to `true`
- the `authnProxyFQDN` to `<signum>.authn.10.196.123.200.nip.io`
- the `keycloakFQDN` to `<signum>.iam.10.196.123.200.nip.io`

in your tilt.options.user.json file.

Deployment steps:

1. Make sure that your helm dependencies are up to date. (Issue `helm dep update` command
   from `charts/ci` folder.)
2. Run `tilt up` from repo root, or deploy using `helm install`. The current best-practice is using
   helm to deploy the chart, then run `tilt up`, with the `deployCiChart` flag set to false in `tilt.options`
   (due to tilt having issues with the `service.yaml` files)
3. Wait for all pods except Node.js Skeleton to come to the ready state (2 green indicators in Tilt).
   Node.js Skeleton won't be ready, until we create the realm in KeyCloak.
4. Visit `https://<signum>.iam.10.196.123.200.nip.io/auth/admin/`, where you can log into the
   administration console using credentials **admin:admin**. Here the following steps need to be done:
   1. In the top left hover over **Master** and click **Add realm**. Name it `oam` - the value of
      `authorizationProxy.adpIamRealm` in the CI chart values.yaml - then click **Create**.
   2. Now the new realm will be selected, in the left menu click **Users**. In the top right of the table
      click **Add user**. This will be the user which will be used to log into Node.js Skeleton. Pick
      a username, then turn on the **Email Verified** switch, then click **Save**.
   3. Now it will redirect to the created users page. Go into the **Credentials** tab, fill in a chosen
      password, turn off the **Temporary** switch, then click **Set password**.
   4. Go to the **Role Mappings** tab, and add the **all-in-one-eric-oss-network-assurance-search** role which will
      give the needed permissions to this user to use the service. This role is specified under the
      `auth-proxy-authorizationrules.yaml`.

> **_Note:_** At step 3, IAM might restart 1-2 times during deployment if the cluster if slower at
> that time, just be patient and wait for it to be ready.

### CORS configuration

CORS is not configured in the eric-sec-access-mgmt service http proxy settings. To fix this the httpproxy
needs to be edited.
List the httpproxies in your namespace.

```bash
kubectl get httpproxy -n <NAMESPACE>
```

Edit the eric-sec-access-mgmt

```bash
kubectl edit httpproxy eric-sec-access-mgmt -n <NAMESPACE>
```

Find the virtualhost in the httpproxy spec and extend it with the cors settings.

```yaml
virtualhost:
  corsPolicy:
    allowCredentials: true
    allowMethods:
      - GET
      - POST
      - OPTIONS
    allowOrigin:
      - '*'
```

After the steps are done Node.js Skeleton should move forward and get to the ready state. Now the
application can be accessed through the `https://<signum>.eric-oss-network-assurance-search.10.196.123.200.nip.io/ui`
address, where you can login with the created username and password.
