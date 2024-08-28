from datetime import datetime, timedelta
from time import mktime
from random import randrange, choice, uniform

from models.data_config import DataConfig
from utils.helper import (
    full_context_to_contexts,
    remove_full_context_from_metric_document_name,
    generate_random_second,
    write_string_to_file,
)
from utils.constants.opensearch import (
    SEARCH_INDEX,
    OS_DATETIME_FORMAT,
    POSTGRES_SCHEMA_NAME,
    POSTGRES_TABLE_PREFIX,
    POSTGRES_TABLE_SUFFIX,
    OS_DEFAULT_DATA_LOOKBACK_MINUTES,
    OS_DEFAULT_DATA_STEP_SIZE_MINUTES,
    OS_DATA_RETENTION_PERIOD,
)


class OpenSearchDataGenerator:
    def __init__(
        self,
        data_config: DataConfig,
        lookback_minutes: int = OS_DEFAULT_DATA_LOOKBACK_MINUTES,
        step_size_minutes: int = OS_DEFAULT_DATA_STEP_SIZE_MINUTES,
    ) -> None:
        """
        Initializing class properties.
        """
        self.data_config = data_config.config
        self.datetime_format = "%Y-%m-%d %H:%M:%S"
        self.lookback_minutes = lookback_minutes
        self.step_size_minutes = step_size_minutes
        self.start_datetime_string = (
            datetime.today() - timedelta(minutes=lookback_minutes)
        ).strftime(self.datetime_format)
        self.end_datetime_string = datetime.today().strftime(self.datetime_format)
        self.postgres_script_directory = "./generated-files/postgres"
        self.opensearch_script_directory = "./generated-files/opensearch"

    def build_postgres_insert_command(self, full_context: str) -> str:
        """
        Builds the beginning of the Postgres INSERT command as a string.
        """
        table_name = "%s%s%s" % (
            POSTGRES_TABLE_PREFIX,
            full_context.lower(),
            POSTGRES_TABLE_SUFFIX,
        )
        contexts = full_context_to_contexts(full_context)
        csac_metrics = []
        for metric in self.data_config["fullContextMetrics"][full_context]:
            generic_metric_name = remove_full_context_from_metric_document_name(
                metric, full_context
            )
            metric_data = self.data_config["metrics"][generic_metric_name]
            csac_metrics.append(
                {"csac_key": metric_data["csacKey"], "type": metric_data["type"]}
            )

        sql_command = """CREATE SCHEMA IF NOT EXISTS %s;\n\nCREATE TABLE IF NOT EXISTS %s.%s(
        aggregation_begin_time TIMESTAMP WITHOUT TIME ZONE,
        aggregation_end_time TIMESTAMP WITHOUT TIME ZONE,
        """ % (
            POSTGRES_SCHEMA_NAME,
            POSTGRES_SCHEMA_NAME,
            table_name,
        )

        for context in contexts:
            sql_command += "%s VARCHAR,\n\t" % (context.lower())

        for csac_metric in csac_metrics:
            if csac_metric["type"] == "integer":
                sql_command += "%s INT,\n\t" % (csac_metric["csac_key"])
            else:
                sql_command += "%s FLOAT,\n\t" % (csac_metric["csac_key"])

        # Removing final comma and replacing it with a closing bracket and semicolon
        sql_command = sql_command[:-3]
        sql_command += "\n);\n\n"
        sql_command += """INSERT INTO %s.%s(
        aggregation_begin_time,
        aggregation_end_time,
        """ % (
            POSTGRES_SCHEMA_NAME,
            table_name,
        )

        for context in contexts:
            sql_command += "%s,\n\t" % (context.lower())

        for csac_metric in csac_metrics:
            sql_command += "%s,\n\t" % (csac_metric["csac_key"])

        # Removing final comma and replacing it with a closing bracket and more
        sql_command = sql_command[:-3]
        sql_command += "\n) VALUES \n"

        return sql_command

    def build_postgres_row_from_dict(self, database_row_data: dict) -> str:
        """
        Builds the values portion of the Postgres INSERT command as a string.
        """
        sql_values_row = "("
        for key, value in database_row_data.items():
            if "csac_" in key:
                sql_values_row += "%s, " % (str(value))
            else:
                sql_values_row += "'%s', " % (str(value))

        # Removing final comma and replacing it with a closing bracket and a semicolon
        sql_values_row = sql_values_row[:-2]
        sql_values_row += "),\n"
        return sql_values_row

    def generate_postgres_delete_from_table_script(self, full_context: str) -> None:
        """
        Generates an SQL file that contains the Postgres DELETE command for data that is
        older than the specified data retention period.
        """
        table_name = "%s%s%s" % (
            POSTGRES_TABLE_PREFIX,
            full_context.lower(),
            POSTGRES_TABLE_SUFFIX,
        )
        sql_command = (
            "DELETE FROM %s.%s WHERE aggregation_end_time < now() - INTERVAL '%s days';"
            % (POSTGRES_SCHEMA_NAME, table_name, str(OS_DATA_RETENTION_PERIOD))
        )
        # Writing SQL command to an SQL file
        write_string_to_file(
            sql_command,
            "%s/trim_%s%s.sql"
            % (
                self.postgres_script_directory,
                full_context.lower(),
                POSTGRES_TABLE_SUFFIX,
            ),
        )

    def build_opensearch_documents_from_dict(
        self, full_context: str, database_row_data: dict, csac_key_metric_mappings: dict
    ) -> str:
        """
        Returns the OpenSearch import curl command as a string.
        """
        open_search_documents = "curl -sS -k -XPOST \"${SEARCH_ENGINE_URL}/soa/_bulk\" -u 'admin:admin' -H 'Content-Type: application/json' -d'\n"
        contexts = full_context_to_contexts(full_context)
        csac_values = {
            key: value for (key, value) in database_row_data.items() if "csac_" in key
        }
        for csac_key, metric_value in csac_values.items():
            metric_name = csac_key_metric_mappings[csac_key]["name"]
            document_id = "%s@" % (metric_name)
            for context in contexts[::-1]:
                document_id += "%s:%s::" % (context, database_row_data[context.lower()])

            first_line = '{"index":{"_index":"%s","_id":"%s"}}' % (
                SEARCH_INDEX,
                document_id,
            )

            context_list = '[ "%s" ]' % ('", "'.join(contexts))
            context_values_string = ""
            for context in contexts:
                context_values_string += '"c_%s": "%s", ' % (
                    context,
                    database_row_data[context.lower()],
                )

            second_line = (
                '{ "full_context": "%s", "context": %s, %s"%s": %s, "csac_table": "%s", "csac_column": "%s", "fk_begin_timestamp": "%s", "fk_end_timestamp": "%s"}'
                % (
                    full_context,
                    context_list,
                    context_values_string,
                    csac_key_metric_mappings[csac_key]["original_metric_id"],
                    str(metric_value),
                    "%s%s%s"
                    % (
                        POSTGRES_TABLE_PREFIX,
                        full_context.lower(),
                        POSTGRES_TABLE_SUFFIX,
                    ),
                    csac_key,
                    str(
                        int(
                            mktime(
                                (
                                    datetime.strptime(
                                        database_row_data["aggregation_begin_time"],
                                        OS_DATETIME_FORMAT,
                                    )
                                ).timetuple()
                            )
                        )
                    ),
                    str(
                        int(
                            mktime(
                                (
                                    datetime.strptime(
                                        database_row_data["aggregation_end_time"],
                                        OS_DATETIME_FORMAT,
                                    )
                                ).timetuple()
                            )
                        )
                    ),
                )
            )
            open_search_documents += "%s\n%s\n" % (first_line, second_line)

        # Adding a closing apostrophe to the shell command
        open_search_documents += "'\n\n"
        return open_search_documents

    def generate_opensearch_deletion_script(self) -> None:
        """
        Generates a shell file that contains the OpenSearch delete curl command for data that is
        older than the specified data retention period.
        """
        opensearch_deletion_unix_timestamp = int(
            mktime(
                (
                    datetime.today() - timedelta(days=OS_DATA_RETENTION_PERIOD)
                ).timetuple()
            )
        )
        opensearch_documents = """curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_delete_by_query?routing=1" -u 'admin:admin' -H 'Content-Type: application/json' -d'\n{
        "query": {
            "range": {
            "fk_end_timestamp": {
                "lte": "%s"
            }
            }
        }\n}'\n""" % (
            opensearch_deletion_unix_timestamp
        )

        # Writing shell command to a shell script file
        write_string_to_file(
            opensearch_documents,
            "%s/remove_data.sh" % (self.opensearch_script_directory),
        )

    def generate_kpi_data(self, full_context: str) -> None:
        """
        Generates shell and SQL files which, once executed, will import data into OpenSearch
        and Postgres for a given full context.
        """
        sql_command = self.build_postgres_insert_command(full_context)
        shell_command = "#! /bin/sh\n\n"

        moving_datetime = datetime.strptime(
            self.start_datetime_string, self.datetime_format
        )
        end_datetime = datetime.strptime(self.end_datetime_string, self.datetime_format)
        generated_data = []
        while moving_datetime <= end_datetime:
            random_second = generate_random_second()
            aggregation_begin_time = moving_datetime.strftime(
                "%Y-%m-%d %H:%M:"
            ) + "%s.%s" % (random_second, str(randrange(100000, 1000000)))
            aggregation_end_time = (
                moving_datetime + timedelta(seconds=int(random_second) + randrange(120))
            ).strftime("%Y-%m-%d %H:%M:%S.") + str(randrange(100000, 1000000))
            database_row_data = {
                "aggregation_begin_time": aggregation_begin_time,
                "aggregation_end_time": aggregation_end_time,
            }

            for context in full_context_to_contexts(full_context):
                list_of_possible_context_values = self.data_config["contextValues"][
                    context
                ]
                context_value = choice(list_of_possible_context_values)
                database_row_data[context.lower()] = context_value

            csac_key_metric_mappings = {}
            for metric in self.data_config["fullContextMetrics"][full_context]:
                generic_metric_name = remove_full_context_from_metric_document_name(
                    metric, full_context
                )
                metric_data = self.data_config["metrics"][generic_metric_name]
                csac_key_metric_mappings[
                    self.data_config["metrics"][generic_metric_name]["csacKey"]
                ] = {**metric_data, "original_metric_id": metric}
                if metric_data["type"] == "integer":
                    database_row_data[
                        self.data_config["metrics"][generic_metric_name]["csacKey"]
                    ] = int(uniform(1, 500))
                else:
                    database_row_data[
                        self.data_config["metrics"][generic_metric_name]["csacKey"]
                    ] = round(uniform(1, 500), 6)

            generated_data.append(database_row_data)
            sql_command += self.build_postgres_row_from_dict(database_row_data)
            shell_command += self.build_opensearch_documents_from_dict(
                full_context, database_row_data, csac_key_metric_mappings
            )
            moving_datetime = moving_datetime + timedelta(
                seconds=randrange(self.step_size_minutes * 60)
            )

        # Removing comma from final row of SQL command and replacing it with a semicolon
        sql_command = sql_command[:-2]
        sql_command += ";\n"

        # Writing SQL command to an SQL file
        write_string_to_file(
            sql_command,
            "%s/%s%s%s.sql"
            % (
                self.postgres_script_directory,
                POSTGRES_TABLE_PREFIX,
                full_context.lower(),
                POSTGRES_TABLE_SUFFIX,
            ),
        )

        # Writing shell command to a shell script file
        write_string_to_file(
            shell_command,
            "%s/add_%s_data.sh" % (self.opensearch_script_directory, full_context),
        )

        # Writing trim SQL command to an SQL file
        self.generate_postgres_delete_from_table_script(full_context)

    def generate(self) -> None:
        """
        Generates shell and SQL files which, once executed, will import data into OpenSearch
        and Postgres for all full contexts in the data configuration file.
        """
        print("Generating KPI data...")

        # Generating Postgres SQL files and OpenSearch ingestion shell scripts
        for full_context in self.data_config["fullContexts"]:
            self.generate_kpi_data(full_context)

        # Generating OpenSearch deletion shell scripts
        self.generate_opensearch_deletion_script()

        print("Done.")
