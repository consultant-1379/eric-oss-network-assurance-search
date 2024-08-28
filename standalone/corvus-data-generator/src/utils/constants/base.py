from os import environ

# Path to the data config file
DATA_CONFIG_PATH = (
    environ["DATA_CONFIG_PATH"]
    if "DATA_CONFIG_PATH" in environ and isinstance(environ["DATA_CONFIG_PATH"], str)
    else "./config/data-config.json"
)
