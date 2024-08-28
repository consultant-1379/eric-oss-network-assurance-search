# Application Developer Guide

[TOC]

## **Introduction**

This document provides guidelines for how to use the Network Assurance Search Microservice from an application developer's point of view.
It gives a brief description of its main features and interfaces.

The Network Assurance Search Microservice is intended to interface the Assurance Indexer Service.
It is a micro-frontend and corresponding backend that will display a pageable, sortable, and filterable table view of data stored by the
Assurance Indexer. It can be used in a few different ways, such as:

- clients can use this service to explore whether the functions in their network are operating within their expectations of their SLSs/SLAs. The service
accomplishes this by exposing different levels of aggregated performance metrics from functions in the network. It allows the user to filter, drill down,
and perform other actions to visualize more information (ex. time series charts and configuration details) to support the user in building this
understanding so they can use their discoveries to troubleshoot their networks.

- this service can be customized by the user to support their monitoring tasks by offering locally persisted customization of KPI Contexts
via table settings, tab renaming, and the ability to customize filters.

The Network Assurance Search Microservice provides a convenient REST API for querying KPI data and exposing search results via the
Assurance Indexer Service. It will also provide any required data augmentation.

*Note: Internally we call the µService "Network Assurance Dashboard", but the official name is "Service Assurance Dashboard.*

## **Revision History**

| Date      | Revision    | Comment          | Author |
| ------------ | -------------------- | ------------ |------|
| 2023-04-26  | 1.0.0 | Initial publish  | Jeremy Levasseur |
| 2023-06-29  | 1.0.1 | Added content from the Metric Search Web Component step | Gyuyoung Lee |
| 2023-09-22  | 1.0.2 | Added and updated content from the Network Assurance Web Application Component step | Gyuyoung Lee |
| 2024-01-04  | 1.0.3 | Updating API interface examples | Jeremy Levasseur |

## **General Concept**

Companies like AT&T, Rogers, and Telstra are Communication Service Providers (CSPs) offering 5G Network Slicing with Service Level Agreements (SLAs)
to their customers. These SLAs are a function of guaranteed throughput (A.K.A. bandwidth) and latency, which usually include monetary penalties if
they are not met. Therefore, CSPs want a way to look for 5G Network Slice SLA violations.

To find 5G Network Slice SLA violations, a CSP technician can go to the 5G Network Slice Assurance Dashboard and search for Network Slices
with low throughput values and/or high latency values, where throughput and latency are KPIs. After the CSP technician finds SLA violating slices,
they can receive slice-specific information, such as the technician responsible for administering the slice, what services run on the slice,
the customer affected by the low performance, etc. Even with the reduced results that come from a filtered search, we assume that the CSP technician
requires the ability to be even more specific with their slice searching. In case the CSP technician wants to share the results, the URL can be bookmarked
and shared.

The following subsections describe the main features of the Network Assurance Search Microservice.

### **Ability to search for entities' KPIs using filters**

There are currently two types of filters that can be passed to the */:index/search/metrics* endpoint as a query parameter with the "filter" key:

#### `MetricFilter`

Filters the results using a conditional value.

Example:

```json
{
    "type": "metric",
    "metricType":
    {
        "id": "vi_SNSSAI_NSI_PDUSessionEstSR",
        "name": "PDU Session Est SR",
        "valueType": "integer",
        "description": "PDUSessionEstSR Description",
        "unit": "errors/minute"
    },
    "from": 10.3,
    "to": 30.78
}
```

#### `EntityFilter`

Filters the results using string matching with the option of using a wildcard delimiter

Example:

```json
{
    "type": "entity",
    "not": true,
    "entityType": {
        "id": "c_SNSSAI",
    },
    "searchPattern": "N*",
}

```

Refer to the next group of subsections for more information on these filter types.

#### **Filter KPIs by conditional numerical values**

To filter the search results by numerical value, you will need to add a `MetricFilter` object to the "filter" query parameter of your **GET** request
to the */:index/search/metrics* endpoint. Here is the OpenAPI specification of the ``MetricFilter`` object:

```yml
allOf:
  - $ref: '../schemas/Filter.yaml'
  - type: object
    required:
      - type
      - metricType
    properties:
      type:
        type: string
        enum:
          - metric
        description: filter type
      metricType:
        $ref: '../schemas/MetricType.yaml'
        description: which metric this filter applies to
      from:
        type: number
        description: from limit
      to:
        type: number
        description: to limit
    example:
      {
        "type": "metric",
        "metricType":
        {
          "id": "vi_SNSSAI_NSI_PDUSessionEstSR",
          "name": "PDU Session Est SR",
          "valueType": "integer",
          "description": "PDUSessionEstSR Description",
          "unit": "errors/minute"
        },
        "from": 10.3,
        "to": 30.78
      }
```

#### **Filter KPIs by string matching**

To filter the search results by string matching, you will need to add an `EntityFilter` object to the "filter" query parameter of
your **GET** request to the */:index/search/metrics* endpoint. Here is the OpenAPI specification of the `EntityFilter` object:

```yml
allOf:
  - $ref: '../schemas/Filter.yaml'
  - type: object
    required:
      - type
      - entityType
      - searchPattern
    properties:
      type:
        type: string
        enum:
          - entity
        description: filter type
      entityType:
        $ref: '../schemas/EntityType.yaml'
        description: entity type use for the search
      searchPattern:
        type: string
        description: substring match pattern for the resource name
    example:
      {
        "type": "entity",
        "not": true,
        "entityType": {
          "id": "c_SNSSAI",
        },
        "searchPattern": "N*",
      }
```

#### **Ability to display KPI results in a paginated, sortable table**

The */:index/search/metrics* endpoint has four optional query parameters that can be used to facilitate the sorting and pagination of the
results. These parameters are the following:

### `sortBy`

Either a `MetricType` object or an `EntityType` object.

#### `MetricType` Schema

```yml
type: object
description: metric type
required:
  - id
properties:
  id:
    type: string
    description: MetricType id prepended with an identifier, either as 'vi_' or 'vd_'
    example: 'vi_SNSSAI_NSI_sessionModificationReqRcvd'
  name:
    type: string
    description: Display name or MetricType id prepended without identifier, 'vi_' or 'vd'
    example: 'AMF Mean Reg Nbr'
  valueType:
    type: string
    enum:
      - integer
      - float
    example: 'float'
    default: integer
  description:
    type: string
    description: entity description
    example: 'AMF Mean Reg Nbr description'
  unit:
    type: string
    description: specification of the value's unit of measurement.
    example: 'errors/minute'
```

#### `MetricType` Example

```json
{
  "id": "vi_SNSSAI_NSI_AMFMeanRegNbr",
  "name": "AMF Mean Reg Nbr",
  "valueType": "float",
  "description": "AMF Mean Reg Nbr description",
  "unit":"errors/minute"
}
```

#### `EntityType` Schema

```yml
type: object
description: entity type
required:
  - id
properties:
  id:
    type: string
    description: entity type id, normally has the prefix of 'c_'
    example: "c_SNSSAI"
  name:
    type: string
    description: entity type name
    example: "My SNSSAI"
  description:
    type: string
    description: entity description
    example: "Network Slice Selection Assistance Information"
```

#### `EntityType` Example

```json
{
  "id": "SNSSAI",
  "name": "My SNSSAI",
  "description": "Network Slice Selection Assistance Information",
  "type":{
       "id": "c_SNSSAI"
  }
}
```

### `sortOrder`

A string which is equal to either "asc" or "desc".

### `offset`

An integer that represents the offset of the first hit to return. The value must be greater than 0.

### `length`

An integer that represents the number of hits to retrieve. The value must be greater than 0.

## **Application Installation**

This section will walk you through the process of getting the Network Assurance Search Microservice up and running on your machine using Docker.

### **Prerequisites**

- Git
- Docker

### **Step 1: Cloning the Repository**

Clone the Network Assurance Search Microservice repository from Gerrit using either ssh:

```bash
git clone ssh://gerrit-gamma.gic.ericsson.se:29418/OSS/com.ericsson.oss.air/eric-oss-network-assurance-search
```

or http:

```bash
git clone https://gerrit-gamma.gic.ericsson.se/a/OSS/com.ericsson.oss.air/eric-oss-network-assurance-search
```

Once the repository has been successfully cloned, change directory into the repository root folder:

```bash
cd eric-oss-network-assurance-search
```

### **Step 2: Running the Microservice using Docker Compose**

You can run a standalone version of the Network Assurance Search Microservice along with OpenSearch and WireMock by running the following command
from the repository's root directory:

```bash
npm run standalone:dev
```

This command may take awhile to complete

### **Step 3: Making a request to the /:index/search/metrics endpoint**

Once the Network Assurance Search Microservice and an OpenSearch instance are up and running within Docker containers, you can make a
request to the */:index/search/metrics* endpoint with the following command:

```bash
curl 'http://localhost:3000/soa/search/metrics?contextTypeId=tac&metricTypes%5B0%5D%5Bid%5D=vd_tac_PartialDBRAccessibility&metricTypes%5B1%5D%5Bid%5D=vd_tac_DLLat_gNB-DU'
```

Inside this GET request, we're sending these query parameters which are stringified into a URI encoding before sending:

```JavaScript
// BEFORE ENCODING
{
 contextTypeId: 'tac',
 metricTypes: [
  {
   id: 'vd_tac_PartialDBRAccessibility',
  },
  {
   id: 'vd_tac_DLLat_gNB-DU',
  }
 ]
}

// AFTER ENCODING
'contextTypeId=tac&metricTypes%5B0%5D%5Bid%5D=vd_tac_PartialDBRAccessibility&metricTypes%5B1%5D%5Bid%5D=vd_tac_DLLat_gNB-DU'
```

The response should look something like this:

```JavaScript
{
  "offset": 0,
  "length": 10,
  "total": 17,
  "results": [
    {
      "context": {
        "type": { "id": "tac", "contextFields": [{ "id": "tac" }] },
        "contextFields": [{ "id": "tac_753", "name": "753", "type": { "id": "c_tac" } }]
      },
      "metrics": [
        {
          "type": { "id": "vd_tac_PartialDBRAccessibility" },
          "value": 14,
          "beginTimestamp": 1701401431,
          "endTimestamp": 1701401538,
          "metadata": [
            { "key": "csac_table", "value": "kpi_csac_tac_10" },
            { "key": "csac_column", "value": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4" }
          ]
        },
        {
          "type": { "id": "vd_tac_DLLat_gNB-DU" },
          "value": 440.1,
          "beginTimestamp": 1701401431,
          "endTimestamp": 1701401538,
          "metadata": [
            { "key": "csac_table", "value": "kpi_csac_tac_10" },
            { "key": "csac_column", "value": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5" }
          ]
        }
      ]
    }
  ]
}
```

## KPI Context Configuration

To configurate a context, one needs to update the *contexts* property which is stored in the file
 *backend/config/backend-service-config/customization-service-config.json*. For example:

```json
 "contexts": [
    {
      "id": "tac",
      "name": "MY TAC",
      "description": "description for tac"
    }
  ]
```

## CNOM Configuration and Usage

> **NOTE:** *CNOM ^2.11.0* is a requirement for running NAS micro-service.

See [CNOM User Guide](https://adp.ericsson.se/marketplace/cnom-server/documentation/2.11.0/dpi/service-user-guide) for more details and troubleshooting.

### Cloning CNOM Repo

To clone CNOM repo, go to the *[CNOM Gerrit repo](https://gerrit-gamma.gic.ericsson.se/#/admin/projects/iopensrc/cnom)*, select
 *Clone with commit-msg hook & ssh*, and then click *Copy to clipboard*.

### Node.js

Make sure that *[Node.js 20.10.0](https://nodejs.org/en/blog/release/v20.10.0)* is used.

### Python

Make sure that Python, *[pyenv](https://github.com/pyenv/pyenv)*, and *[Pipenv](https://pipenv.pypa.io/en/latest/)* are installed, and run
 the following *bash* script in the project home:

```bash
# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
```

### direnv

Make sure that *[direnv](https://direnv.net/)* is installed. Create a file *.envrc* in the CNOM directory with the following contents:

```text
source_env .env.dev
source_env .env.embedded
```

Run the command:

```shell
cd $CNOM_HOME
eval "$( direnv hook bash )"
direnv allow
```

### PostgreSQL

Make sure that a Docker Desktop is installed locally. Create the Postgre directory: `$CNOM_HOME/../postgresql/saved_data`. Create
 the *docker-compose.yml* file: `$CNOM_HOME/../docker-compose.yml`:

```yaml
version: "3.5"
 
services:
  # Container that hosts the PostgreSQL database
  postgres:
    container_name: postgres
    image: serodocker.sero.gic.ericsson.se/proj-pc-3pp-images/bitnami/postgresql:11.10.0-debian-10-r52
    restart: always
    environment:
      - ALLOW_EMPTY_PASSWORD=yes
      - POSTGRESQL_USERNAME=cnom
      - POSTGRESQL_DATABASE=cnom
    logging:
      options:
        max-size: 10m
        max-file: "3"
    ports:
      - "5432:5432"
    volumes:
      - ./postgresql/saved_data:/var/lib/postgresql/data
    networks:
      - app-network
 
networks:
  app-network:
    driver: bridge
```

The project heirarchy looks like the follows:

```shell
├── cnom
├── postgresql
│    ├── saved_data
└── docker-compose.yml
```

Execute the Docker deployment with the command:

```shell
docker compose up
```

### Running CNOM

Install CNOM dependencies:

```shell
cd $CNOM_HOME
npm ci
pipenv install --dev
npm start
```

Wait for the message "[start:brand2]: Compiled successfully". Open your browser and hit *localhost:8080* to access the CNOM dashboard.

#### Running NAS Micro-service

Change a port number for an *indexer-mock* in the file *$NAS_HOME/standalone/docker-compose.dev.yml* from `8080:8080` to `8086:8080`:

```yaml
indexer-mock:
  container_name: indexer-mock
  image: wiremock/wiremock:2.35.0
  ports:
    - "8086:8080"
```

Change a port number for *cnomConfig* from `8081` to `8080` in the file *$NAS_HOME/frontend/src/config/defaultConfig.js* (*line 30*).

Change a port number for *cnomConfig* from `8081` to `8080` in the file *$NAS_HOME/backend/config/frontend-config.json* (*line 32*).

Change *cnomDataSourceType* the file *$NAS_HOME/frontend/src/config/defaultConfig.js* (line 33) from `CnomDataSourceType.PM_STATS_QUERY_SERVICE` to `CnomDataSourceType.FAKE`.

Change *cnomDataSourceType* in the file *$NAS_HOME/frontend/public/deployment-config/frontend-config.json* (line 35) from `cnomDataSourceType` to `fake`.

Running NAS micro-service:

```shell
npm run standalone:dev
```

On UI, click a table row and then click a "chart" icon to check if you can get CNOM data source.

## **Application Integration**

### Prerequisites

This section does  _not*  replace the user guides deployment instructions, but to give a general idea of
how to install Network Assurance Search and dependency services.

*Note: All "kubectl" commands below are shown without namespace specification.*

To install all helm charts, it is assumed a helm repository with the name  **adp_repo**  exists.

```bash
helm repo list
NAME        URL
adp_repo    https://arm.seli.gic.ericsson.se/artifactory/proj-eric-oss-drop-helm/
```

If the repository has a different name, please update all  **helm install**  commands accordingly.
In case the  *proj-eric-oss-drop-helm*  repository does not appear in the list above, please use the following command to add it:

```bash
helm repo add adp_repo https://arm.seli.gic.ericsson.se/artifactory/proj-eric-oss-drop-helm/ --username $USER --password $API_TOKEN
```

"adp_repo" has been added to your repositories

To get the latest information about charts locally from the helm chart repo, use the following command:

```bash
helm repo update
```

#### Install SIP-TLS

```bash
helm install eric-sec-sip-tls adp_repo/eric-sec-sip-tls
```

#### Install Log-Transformer

```bash
helm install eric-log-transformer adp_repo/eric-log-transformer
```

## **Interfaces**

The Network Assurance Search Microservice currently has ten REST API endpoints which are described below.

It is important to note that all query parameters need to be stringified into a URI encoding. The Network Assurance Search
Microservice uses the [`qs`](https://github.com/ljharb/qs) library to stringify and parse the query parameters. Here is a
quick example of how to stringify and parse query parameters using the `qs` library:

```javascript
import qs from 'qs';

const baseUrl = 'http://localhost:3000/example-endpoint';
const queryParams = {
  queryParam1: 'ONE',
  queryParam2: 'TWO',
  queryParam3: 'THREE',
};

// Stringifying query parameters into a URI encoding
const stringifiedQueryParams = qs.stringify(queryParams);

// Parsing the query parameters
const decodedQueryParams = qs.parse(stringifiedQueryParams);

// Appending the the query parameters to the base URL before executing the request
const url = `${baseUrl}?${stringifiedQueryParams}`;
```

### **`GET /internal-api/ui`**

Making a GET request to the /internal-api/ui endpoint returns frontend static content, such as JavaScript, CSS, images, etc.

### **`GET /internal-api/uiConfig`**

Making a GET request to the /internal-api/uiConfig endpoint returns the current UI config JSON object to the frontend.
The config JSON object is constructed from the helm values.

Here is an example of a UI config JSON object that could be returned from this endpoint:

```json
{
  "internal": {
    "prefix": "/internal-api",
    "routes": {
      "config": "/uiConfig",
      "ui": "/ui"
    }
  },
  "api": {
    "prefix": "",
    "routes": {
      "searchMetrics": "/:index/search/metrics",
      "searchContexts": "/:index/search/contexts",
      "searchRelatedContextsFacets": "/:index/search/related-contexts-facets",
      "metadataRelations": "/:index/metadata/relations",
      "metadataContexts": "/:index/metadata/contexts",
      "metadataMetrics": "/:index/metadata/metrics",
      "metadataAll": "/:index/metadata",
      "metadataIndexes": "/metadata/indexes"
    }
  }
}
```

### **`GET /metrics`**

Making a GET request to the /metrics endpoint retrieves Prometheus metrics for this microservice.

Here is an example of what may be returned from this endpoint:

```txt
# HELP eric_oss_network_assurance_search_process_cpu_user_seconds_total Total user CPU time spent in seconds.
# TYPE eric_oss_network_assurance_search_process_cpu_user_seconds_total counter
eric_oss_network_assurance_search_process_cpu_user_seconds_total{app="eric-oss-network-assurance-search"} 7.872836

# HELP eric_oss_network_assurance_search_process_cpu_system_seconds_total Total system CPU time spent in seconds.
# TYPE eric_oss_network_assurance_search_process_cpu_system_seconds_total counter
eric_oss_network_assurance_search_process_cpu_system_seconds_total{app="eric-oss-network-assurance-search"} 1.164983

...
```

### **`GET /:index/search/metrics`**

Making a GET request to the /:index/search/metrics endpoint retrieves an array of KPIs matching the search criteria. Refer to our OpenAPI
Guide documentation for a complete description of the query parameters of this endpoint, or refer to the General Concept section above.

Here is an example of a set of valid query parameters:

```json
{
  "contextTypeId": "tac",
  "metricTypes": [
    {
      "id": "vd_tac_PartialDBRAccessibility"
    },
    {
      "id": "vd_tac_DLLat_gNB-DU"
    },
    {
      "id": "vd_tac_DLDelay_gNBDU"
    },
    {
      "id": "vd_tac_DLUeThroughput"
    },
    {
      "id": "vd_tac_UlUeThroughput"
    },
    {
      "id": "vd_tac_GRANGOSR"
    },
    {
      "id": "vd_tac_5GSEPHOSR"
    }
  ],
  "sortBy": {
    "id": "vd_tac_PartialDBRAccessibility"
  },
  "sortOrder": "asc",
  "offset": "0",
  "length": "1"
}
```

After stringifying these query parameters, the full request URL would look like:

```txt
${BASE-URL}/soa/search/metrics?contextTypeId=tac&metricTypes%5B0%5D%5Bid%5D=vd_tac_PartialDBRAccessibility&metricTypes%5B1%5D%5Bid%5D=vd_tac_DLLat_gNB-DU&metricTypes%5B2%5D%5Bid%5D=vd_tac_DLDelay_gNBDU&metricTypes%5B3%5D%5Bid%5D=vd_tac_DLUeThroughput&metricTypes%5B4%5D%5Bid%5D=vd_tac_UlUeThroughput&metricTypes%5B5%5D%5Bid%5D=vd_tac_GRANGOSR&metricTypes%5B6%5D%5Bid%5D=vd_tac_5GSEPHOSR&sortBy%5Bid%5D=vd_tac_PartialDBRAccessibility&sortOrder=asc&offset=0&length=1
```

Here is an example of what may be returned from this endpoint:

```json
{
  "offset": 0,
  "length": 1,
  "total": 17,
  "results": [
    {
      "context": {
        "type": {
          "id": "tac",
          "contextFields": [
            {
              "id": "tac"
            }
          ]
        },
        "contextFields": [
          {
            "id": "tac_807",
            "name": "807",
            "type": {
              "id": "c_tac"
            }
          }
        ]
      },
      "metrics": [
        {
          "type": {
            "id": "vd_tac_PartialDBRAccessibility"
          },
          "value": 28.99985,
          "beginTimestamp": 1704304699,
          "endTimestamp": 1704304781,
          "metadata": [
            {
              "key": "csac_table",
              "value": "kpi_csac_tac_10"
            },
            {
              "key": "csac_column",
              "value": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4"
            }
          ]
        },
        {
          "type": {
            "id": "vd_tac_DLLat_gNB-DU"
          },
          "value": 483.444068,
          "beginTimestamp": 1704304699,
          "endTimestamp": 1704304781,
          "metadata": [
            {
              "key": "csac_table",
              "value": "kpi_csac_tac_10"
            },
            {
              "key": "csac_column",
              "value": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5"
            }
          ]
        }
      ]
    }
  ]
}
```

### **`GET /:index/search/contexts`**

Making a GET request to the /:index/search/contexts endpoint retrieves an array of context fields that match the search criteria.
This endpoint requires a "searchQuery" query parameter to be sent with the request, which supports wildcard (*|?) characters.

Here is an example of a set of valid query parameters:

```json
{
  "filters": [
    {
      "type": "entity",
      "entityType": {
        "id": "c_tac"
      },
      "searchPattern": "905"
    }
  ],
  "offset": "0",
  "length": "1"
}
```

After stringifying these query parameters, the full request URL would look like:

```txt
${BASE-URL}/soa/search/contexts?filters%5B0%5D%5Btype%5D=entity&filters%5B0%5D%5BentityType%5D%5Bid%5D=c_tac&filters%5B0%5D%5BsearchPattern%5D=905&offset=0&length=1
```

Here is an example of what may be returned from this endpoint:

```json
{
  "offset": 0,
  "length": 1,
  "total": 10000,
  "results": [
    {
      "type": {
        "id": "cellId_managedElement_nssi_plmnId_snssai_tac",
        "contextFields": [
          {
            "id": "cellId"
          },
          {
            "id": "managedElement"
          },
          {
            "id": "nssi"
          },
          {
            "id": "plmnId"
          },
          {
            "id": "snssai"
          },
          {
            "id": "tac"
          }
        ]
      },
      "contextFields": [
        {
          "id": "556",
          "type": {
            "id": "c_cellId"
          }
        },
        {
          "id": "me-1-id",
          "type": {
            "id": "c_managedElement"
          }
        },
        {
          "id": "macNsiDedicated20230728x1543_corNssiService",
          "type": {
            "id": "c_nssi"
          }
        },
        {
          "id": "302-221",
          "type": {
            "id": "c_plmnId"
          }
        },
        {
          "id": "2-2002",
          "type": {
            "id": "c_snssai"
          }
        },
        {
          "id": "905",
          "type": {
            "id": "c_tac"
          }
        }
      ]
    }
  ]
}
```

### **`GET /:index/search/related-contexts-facets`**

Making a GET request to the /:index/search/related-contexts-facets endpoint retrieves related facet counts for given context types.

Here is an example of a set of valid query parameters:

```json
{
  "contextId": {
    "type": {
      "id": "nf",
      "contextFields": [
        {
          "id": "c_nf",
          "name": "NF",
          "description": "Network Function",
          "dataType": "entityType"
        }
      ]
    },
    "contextFields": [
      {
        "id": "AMF_ON2",
        "type": {
          "id": "c_nf"
        }
      }
    ]
  },
  "contextTypeId": "nf"
}
```

After stringifying these query parameters, the full request URL would look like:

```txt
${BASE-URL}/soa/search/related-contexts-facets?contextId%5Btype%5D%5Bid%5D=nf&contextId%5Btype%5D%5BcontextFields%5D%5B0%5D%5Bid%5D=c_nf&contextId%5Btype%5D%5BcontextFields%5D%5B0%5D%5Bname%5D=NF&contextId%5Btype%5D%5BcontextFields%5D%5B0%5D%5Bdescription%5D=Network%20Function&contextId%5Btype%5D%5BcontextFields%5D%5B0%5D%5BdataType%5D=entityType&contextId%5BcontextFields%5D%5B0%5D%5Bid%5D=AMF_ON2&contextId%5BcontextFields%5D%5B0%5D%5Btype%5D%5Bid%5D=c_nf&contextTypeId=nf
```

Here is an example of what may be returned from this endpoint:

```json
[
  {
    "contextType": {
      "id": "nf_snssai",
      "contextFields": [
        {
          "id": "c_nf",
          "name": "NF",
          "description": "Network Function"
        },
        {
          "id": "c_snssai",
          "name": "S-NSSAI",
          "description": "Single - Network Slice Selection Assistance Information"
        }
      ]
    },
    "count": 48
  }
]
```

### **`GET /metadata/indexes`**

Making a GET request to the /metadata/indexes endpoint returns an array of available indexes (domains). This endpoint does not require any
query parameters to be sent.

Here is an example of what may be returned from this endpoint:

```json
[
  {
    "name": "soa",
    "displayName": "soa_DisplayName",
    "indexDescription": "Description of soa"
  },
  {
    "name": "index1",
    "displayName": "SearchIndex1_DisplayName",
    "indexDescription": "Description of index1"
  },
  {
    "name": "index2",
    "displayName": "SearchIndex2_DisplayName",
    "indexDescription": "Description of index2"
  }
]

```

### **`GET /:index/metadata/relations`**

Making a GET request to the /:index/metadata/relations endpoint returns an array of relations for a given context. This endpoint requires
a "contextFields" query parameter to be sent with the request.

Here is an example of a set of valid query parameters:

```json
{
  "contextTypeId": "nf"
}
```

After stringifying these query parameters, the full request URL would look like:

```txt
${BASE-URL}/soa/metadata/relations?contextTypeId=nf
```

Here is an example of what may be returned from this endpoint:

```json
[
  {
    "relationType": "RELATED_TO",
    "related": {
      "id": "nf_snssai",
      "contextFields": [
        {
          "id": "c_nf",
          "name": "NF",
          "description": "Network Function"
        },
        {
          "id": "c_snssai",
          "name": "S-NSSAI",
          "description": "Single - Network Slice Selection Assistance Information"
        }
      ]
    }
  }
]
```

### **`GET /:index/metadata/contexts`**

Making a GET request to the /:index/metadata/contexts endpoint returns an array of available context types. This endpoint does not require any
query parameters to be sent.

Here is an example of what may be returned from this endpoint:

```json
[
  {
    "id": "cellId_managedElement_nssi_plmnId_qos_snssai_tac",
    "contextFields": [
      {
        "id": "c_cellId",
        "name": "Cell ID",
        "description": "Cell Identifier"
      },
      {
        "id": "c_managedElement",
        "name": "Managed Element",
        "description": "Managed Element"
      },
      {
        "id": "c_nssi",
        "name": "NSSI",
        "description": "Network Slice Subnet Instance"
      },
      {
        "id": "c_plmnId",
        "name": "PLMN ID",
        "description": "Public Land Mobile Network Identifier"
      },
      {
        "id": "c_qos",
        "name": "QoS",
        "description": "5G Quality of Service Identifier"
      },
      {
        "id": "c_snssai",
        "name": "S-NSSAI",
        "description": "Single - Network Slice Selection Assistance Information"
      },
      {
        "id": "c_tac",
        "name": "TAC",
        "description": "Tracking Area Code"
      }
    ]
  }
]
```

### **`GET /:index/metadata/metrics`**

Making a GET request to the /:index/metadata/metrics endpoint returns an array of available metrics for a given context. This endpoint requires
a "contextFields" query parameter to be sent with the request.

Here is an example of a set of valid query parameters:

```json
{
  "contextTypeId": "nf"
}
```

After stringifying these query parameters, the full request URL would look like:

```txt
${BASE-URL}/soa/metadata/metrics?contextTypeId=nf
```

Here is an example of what may be returned from this endpoint:

```json
[
  {
    "id": "vi_nf_AMFMeanRegNbr",
    "name": "AMFMeanRegNbr",
    "valueType": "integer",
    "description": "Mean number of subscribers registered to a network slice instance measured at the AMF ",
    "unit": "subscribers"
  },
  {
    "id": "vd_nf_PDUSessEstSR",
    "name": "PDUSessEstSR",
    "valueType": "float",
    "description": "Rate of successful PDU session establishment requests for an SMF related to one network slice (S-NSSAI)",
    "unit": "successful requests"
  },
  {
    "id": "vd_nf_PDUSessModSR",
    "name": "PDUSessModSR",
    "valueType": "float",
    "description": "Rate of successful PDU session modifications",
    "unit": "successful modifications"
  }
]

```

### **`GET /:index/metadata`**

Making a GET request to the /:index/metadata endpoint returns all static data combined together.
This endpoint does not require any query parameters to be sent.

Here is an example of what may be returned from this endpoint:

```json
[
  {
    "contextType": {
      "id": "tac",
      "contextFields": [
        {
          "id": "c_tac",
          "name": "TAC",
          "description": "Tracking Area Code"
        }
      ]
    },
    "relations": [
      {
        "relationType": "RELATED_TO",
        "related": {
          "id": "nssi_tac",
          "contextFields": [
            {
              "id": "c_nssi",
              "name": "NSSI",
              "description": "Network Slice Subnet Instance"
            },
            {
              "id": "c_tac",
              "name": "TAC",
              "description": "Tracking Area Code"
            }
          ]
        }
      }
    ],
    "metricTypes": [
      {
        "id": "vd_tac_PartialDBRAccessibility",
        "name": "Partial DBR Accessibility",
        "valueType": "float",
        "description": "The Data Radio Bearer (DRB) setup success rate, including the success rate for setting up Radio Resource Control (RRC)
        connection and Next Generation (NG) signaling connection",
        "unit": "successes"
      },
      {
        "id": "vd_tac_DLLat_gNB-DU",
        "name": "DLLat_gNB-DU",
        "valueType": "float",
        "description": "The gNodeB-Distributed unit (gNB-DU) part of the packet transmission latency experienced by an end-user. It is used to
        evaluate the gNB latency contribution to the total packet latency",
        "unit": "milliseconds"
      }
    ]
  }
]

```

### **API Schema**

Refer to our OpenAPI Guide documentation or the API Documentation for the API schema of the Network Assurance Search Microservice.

#### **API Schema Changes**

If a developer makes a change to the API Schema, they *must* also regenerate the object model classes for both the backend and the frontend, which
are based upon the API Schema. Fortunately, this process has been fully automated and only requires a few commands to be run.
Follow the guide below to regenerate the object models.

##### **Step 1: Changes Are Made To The API Schema**

Make your changes to the API Schema within the `docs/api/spec` directory.

##### **Step 2: Installing Dependencies**

Ensure that you've installed all required project dependencies by running the following command from the project's root directory.

```bash
npm run install:all
```

##### **Step 3: Confirming Java JDK Installation**

To regenerate the object model classes, you must have a Java JDK properly installed on your local computer.
You can check if a Java JDK is installed by running the following command:

```bash
java -version
```

If it's been installed correctly, the response from the above command should look similar to this:

```bash
openjdk version "11.0.20" 2023-07-18
OpenJDK Runtime Environment (build 11.0.20+8-post-Ubuntu-1ubuntu122.04)
OpenJDK 64-Bit Server VM (build 11.0.20+8-post-Ubuntu-1ubuntu122.04, mixed mode, sharing)
```

If your output is different, you must install a Java JDK by following the set of instructions tailored to your computer's operating system:

[Windows Java Installation Instructions](https://docs.oracle.com/en/java/javase/11/install/installation-jdk-microsoft-windows-platforms.html#GUID-A7E27B90-A28D-4237-9383-A58B416071CA)

[macOS Java Installation Instructions](https://docs.oracle.com/en/java/javase/20/install/installation-jdk-macos.html#GUID-2FE451B0-9572-4E38-A1A5-568B77B146DE)

[Ubuntu Java Installation Instructions](https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-22-04)

If you're using any other Linux distribution, it is expected that you can figure it out.

##### **Step 4: Regenerating The Object Model Classes**

Now that all the required dependencies have been properly installed, we can regenerate the object model classes
by running the following `npm` command from the project's root directory:

```bash
npm run generate-move:models:all
```

This command may take some time to complete. Once it has finished, we will regenerate the documentation files
by running the following `npm` command from the project's root directory:

```bash
npm run generate:apiDocs
```

You should now have successfully regenerated the object model classes and the documentation files that go along with them.

##### **Step 5: Manually Updating Documentation**

In the last step, you've updated the API Documenation using a script. However, it's possible that your API Schema changes need
to be reflected within the Application Developers Guide or the User Service Guide documentation files manually.
Please ensure that you make any required updates to these documentation files.

### **API Configuration**

The following is a guide on how to run the API in development mode so that you can perform modifications easily.

#### **Step 1: Cloning the repository**

Clone the Network Assurance Search Microservice repository from Gerrit using either ssh:

```bash
git clone ssh://gerrit-gamma.gic.ericsson.se:29418/OSS/com.ericsson.oss.air/eric-oss-network-assurance-search
```

or http:

```bash
git clone https://gerrit-gamma.gic.ericsson.se/a/OSS/com.ericsson.oss.air/eric-oss-network-assurance-search
```

Once the repository has been successfully cloned, change directory into the repository root folder:

```bash
cd eric-oss-network-assurance-search
```

#### **Step 2: Installing the application dependencies**

Install the application dependencies by running the following command from the root directory:

```bash
npm run install:all
```

#### **Step 3: Starting the backend in development mode**

Start the backend in development mode by running the following command from the root directory:

```bash
npm run start:server
```

The backend should now be accessible through port 3000.

#### **Step 4: Making modifications**

Refer to the files within the *backend/routes/* directory to see how the current routes are being configured. All routes are defined within
the *backend/config/api-config.json* file.

### Running the frontend with the mock

To run the frontend with the mock, follow the steps below:

#### Step 1: Generating docs

Generate docs by running the following command from docs/api directory :

```bash
npm run generate-docs
```

#### Step 2 : Changing a port number

Change the base URL's port number from 3000 to 8080 by running the following command from frontend/src/ApiClient.js

#### Step 3 : Runnning the mock

Open a new terminal and run the mock by running the following command from the root directory :

```bash
npm run start:mock
```

#### Step 4 : Running the frontend

Open a new terminal and run the frontend by running the following command from the root directory :

```bash
npm run start:frontend
```

### **Search Engine Interface**

Of the endpoints listed above, the Network Assurance Search Microservice makes requests to the
[Search Engine service](https://adp.ericsson.se/marketplace/search-engine) for the URIs that follow
the pattern of "/:index/search/*". For the Network Assurance Search Microservice to function correctly,
the response of these Search Engine requests must follow a specific schema. More specifically, each of the
documents contained within the Search Engine's response
*must* have these properties within the `_source` object:

- full_context: string
- context: array of strings
- csac_table: string
- csac_column: string

Additionally, each of the properties must be of the correct type. Refer to the examples below for more information.

The schema used for the Search Engine document validation also contains these optional properties:

- ft_begin_timestamp: integer
- ft_end_timestamp: integer
- fk_begin_timestamp: string
- fk_end_timestamp: string

The `_source` object within the Search Engine documents do not need to contain the optional properties, however
there is added functionality in the UI if they are present.

To view the [JSON schema](https://json-schema.org/) that the Network Assurance Search Microservice uses to validate the
responses coming from the Search Engine service, check out the files within the following folder within the Microservice's repository:
[backend/utils/opensearchJsonSchemas/](https://gerrit-gamma.gic.ericsson.se/plugins/gitiles/OSS/com.ericsson.oss.air/eric-oss-network-assurance-search/+/refs/heads/master/backend/utils/opensearchJsonSchemas/).

#### Valid Search Engine Response Document Example 1

The object below represents a valid Search Engine response document because the `_source` object contains
all of the required properties.

```json
{
    "_index": "soa",
    "_id": "AMFMeanRegNbr@NF:AMF_BC::SNSSAI:1:1::",
    "_score": null,
    "_source": {
        "full_context": "NF_SNSSAI",
        "context": ["SNSSAI", "NF"],
        "c_SNSSAI": "1:1",
        "c_NF": "AMF_BC",
        "vi_NF_SNSSAI_AMFMeanRegNbr": 10,
        "csac_table": "kpi_csac_simple_snssai_mofdn_15",
        "csac_column": "csac_0fcf6508_67cc_4969_a1f2_566c106e38b0",
        "ft_begin_timestamp": 1676241825,
        "ft_end_timestamp": 1676242825
    },
    "sort": [10]
}
```

#### Valid Search Engine Response Document Example 2

The object below represents a valid Search Engine response document because the `_source` object contains
all of the required properties, this time with `fk_` prefixed timestamps.

```json
{
    "_index": "soa",
    "_id": "AMFMeanRegNbr@NF:AMF_BC::SNSSAI:1:1::",
    "_score": null,
    "_source": {
        "full_context": "NF_SNSSAI",
        "context": ["SNSSAI", "NF"],
        "c_SNSSAI": "1:1",
        "c_NF": "AMF_BC",
        "vi_NF_SNSSAI_AMFMeanRegNbr": 10,
        "csac_table": "kpi_csac_simple_snssai_mofdn_15",
        "csac_column": "csac_0fcf6508_67cc_4969_a1f2_566c106e38b0",
        "fk_begin_timestamp": "1676241825",
        "fk_end_timestamp": "1676242825"
    },
    "sort": [10]
}
```

#### Invalid Search Engine Response Document Example 1

The object below represents an invalid Search Engine response document because the `_source` object does not contain
all of the required properties. It is missing both the `csac_table` and the `csac_column` property.

```json
{
    "_index": "soa",
    "_id": "AMFMeanRegNbr@NF:AMF_BC::SNSSAI:1:1::",
    "_score": null,
    "_source": {
        "full_context": "NF_SNSSAI",
        "context": ["SNSSAI", "NF"],
        "c_SNSSAI": "1:1",
        "c_NF": "AMF_BC",
        "vi_NF_SNSSAI_AMFMeanRegNbr": 10,
        "ft_begin_timestamp": 1676241825,
        "ft_end_timestamp": 1676242825
    },
    "sort": [10]
}
```

#### Invalid Search Engine Response Document Example 2

The object below represents an invalid Search Engine response document. Although the `_source` object contains
all of the required properties, the values for the `csac_table` and the `csac_column` properties
are numbers instead of strings.

```json
{
    "_index": "soa",
    "_id": "AMFMeanRegNbr@NF:AMF_BC::SNSSAI:1:1::",
    "_score": null,
    "_source": {
        "full_context": "NF_SNSSAI",
        "context": ["SNSSAI", "NF"],
        "c_SNSSAI": "1:1",
        "c_NF": "AMF_BC",
        "vi_NF_SNSSAI_AMFMeanRegNbr": 10,
        "csac_table": 15,
        "csac_column": 38,
        "ft_begin_timestamp": 1676241825,
        "ft_end_timestamp": 1676242825
    },
    "sort": [10]
}
```

#### Example API Response For An Invalid Search Engine Document

The Network Assurance Search Microservice's API endpoints which make requests to the Search Engine service
validate that the response follows the correct schema. If the validation fails, the response from the Microservice
will be verbose and describe why the validation failed. The example response below indicates that a document received
from the Search Engine service was missing two required properties: `csac_table` and `csac_column`.

```json
{
  "name": "OpenSearch Response Validation Error",
  "code": 400,
  "message": [
    {
      "instancePath": "/hits/hits/0/_source",
      "schemaPath": "https://nas.ericsson.com/schemas/opensearchDocumentSourceModel.schema.json/required",
      "keyword": "required",
      "params": {
        "missingProperty": "csac_table"
      },
      "message": "must have required property \"csac_table\""
    },
    {
      "instancePath": "/hits/hits/0/_source",
      "schemaPath": "https://nas.ericsson.com/schemas/opensearchDocumentSourceModel.schema.json/required",
      "keyword": "required",
      "params": { "missingProperty": "csac_column" },
      "message": "must have required property \"csac_column\""
    }
  ]
}
```

## UI Reusable Components

The Network Assurance Search UI shares the following components that can be reused in other micro services:

### Metric Browser

A multi-tile panel web component that includes:

- An **EUI-SDK table** with:
  - selectable rows
  - resizable, sortable columns
  - pagination
  - configurable action bar and context menu (available on row select)
- A **filter panel** with a filtering interface for the table that groups filters into `categories`:
`categories` are represented as Accordions in the filter panel (Checkbox or Radio selection). Each filter category is configurable
using the `categories` property. Filters are provided through the `filters` property and will be sorted into their appropriate category
by matching the categories object **type** with the filters object's **filterCategory** property (Context or Metric)

When there is an active metric filter and users select a different metric from a table column for sorting,
it deselects the active metric filter because of the change in the sort. In this case, a toast notification is fired to indicate to users the change.
When a metric filter applies to a different KPI column than a table column that holds the active sort, a warning message appears
on the top of the list for the radio options and the Metric filter dialog column selector.

*Note: While the metric browser is initially intended to display performance metrics, the component should be reusable for other table use cases.*

- A **table setting dialog** with:
  - the row height of the table
  - the metrics to include in the table
  - the order of columns in the table
  - the visibility of columns in the table.

- An **Autorefresh** option:
If the tab is active, auto-refresh is on. If auto-refresh is on, it can be paused by clicking a pause button to stop auto-refresh.
Once it is paused, a manual refresh button is offered.

#### Use Case

Display data for a selected KPI context in a table filterable table that supports contextual actions.

- When a row of the table is left-clicked, the top table action buttons are displayed.
- When a row of the table is right-clicked, the table context menu with the actions is displayed.
- Selecting a context option to explore from a row should open a new tab with filters for the relevant context field value of the row.

Users can find existing filters by column name or value.

Users can add, edit and remove filter list items for "network" (Checkbox) and "measurement" (Radio box) filters.

#### Props

| Name                 | Type    | Default   | Description                                                                                                                        |
| -------------------- | ------- | --------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| id               | String  | Undefined | Browser id |
| title            | String  | Placeholder Title | Metric Browser title |
| active           | Boolean | false | Activation status for a tab |
| filterCategories | Array   | [ ]   | A list of filter category information including type, title, selection,and fields  |
| filters          | Array   | [ ]   | A list of filters (currently applied or not) for metric browser instance |
| match            | String  | ' '   | Substring of existing filters to highlight in bold if there is a match |
| columns          | Array   | [ ]   | A list of columns for the metric browser table |
| data             | Object  | { }   | Data object to be displayed for the table { tableData, fetchTime } |
| selectedContext  | Object  | Undefined | The active metric browser selection object { displayName, open, dashboardURL, CTSQuery } |
| lastRefreshed    | String  | Undefined | Time since last refresh |
| error            | String  | Undefined | Error information |
| loading          | Boolean | false | Boolean to check if it is loading |
| actions          | Array   | Undefined | A list of related contexts facets |
| selectedRow      | Object  | Undefined | Data object when a row is clicked from a table |
| settings         | Object  | Undefined | Settings for the metric browser {autoRefresh, rowHeight, columns} |

**The structure of `filterCategories` example:**

```json
[
    {
        "type": "context",                        // The filter category type (How filters are grouped into the right filter category)
        "title": "Network Context",               // The name of the filter category accordion
        "selection": "checkbox",                  // The selection mechanism of the filter category group ("radio" or "checkbox")
        "help": "NETWORK_FILTER_TOOLTIP_MESSAGE", // The locale key to reference what help content should be displayed in the popover
        "fields": [                               // A list of objects representing the fields that you can make a filter for in this filter category
            {
                "filterCategory": "context",
                "label": "NF",
                "name":"c_NF",
                "type":{
                    "dataType": "entityType",
                    "description": "Network Function",
                    "id" : "c_NF",
                    "name" : "NF",
                    "valueType" : "string"
                }
            }
        ]
    }
]
```

**The structure of `filters` example :**

```json
[
    {
        "label": "Slice A (NSI)",       // A label of filter
        "name": "c_NSI",                // A type of filter
        "type": {                       // A type of data about the filter
            "id": "c_NSI",
            "name": "NSI",
            "description": "Network Slice Instance",
            "valueType": "string",
            "dataType": "entityType"
        },
        "value": {                      // The object that defines the value of the filter
            "from": 0,                  // Starting point for number range operations
            "to": 0,                    // Ending point for number range operations
            "searchPattern": "Slice A", // Pattern to match for string operations
            "not": false,               // Doesn't or does match flag
            "operation": "eq",          // The operation being performed
          },
        "filterCategory": "context",    // The filter category that the filter belongs to
        "selected": false,              // Whether or not the filter is selected
    },
]
```

**The `operations` are:**

| Operation Description | Value          |
| --------------------- |----------------|
| Equal To | 'eq'
| Less Than | 'lt'
| Greater Than | 'gt'
| Not Equal | 'neq'
| In Range | 'inr'
| Not In Range | 'ninr'

**The structure of `columns` example :**

Refer to the format of the columns expected from the [EUI SDK Table](https://euisdk.seli.wh.rnd.internal.ericsson.com/euisdk/#table-component)

```json
[
    {
        "title": "Title 1",
        "attribute": "col1",
        "sortable": true
    }
]
```

**The structure of `settings` example :**

```json
{
    "autoRefresh": false,   // Whether or not the Auto-refresh is on
    "columns": [            // Data for columns in a table
        {
          "title": "My NF",
          "attribute": "c_NF",
          "sortable": true,
          "additionalInfo": "New Finger",
          "width": "300px",
          "pinned": true,
        },
        {
          "title": "AMF Mean Reg Nbr (errors/minute)",
          "attribute": "vi_NF_AMFMeanRegNbr",
          "valueType": "integer",
          "sortable": true,
          "additionalInfo": "AMFMeanRegNbr Description",
          "width": "300px",
          "sortNotificationInfo": "AMF Mean Reg Nbr",
        },
        {
          "title": "AMF Mean Reg Nbr 2 (errors/minute)",
          "attribute": "vi_NF_AMFMeanRegNbr2",
          "valueType": "integer",
          "sortable": true,
          "additionalInfo": "AMFMeanRegNbr2 Description",
          "width": "300px",
          "sortNotificationInfo": "AMF Mean Reg Nbr 2",
        }
    ],
    "rowHeight": "compact"  // A row height setting in a table. "tiny" or "undefined"(default to normal) can be used.
}
```

#### Events

| Name               | Description                                                                                 |
| ------------------ |---------------------------------------------------------------------------------------------|
| register-browser | Triggered when the metric browser component is added to the DOM
| metric-search | Triggered when users click the "refresh button" or on sort, on paging. It refreshes the table data. See below for the schema of the data that is emitted
| update-filters | It is an object with "updateOperation" and "data" keys. "updateOperation" key has 8 types, which are "add-filter", "edit-filter", "select-filter", "remove-filter", "select-all-of-type", "clear-all-of-type", "remove-all-of-type" and "clear-all-filters". See below for the description of sub-type operations.
| update-match | Triggered when users type input to the "find existing filters"
| table-actions | Triggered when users click the "action button" of the table. It will open the new tab and show the respected network info, data, table data in the new tab
| table-actions-row-selected | Triggered when users click a row from a table
| update-facet-counts | Triggered when either a right click or left click is performed on a row. It will update the related contexts facet counts for the clicked row
| clear-facet-counts | Triggered when "update-facet-counts" is fired. It will clear the related contexts facet counts for the specified location (contextMenu, actionButtons, etc.)
| pause | Triggered when users click the "table settings" button. It will display the table settings dialog
| update-settings | Triggered when users click the "save" button on the table settings dialog. It will update the table with the selected settings and close the dialog
| cancel-dialog | Triggered when users click the "cancel" button on the table settings dialog. It will close the dialog

**A description of the sub-type of `update-filters` operations**

| Sub-type               | Description                                                                                 |
| ------------------ |---------------------------------------------------------------------------------------------|
| add-filter | Adds a filter to a specified filter category, selected by default
| edit-filter | Updates a specified filter in a specified filter category
| select-filter | Selects or deselects a specified filter in a filter category
| remove-filter | Removes a specified filter from a specified filter category
| select-all-of-type | Selects all filters in a specified filter category
| clear-all-of-type | Deselects all filters in a specified filter category
| remove-all-of-type | Deletes all filters in a specified filter category
| clear-all-filters | Deselects all filters across all filter categories

**The schema of `metric-search` event data that is emitted**

Sort example:

```json
{
  "sortOrder": "asc",
  "sortBy": { "id": "col1" }
}
```

Pagination example:

```json
{
  "state": {
    "currentPage":1,
    "hasNextPage":true,
    "hasPreviousPage":false,
    "numEntries":5,
    "numPages":2,
    "pageClicked":3,
    "sortBy":{
        "id":"vi_sessionModificationReqRcvd"
    },
    "sortOrder": "asc"
  },
}
```

**The schema of `table-action` event data that is emitted**

```json
{
    "operation":"open-tab",
    "id":"52ab74e5-f689-4406-b44d-eb03f50886ed",
    "context":{
        "id":"NF_NSI",
        "name":"MY NSI & MY NF",
        "contextFields":[
            {
                "dataType":"entityType",
                "description": "MY NSI description",
                "id":"c_NSI",
                "name":"MY NSI"
            },
            {
                "dataType":"entityType",
                "description": "MY NF description",
                "id":"c_NF",
                "name":"MY NF"
            }
        ]
    },
    "row":{
        "c_NF":"AMF_BC",
        "vi_NF_AMFMeanRegNbr":60,
        "vi_NF_SessionModificationReqRcvd":30,
        "metadata":{
            "context":"",
            "contextName":"My NF",
            "metrics":[
                {
                  "description" :"AMFMeanRegNbr Description",
                  "id": "vi_NF_AMFMeanRegNbr",
                  "name":"AMF Mean Reg Nbr",
                  "unit":"errors/minute",
                  "value":60,
                  "valueType":"integer"
                },
                {
                  "description" :"Session Modification Request Received",
                  "id": "vi_NF_SessionModificationReqRcvd",
                  "name":"SessionModificationReqRcvd",
                  "unit":"errors/minute",
                  "value":30,
                  "valueType":"integer"
                },
            ]
        }
    }
}
```

## Troubleshooting

`Error Banner` and `Browser Developer Tools Console` are used to providing further information for troubleshooting

### Error Banner

- The application requires non-empty index and context information to be returned from the discovery services provided
by the Assurance Indexer via the Network Assurance Search backend for configuration.
If the data is returned empty or the network request fails then the Network Assurance Application cannot be configured
and the user will observe a banner and error messaging identifying that the dashboard has failed to load :
`"Dashboard failed to load. Reload the page to try again"`
**To resolve the issue:** verify that Assurance Indexer is working and that indexes and context information for indexes can be returned nonempty.

- Metric Browser displays an error banner when no columns are provided to the component with `"The table couldn't be built. 'Reload' to try again"` message.
**To resolve the issue:** a nonempty columns prop must be provided to the metric browser component following the column schema defined earlier in the document.

- If users try to view information for a network context that doesn't exist, the user will see a page banner with
`The Context you are trying to view doesn't exist. Select 'Add Network Context' to view available network contexts` message.
**To resolve the issue:** click "Add Network Context" to view the available network contexts

### Browser Developer Tools Console

If experiencing a failure to fetch data or a failure to load the data then you can navigate to the Network tab of the element inspector
to determine what network request is failing.
For Chrome, follow [this guide](https://developer.chrome.com/docs/devtools/network/#open)

The application throws logs to the console in case of errors. Here are some of the examples :

- `The table is misconfigured because it has no columns`
- `Time last data was fetched was not provided. Defaulting to now`
: The last fetched time is used for the relative time subtitle of the metric browser.
It should be included in the data object provided to the metric browser, if it is not the client will determine its own time to use it.

## **Limitations**

Work In Progress

## **Appendix**

Work In Progress

## **References**

[SIP-TLS User Guide](https://adp.ericsson.se/marketplace/service-identity-provider-tls/documentation/development/dpi/service-user-guide)

[Log Transformer Guide](https://adp.ericsson.se/marketplace/log-transformer/documentation/development/dpi/service-user-guide)

[E-UI SDK](https://euisdk.seli.wh.rnd.internal.ericsson.com/showcase/esm-docs/#welcome)
