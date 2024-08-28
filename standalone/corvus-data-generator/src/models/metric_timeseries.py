import logging
import yaml
from random import randrange
from datetime import datetime, timedelta, UTC

from utils.constants.victoriametrics import (
    SERVICE_NAME,
    EXPOSE_PORT,
    METRICS_CONFIG_PATH,
)
from utils.helper import create_timestamp_range

logger = logging.getLogger()


class MetricTimeseries:
    def __init__(
        self,
        metric_id: str,
        full_context: str,
        label_names: list,
        label_values: list,
        to_datetime: datetime,
        lookback_period: timedelta,
        step_timedelta: timedelta,
        max_deviation: int,
    ) -> None:
        """
        Initializing class properties.
        """
        self.metric_id = metric_id
        self.full_context = full_context
        self.label_names = label_names
        self.label_values = label_values
        self.to_datetime = to_datetime
        self.lookback_period = lookback_period
        self.step_timedelta = step_timedelta
        self.max_deviation = max_deviation
        self.config = self.get_metric_configuration()

    def get_metric_configuration(self) -> dict:
        """
        Returns the metric configuration for the metric ID property of this class.
        """
        with open(METRICS_CONFIG_PATH) as yaml_file:
            metrics_config = yaml.safe_load(yaml_file)["config"]

        return next(
            (
                metric_config
                for metric_config in metrics_config
                if metric_config["name"] == self.metric_id
            ),
            {"mean": 300},
        )

    def build_label_object(self) -> dict:
        """
        Returns a dictionary that contains the metric label names as dict keys
        and the metric label values as dict values.
        """
        if len(self.label_names) != len(self.label_values):
            logger.warning("Label names do not match up with label values.")
            return {}

        labelDict = {
            "__name__": self.metric_id,
            "job": SERVICE_NAME,
            "instance": "%s:%s" % (SERVICE_NAME, EXPOSE_PORT),
            "context": self.full_context.replace("_", ","),
        }
        for i in range(len(self.label_names)):
            labelDict[self.label_names[i]] = self.label_values[i]

        return labelDict

    def build_timestamp_range(self) -> list:
        """
        Returns a list of unix timestamps for which this MetricTimeseries will have data measurements.
        """
        from_datetime = self.to_datetime - self.lookback_period
        return create_timestamp_range(
            from_datetime, self.to_datetime, self.step_timedelta
        )

    def build_values_for_timestamp_range(self, timestamp_range: list) -> list:
        """
        Returns a list of metric values that is the same size as the timestamp list.
        """
        mean_value = self.config["mean"]
        return [
            (
                mean_value + randrange(0, self.max_deviation * 2) - self.max_deviation
                if self.max_deviation != 0
                else mean_value
            )
            for _ in range(len(timestamp_range))
        ]

    def build(self) -> dict:
        """
        Returns a dictionary that represents the MetricTimeseries and is compatible
        with VictoriaMetrics import functionality.
        """
        timestamp_range = self.build_timestamp_range()
        metric = {
            "metric": self.build_label_object(),
            "values": self.build_values_for_timestamp_range(timestamp_range),
            "timestamps": timestamp_range,
        }
        return metric
