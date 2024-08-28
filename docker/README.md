# Dockerfile for building eric-oss-network-assurance-search

For more info check [Docker chapter](../docs/development/docker.md) in documentation.

## Build

Run the following command from the repository root directory:

```bash
docker build -t eric-oss-network-assurance-search -f docker/Dockerfile . --build-arg BASE_OS_VERSION=5.11.0-10
```

Start the image with specified port:

```bash
docker run -d -p 8080:3000 eric-oss-network-assurance-search
```
