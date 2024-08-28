import isString from 'lodash/isString';
import isEmpty from 'lodash/isEmpty';
import trim from 'lodash/trim';
import filter from 'lodash/filter';

export function randomSuffix() {
  return Math.random().toString(36).substring(5);
}

export function isValidString(value) {
  return isString(value) && !isEmpty(trim(value));
}

export function removeNonValidName(array) {
  return filter(array, (i) => isValidString(i?.name));
}

/**
 * Extracts tiles from dashboard model.
 * @param model
 * @param dashboardId
 * @returns {unknown[]}
 */
export function getDashboardTiles(model, dashboardId) {
  const findDashboardById = (id) => model.dashboards.find((d) => d._id === id);

  const findWidgetById = (id) => model.widgets.find((widget) => widget._id === id);

  const findWidgetSources = (widgetSourceIds) =>
    widgetSourceIds.map((sourceId) => ({
      source: model.sources.find((source) => source._id === sourceId.source),
    }));

  const dashboard = findDashboardById(dashboardId);

  return dashboard.tiles.map((t) => {
    const tile = { ...t };
    const widget = findWidgetById(tile.widget);

    if (widget) {
      tile.widget = { ...widget };

      tile.widget.sources = [...findWidgetSources(widget.sources)];
    }
    return tile;
  });
}
