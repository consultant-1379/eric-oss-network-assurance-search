# Mock services

Here you can find information on how to build and deploy mock services, which are useful
for development and testing.

## Tilt

Please read the [Tilt based development](tilt.md) chapter. Tilt based solution supports
deploying mock services both locally and remotely, which is enough for most cases.

## CI version

As mock services are not changing frequently, most of the time it is enough to install
mock service from the internal CI repository. **Note:** the CI helm repo might be huge, so
if you experience performance issues with helm commands remove the repository after using it.

!> Make sure that the `arm-pullsecret` `secret` is installed to the namespace.
For more info see: [Pull secret](#pull-secret)

```bash
# Add CI-internal repo to helm with credentials
helm repo add eea-ci https://arm.seli.gic.ericsson.se/artifactory/proj-eea-ci-internal-helm \
  --username $DOCKER_USERNAME --password $DOCKER_PASSWORD

# Generate a mock service
helm install mock eea-ci/help-center-mock --devel \
  --namespace $NAMESPACE \
  --set global.pullSecret=arm-pullsecret \
  --set nameOverride=mock-eea
```

For other deployment parameters see [Deploy](#deploy).

## Manual execution

It is also possible to do a manual deploy with some simple test, if you do not prefer Tilt.

!> Execute the commands in the repository root, as the path in the following commands
are relative to the root.

?> Please do not forget to replace `<your-signum>` with your signum in the following commands.

### Build image

To build the generic mock service with docker, execute the following:

```bash
docker image build \
  --file mock/help-center-mock/Dockerfile \
  -t armdocker.rnd.ericsson.se/proj-eea-dev/help-center-mock:1.0-<your-signum> .
```

!> As images are built and published to the local repository,
the services can only be started in a local kubernetes cluster.
For remote cluster see the [Remote cluster](#remote-cluster) chapter.

### Deploy

The generic mock service can be installed with helm. The deployment requires some
configuration:

- `<nameOverride>` can be used to give a unique name to the chart, it is required if you would like
  to deploy more instances of the same chart

```bash
helm install $RELEASE_NAME mock/charts/help-center-mock \
  --namespace $NAMESPACE \
  --set imageCredentials.repoPath=proj-eea-dev \
  --set images.main.name=help-center-mock \
  --set images.main.tag=1.0-<your-signum> \
  --set global.pullSecret=arm-pullsecret \
  --set ingress.enabled=true \
  --set ingress.path=/domainapp \
  --set ingress.hostname=localhost \
  --set nameOverride=<nameOverride>
```

### Undeploy

To remove with helm, execute the following:

```bash
helm uninstall $RELEASE_NAME
```

### Remote debug

After the service is started it is possible to debug it remotely.
Please read the [Remote debugging](tilt.md#Remote-debugging) chapter and use the preferred
VSCode debug mode.

## Remote cluster

The above description works only in a local kubernetes cluster. To make it work in a remote cluster,
some additional step is required.

### Upload the image

First the docker image has to be uploaded to a remote ARM repository.

```bash
# Login with signum and password
docker login armdocker.rnd.ericsson.se
# Push the image to the repo using full image name, after the image build
docker push armdocker.rnd.ericsson.se/proj-eea-dev/help-center-mock:1.0-<your-signum>
```

### Pull secret

Create a pull-secret with your signum and API key from ARM:

```bash
kubectl create namespace $NAMESPACE

kubectl create secret docker-registry arm-pullsecret \
  --docker-server=armdocker.rnd.ericsson.se \
  --docker-username=$DOCKER_USERNAME \
  --docker-password=$DOCKER_PASSWORD \
  --namespace $NAMESPACE
```

Then use this pull-secret with the helm deployment,
set `imageCredentials.pullSecret` attribute to `arm-pullsecret`.

### Unique namespace

Use separate namespace to avoid collision with other developers

- find an unique name (eg: `SIGNUM_DEV`)
- create namespace: `kubectl create namespace <namespace>`
- switch namespace in kubectl `kubectl config set-context --current --namespace=<custom namespacename>`

### Remote deploy

Execute the helm command from [Deploy](#deploy), just add the pull-secret parameter: `--set imageCredentials.pullSecret=arm-pullsecret`
