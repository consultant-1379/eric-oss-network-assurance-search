import json

from utils.constants.base import DATA_CONFIG_PATH


class DataConfig:
    def __init__(self) -> None:
        """
        Initializing class properties.
        """
        self.config = self.read_data_configuration()
        self.metrics = sorted(list(self.config["metrics"].keys()))
        self.contexts = sorted(list(self.config["contextValues"].keys()))

        self.full_context_metrics = self.get_all_full_context_metrics()
        self.metric_full_contexts = self.get_all_metric_full_contexts()

    def read_data_configuration(self) -> dict:
        """
        Returns the data configuration as a dictionary by reading it from
        the DATA_CONFIG_PATH environment variable.
        """
        with open(DATA_CONFIG_PATH) as json_file:
            config = json.load(json_file)

        return config

    def get_all_full_context_metrics(self) -> dict:
        """
        Returns a dictionary that contains lists of metric IDs by keys of full contexts.
        """
        full_context_metrics = {}
        for full_context, long_metric_names in self.config[
            "fullContextMetrics"
        ].items():
            short_metric_names = []
            for long_metric_name in long_metric_names:
                short_metric_names.append(
                    long_metric_name.replace(full_context + "_", "")
                )

            full_context_metrics[full_context] = short_metric_names

        return full_context_metrics

    def get_full_contexts_by_metric(self, metric: str) -> list:
        """
        Returns a list of full contexts associated with a metric ID.
        """
        full_contexts = []
        for full_context, metrics in self.full_context_metrics.items():
            if metric in metrics:
                full_contexts.append(full_context)

        return full_contexts

    def get_all_metric_full_contexts(self) -> dict:
        """
        Returns a dictionary that contains lists of full contexts by keys of metric IDs.
        """
        metric_full_contexts = {}
        for metric in self.metrics:
            metric_full_contexts[metric] = self.get_full_contexts_by_metric(metric)

        return metric_full_contexts
