from models.data_config import DataConfig
from utils.helper import (
    full_context_to_contexts,
    remove_full_context_from_metric_document_name,
    write_object_to_json_file,
)
from utils.constants.opensearch import SEARCH_INDEX


class IndexerDataGenerator:
    def __init__(self, data_config: DataConfig) -> None:
        self.data_config = data_config.config
        self.generated_files_prefix = "./generated-files/indexer"

    def generate_search_engine_index_list_file(self) -> None:
        # Creating the mapping file
        mapping_file_content = {
            "request": {
                "urlPath": "/v1/indexer-info/search-engine-index-list",
                "method": "GET",
                "headers": {"Content-Type": {"equalTo": "application/json"}},
            },
            "response": {
                "status": 200,
                "bodyFileName": "../__files/v1/indexer-info/search-engine-index-list.json",
            },
        }
        write_object_to_json_file(
            mapping_file_content,
            f"{self.generated_files_prefix}/mappings/v1/indexer-info/search-engine-index-list.json",
        )

        # Creating the data file
        search_engine_index_list = [
            {
                "name": SEARCH_INDEX,
                "displayName": f"{SEARCH_INDEX}_DisplayName",
                "indexDescription": f"Description of {SEARCH_INDEX}",
            },
            # Adding two dummy search engine indexes
            {
                "name": "index1",
                "displayName": "SearchIndex1_DisplayName",
                "indexDescription": "Description of index1",
            },
            {
                "name": "index2",
                "displayName": "SearchIndex2_DisplayName",
                "indexDescription": "Description of index2",
            },
        ]
        write_object_to_json_file(
            search_engine_index_list,
            f"{self.generated_files_prefix}/__files/v1/indexer-info/search-engine-index-list.json",
        )

    def generate_full_contexts_files(self) -> None:
        # Creating the mapping file
        mapping_file_content = {
            "request": {
                "urlPath": "/v1/indexer-info/spec/fullcontexts",
                "method": "GET",
                "headers": {"Content-Type": {"equalTo": "application/json"}},
                "queryParameters": {"searchEngineIndexName": {"equalTo": SEARCH_INDEX}},
            },
            "response": {
                "status": 200,
                "bodyFileName": f"../__files/v1/indexer-info/spec/fullcontexts/{SEARCH_INDEX}.json",
            },
        }
        write_object_to_json_file(
            mapping_file_content,
            f"{self.generated_files_prefix}/mappings/v1/indexer-info/spec/fullcontexts/{SEARCH_INDEX}.json",
        )

        # Creating the data file
        full_contexts_data = []
        for full_context in self.data_config["fullContexts"]:
            document = {
                "documentName": "full_context",
                "fullContext": [{"name": full_context, "context": []}],
            }
            for context in full_context_to_contexts(full_context):
                document["fullContext"][0]["context"].append(
                    self.data_config["contextDetails"][context]
                )

            full_contexts_data.append(document)

        write_object_to_json_file(
            full_contexts_data,
            f"{self.generated_files_prefix}/__files/v1/indexer-info/spec/fullcontexts/{SEARCH_INDEX}.json",
        )

    def generate_values_for_full_context_files(self, full_context: str) -> None:
        # Creating the mapping file
        mapping_file_content = {
            "request": {
                "urlPath": "/v1/indexer-info/spec/values-for-fullcontext",
                "method": "GET",
                "headers": {"Content-Type": {"equalTo": "application/json"}},
                "queryParameters": {
                    "searchEngineIndexName": {"equalTo": SEARCH_INDEX},
                    "fullContextName": {"equalTo": full_context},
                },
            },
            "response": {
                "status": 200,
                "bodyFileName": f"../__files/v1/indexer-info/spec/values-for-fullcontext/{SEARCH_INDEX}_{full_context}.json",
            },
        }
        write_object_to_json_file(
            mapping_file_content,
            f"{self.generated_files_prefix}/mappings/v1/indexer-info/spec/values-for-fullcontext/{SEARCH_INDEX}_{full_context}.json",
        )

        # Creating the data file
        values_for_full_context_data = {
            "fullContext": {"name": full_context, "context": []},
            "value": [],
        }
        full_context_metrics = self.data_config["fullContextMetrics"][full_context]
        for metric in full_context_metrics:
            generic_metric_name = remove_full_context_from_metric_document_name(
                metric, full_context
            )
            metric_data = self.data_config["metrics"][generic_metric_name].copy()
            del metric_data["csacKey"]
            values_for_full_context_data["value"].append(
                {
                    **metric_data,
                    "valueContextDocumentName": metric_data["name"]
                    + "_"
                    + full_context,
                    "valueDocumentName": metric,
                }
            )

        write_object_to_json_file(
            values_for_full_context_data,
            f"{self.generated_files_prefix}/__files/v1/indexer-info/spec/values-for-fullcontext/{SEARCH_INDEX}_{full_context}.json",
        )

    def generate(self) -> None:
        print("Generating Indexer Data...")

        # Generating JSON files for the search engine index list endpoint
        self.generate_search_engine_index_list_file()

        # Generating JSON files for fullcontext endpoint
        self.generate_full_contexts_files()

        # Generating JSON files for values-for-fullcontext endpoint
        for full_context in self.data_config["fullContexts"]:
            self.generate_values_for_full_context_files(full_context)

        print("Done.")
