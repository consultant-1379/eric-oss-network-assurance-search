from os import environ

# Path to the data config file
SERVICE_NAME = (
    environ["SERVICE_NAME"]
    if "SERVICE_NAME" in environ and isinstance(environ["SERVICE_NAME"], str)
    else "corvus-data-generator"
)

# Port that the metrics server will run on
EXPOSE_PORT = (
    int(environ["EXPOSE_PORT"])
    if "EXPOSE_PORT" in environ and environ["EXPOSE_PORT"].isdigit()
    else 9000
)

# Path to the data config file
METRICS_CONFIG_PATH = (
    environ["METRICS_CONFIG_PATH"]
    if "METRICS_CONFIG_PATH" in environ
    and isinstance(environ["METRICS_CONFIG_PATH"], str)
    else "./config/metrics-config.yaml"
)

# The URL that the generated data will be sent to
VM_IMPORT_URL = (
    environ["VM_IMPORT_URL"]
    if "VM_IMPORT_URL" in environ and isinstance(environ["VM_IMPORT_URL"], str)
    else "http://localhost:8480/api/v1/import"
)

# The URL that will be used to query VictoriaMetrics data
VM_QUERY_URL = (
    environ["VM_QUERY_URL"]
    if "VM_QUERY_URL" in environ and isinstance(environ["VM_QUERY_URL"], str)
    else "http://localhost:8481/select/0/prometheus/api/v1/query"
)

# The number of requests to send per metric ID
VM_REQUESTS_PER_METRIC = (
    int(environ["VM_REQUESTS_PER_METRIC"])
    if "VM_REQUESTS_PER_METRIC" in environ
    and environ["VM_REQUESTS_PER_METRIC"].isdigit()
    else 10
)

VM_DEFAULT_DATA_LOOKBACK_MINUTES = (
    int(environ["VM_DEFAULT_DATA_LOOKBACK_MINUTES"])
    if "VM_DEFAULT_DATA_LOOKBACK_MINUTES" in environ
    and environ["VM_DEFAULT_DATA_LOOKBACK_MINUTES"].isdigit()
    else 15
)

VM_DEFAULT_DATA_STEP_SIZE_MINUTES = (
    int(environ["VM_DEFAULT_DATA_STEP_SIZE_MINUTES"])
    if "VM_DEFAULT_DATA_STEP_SIZE_MINUTES" in environ
    and environ["VM_DEFAULT_DATA_STEP_SIZE_MINUTES"].isdigit()
    else 15
)

# The length of time into the past that metric data will be generated for (in hours)
VM_HISTORICAL_DATA_LOOKBACK_MINUTES = (
    int(environ["VM_HISTORICAL_DATA_LOOKBACK_MINUTES"])
    if "VM_HISTORICAL_DATA_LOOKBACK_MINUTES" in environ
    and environ["VM_HISTORICAL_DATA_LOOKBACK_MINUTES"].isdigit()
    else 180
)

# The step size (frequency) of data points within the generated historical data (in minutes)
VM_HISTORICAL_DATA_STEP_SIZE_MINUTES = (
    int(environ["VM_HISTORICAL_DATA_STEP_SIZE_MINUTES"])
    if "VM_HISTORICAL_DATA_STEP_SIZE_MINUTES" in environ
    and environ["VM_HISTORICAL_DATA_STEP_SIZE_MINUTES"].isdigit()
    else 15
)

VM_DEFAULT_METRIC_VALUE_DEVIATION = (
    int(environ["VM_DEFAULT_METRIC_VALUE_DEVIATION"])
    if "VM_DEFAULT_METRIC_VALUE_DEVIATION" in environ
    and environ["VM_DEFAULT_METRIC_VALUE_DEVIATION"].isdigit()
    else 20
)
