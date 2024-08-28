# 2pp (Ericsson internal) Libraries

This document is to capture some findings about the 2pp libraries used by Node.js Skeleton.

## E-UI SDK

The UI is built upon the `E-UI SDK` framework. The npm libraries are published under the `@eui` namespace
into internal ARM repository.

[E-UI SDK Documentation](https://euisdk.seli.wh.rnd.internal.ericsson.com/showcase/esm-docs/#welcome)

### Update versions

The framework is split into several npm libraries with individual versions. Check the E-UI SDK
[Releases](https://euisdk.seli.wh.rnd.internal.ericsson.com/showcase/esm-docs/#release) list
to get the exact library versions contained in a release.

Preferably update to the latest versions, follow the [dependencies handling guide](dependencies.md).

If updating to a new E-UI SDK release the `product_structure.yaml` also has to be updated.
Check the [release manual](release-manual.md) for more information.

## Authentication Proxy

For Authentication an Authorization the Authorization Proxy Oauth2 is used. [Documentation](https://adp.ericsson.se/marketplace/authorization-proxy-oauth2/documentation/development/dpi/service-user-guide)

It runs in a sidecar next to the main container and handles every incoming requests.
The implementation is in a separate docker image, however in the Helm chart some templates are also
included to generate the necessary content.

### Update

Version increase of the AuthZProxy requires some manual steps. Only a released version can be used.

1. Check the latest released version, determine the drop version (eg. 1.11.0-9).
   **Note:** use the minus version.
2. Open the PRI document, it contains a link to the Helm template package.

   - example: <https://arm.sero.gic.ericsson.se/artifactory/proj-adp-sec-helm-dev-generic-local/oauthpxy-lib/released/eric-sec-authorization-proxy-oauth2-helmlibauth-cxa30108-1.11.0+9.tgz>

3. Download the template, unzip it
4. Copy the `templates/_auth-proxy-helpers.tpl` to Node.js Skeleton helm chart's `templates` folder.
5. Replace `@@authz-proxy-replace-me-tag@@` with `eric-oss-network-assurance-search` in the template file
6. Update version info in `charts/eric-oss-network-assurance-search/eric-product-info.yaml`
7. Update version info in `plms/product_structure.yaml`
