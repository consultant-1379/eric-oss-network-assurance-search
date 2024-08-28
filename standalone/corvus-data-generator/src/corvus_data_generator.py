import argparse

from models.data_config import DataConfig
from models.indexer_data_generator import IndexerDataGenerator
from models.opensearch_data_generator import OpenSearchDataGenerator
from models.victoriametrics_data_generator import VictoriaMetricsDataGenerator
from utils.constants.opensearch import (
    OS_HISTORICAL_DATA_LOOKBACK_MINUTES,
    OS_HISTORICAL_DATA_STEP_SIZE_MINUTES,
)
from utils.constants.victoriametrics import (
    VM_HISTORICAL_DATA_LOOKBACK_MINUTES,
    VM_HISTORICAL_DATA_STEP_SIZE_MINUTES,
)

# Initializing argument parser
arg_parser = argparse.ArgumentParser(
    description="Corvus Data Generator",
    formatter_class=argparse.ArgumentDefaultsHelpFormatter,
)

# Adding Indexer argument
arg_parser.add_argument(
    "--indexer", action="store_true", help="Generate Indexer WireMock stubs"
)

# Adding OpenSearch initialization argument
arg_parser.add_argument(
    "--opensearch_init",
    action="store_true",
    help="Generate OpenSearch initialization data files",
)

# Adding OpenSearch argument
arg_parser.add_argument(
    "--opensearch", action="store_true", help="Generate OpenSearch data files"
)

# Adding VictoriaMetrics initialization argument
arg_parser.add_argument(
    "--victoriametrics_init",
    action="store_true",
    help="Ingest historical data into VictoriaMetrics",
)

# Adding VictoriaMetrics argument
arg_parser.add_argument(
    "--victoriametrics",
    action="store_true",
    help="Ingest data into VictoriaMetrics",
)

args = arg_parser.parse_args()

# Importing the data configuration class instance
data_config = DataConfig()

if args.indexer:
    IndexerDataGenerator(data_config=data_config).generate()

if args.opensearch_init:
    OpenSearchDataGenerator(
        data_config=data_config,
        lookback_minutes=OS_HISTORICAL_DATA_LOOKBACK_MINUTES,
        step_size_minutes=OS_HISTORICAL_DATA_STEP_SIZE_MINUTES,
    ).generate()

if args.opensearch:
    OpenSearchDataGenerator(data_config=data_config).generate()

if args.victoriametrics_init:
    VictoriaMetricsDataGenerator(
        data_config=data_config,
        lookback_minutes=VM_HISTORICAL_DATA_LOOKBACK_MINUTES,
        step_size_minutes=VM_HISTORICAL_DATA_STEP_SIZE_MINUTES,
    ).generate()

if args.victoriametrics:
    VictoriaMetricsDataGenerator(data_config=data_config).generate()
