/**
 * Randomizes a value
 * @param value
 * @param percentage
 * @returns {number}
 */
const randomize = (value, percentage = 10) => {
  // For demo data source just make sure all values are valid integers
  value = typeof value === 'number' && !Number.isNaN(value) ? value : 42;

  const range = Math.floor(value * (percentage / 100));
  return value + Math.floor(Math.random() * (2 * range + 1)) - range;
};

export function getDataSource(context, postgresSchemaName) {
  return (sourceType, metric) => {
    if (sourceType === 'fake') {
      return {
        data: [
          {
            // Randomize slightly to avoid repeated graphs
            numberValue: randomize(metric.value),
            label: metric.name,
          },
        ],
      };
    }

    if (sourceType === 'pmStatsQueryService') {
      const findByName = (name) => metric.extra.find((item) => item.key === name)?.value;
      const csacTable = findByName('csac_table');
      const csacColumn = findByName('csac_column');
      const contextTypeFields = context.type.contextFields;
      const filter = context.contextFields
        .map(({ name }, index) => `${contextTypeFields[index].id.toLowerCase()} eq '${name}'`)
        .join(' and ');
      return {
        schema: postgresSchemaName,
        entitySet: csacTable,
        timestampField: 'aggregation_end_time',
        sourceFields: { [metric.name]: csacColumn },
        queryParameters: {
          $filter: filter,
        },
      };
    }

    return {};
  };
}
