# Application Developer Guide

## API endpoints

The API has a base URL of assurance-search-service and after the base URL,
the clients must provide the name of a prefix and route.

### Get static files such as CSS, JavaScript for Frontend

`http://assurance-search-service/internal-api/ui`

### Get the current ui-config JSON to the UI

`http://assurance-search-service/internal-api/uiConfig`

### Get list of KPIS matching search criteria

`http://assurance-search-service/api/search/search-criteria`

This API endpoint lists a list of KPIS matching search criteria.
The endpoint accepts query parameters for search criteria. The response format is JSON by default.
