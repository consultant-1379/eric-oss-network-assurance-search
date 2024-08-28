#! /bin/sh

: '
  This file does two things:
    - Generates new stubs for the Assurance Indexer Service Wiremock
      container and copies them to the correct locations within the
      repository.

    - Generates new OpenSearch data scripts and copies them to the
      correct locations within the repository.

  Refer to the README in this directory for more information.
'

# Assurance Indexer Stubs
# =======================
echo "Generating Assurance Indexer Service WireMock stubs..."
cd ./corvus-data-generator/src
python corvus_data_generator.py --indexer

# Navigating to the root directory of the repository
cd ../../..

echo "Copying generated stubs to the correct locations..."
cp -R standalone/corvus-data-generator/src/generated-files/indexer/mappings/v1/* standalone/volume-data/indexer/mappings/v1/
cp -R standalone/corvus-data-generator/src/generated-files/indexer/__files/v1/* mock/indexer/mock-data/v1/
echo "Done."

# ADP Search Engine Scripts
# =========================
echo "Generating data ingestion scripts for the ADP Search Engine..."
cd standalone/corvus-data-generator/src
python corvus_data_generator.py --opensearch_init

# Navigating to the root directory of the repository
cd ../../..

echo "Copying generated scripts to the correct locations..."
cp -R standalone/corvus-data-generator/src/generated-files/opensearch/* standalone/volume-data/opensearch/sample-data/initialization-files/
echo "Done."
