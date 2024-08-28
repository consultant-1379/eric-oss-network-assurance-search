from os import environ

# The search index that will be used in OpenSearch
SEARCH_INDEX = (
    environ["SEARCH_INDEX"]
    if "SEARCH_INDEX" in environ and isinstance(environ["SEARCH_INDEX"], str)
    else "soa"
)

# The datetime format that will be used in the OpenSearch data for date fields
OS_DATETIME_FORMAT = (
    environ["OS_DATETIME_FORMAT"]
    if "OS_DATETIME_FORMAT" in environ
    and isinstance(environ["OS_DATETIME_FORMAT"], str)
    else "%Y-%m-%d %H:%M:%S.%f"
)

# The Postgres schema name that will be used when generating Postgres data
POSTGRES_SCHEMA_NAME = (
    environ["POSTGRES_SCHEMA_NAME"]
    if "POSTGRES_SCHEMA_NAME" in environ
    and isinstance(environ["POSTGRES_SCHEMA_NAME"], str)
    else "kpi"
)

# The string which each Postgres table name will be prepended with.
POSTGRES_TABLE_PREFIX = (
    environ["POSTGRES_TABLE_PREFIX"]
    if "POSTGRES_TABLE_PREFIX" in environ
    and isinstance(environ["POSTGRES_TABLE_PREFIX"], str)
    else "%s_csac_" % (POSTGRES_SCHEMA_NAME)
)

# The string which each Postgres table name will be appended with.
POSTGRES_TABLE_SUFFIX = (
    environ["POSTGRES_TABLE_SUFFIX"]
    if "POSTGRES_TABLE_SUFFIX" in environ
    and isinstance(environ["POSTGRES_TABLE_SUFFIX"], str)
    else "_10"
)

OS_DEFAULT_DATA_LOOKBACK_MINUTES = (
    int(environ["OS_DEFAULT_DATA_LOOKBACK_MINUTES"])
    if "OS_DEFAULT_DATA_LOOKBACK_MINUTES" in environ
    and environ["OS_DEFAULT_DATA_LOOKBACK_MINUTES"].isdigit()
    else 1
)

OS_DEFAULT_DATA_STEP_SIZE_MINUTES = (
    int(environ["OS_DEFAULT_DATA_STEP_SIZE_MINUTES"])
    if "OS_DEFAULT_DATA_STEP_SIZE_MINUTES" in environ
    and environ["OS_DEFAULT_DATA_STEP_SIZE_MINUTES"].isdigit()
    else 1
)

# The length of time into the past that metric data will be generated for (in hours)
OS_HISTORICAL_DATA_LOOKBACK_MINUTES = (
    int(environ["OS_HISTORICAL_DATA_LOOKBACK_MINUTES"])
    if "OS_HISTORICAL_DATA_LOOKBACK_MINUTES" in environ
    and environ["OS_HISTORICAL_DATA_LOOKBACK_MINUTES"].isdigit()
    else 5
)

# The step size (frequency) of data points within the generated historical data (in minutes)
OS_HISTORICAL_DATA_STEP_SIZE_MINUTES = (
    int(environ["OS_HISTORICAL_DATA_STEP_SIZE_MINUTES"])
    if "OS_HISTORICAL_DATA_STEP_SIZE_MINUTES" in environ
    and environ["OS_HISTORICAL_DATA_STEP_SIZE_MINUTES"].isdigit()
    else 1
)

# Data retention period in days for both OpenSearch documents and PostgreSQL rows
OS_DATA_RETENTION_PERIOD = (
    int(environ["OS_DATA_RETENTION_PERIOD"])
    if "OS_DATA_RETENTION_PERIOD" in environ
    and environ["OS_DATA_RETENTION_PERIOD"].isdigit()
    else 7
)
