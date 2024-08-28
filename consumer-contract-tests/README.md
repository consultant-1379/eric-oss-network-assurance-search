# How to run contract tests

To run the contract tests, execute the following command from either the root of the repository or this directory:

```bash
npm run test:contract:indexer
```

To refresh the Assurance Indexer Microservice stubs, run the shell script called `refresh_indexer_stubs.sh` from within this directory.
For the shell script to be successful, you need to have valid SELI_ARTIFACTORY_REPO_USER and SELI_ARTIFACTORY_REPO_PASS environment variables set.

```bash
./refresh_indexer_stubs.sh
```

The command below will bring up the wiremock instance on local host 8282 using Docker.

```bash
docker compose up
```

The command below will bring up the wiremock instance on local host 8282 using npm.

```bash
npm run mock:indexer
```

Artifactory for consumer [spring cloud stubs (AIS Microservice)](https://arm.seli.gic.ericsson.se/artifactory/proj-eric-oss-dev-local/com/ericsson/oss/air/eric-oss-assurance-indexer/).
