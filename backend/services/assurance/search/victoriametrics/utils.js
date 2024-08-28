import path from 'path';
import constants from '../../../../config/constants.js';
import configManager from '../../../../config/configManager.js';

const { VICTORIAMETRICS_QUERY_LOOK_BACK_TIME_DURATION } = constants;

const ENTITY_FILTER_REGEX = {
  doubleEscape: {
    pattern: /[$^()+|[.]/g,
    replacement: '\\\\$&',
  },
  singleEscape: {
    pattern: /["]/g,
    replacement: '\\$&',
  },
  singleWildcard: {
    pattern: /[?]/g,
    replacement: '.',
  },
  tripleEscape: {
    pattern: /[\\]/g,
    replacement: '\\\\\\$&',
  },
  wildcard: {
    pattern: /[*]/g,
    replacement: '.*',
  },
};

/**
 * @description
 * This function returns a set of methods that perform `replace` operations on a given
 * string. These operations can be chained together and the resulting string is assigned
 * to the `result` property of the return object.
 *
 * @param {String} searchPattern - The search pattern that operations will be applied to.
 * @returns {Object} An object that contains the operation methods that can be applied to the given string and the resulting string.
 * @example {
 *  result: "searching.*",
 *  doubleEscapeSearchPattern: () => void,
 *  replaceSingleWildCard: () => void
 *  replaceWildcard: () => void,
 *  singleEscapeSearchPattern: () => void,
 *  tripleEscapeSearchPattern: () => void,
 * }
 *
 * @example Usage example:
 * const cleanSearchPattern = searchPatternOperations("searching*")
 *    .tripleEscapeSearchPattern()
 *    .doubleEscapeSearchPattern()
 *    .singleEscapeSearchPattern()
 *    .replaceWildcard()
 *    .replaceSingleWildCard().result;
 */
const searchPatternOperations = (searchPattern) => ({
  result: searchPattern,

  /**
   * @description
   * This method adds two escape characters (`\\`) in front of certain characters in a string.
   * The target characters are defined by a constant at the top of this file.
   */
  doubleEscapeSearchPattern() {
    this.result = this.result.replace(
      ENTITY_FILTER_REGEX.doubleEscape.pattern,
      ENTITY_FILTER_REGEX.doubleEscape.replacement,
    );
    return this;
  },

  /**
   * @description
   * This method replaces all question marks (`?`) within a string with the equivalent
   * regex expression (`.`).
   */
  replaceSingleWildCard() {
    this.result = this.result.replace(
      ENTITY_FILTER_REGEX.singleWildcard.pattern,
      ENTITY_FILTER_REGEX.singleWildcard.replacement,
    );
    return this;
  },

  /**
   * @description
   * This method replaces all asterisks (`*`) within a string with the equivalent
   * regex expression (`.*`).
   */
  replaceWildcard() {
    this.result = this.result.replace(
      ENTITY_FILTER_REGEX.wildcard.pattern,
      ENTITY_FILTER_REGEX.wildcard.replacement,
    );
    return this;
  },

  /**
   * @description
   * This method adds a single escape character (`\`) in front of certain characters in a string.
   * The target characters are defined by a constant at the top of this file.
   */
  singleEscapeSearchPattern() {
    this.result = this.result.replace(
      ENTITY_FILTER_REGEX.singleEscape.pattern,
      ENTITY_FILTER_REGEX.singleEscape.replacement,
    );
    return this;
  },

  /**
   * @description
   * This method adds three escape characters (`\\\`) in front of certain characters in a string.
   * The target characters are defined by a constant at the top of this file.
   */
  tripleEscapeSearchPattern() {
    this.result = this.result.replace(
      ENTITY_FILTER_REGEX.tripleEscape.pattern,
      ENTITY_FILTER_REGEX.tripleEscape.replacement,
    );
    return this;
  },
});

/**
 * @description
 * This function applies a set of regex `replace` operations to a given
 * search pattern string.
 *
 * The NAS microservice supports the use of two wildcard query operators:
 *    `*` => Matches zero or more characters;
 *    `?` => Matches any single character;
 * Due to VictoriaMetrics supporting regex querying, the search patterns received
 * from the NAD (frontend) must be cleaned by escaping reserved regex characters
 * and replacing the wildcard query operators (listed above) with the equivalent
 * regex expression.
 *
 * @param {String} searchPattern - The search pattern that will be cleaned.
 * @example "1-?00*"
 * @returns {String} The cleaned search pattern that can be used within a VictoriaMetrics query.
 * @example "1-.00.*"
 */
const cleanSearchPattern = (searchPattern) =>
  searchPatternOperations(searchPattern)
    .tripleEscapeSearchPattern()
    .doubleEscapeSearchPattern()
    .singleEscapeSearchPattern()
    .replaceWildcard()
    .replaceSingleWildCard().result;

/**
 * function to create entity filters for VM query.
 * @param entityFilters
 * @returns {*}
 */
function getEntityFilters(entityFilters) {
  return entityFilters
    .map(
      (entityFilter) =>
        `${entityFilter.entityType.id}=~"${cleanSearchPattern(entityFilter.searchPattern)}"`,
    )
    .join(',');
}

/**
 * function to create Metric time series expressions for VM query.
 * @param metricTypes
 * @param mustApplyMetricFilter
 * @returns {*}
 */
function getMetricTimeSeriesExpressions(metricTypes, mustApplyMetricFilter) {
  return metricTypes
    .map((metricType, index) => {
      const timeSeriesVariableName = `k${index + 1}`;
      const metricFilter = mustApplyMetricFilter(metricType.id);
      let timeSeriesExpression = `${timeSeriesVariableName}${
        metricFilter ? '_0' : ''
      } = last_over_time(${
        metricType.id
      }{context_filter}[${VICTORIAMETRICS_QUERY_LOOK_BACK_TIME_DURATION}])`;

      // Building the metric filter expression if applicable
      if (metricFilter) {
        const metricFilterExpressions = [
          metricFilter.from
            ? `${timeSeriesVariableName}_0 >= ${parseFloat(metricFilter.from)}`
            : undefined,
          metricFilter.to
            ? `${timeSeriesVariableName}_0 <= ${parseFloat(metricFilter.to)}`
            : undefined,
        ]
          .filter((expression) => expression)
          .join(' AND ');
        timeSeriesExpression = `${timeSeriesExpression},\n  ${timeSeriesVariableName} = ${metricFilterExpressions}`;
      }
      return timeSeriesExpression;
    })
    .join(',\n  ');
}

/**
 * Function to create a Sorting function for VM query
 * @param metricTypes
 * @param sortingBy
 * @param sortOrder
 * @returns {(function(): (string))|*}
 */
function getSortFunction(metricTypes, sortingBy, sortOrder) {
  return () => {
    const metricIds = metricTypes.map((metricType) => metricType.id);
    if (metricIds.includes(sortingBy)) {
      return sortOrder === 'desc' ? 'sort_by_label_numeric_desc' : 'sort_by_label_numeric';
    }
    return sortOrder === 'desc' ? 'sort_by_label_desc' : 'sort_by_label';
  };
}

/**
 * function to extract time stamps from row data
 * @param metricData
 * @returns {{beginTimestamp: *, endTimestamp: *}}
 */
function extractTimestampProperties(metricData) {
  const timeStamp = metricData?.value[0] || null;
  return {
    beginTimestamp: timeStamp,
    endTimestamp: timeStamp,
  };
}

/**
 * @Function
 * to construct Victoria Metrics url using path
 * @param urlPath
 * @returns {String}
 */
const createVmUrlFromPath = (urlPath) => {
  const vmUrl = configManager.getVictoriaMetricsUrl();
  return new URL(path.join(vmUrl, urlPath)).toString();
};

export {
  cleanSearchPattern,
  getEntityFilters,
  getMetricTimeSeriesExpressions,
  getSortFunction,
  extractTimestampProperties,
  createVmUrlFromPath,
};
