import isEmpty from 'lodash/isEmpty';
import filter from 'lodash/filter';
import flatMap from 'lodash/flatMap';
import uniq from 'lodash/uniq';
import { randomSuffix } from './utils.js';

/**
 * Widget generator.
 * Handles widget generation based on the type of the widget.
 * Build is controlled by visualization directives
 * @param model - dashboard model builder
 * @returns {{generateWidget: (function(*, *, *, *, *, *): *)}}
 */
function widgetTypeBuilder(model) {
  const visualizationDirectives = model.getVisualizationDirectives();
  return {
    generateWidget: (id, widgetType, title, subtitle, unit, sources) => {
      const widget = {
        _id: id,
        widgetType,
        title,
        subtitle,
        unit,
        sources: sources.map((source) => {
          const sourceEntry = { source: source.getSourceId() };
          const sourceOptions = visualizationDirectives.sourceOptions?.[widgetType];
          return sourceOptions
            ? { ...sourceEntry, ...sourceOptions(source.getMetric()) }
            : sourceEntry;
        }),
      };
      // Cleaning invalid units spec for 'kpi' widget. CNOM has an 8 character limit on
      // the `unit` string. If the `unit` string has more than 8 characters, our dashboard
      // model will not pass CNOM's schema validation.
      if (widgetType === 'kpi' || unit?.length > 8) {
        delete widget.unit;
      }
      const options = visualizationDirectives.widgetOptions?.[widgetType];
      return options ? { ...widget, ...options() } : widget;
    },
  };
}

/**
 * Builds tile generator
 * @param model - dashboard model builder
 * @param widget - widget to build tile from
 * @returns {{generate: (function(): *&{widget: *})}}
 */
function buildTile(model, widget) {
  const { configureTile } = model.getVisualizationDirectives();
  return {
    generate: () => ({
      ...configureTile(widget.widgetType),
      widget: widget.getId(),
    }),
  };
}

/**
 * Builds source generator
 * @param model - dashboard model builder
 * @param metric - metric to build source from
 */
function buildSource(model, metric) {
  const { sourceType, configureSource } = model.getVisualizationDirectives();
  const sourceId = `${sourceType}_${metric.id}_${randomSuffix()}`;

  model.pushSource({
    generate: () => ({
      _id: sourceId,
      sourceType,
      ...configureSource(sourceType, metric),
    }),
    getSourceId: () => sourceId,
    getMetric: () => metric,
    isMemberOfFamily: (family) => uniq(flatMap(metric.visualization.groups)).includes(family),
  });
}

/**
 * Build source generators from given metrics
 * @param model - dashboard model builder
 * @param metrics - metrics used for building sources
 */
function buildSources(model, metrics) {
  metrics?.forEach((metric) => buildSource(model, metric));
}

/**
 * Builds a widget generator.
 * @param model - dashboard model builder
 * @param widgetType - widget type to build
 * @param title - widget title
 * @param subtitle - widget subtitle
 * @param unit - widget unit
 * @param groups - widgets groups
 * @param sources - widget sources
 */
function buildWidget(model, widgetType, title, subtitle, unit, groups, sources) {
  const { generateWidget } = widgetTypeBuilder(model);
  const widgetId = `${widgetType}_${randomSuffix()}`;

  model.pushWidget({
    getId: () => widgetId,
    getMetrics: () => sources.map((source) => source.getMetric()),
    getGroups: () => groups,
    generate: () => generateWidget(widgetId, widgetType, title, subtitle, unit, sources),
  });
}

/**
 * Builds widgets generators from source generators
 * @param model - dashboard model builder
 */
function buildWidgets(model) {
  const { widgetsToBuild, configureWidgetTitle, configureWidgetSubtitle, configureWidgetUnit } =
    model.getVisualizationDirectives();

  widgetsToBuild?.().forEach(({ familyName, type, title, subtitle, unit, groups }) => {
    const sources = filter(model.sourceBuilders(), (source) => source.isMemberOfFamily(familyName));

    const metrics = sources.map((source) => source.getMetric());

    buildWidget(
      model,
      type,
      title || configureWidgetTitle(metrics),
      subtitle || configureWidgetSubtitle(metrics),
      unit || configureWidgetUnit(metrics),
      groups,
      sources,
    );
  });
}

/**
 * Builds dashboard generator
 * @param model - dashboard model builder
 * @param title - dashboard title
 * @param tilesSpec - tiles specification
 */
function buildDashboard(model, title, tilesSpec) {
  const tiles = model
    .widgetBuilders()
    .filter((widget) => tilesSpec.accept(widget.getGroups()))
    .map((widget) => buildTile(model, widget));

  if (!isEmpty(tiles)) {
    const dashboard = {
      generate: () => ({
        _id: `dashboard_${randomSuffix()}`,
        title,
        tiles: tiles.map((tile) => tile.generate()),
      }),
    };

    model.pushDashboard(dashboard);
  }
}

/**
 * Builds dashboards
 * @param model - dashboard model builder
 */
function buildDashboards(model) {
  const { dashboardsSpec } = model.getVisualizationDirectives();

  dashboardsSpec?.()?.forEach(({ dashboardTitleSuffix, tilesSpec }) => {
    buildDashboard(model, `${dashboardTitleSuffix}`, tilesSpec);
  });
}

/**
 * Builds CNOM dashboards based on visualization directives
 * @param {object} visualizationDirectives - visualization directives used for controlling build process
 * @returns {{pushDashboard: (function(*): number), pushSource: (function(*): number), pushWidget: (function(*): number), generate: (function(): {$schema: string, sources: *[], namespace: string, widgets: *[], dashboards: *[]}), getVisualizationDirectives: (function(): *)}}
 */
function buildDashboardModel(visualizationDirectives) {
  const schema = '../../../server/jsonSchemas/dashboardModel.schema.json';
  const dashboards = [];
  const sources = [];
  const widgets = [];

  return {
    getVisualizationDirectives: () => visualizationDirectives,
    sourceBuilders: () => sources,
    widgetBuilders: () => widgets,
    pushDashboard: (dashboard) => dashboards.push(dashboard),
    pushSource: (source) => sources.push(source),
    pushWidget: (widget) => widgets.push(widget),
    generate: () => ({
      $schema: schema,
      namespace: visualizationDirectives.namespace,
      dashboards: dashboards.map((b) => b.generate()),
      widgets: widgets.map((b) => b.generate()),
      sources: sources.map((b) => b.generate()),
    }),
  };
}

/**
 * Generates DashboardModel object from metrics data.
 * The generation is controlled by given visualization directives
 * Built DashboardModel object is compliant to CNOM DashboardModel schema.
 * @param {object} visualizationDirectives - visualization directives used for controlling build process
 * @param {object[]} metrics - source metrics used to build dashboards
 * @returns {{$schema: string, sources: *[], namespace: string, widgets: *[], dashboards: *[]}}
 */
export function dashboardModel(visualizationDirectives, metrics) {
  const model = buildDashboardModel(visualizationDirectives);

  buildSources(model, metrics);
  buildWidgets(model);
  buildDashboards(model);

  return model.generate();
}
