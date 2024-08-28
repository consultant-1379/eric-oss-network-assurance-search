FROM --platform=linux/amd64 python:3.11-slim

# Base environment variables
ARG K8S_NAMESPACE
ARG ENABLE_SEARCH_ENGINE_DATA_GENERATION
ARG ENABLE_VICTORIAMETRICS_DATA_GENERATION
ARG DATA_CONFIG_PATH

# OpenSearch specific environment variables
ARG SEARCH_INDEX
ARG SEARCH_ENGINE_URL
ARG OS_DATETIME_FORMAT
ARG OS_DEFAULT_DATA_LOOKBACK_MINUTES
ARG OS_DEFAULT_DATA_STEP_SIZE_MINUTES
ARG OS_HISTORICAL_DATA_LOOKBACK_MINUTES
ARG OS_HISTORICAL_DATA_STEP_SIZE_MINUTES
ARG OS_DATA_RETENTION_PERIOD
ARG POSTGRES_READINESS_PROBE_URL
ARG POSTGRES_SUPER_USER
ARG POSTGRES_SUPER_PASSWORD
ARG POSTGRES_DATABASE
ARG POSTGRES_SCHEMA_NAME
ARG POSTGRES_TABLE_PREFIX
ARG POSTGRES_TABLE_SUFFIX

# VictoriaMetrics specific environment variables
ARG SERVICE_NAME
ARG EXPOSE_PORT
ARG METRICS_CONFIG_PATH
ARG VM_IMPORT_URL
ARG VM_REQUESTS_PER_METRIC
ARG VM_DEFAULT_DATA_LOOKBACK_MINUTES
ARG VM_DEFAULT_DATA_STEP_SIZE_MINUTES
ARG VM_HISTORICAL_DATA_LOOKBACK_MINUTES
ARG VM_HISTORICAL_DATA_STEP_SIZE_MINUTES
ARG VM_DEFAULT_METRIC_VALUE_DEVIATION

# Installing unix libraries
RUN chmod 777 /tmp
RUN apt-get update -y
RUN apt-get -y install procps cron curl postgresql-client

# Setting /home/src as the working directory
WORKDIR /home/src

# Adding Python environment library requirments file
ADD ./requirements.txt /home/src/requirements.txt

# Installing required Python libraries
RUN pip3 install -r requirements.txt

# Add crontab file in the cron directory
COPY crontab /etc/cron.d/crontab

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/crontab

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Copying content to the active directory
COPY ./src /home/src

# Give execution rights on the generate_data.sh script
RUN chmod +x /home/src/generate_data.sh

# Starting cron
RUN /usr/bin/crontab /etc/cron.d/crontab

# Running initializing scripts
ENTRYPOINT [ "/bin/sh", "-c", "printenv > /etc/environment && /home/src/generate_data.sh \"initialize\" && cron && sleep infinity"]