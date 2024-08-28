import os
import json
from random import randrange
from datetime import datetime, timedelta
import math
import pandas as pd


def create_context_identifier(context: str) -> str:
    return "c_" + context


def full_context_to_contexts(full_context: str) -> list:
    return full_context.split("_")


def remove_full_context_from_metric_document_name(
    metric_document_name: str, full_context: str
) -> str:
    return metric_document_name.replace(full_context + "_", "")


def generate_random_two_character_number(upper_boundary: int) -> str:
    random_integer = randrange(upper_boundary)
    if random_integer < 10:
        return "0" + str(random_integer)
    else:
        return str(random_integer)


def generate_random_second() -> str:
    return generate_random_two_character_number(60)


def generate_random_minute() -> str:
    return generate_random_two_character_number(60)


def generate_random_hour() -> str:
    return generate_random_two_character_number(24)


def write_string_to_file(string_to_save: str, file_path: str) -> None:
    # Ensuring the path directories exist, if they don't, they'll be created
    os.makedirs(os.path.dirname(file_path), exist_ok=True)
    # Writing object to file
    with open(file_path, "w+") as output_file:
        output_file.write(string_to_save)


def write_object_to_json_file(obj, file_path: str) -> None:
    # Ensuring the path directories exist, if they don't, they'll be created
    os.makedirs(os.path.dirname(file_path), exist_ok=True)
    # Writing object to file
    with open(file_path, "w+") as json_file:
        json.dump(obj, json_file)


def create_timestamp_range(
    from_datetime: datetime,
    to_datetime: datetime,
    step_timedelta: timedelta = timedelta(minutes=15),
) -> list:
    return [
        math.floor(pd_timestamp.timestamp()) * 1000
        for pd_timestamp in pd.date_range(
            start=from_datetime, end=to_datetime, freq=step_timedelta
        )
    ]
