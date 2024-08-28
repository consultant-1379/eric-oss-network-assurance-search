---
title: Assurance Search API v1.0.0
language_tabs:
  - javascript: JavaScript
language_clients:
  - javascript: ""
toc_footers: []
includes: []
search: false
highlight_theme: darkula
headingLevel: 2

---

<!-- Generator: Widdershins v4.0.1 -->

# Assurance Search API v1.0.0 {#assurance-search-api}

> Scroll down for code samples, example requests and responses. Select a language for code samples from the tabs above or the mobile navigation menu.

```
  Ericsson   |   DocNo n/155 19-CAF CAF 101 105/3   |   Rev PA1   |   Inter-work Description
```
## Introduction
This document describes the User Interface Internal REST API identified in the ADP GUI FA.
### Terms
- **UI Internal Interface**: The interface providing access to static content meant to be used exclusively by the User Interface itself. All static content paths are relative to this URI.
- **Client Container**: An SPA (Single Page Application) implementing the App Shell pattern e.g. E-UI SDK Container.
- **UI App**: A full screen user interface exposed by a Microservice that can execute in the Client Container e.g. E-UI SDK App.
- ***External UI App***: Any UIs that have a separate web page (outside the Client Container) or other alternative renderer e.g. Citrix.
- **UI Component**: A reusable, embeddable UI Web Component exposed by a Microservice e.g. E-UI SDK Shareable Components.

Base URLs:

* [/](/)

Email: <a href="mailto:sasha.katsman@ericsson.com">Support</a> 
 License: Commercial

# Static Response {#assurance-search-api-static-response}

## Frontend Route {#opIdgetUiServiceAggregation}

`GET /internal-api/ui`

Endpoint that responds with 200. Used for service aggregation purposes.

> Example responses

> default Response

```json
{
  "code": 500,
  "message": "Internal Server Error"
}
```

### Responses {#frontend-route-responses}

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|None|
|default|Default|Internal Server Error|Inline|

### Response Schema {#frontend-route-responseschema}

Status Code **default**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

<aside class="success">
This operation does not require authentication
</aside>

# IF.GUI.INTERNAL.REST {#assurance-search-api-if-gui-internal-rest}

## API for internal configs {#opIdgetUiConfigServiceAggregation}

`GET /internal-api/uiConfig`

Endpoint to provide the current ui-config JSON to the UI. The config is constructed from the helm values. Used for service aggregation purposes.

> Example responses

> 200 Response

```json
{
  "logging": {
    "logLevel": "info"
  },
  "routes": {
    "internal": {
      "prefix": "/ui",
      "routes": {
        "config": "/configuration"
      }
    }
  }
}
```

> 400 Response

```json
{
  "code": 400,
  "message": "Bad Request"
}
```

> 401 Response

```json
{
  "code": 401,
  "message": "Unauthorized"
}
```

> 503 Response

```json
{
  "code": 503,
  "message": "Service Unavailable"
}
```

> default Response

```json
{
  "code": 500,
  "message": "Internal Server Error"
}
```

### Responses {#api-for-internal-configs-responses}

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad Request|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|Inline|
|503|[Service Unavailable](https://tools.ietf.org/html/rfc7231#section-6.6.4)|Service Unavailable|Inline|
|default|Default|Internal Server Error|Inline|

### Response Schema {#api-for-internal-configs-responseschema}

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» logging`|object|false|none|Settings for UI logging|
|`»» logLevel`|string|false|none|Full name of an UI entity. Well-known name defined during development time|
|`» routes`|object|false|none|Optional definition of custom API routes|
|`»» internal`|object|false|none|The internal API description|
|`»»» prefix`|string|false|none|none|
|`»»» routes`|object|false|none|none|
|`»» logging`|object|false|none|The logging API description|
|`»»» prefix`|string|false|none|none|
|`»»» routes`|object|false|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|`logLevel`|debug|
|`logLevel`|info|
|`logLevel`|warning|
|`logLevel`|error|
|`logLevel`|critical|

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **401**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **503**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **default**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

<aside class="success">
This operation does not require authentication
</aside>

# Static Content {#assurance-search-api-static-content}

## Frontend Route {#opIdgetUi}

`GET /ui`

Endpoint to serve static content like JS, CSS, images, etc for Frontend

> Example responses

> 400 Response

```json
{
  "code": 400,
  "message": "Bad Request"
}
```

> 401 Response

```json
{
  "code": 401,
  "message": "Unauthorized"
}
```

> 503 Response

```json
{
  "code": 503,
  "message": "Service Unavailable"
}
```

> default Response

```json
{
  "code": 500,
  "message": "Internal Server Error"
}
```

### Responses {#frontend-route-responses}

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK - Static content|None|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad Request|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|Inline|
|503|[Service Unavailable](https://tools.ietf.org/html/rfc7231#section-6.6.4)|Service Unavailable|Inline|
|default|Default|Internal Server Error|Inline|

### Response Schema {#frontend-route-responseschema}

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **401**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **503**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **default**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

<aside class="success">
This operation does not require authentication
</aside>

# UI Configuration {#assurance-search-api-ui-configuration}

## API for UI configuration {#opIdgetUiConfiguration}

`GET /ui/configuration`

Endpoint to provide the current UI configuration. The configuration is constructed from the helm values.

> Example responses

> 200 Response

```json
{
  "families": [
    {
      "name": "family1",
      "widget": "timeline"
    },
    {
      "name": "family2",
      "widget": "donut"
    }
  ],
  "groups": [
    {
      "name": "group1",
      "title": "Panel 1",
      "sort": "alphabetical",
      "sortOrder": "asc"
    },
    {
      "name": "group2",
      "title": "Panel 2",
      "sort": "alphabetical",
      "sortOrder": "asc"
    }
  ],
  "categories": [
    {
      "name": "category1",
      "title": "Category 1"
    },
    {
      "name": "category2",
      "title": "Category 2"
    }
  ]
}
```

> 400 Response

```json
{
  "code": 400,
  "message": "Bad Request"
}
```

> 401 Response

```json
{
  "code": 401,
  "message": "Unauthorized"
}
```

> 503 Response

```json
{
  "code": 503,
  "message": "Service Unavailable"
}
```

> default Response

```json
{
  "code": 500,
  "message": "Internal Server Error"
}
```

### Responses {#api-for-ui-configuration-responses}

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad Request|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|Inline|
|503|[Service Unavailable](https://tools.ietf.org/html/rfc7231#section-6.6.4)|Service Unavailable|Inline|
|default|Default|Internal Server Error|Inline|

### Response Schema {#api-for-ui-configuration-responseschema}

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» **additionalProperties**`|[object]|false|none|Array of more configuration objects|
|`» families`|[object]|false|none|Array of configuration family objects|
|`»» name`|string|true|none|metric family name|
|`»» title`|string|false|none|metric family title|
|`»» subtitle`|string|false|none|metric family subtitle|
|`»» unit`|string|false|none|metric family units|
|`»» widget`|string|true|none|metric category widget which is displayed within the historical dashboard family's tab|
|`» groups`|[object]|false|none|Array of configuration group objects|
|`»» name`|string|true|none|metric group name|
|`»» title`|string|true|none|metric group title which is displayed in the historical dashboard tab|
|`»» sort`|string|false|none|the type of sorting|
|`»» sortOrder`|string|false|none|the sorting order|
|`» categories`|[object]|false|none|Array of configuration category objects|
|`»» name`|string|true|none|metric category name|
|`»» title`|string|true|none|metric category title which is displayed on UI|

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **401**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **503**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **default**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

<aside class="success">
This operation does not require authentication
</aside>

# search {#assurance-search-api-search}

## Returns a list of KPIs {#opIdsearchMetricsByQuery}

`GET /{index}/search/metrics`

Retrieves list of KPIs matching search criteria

### Parameters {#returns-a-list-of-kpis-parameters}

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|`index`|path|string|true|Specify an effective index|
|`contextTypeId`|query|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/1/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/1/schema)|true|a context type used for searching|
|`metricTypes`|query|array[object]|true|Names of metrics to return|
|`filters`|query|array[any]|false|Filter the query with numeric, facet and/or tag filters.|
|`sortBy`|query|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/4/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/4/schema)|false|column name to be sorted on.|
|`sortOrder`|query|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/5/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/5/schema)|false|sort order|
|`offset`|query|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/6/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/6/schema)|false|Specify the offset of the first hit to return.|
|`length`|query|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/7/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/7/schema)|false|Set the number of hits to retrieve (used only with offset).|

#### Enumerated Values

|Parameter|Value|
|---|---|
|sortOrder|asc|
|sortOrder|desc|

> Example responses

> 200 Response

```json
{
  "length": 1,
  "offset": 0,
  "total": 42,
  "results": [
    {
      "context": {
        "contextFields": [
          {
            "description": "Instance of SNSSAI 1234",
            "id": "1234",
            "name": "SNSSAI 1234",
            "type": {
              "id": "c_SNSSAI",
              "description": "Network Slice Selection Assistance Information"
            }
          },
          {
            "description": "Instance of NSI 4321",
            "id": "NSI_4321",
            "name": "NSI 4321",
            "type": {
              "id": "c_NSI",
              "description": "Network Slice Instance"
            }
          }
        ],
        "id": "SNSSAI_NSI",
        "name": "SNSSAI & NSI Context",
        "type": {
          "id": "SNSSAI_NSI",
          "contextFields": [
            {
              "id": "c_NSI"
            },
            {
              "id": "c_SNSSAI"
            }
          ]
        }
      },
      "metrics": [
        {
          "type": {
            "id": "vi_SNSSAI_NSI_DlUnstrDropPackets",
            "name": "Dl Unstr Drop Packets",
            "description": "Dropped Packets",
            "unit": "errors/minute",
            "valueType": "integer"
          },
          "id": "MID_12342",
          "beginTimestamp": 1513520073,
          "endTimestamp": 1513520173,
          "value": -8618.52
        },
        {
          "type": {
            "id": "vi_SNSSAI_NSI_SessionModificationReqRcvd",
            "name": "Session Modification Req Rcvd",
            "description": "Session Modification Request Received",
            "unit": "errors/minute",
            "valueType": "integer"
          },
          "beginTimestamp": 1513520073,
          "endTimestamp": 1513520173,
          "value": 3379.882952
        },
        {
          "type": {
            "id": "vi_SNSSAI_NSI_PDUSessionEstSR",
            "name": "PDU Session Est SR",
            "description": "PDU Session",
            "unit": "errors/minute",
            "valueType": "integer"
          },
          "beginTimestamp": 1513520073,
          "endTimestamp": 1513520173,
          "value": 16948.1818
        }
      ]
    }
  ]
}
```

> 400 Response

```json
{
  "code": 400,
  "message": "Bad Request"
}
```

> 401 Response

```json
{
  "code": 401,
  "message": "Unauthorized"
}
```

> 503 Response

```json
{
  "code": 503,
  "message": "Service Unavailable"
}
```

> default Response

```json
{
  "code": 500,
  "message": "Internal Server Error"
}
```

### Responses {#returns-a-list-of-kpis-responses}

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK - search results|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad Request|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|Inline|
|503|[Service Unavailable](https://tools.ietf.org/html/rfc7231#section-6.6.4)|Service Unavailable|Inline|
|default|Default|Internal Server Error|Inline|

### Response Schema {#returns-a-list-of-kpis-responseschema}

key performance metric (KPI)

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» offset`|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/6/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/6/schema)|true|none|offset of the page|
|`» length`|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/7/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/7/schema)|true|none|size of the page|
|`» total`|[#/paths/~1%7Bindex%7D~1search~1metrics/get/responses/200/content/application~1json/schema/properties/total](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/responses/200/content/application~1json/schema/properties/total)|true|none|total number of records|
|`» results`|[object]|true|none|none|
|`»» context`|[#/paths/~1%7Bindex%7D~1search~1metrics/get/responses/200/content/application~1json/schema/properties/results/items/properties/context](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/responses/200/content/application~1json/schema/properties/results/items/properties/context)|false|none|aggregation context|
|`»»» id`|string|false|none|context instance ID|
|`»»» name`|string|false|none|name for the context|
|`»»» type`|[#/paths/~1%7Bindex%7D~1metadata~1contexts/get/responses/200/content/application~1json/schema/items](#schema#/paths/~1%7bindex%7d~1metadata~1contexts/get/responses/200/content/application~1json/schema/items)|true|none|context type|
|`»»»» id`|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/1/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/1/schema)|true|none|an unique identifier of the context type|
|`»»»» name`|string|false|none|a display name of the context|
|`»»»» description`|string|false|none|a description of the context|
|`»»»» contextFields`|[[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/3/content/application~1json/schema/items/oneOf/1/allOf/1/properties/entityType](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/3/content/application~1json/schema/items/oneof/1/allof/1/properties/entitytype)]|true|none|aggregated entities|
|`»»»»» id`|string|true|none|entity type id, normally has the prefix of 'c_'|
|`»»»»» name`|string|false|none|entity type name|
|`»»»»» description`|string|false|none|entity description|
|`»»» contextFields`|[object]|true|none|aggregated entities in this context|
|`»»»» id`|string|true|none|entity ID|
|`»»»» name`|string|false|none|entity name|
|`»»»» type`|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/3/content/application~1json/schema/items/oneOf/1/allOf/1/properties/entityType](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/3/content/application~1json/schema/items/oneof/1/allof/1/properties/entitytype)|true|none|entity type|
|`»»»» description`|string|false|none|entity description|
|`»» metrics`|[object]|false|none|none|
|`»»» type`|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/2/content/application~1json/schema/items](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/2/content/application~1json/schema/items)|false|none|metric type|
|`»»»» id`|string|true|none|MetricType id prepended with an identifier, either as 'vi_' or 'vd_'|
|`»»»» name`|string|false|none|Display name or MetricType id prepended without identifier, 'vi_' or 'vd'|
|`»»»» valueType`|string|false|none|none|
|`»»»» description`|string|false|none|entity description|
|`»»»» unit`|string|false|none|specification of the value's unit of measurement.|
|`»»»» visualization`|object|false|none|metric visualization data|
|`»»»»» category`|[string]|false|none|Categories for this metric|
|`»»»»» query`|string|false|none|An example query string|
|`»»»»» groups`|object|false|none|none|
|`»»»»»» **additionalProperties**`|[string]|false|none|List of metric families for the group|
|`»»» id`|string|false|none|metric ID|
|`»»» value`|number|false|none|metric value|
|`»»» beginTimestamp`|integer(int64)|false|none|the time when collection of this metric begins|
|`»»» endTimestamp`|integer(int64)|false|none|the time when collection of this metric ends|
|`»»» metadata`|[object]|false|none|key/value pair|
|`»»»» key`|string|true|none|none|
|`»»»» value`|string|true|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|`valueType`|integer|
|`valueType`|float|

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **401**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **503**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **default**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Returns a list of context fields {#opIdgetContextFieldsByQuery}

`GET /{index}/search/contexts`

Retrieves list of context fields matching search criteria. Query supports wildcard (*|?) characters.

### Parameters {#returns-a-list-of-context-fields-parameters}

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|`index`|path|string|true|Specify an effective index|
|`filters`|query|array[any]|true|Filters for finding contexts|
|`contextTypeId`|query|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/1/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/1/schema)|false|a full context type used to narrow scope of context search|
|`sortBy`|query|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/4/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/4/schema)|false|column name to be sorted on.|
|`sortOrder`|query|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/5/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/5/schema)|false|sort order|
|`offset`|query|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/6/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/6/schema)|false|Specify the offset of the first hit to return.|
|`length`|query|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/7/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/7/schema)|false|Set the number of hits to retrieve (used only with offset).|

#### Enumerated Values

|Parameter|Value|
|---|---|
|sortOrder|asc|
|sortOrder|desc|

> Example responses

> 200 Response

```json
{
  "length": 1,
  "offset": 0,
  "total": 42,
  "results": [
    {
      "contextFields": [
        {
          "description": "Instance of SNSSAI 1234",
          "id": "1234",
          "name": "SNSSAI 1234",
          "type": {
            "id": "c_SNSSAI",
            "description": "Network Slice Selection Assistance Information"
          }
        },
        {
          "description": "Instance of NSI 4321",
          "id": "NSI_4321",
          "name": "NSI 4321",
          "type": {
            "id": "c_NSI",
            "description": "Network Slice Instance"
          }
        }
      ],
      "id": "NSSAI_NSI",
      "name": "SNSSAI & NSI Context",
      "type": {
        "id": "NSSAI_NSI",
        "contextFields": [
          {
            "id": "c_NSI"
          },
          {
            "id": "c_SNSSAI"
          }
        ]
      }
    }
  ]
}
```

> 400 Response

```json
{
  "code": 400,
  "message": "Bad Request"
}
```

> 401 Response

```json
{
  "code": 401,
  "message": "Unauthorized"
}
```

> 503 Response

```json
{
  "code": 503,
  "message": "Service Unavailable"
}
```

> default Response

```json
{
  "code": 500,
  "message": "Internal Server Error"
}
```

### Responses {#returns-a-list-of-context-fields-responses}

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK - matching contexts|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad Request|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|Inline|
|503|[Service Unavailable](https://tools.ietf.org/html/rfc7231#section-6.6.4)|Service Unavailable|Inline|
|default|Default|Internal Server Error|Inline|

### Response Schema {#returns-a-list-of-context-fields-responseschema}

matching contexts

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» offset`|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/6/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/6/schema)|true|none|offset of the page|
|`» length`|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/7/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/7/schema)|true|none|size of the page|
|`» total`|[#/paths/~1%7Bindex%7D~1search~1metrics/get/responses/200/content/application~1json/schema/properties/total](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/responses/200/content/application~1json/schema/properties/total)|true|none|total number of records|
|`» results`|[[#/paths/~1%7Bindex%7D~1search~1metrics/get/responses/200/content/application~1json/schema/properties/results/items/properties/context](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/responses/200/content/application~1json/schema/properties/results/items/properties/context)]|true|none|[aggregation context]|
|`»» id`|string|false|none|context instance ID|
|`»» name`|string|false|none|name for the context|
|`»» type`|[#/paths/~1%7Bindex%7D~1metadata~1contexts/get/responses/200/content/application~1json/schema/items](#schema#/paths/~1%7bindex%7d~1metadata~1contexts/get/responses/200/content/application~1json/schema/items)|true|none|context type|
|`»»» id`|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/1/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/1/schema)|true|none|an unique identifier of the context type|
|`»»» name`|string|false|none|a display name of the context|
|`»»» description`|string|false|none|a description of the context|
|`»»» contextFields`|[[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/3/content/application~1json/schema/items/oneOf/1/allOf/1/properties/entityType](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/3/content/application~1json/schema/items/oneof/1/allof/1/properties/entitytype)]|true|none|aggregated entities|
|`»»»» id`|string|true|none|entity type id, normally has the prefix of 'c_'|
|`»»»» name`|string|false|none|entity type name|
|`»»»» description`|string|false|none|entity description|
|`»» contextFields`|[object]|true|none|aggregated entities in this context|
|`»»» id`|string|true|none|entity ID|
|`»»» name`|string|false|none|entity name|
|`»»» type`|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/3/content/application~1json/schema/items/oneOf/1/allOf/1/properties/entityType](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/3/content/application~1json/schema/items/oneof/1/allof/1/properties/entitytype)|true|none|entity type|
|`»»» description`|string|false|none|entity description|

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **401**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **503**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **default**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Returns a facet counts for related contexts {#opIdsearchContextFacets}

`GET /{index}/search/related-contexts-facets`

Retrieves related facet counts for given context types

### Parameters {#returns-a-facet-counts-for-related-contexts-parameters}

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|`index`|path|string|true|Specify an effective index|
|`contextId`|query|[#/paths/~1%7Bindex%7D~1search~1metrics/get/responses/200/content/application~1json/schema/properties/results/items/properties/context](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/responses/200/content/application~1json/schema/properties/results/items/properties/context)|true|The context ID used to find relations|
|`contextTypeId`|query|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/1/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/1/schema)|true|a context type used for searching|

> Example responses

> 200 Response

```json
[
  {
    "contextType": {
      "id": "string",
      "name": "SNSSAI & NF",
      "description": "My SNSSAI and NF",
      "contextFields": [
        {
          "id": "c_NF",
          "name": "My NF"
        },
        {
          "id": "c_SNSSAI",
          "name": "My SNSSAI",
          "description": "Network Slice Selection Assistance Information"
        }
      ]
    },
    "count": 42
  }
]
```

> 400 Response

```json
{
  "code": 400,
  "message": "Bad Request"
}
```

> 401 Response

```json
{
  "code": 401,
  "message": "Unauthorized"
}
```

> 503 Response

```json
{
  "code": 503,
  "message": "Service Unavailable"
}
```

> default Response

```json
{
  "code": 500,
  "message": "Internal Server Error"
}
```

### Responses {#returns-a-facet-counts-for-related-contexts-responses}

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK - search results|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad Request|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|Inline|
|503|[Service Unavailable](https://tools.ietf.org/html/rfc7231#section-6.6.4)|Service Unavailable|Inline|
|default|Default|Internal Server Error|Inline|

### Response Schema {#returns-a-facet-counts-for-related-contexts-responseschema}

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» contextType`|[#/paths/~1%7Bindex%7D~1metadata~1contexts/get/responses/200/content/application~1json/schema/items](#schema#/paths/~1%7bindex%7d~1metadata~1contexts/get/responses/200/content/application~1json/schema/items)|true|none|context type|
|`»» id`|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/1/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/1/schema)|true|none|an unique identifier of the context type|
|`»» name`|string|false|none|a display name of the context|
|`»» description`|string|false|none|a description of the context|
|`»» contextFields`|[[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/3/content/application~1json/schema/items/oneOf/1/allOf/1/properties/entityType](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/3/content/application~1json/schema/items/oneof/1/allof/1/properties/entitytype)]|true|none|aggregated entities|
|`»»» id`|string|true|none|entity type id, normally has the prefix of 'c_'|
|`»»» name`|string|false|none|entity type name|
|`»»» description`|string|false|none|entity description|
|`» count`|integer|true|none|count for a context type|

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **401**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **503**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **default**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

<aside class="success">
This operation does not require authentication
</aside>

# metadata {#assurance-search-api-metadata}

## Get relations for given context {#opIdgetRelationByContextId}

`GET /{index}/metadata/relations`

relation to a context

### Parameters {#get-relations-for-given-context-parameters}

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|`index`|path|string|true|Specify an effective index|
|`contextTypeId`|query|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/1/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/1/schema)|true|a context type used for searching|

> Example responses

> 200 Response

```json
[
  {
    "relationType": "RELATED_TO",
    "related": {
      "contextFields": [
        {
          "id": "c_SNSSAI_1234",
          "name": "SNSSAI 1234",
          "description": "Instance of SNSSAI 1234"
        },
        {
          "id": "c_NSI_4321",
          "name": "NSI 4321",
          "description": "Instance of NSI 4321"
        }
      ],
      "id": "SNSSAI_NSI",
      "name": "SNSSAI & NSI Context"
    }
  }
]
```

> 400 Response

```json
{
  "code": 400,
  "message": "Bad Request"
}
```

> 401 Response

```json
{
  "code": 401,
  "message": "Unauthorized"
}
```

> 503 Response

```json
{
  "code": 503,
  "message": "Service Unavailable"
}
```

> default Response

```json
{
  "code": 500,
  "message": "Internal Server Error"
}
```

### Responses {#get-relations-for-given-context-responses}

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad Request|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|Inline|
|503|[Service Unavailable](https://tools.ietf.org/html/rfc7231#section-6.6.4)|Service Unavailable|Inline|
|default|Default|Internal Server Error|Inline|

### Response Schema {#get-relations-for-given-context-responseschema}

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`*anonymous*`|[[#/paths/~1%7Bindex%7D~1metadata~1relations/get/responses/200/content/application~1json/schema/items](#schema#/paths/~1%7bindex%7d~1metadata~1relations/get/responses/200/content/application~1json/schema/items)]|false|none|[a relation to a context]|
|`» relationType`|string|true|none|type of the relation|
|`» related`|[#/paths/~1%7Bindex%7D~1metadata~1contexts/get/responses/200/content/application~1json/schema/items](#schema#/paths/~1%7bindex%7d~1metadata~1contexts/get/responses/200/content/application~1json/schema/items)|true|none|context type|
|`»» id`|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/1/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/1/schema)|true|none|an unique identifier of the context type|
|`»» name`|string|false|none|a display name of the context|
|`»» description`|string|false|none|a description of the context|
|`»» contextFields`|[[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/3/content/application~1json/schema/items/oneOf/1/allOf/1/properties/entityType](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/3/content/application~1json/schema/items/oneof/1/allof/1/properties/entitytype)]|true|none|aggregated entities|
|`»»» id`|string|true|none|entity type id, normally has the prefix of 'c_'|
|`»»» name`|string|false|none|entity type name|
|`»»» description`|string|false|none|entity description|

#### Enumerated Values

|Property|Value|
|---|---|
|`relationType`|CONTAINED_BY|
|`relationType`|CONTAINS|
|`relationType`|RELATED_TO|
|`relationType`|RELATED_BY|

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **401**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **503**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **default**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Return available context {#opIdgetAvailableContexts}

`GET /{index}/metadata/contexts`

metadata endpoint for returning available context types

### Parameters {#return-available-context-parameters}

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|`index`|path|string|true|Specify an effective index|

> Example responses

> 200 Response

```json
[
  {
    "contextFields": [
      {
        "id": "c_SNSSAI",
        "description": "Network Slice Selection Assistance Information"
      },
      {
        "id": "c_NSI",
        "description": "Network Slice Instance"
      }
    ],
    "id": "CFID_SNSSAI_NSI",
    "name": "SNSSAI & NSI"
  },
  {
    "contextFields": [
      {
        "id": "c_SNSSAI",
        "description": "Network Slice Selection Assistance Information"
      },
      {
        "id": "c_NSI",
        "description": "Network Slice Instance"
      }
    ],
    "id": "CFID_SNSSAI_NF",
    "name": "SNSSAI & NF"
  }
]
```

> 400 Response

```json
{
  "code": 400,
  "message": "Bad Request"
}
```

> 401 Response

```json
{
  "code": 401,
  "message": "Unauthorized"
}
```

> 503 Response

```json
{
  "code": 503,
  "message": "Service Unavailable"
}
```

> default Response

```json
{
  "code": 500,
  "message": "Internal Server Error"
}
```

### Responses {#return-available-context-responses}

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad Request|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|Inline|
|503|[Service Unavailable](https://tools.ietf.org/html/rfc7231#section-6.6.4)|Service Unavailable|Inline|
|default|Default|Internal Server Error|Inline|

### Response Schema {#return-available-context-responseschema}

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`*anonymous*`|[[#/paths/~1%7Bindex%7D~1metadata~1contexts/get/responses/200/content/application~1json/schema/items](#schema#/paths/~1%7bindex%7d~1metadata~1contexts/get/responses/200/content/application~1json/schema/items)]|false|none|[context type]|
|`» id`|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/1/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/1/schema)|true|none|an unique identifier of the context type|
|`» name`|string|false|none|a display name of the context|
|`» description`|string|false|none|a description of the context|
|`» contextFields`|[[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/3/content/application~1json/schema/items/oneOf/1/allOf/1/properties/entityType](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/3/content/application~1json/schema/items/oneof/1/allof/1/properties/entitytype)]|true|none|aggregated entities|
|`»» id`|string|true|none|entity type id, normally has the prefix of 'c_'|
|`»» name`|string|false|none|entity type name|
|`»» description`|string|false|none|entity description|

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **401**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **503**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **default**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Return available metrics types {#opIdgetMetricsByContext}

`GET /{index}/metadata/metrics`

metadata endpoint for returning available metrics types for a given context

### Parameters {#return-available-metrics-types-parameters}

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|`index`|path|string|true|Specify an effective index|
|`contextTypeId`|query|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/1/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/1/schema)|true|a context type used for searching|

> Example responses

> 200 Response

```json
[
  {
    "id": "vi_SNSSAI_NSI_PDUSessionEstSR",
    "name": "PDU Session Est SR",
    "valueType": "integer",
    "description": "PDUSessionEstSR Description",
    "unit": "errors/minute",
    "visualization": {
      "category": [
        "observability",
        "performance"
      ],
      "group1": [
        "family1",
        "family2"
      ],
      "group2": [
        "family2"
      ],
      "query": "${metricName}{snssai=~\"sn.*-4\"}"
    }
  },
  {
    "id": "vi_SNSSAI_NSI_SessionModificationReqRcvd",
    "name": "Session Modification Req Rcvd",
    "valueType": "integer",
    "description": "SessionModificationReqRcvd Description",
    "unit": "errors/minute",
    "visualization": {
      "category": [
        "observability",
        "performance"
      ],
      "group1": [
        "family1",
        "family2"
      ],
      "group2": [
        "family2"
      ],
      "query": "${metricName}{snssai=~\"sn.*-4\"}"
    }
  },
  {
    "id": "vd_SNSSAI_NSI_AMFMeanRegNbr",
    "name": "AMF Mean Reg Nbr",
    "valueType": "float",
    "description": "AMFMeanRegNbr Description",
    "unit": "errors/minute",
    "visualization": {
      "category": [
        "observability",
        "performance"
      ],
      "group1": [
        "family1",
        "family2"
      ],
      "group2": [
        "family2"
      ],
      "query": "${metricName}{snssai=~\"sn.*-4\"}"
    }
  }
]
```

> 400 Response

```json
{
  "code": 400,
  "message": "Bad Request"
}
```

> 401 Response

```json
{
  "code": 401,
  "message": "Unauthorized"
}
```

> 503 Response

```json
{
  "code": 503,
  "message": "Service Unavailable"
}
```

> default Response

```json
{
  "code": 500,
  "message": "Internal Server Error"
}
```

### Responses {#return-available-metrics-types-responses}

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK - available metric types|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad Request|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|Inline|
|503|[Service Unavailable](https://tools.ietf.org/html/rfc7231#section-6.6.4)|Service Unavailable|Inline|
|default|Default|Internal Server Error|Inline|

### Response Schema {#return-available-metrics-types-responseschema}

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`*anonymous*`|[[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/2/content/application~1json/schema/items](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/2/content/application~1json/schema/items)]|false|none|[metric type]|
|`» id`|string|true|none|MetricType id prepended with an identifier, either as 'vi_' or 'vd_'|
|`» name`|string|false|none|Display name or MetricType id prepended without identifier, 'vi_' or 'vd'|
|`» valueType`|string|false|none|none|
|`» description`|string|false|none|entity description|
|`» unit`|string|false|none|specification of the value's unit of measurement.|
|`» visualization`|object|false|none|metric visualization data|
|`»» category`|[string]|false|none|Categories for this metric|
|`»» query`|string|false|none|An example query string|
|`»» groups`|object|false|none|none|
|`»»» **additionalProperties**`|[string]|false|none|List of metric families for the group|

#### Enumerated Values

|Property|Value|
|---|---|
|`valueType`|integer|
|`valueType`|float|

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **401**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **503**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **default**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Return all static data combined together {#opIdgetStaticInformation}

`GET /{index}/metadata`

metadata endpoint for returning all static data combined together

### Parameters {#return-all-static-data-combined-together-parameters}

|Name|In|Type|Required|Description|
|---|---|---|---|---|
|`index`|path|string|true|Specify an effective index|

> Example responses

> 200 Response

```json
[
  {
    "contextType": {
      "contextFields": [
        {
          "id": "c_SNSSAI",
          "description": "Network Slice Selection Assistance Information"
        },
        {
          "id": "c_NSI",
          "description": "Network Slice Instance"
        }
      ],
      "id": "SNSSAI_NSI",
      "name": "SNSSAI & NSI"
    },
    "relations": [
      {
        "relationType": "RELATED_TO",
        "related": {
          "contextFields": [
            {
              "id": "c_SNSSAI_1234",
              "name": "SNSSAI 1234",
              "description": "Instance of SNSSAI 1234"
            },
            {
              "id": "c_NSI_4321",
              "name": "NSI 4321",
              "description": "Instance of NSI 4321"
            }
          ],
          "id": "NSSAI_NSI",
          "name": "SNSSAI & NSI Context"
        }
      }
    ],
    "metricTypes": [
      {
        "id": "vi_SNSSAI_NSI_sessionModificationReqRcvd",
        "name": "Session Modification Req Rcvd",
        "unit": "errors/minute",
        "valueType": "integer",
        "description": "Session Modification Request Received",
        "visualization": {
          "category": [
            "observability",
            "performance"
          ],
          "group1": [
            "family1",
            "family2"
          ],
          "group2": [
            "family2"
          ],
          "query": "${metricName}{snssai=~\"sn.*-4\"}"
        }
      },
      {
        "id": "vd_SNSSAI_NSI_dlUnstrDropPackets",
        "name": "DlUnstr Drop Packets",
        "unit": "errors/minute",
        "valueType": "float",
        "description": "Dropped Packets",
        "visualization": {
          "category": [
            "observability",
            "performance"
          ],
          "group1": [
            "family1",
            "family2"
          ],
          "group2": [
            "family2"
          ],
          "query": "${metricName}{snssai=~\"sn.*-4\"}"
        }
      }
    ]
  }
]
```

> 400 Response

```json
{
  "code": 400,
  "message": "Bad Request"
}
```

> 401 Response

```json
{
  "code": 401,
  "message": "Unauthorized"
}
```

> 503 Response

```json
{
  "code": 503,
  "message": "Service Unavailable"
}
```

> default Response

```json
{
  "code": 500,
  "message": "Internal Server Error"
}
```

### Responses {#return-all-static-data-combined-together-responses}

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK - available metric types|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad Request|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|Inline|
|503|[Service Unavailable](https://tools.ietf.org/html/rfc7231#section-6.6.4)|Service Unavailable|Inline|
|default|Default|Internal Server Error|Inline|

### Response Schema {#return-all-static-data-combined-together-responseschema}

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» contextType`|[#/paths/~1%7Bindex%7D~1metadata~1contexts/get/responses/200/content/application~1json/schema/items](#schema#/paths/~1%7bindex%7d~1metadata~1contexts/get/responses/200/content/application~1json/schema/items)|true|none|context type|
|`»» id`|[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/1/schema](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/1/schema)|true|none|an unique identifier of the context type|
|`»» name`|string|false|none|a display name of the context|
|`»» description`|string|false|none|a description of the context|
|`»» contextFields`|[[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/3/content/application~1json/schema/items/oneOf/1/allOf/1/properties/entityType](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/3/content/application~1json/schema/items/oneof/1/allof/1/properties/entitytype)]|true|none|aggregated entities|
|`»»» id`|string|true|none|entity type id, normally has the prefix of 'c_'|
|`»»» name`|string|false|none|entity type name|
|`»»» description`|string|false|none|entity description|
|`» relations`|[[#/paths/~1%7Bindex%7D~1metadata~1relations/get/responses/200/content/application~1json/schema/items](#schema#/paths/~1%7bindex%7d~1metadata~1relations/get/responses/200/content/application~1json/schema/items)]|true|none|[a relation to a context]|
|`»» relationType`|string|true|none|type of the relation|
|`»» related`|[#/paths/~1%7Bindex%7D~1metadata~1contexts/get/responses/200/content/application~1json/schema/items](#schema#/paths/~1%7bindex%7d~1metadata~1contexts/get/responses/200/content/application~1json/schema/items)|true|none|context type|
|`» metricTypes`|[[#/paths/~1%7Bindex%7D~1search~1metrics/get/parameters/2/content/application~1json/schema/items](#schema#/paths/~1%7bindex%7d~1search~1metrics/get/parameters/2/content/application~1json/schema/items)]|true|none|[metric type]|
|`»» id`|string|true|none|MetricType id prepended with an identifier, either as 'vi_' or 'vd_'|
|`»» name`|string|false|none|Display name or MetricType id prepended without identifier, 'vi_' or 'vd'|
|`»» valueType`|string|false|none|none|
|`»» description`|string|false|none|entity description|
|`»» unit`|string|false|none|specification of the value's unit of measurement.|
|`»» visualization`|object|false|none|metric visualization data|
|`»»» category`|[string]|false|none|Categories for this metric|
|`»»» query`|string|false|none|An example query string|
|`»»» groups`|object|false|none|none|
|`»»»» **additionalProperties**`|[string]|false|none|List of metric families for the group|

#### Enumerated Values

|Property|Value|
|---|---|
|`relationType`|CONTAINED_BY|
|`relationType`|CONTAINS|
|`relationType`|RELATED_TO|
|`relationType`|RELATED_BY|
|`valueType`|integer|
|`valueType`|float|

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **401**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **503**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **default**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

<aside class="success">
This operation does not require authentication
</aside>

## Return available indexes {#opIdgetAvailableIndexes}

`GET /metadata/indexes`

metadata endpoint for returning available indexes (domains)

> Example responses

> 200 Response

```json
[
  {
    "name": "ran",
    "description": "Radio Access Network (RAN)"
  },
  {
    "name": "soa",
    "description": "Some description"
  }
]
```

> 400 Response

```json
{
  "code": 400,
  "message": "Bad Request"
}
```

> 401 Response

```json
{
  "code": 401,
  "message": "Unauthorized"
}
```

> 503 Response

```json
{
  "code": 503,
  "message": "Service Unavailable"
}
```

> default Response

```json
{
  "code": 500,
  "message": "Internal Server Error"
}
```

### Responses {#return-available-indexes-responses}

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad Request|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|Inline|
|503|[Service Unavailable](https://tools.ietf.org/html/rfc7231#section-6.6.4)|Service Unavailable|Inline|
|default|Default|Internal Server Error|Inline|

### Response Schema {#return-available-indexes-responseschema}

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» name`|string|true|none|name for the context|
|`» description`|string|false|none|index description|

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **401**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **503**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **default**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

<aside class="success">
This operation does not require authentication
</aside>

# system {#assurance-search-api-system}

## Get operational state of NAS {#opIdgetSystemState}

`GET /system/state`

Returns the operational state of the NAS.

> Example responses

> 200 Response

```json
{
  "status": "initializing",
  "message": "Waiting for configurator service to be ready"
}
```

> 400 Response

```json
{
  "code": 400,
  "message": "Bad Request"
}
```

> 401 Response

```json
{
  "code": 401,
  "message": "Unauthorized"
}
```

> 503 Response

```json
{
  "code": 503,
  "message": "Service Unavailable"
}
```

> default Response

```json
{
  "code": 500,
  "message": "Internal Server Error"
}
```

### Responses {#get-operational-state-of-nas-responses}

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Bad Request|Inline|
|401|[Unauthorized](https://tools.ietf.org/html/rfc7235#section-3.1)|Unauthorized|Inline|
|503|[Service Unavailable](https://tools.ietf.org/html/rfc7231#section-6.6.4)|Service Unavailable|Inline|
|default|Default|Internal Server Error|Inline|

### Response Schema {#get-operational-state-of-nas-responseschema}

Status Code **200**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» status`|string|true|none|The operational state|
|`» message`|string|false|none|Additional information about the state (optional)|

#### Enumerated Values

|Property|Value|
|---|---|
|`status`|initializing|
|`status`|ready|
|`status`|error|

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **401**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **503**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

Status Code **default**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|`» code`|integer(int32)|true|none|none|
|`» message`|string|true|none|none|

<aside class="success">
This operation does not require authentication
</aside>

