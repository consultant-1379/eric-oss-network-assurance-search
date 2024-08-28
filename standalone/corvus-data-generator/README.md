# Corvus Data Generator

## Purpose

The purpose of the Corvus Data Generator is to generate mock data for the services
which the Network Assurance Search (NAS) microservice depends upon to function correctly.
The NAS microservice currently has the following dependencies which require data ingestion:

- Assurance Indexer Service
- ADP Search Engine (OpenSearch)
- ADP PG Document Database (PostgreSQL DB used by the PM Stats Query Service)
- Assurance Analytics Service (VictoriaMetrics)

The Corvus Data Generator ingests mock data into each of these services so that the NAS
microservice is able to use them for development purposes.

## Prerequisites

To use the Corvus Data Generator, a Python environment is required. Follow the steps below
to setup a Python environment that is able to run the tool.

### Python Environment Setup

The setup guide below is for MacOS.

#### Step 1: Install Pyenv

Execute the following commands (assuming homebrew):

```bash
brew update
brew install pyenv
```

Setup your shell environment for Pyenv by executing the following commands (assuming .zsh):

```bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
```

Source your terminal or open a new one and execute:

```bash
pyenv --version
```

You should be able to see the version of pyenv that you've installed.

#### Step 2: Install a Python version

Execute the following command to install a specific version of Python:

```bash
pyenv install 3.11.8
```

Once completed, execute the following command to set this version as
the default:

```bash
pyenv global 3.11.8
```

#### Step 3: Verify Python installation

Verify your Python installation by executing the following command:

```bash
python -V
```

The output should be `Python 3.11.8`.

#### Step 4: Install the required Python libraries

To use the Corvus Data Generator, a small number of Python libraries
are required. To install them, run the following two commands:

```bash
cd standalone/corvus-data-generator
pip install -r requirements.txt
```

You should now be able to run the Corvus Data Generator successfully.

## Dependent Services

As mentioned in the [Purpose](#purpose) section above, the NAS microservice has four
separate dependencies which require data ingestion. This section will outline how often
this data ingestion will occur and the type of data that will be ingested.

For each of the dependent services, the mock data that is generated is based upon the
configuration files located within the `src/config/` directory. The `data-config.json`
file contains information about the contexts and metrics that will be generated. The
`metrics-config.yaml` file contains information relevant to the metric values. By editing
these two configuration files, the generated mock data is able to be controlled.

### Assurance Indexer Service

The Assurance Indexer Service (AIS) is a set of REST API endpoints which the NAS microservice
queries for metadata. It's easier to deploy a mocked version of the AIS endpoints instead
of the real thing, therefore we use a WireMock image which contains AIS stubs. These stubs
are in the format of JSON files and they follow a specific structure. The Corvus Data Generator
creates these stub JSON files based upon the configuration files mentioned above, and saves them
into the `src/generated-files/indexer/` directory.

The stubs for the AIS WireMock image only need to be generated once before the image is deployed,
however, after the stubs are generated, they need to be moved to the correct locations. These
locations depend on the specifics of the deployment.

### ADP Search Engine and ADP PG Document Database

The ADP Search Engine (SE) runs a version of the open-source OpenSearch search engine and offers the
ability to ingest data via HTTP requests. Therefore, the Corvus Data Generator creates shell scripts (`.sh`)
which contain `curl` commands to ingest schemas and data, as well as delete old data. For the NAS
microservice to funtion correctly, the SE needs to recieve data at a regular cadence. The frequency
of data ingestion can be set my modifying the cronjob within the `crontab` file. It is set to every
1 minute by default. The generated OpenSearch shell scripts are saved to the
`src/generated-files/opensearch/` directory.

The ADP PG Document Database (PG) runs a PostgreSQL database which is read by the PM Stats Query Service.
To manipulate the data within the database, executing SQL scripts using the `psql` tool can be used.
The Corvus Data Generator creates sql scripts (`.sql`) which contain SQL commands to create schemas,
insert data, and delete old data. Similar to the SE, for the NAS microservice to funtion correctly, the
PG needs to recieve data at a regular cadence. This cadence is controlled by the same cronjob mentioned above.

The mock data generated for the SE and the PG services are closely tied together within the
Corvus Data Generator. This is because the SE and PG need to contain the same data. Due to this,
the Corvus Data Generator will always generate both OpenSearch shell scripts and PostgreSQL SQL scripts
when OpenSearch data is requested (for the time being). (TODO) Future work may separate the two, but it is not
extremely important at this time.

### Assurance Analytics Service

The Assurance Analytics Service (AAS) runs a version of the open-source VictoriaMetrics timeseries
database and monitoring tool. The AAS offers the ability to ingest data via HTTP requests, similar
to the SE. Therefore, the Corvus Data Generator creates shell scripts (`.sh`) which contain `curl`
commands to ingest and delete data. Similar to both the SE and PG services, for the NAS microservice
to funtion correctly, the AAS needs to recieve data at a regular cadence. This cadence is controlled
by the same cronjob mentioned above.

In contrast with the SE and PG generated mock data, the Corvus Data Generator does not save any files
for data manipulation within the AAS timeseries database. Instead, the Python scripts which generate
the mock data perform HTTP requests using the `requests` Python library, which causes less clutter within
the filesystem and keeps all functionality in one process. (TODO) Future work for this tool would include
refactoring the source code for the SE and PG data generation scripts to do the same.

### Other Considerations

Currently, there can only be one data ingestion frequency for the SE, PG, and AAS services. Setting
the data ingestion frequency within the `crontab` file to every 15 minutes will apply to all three of
the mentioned services.

Within the Corvus Data Generator source code, the term "OpenSearch" is used synonymously with "SearchEngine".
The same applies to the term "VictoriaMetrics" and "AssuranceAnalytics".

## Usage

To use the Corvus Data Generator, navigate to it's `src/` directory and
execute the following command:

```bash
python corvus_data_generator.py --help
```

You should receive the following output:

```bash
usage: corvus_data_generator.py [-h] [--indexer] [--opensearch_init] [--opensearch] [--victoriametrics]

Corvus Data Generator

options:
  -h, --help         show this help message and exit
  --indexer          Generate Indexer WireMock stubs (default: False)
  --opensearch_init  Generate OpenSearch initialization data files (default: False)
  --opensearch       Generate OpenSearch data files (default: False)
  --victoriametrics  Ingest data into VictoriaMetrics (default: False)
```

There are four different usage options:

- Using the "--indexer" flag will generate the AIS JSON file stubs which can be moved to the
  correct locations for deployment with a WireMock image.

- Using the "--opensearch_init" flag will generate the SE shell scripts which contain a larger
  amount of data than the other "--opensearch" flag. This flag is generally used upon startup of
  the dependent services to populate the SE and PG with enough data to get started on development
  work instantly.

- Using the "--opensearch" flag is similar to using the "--opensearch_init", but the SE shell
  scripts that are generated contain less data. This flag is generally used by a cronjob to ingest
  a smaller amount of data at a regular cadence.

- Using the "--victoriametrics" flag will ingest data into the AAS service via REST API endpoints.

## Deployment

To deploy the Corvus Data Generator within a Docker container, use the `Dockerfile` in it's root
directory. There are a number of environment variables that can be used to configure the tool.

### Environment Variables

| Variable Name | Required | Description | Default |
| ------------- | -------- | ----------- | ------- |
| K8S_NAMESPACE | false | Used for communicating with the PG database in a K8s cluster. This variable is only required if OpenSearch data generation is enabled. |  |
| ENABLE_SEARCH_ENGINE_DATA_GENERATION | false | Enables data ingestion into the SE and the PG services | `false` |
| ENABLE_VICTORIAMETRICS_DATA_GENERATION | false | Enables data ingestion into the AAS | `false` |
| DATA_CONFIG_PATH | false | The path location of the data config file | "./config/data-config.json" |
| SEARCH_INDEX | false | The name of the search index | "soa" |
| SEARCH_ENGINE_URL | true | The URL (including the port number) to reach the ADP Search Engine (or OpenSearch) | |
| OS_DATETIME_FORMAT | false | The datetime format for document fields within the ADP Search Engine | "%Y-%m-%d %H:%M:%S.%f" |
| POSTGRES_READINESS_PROBE_URL | false | The URL (including the port number) that can be used to verify that the PG database is available to accept SQL commands via `psql`. This variable is only required if OpenSearch data generation is enabled. | |
| POSTGRES_SUPER_USER | false | The username of the PG super user. This variable is only required if OpenSearch data generation is enabled. | |
| POSTGRES_SUPER_PASSWORD | false | The password of the PG super user. This variable is only required if OpenSearch data generation is enabled. | |
| POSTGRES_DATABASE | false | The PG database name that will be used for data ingestion. This variable is only required if OpenSearch data generation is enabled. | |
| POSTGRES_SCHEMA_NAME | false | The schema name to be used within the PG database | "kpi" |
| POSTGRES_TABLE_PREFIX | false | The string that will be prepended to all PG database table names | "${POSTGRES_SCHEMA_NAME}\_csac\_" |
| POSTGRES_TABLE_SUFFIX | false | The string that will be appended to all PG database table names | "_10" |
| OS_DEFAULT_DATA_LOOKBACK_MINUTES | false | The default number of minutes into the past that SE data will be generated for | 15 |
| OS_DEFAULT_DATA_STEP_SIZE_MINUTES | false | The default number of minutes between generated SE data points | 15 |
| OS_HISTORICAL_DATA_LOOKBACK_MINUTES | false | The number of minutes into the past that SE data will be generated for upon startup of the tool | 180 |
| OS_HISTORICAL_DATA_STEP_SIZE_MINUTES | false | The number of minutes between data points of the SE data generated upon startup of the tool | 15 |
| OS_DATA_RETENTION_PERIOD | false | The period of time (in days) that the SE and PG data will be kept | 7 |
| SERVICE_NAME | false | The service name given to the Corvus Data Generator when ingesting data into AAS | "corvus-data-generator" |
| EXPOSE_PORT | false | The port number that will be given to AAS when ingesting data to represent the service | 9000 |
| METRICS_CONFIG_PATH | false | The path location of the metric config file | "./config/metrics-config.yaml" |
| VM_IMPORT_URL | false | The URL (including the port number) that will be used to make HTTP requests to AAS | "localhost:8480/api/v1/import" |
| VM_REQUESTS_PER_METRIC | false | The number of ingestion requests that will be made per metric. This number will determine how much data gets ingested into AAS | 10 |
| VM_DEFAULT_DATA_LOOKBACK_MINUTES | false | The default number of minutes into the past that AAS data will be generated for | 15 |
| VM_DEFAULT_DATA_STEP_SIZE_MINUTES | false | The default number of minutes between generated AAS data points | 15 |
| VM_HISTORICAL_DATA_LOOKBACK_MINUTES | false | The number of minutes into the past that AAS data will be generated for upon startup of the tool | 180 |
| VM_HISTORICAL_DATA_STEP_SIZE_MINUTES | false | The number of minutes between data points of the AAS data generated upon startup of the tool | 15 |
| VM_DEFAULT_METRIC_VALUE_DEVIATION | false | The maximum difference that a metric value can deviate from it's mean value. | 20 |
