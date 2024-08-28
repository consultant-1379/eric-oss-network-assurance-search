import { chain } from 'lodash'; // chain cannot be imported like the other lodash packages.
import flatMap from 'lodash/flatMap';
import isEmpty from 'lodash/isEmpty';
import omit from 'lodash/omit';
import uniq from 'lodash/uniq';
import { getConfig } from '../../config/configManager.js';
import CONSTANTS from '../../utils/constants.js';
import { getDataSource } from './visualizationDataSource.js';
import { getWidgetOptions } from './visualizationWidgetOptions.js';
import { getSourceOptions } from './visualizationSourceOptions.js';

const { HISTORICAL_DASHBOARD_NAMESPACE } = CONSTANTS;

/**
 *
 * @param context - context
 * @param metrics
 * @param configuration
 * @param postgresSchemaName
 * @return {*} visualization directives
 */
export default function getVisualizationDirectives(
  context,
  metrics,
  configuration,
  postgresSchemaName,
) {
  /**
   * Main dashboard title
   * @type {string}
   */
  const dashboardTitle = context
    ? `${context.contextFields.map((entity) => entity.id).join(', ')}`
    : 'Please select the row';

  /**
   *
   * @param pushWidget accumulator callback to store widgets
   * @param metric
   */
  const resolveWidgetReferences = (pushWidget, metric) => {
    const filterMetricFamilies = ([groupName, families]) => {
      const referencedFamilies = configuration?.families?.filter((familyDefinition) =>
        families.includes(familyDefinition.name),
      );

      return {
        groupName,
        families: isEmpty(referencedFamilies)
          ? [{ name: metric.id, widget: 'timeline' }]
          : referencedFamilies,
      };
    };

    Object.entries(metric.visualization.groups)
      .map(filterMetricFamilies)
      .forEach(({ groupName, families }) =>
        families.forEach((family) =>
          pushWidget({
            familyName: family.name,
            type: family.widget,
            title: family.title,
            subtitle: family.subtitle,
            unit: family.unit,
            groups: groupName,
          }),
        ),
      );
  };

  /**
   * Get list of widgets to be build for the historical dashboard.
   * Number of calculated widgets is based on the family the metric belongs to.
   * Metrics within the same family will be share the same widget.
   * The type of the widget is defined by the family.
   * @returns {{familyName: string, groups: string[]}[]} each widget contains family name and groups it belongs to-
   */
  const widgetsToBuild = () => {
    const widgets = [];
    metrics.forEach((metric) => resolveWidgetReferences(widgets.push.bind(widgets), metric));

    return chain(widgets)
      .groupBy('familyName')
      .map((group, familyName) => ({
        familyName,
        ...omit(group[0], 'familyName'),
        groups: uniq(flatMap(group, 'groups')),
      }))
      .value();
  };

  /**
   * Generates dashboards specification based on the configuration.
   * @returns {*} dashboard specification object
   */
  const dashboardsSpec = () =>
    configuration?.groups?.map(({ name, title, subtitle, sort, sortOrder }) => ({
      dashboardTitleSuffix: title,
      subtitle,
      sort,
      sortOrder,
      tilesSpec: {
        accept: (groups) => groups.includes(name),
      },
    }));

  return {
    namespace: HISTORICAL_DASHBOARD_NAMESPACE,
    dashboardTitle,
    sourceOptions: getSourceOptions(),
    widgetOptions: getWidgetOptions(),

    dashboardsSpec,

    configureTile: (widgetType) => ({
      xSize: widgetType === 'kpi' ? 2 : 8,
      ySize: 1,
    }),
    configureWidgetTitle: (widgetMetrics) => widgetMetrics.map((metric) => metric.name).join(','),
    configureWidgetSubtitle: (widgetMetrics) =>
      widgetMetrics.map((metric) => metric.name).join(','),
    configureWidgetUnit: (widgetMetrics) => widgetMetrics.map((metric) => metric.unit).join(','),
    widgetTypesSupportMultipleSources: ['timeline', 'barChart', 'kpi', 'gauge', 'donut'],
    widgetsToBuild,
    sourceType: getConfig().getCnomDataSourceType(),
    configureSource: getDataSource(context, postgresSchemaName),
  };
}
