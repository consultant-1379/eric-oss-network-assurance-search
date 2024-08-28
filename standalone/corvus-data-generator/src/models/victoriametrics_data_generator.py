from typing import Union
from datetime import datetime, timedelta, UTC
from time import time
from random import choice
import requests
import json

from models.data_config import DataConfig
from models.metric_timeseries import MetricTimeseries
from utils.helper import (
    full_context_to_contexts,
)
from utils.constants.victoriametrics import (
    VM_IMPORT_URL,
    VM_REQUESTS_PER_METRIC,
    VM_DEFAULT_DATA_LOOKBACK_MINUTES,
    VM_DEFAULT_DATA_STEP_SIZE_MINUTES,
    VM_DEFAULT_METRIC_VALUE_DEVIATION,
)


class VictoriaMetricsDataGenerator:
    def __init__(
        self,
        data_config: DataConfig,
        lookback_minutes: int = VM_DEFAULT_DATA_LOOKBACK_MINUTES,
        step_size_minutes: int = VM_DEFAULT_DATA_STEP_SIZE_MINUTES,
        metric_value_deviation: int = VM_DEFAULT_METRIC_VALUE_DEVIATION,
    ) -> None:
        """
        Initializing class properties.
        """
        self.data_config = data_config
        self.lookback_minutes = lookback_minutes
        self.step_size_minutes = step_size_minutes
        self.metric_value_deviation = metric_value_deviation

    def build_file_name(self, metric_id: str, full_context: str) -> str:
        """
        Returns a string which represents a file name based on a metric ID and a
        full context.
        """
        return "%s_%s_%s.jsonl" % (metric_id, full_context, int(time()))

    def generate_metric_timeseries(
        self,
        metric_id: str,
        full_context: str,
        to_datetime: datetime,
        lookback_period: timedelta,
        step_timedelta: timedelta,
        max_deviation: int,
    ) -> Union[dict, None]:
        """
        Returns a MetricTimeseries class instance based on a metric ID, a full context,
        and a starting timestamp.
        """
        label_names = full_context_to_contexts(full_context)
        label_values = []
        for context in label_names:
            label_values.append(
                choice(self.data_config.config["contextValues"][context])
            )

        if len(label_names) != len(label_values):
            return None

        return MetricTimeseries(
            metric_id=metric_id,
            full_context=full_context,
            label_names=label_names,
            label_values=label_values,
            to_datetime=to_datetime,
            lookback_period=lookback_period,
            step_timedelta=step_timedelta,
            max_deviation=max_deviation,
        ).build()

    def send_data_to_victoriametrics(self, data: str) -> int:
        """
        Performs a POST request to the VictoriaMetrics import endpoint with
        the provided data string (which is in JSONLINE format).
        """
        try:
            res = requests.post(
                VM_IMPORT_URL,
                data=data,
            )
            return res.status_code
        except Exception as e:
            print("Unable to reach VictoriaMetrics insert endpoint:", e)

    def generate(self) -> None:
        """
        Generates MetricTimeseries class instances and attempts to import them into
        VictoriaMetrics for all metrics of each full context.
        """
        print("Ingesting KPI data into VictoriaMetrics...")
        for full_context in self.data_config.config["fullContexts"]:
            to_datetime = datetime.now(UTC)
            generated_metric_data_string = ""
            for metric_id in self.data_config.full_context_metrics[full_context]:
                for _ in range(VM_REQUESTS_PER_METRIC):
                    generated_metric_data_string += (
                        json.dumps(
                            self.generate_metric_timeseries(
                                metric_id=metric_id,
                                full_context=full_context,
                                to_datetime=to_datetime,
                                lookback_period=timedelta(
                                    minutes=self.lookback_minutes
                                ),
                                step_timedelta=timedelta(
                                    minutes=self.step_size_minutes
                                ),
                                max_deviation=self.metric_value_deviation,
                            )
                        )
                        + "\n"
                    )

            response_status_code = self.send_data_to_victoriametrics(
                generated_metric_data_string
            )
            print(
                "Full context: %s - Response code: %s"
                % (full_context, response_status_code)
            )

        print("Done.")
