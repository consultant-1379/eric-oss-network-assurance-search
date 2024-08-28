import { expect } from '@open-wc/testing';
import isEqual from 'lodash/isEqual';
import { dashboardModel } from '../../../src/services/historicalDashboard/dashboardGenerator.js';
import getVisualizationDirectives from '../../../src/services/historicalDashboard/getVisualizationDirectives.js';

import configuration from './dashboardConfiguration.json';
import context from './context.json';
import metrics from './metrics.json';
import { loadConfig } from '../../../src/config/configManager.js';

const postgresSchemaName = 'whatever';
await loadConfig();

function getEmptyVisualizationDirectives() {
  return {
    namespace: 'assurance',
  };
}

describe('CNOM Dashboard Generator Tests', () => {
  it('should generate empty dashboard on for empty visualization', async () => {
    const emptyMetrics = [];
    const visualizationDirectives = getEmptyVisualizationDirectives();
    const actual = dashboardModel(visualizationDirectives, emptyMetrics);
    const expected = {
      $schema: '../../../server/jsonSchemas/dashboardModel.schema.json',
      namespace: 'assurance',
      dashboards: [],
      widgets: [],
      sources: [],
    };
    await expect(actual).to.deep.equal(expected);
  });

  it('should generate default dashboard on for default customization', async () => {
    const defaultConfiguration = {
      families: [
        {
          name: 'default',
          widget: 'timeline',
        },
      ],
      groups: [
        {
          name: 'default',
          title: 'Historical Dashboard',
          sort: 'alphabetical',
          sortOrder: 'asc',
        },
      ],
    };
    const actual = dashboardModel(
      getVisualizationDirectives(context, metrics, defaultConfiguration, postgresSchemaName),
      metrics,
    ).dashboards.length;
    const expected = 1;
    await expect(actual).to.be.equal(expected);
  });

  const dashboard = dashboardModel(
    getVisualizationDirectives(context, metrics, configuration, postgresSchemaName),
    metrics,
  );

  it('should generate expected number of sources', async () => {
    const expected = 6;
    const actual = dashboard.sources.length;
    await expect(actual).to.equal(expected);
  });

  it('should generate expected number of widgets', async () => {
    const expected = 5;
    const actual = dashboard.widgets.length;
    await expect(actual).to.equal(expected);
  });

  it('should create expected widget types', async () => {
    const actual = dashboard.widgets.map((w) => w.widgetType);
    const expected = ['timeline', 'timeline', 'donut', 'barChart', 'kpi'];
    expect(isEqual(actual, expected)).to.be.true;
  });

  it('should create expected widget subtitles', async () => {
    const actual = dashboard.widgets.map((i) => i.subtitle);
    const expected = [
      'AMF Mean Reg Nbr',
      'Subtitle for Family 1',
      'Subtitle for Family 2',
      'Subtitle for Family 3',
      'Subtitle for Family 4',
    ];
    expect(isEqual(actual, expected)).to.be.true;
  });

  it('should create expected source types', async () => {
    const actual = dashboard.sources.map((i) => i.sourceType);
    const expected = [
      'pmStatsQueryService',
      'pmStatsQueryService',
      'pmStatsQueryService',
      'pmStatsQueryService',
      'pmStatsQueryService',
      'pmStatsQueryService',
    ];
    expect(isEqual(actual, expected)).to.be.true;
  });

  it('should create expected dashboard titles', async () => {
    const actual = dashboard.dashboards.map((i) => i.title);
    const expected = ['Historical Dashboard', 'Panel 1', 'Panel 2'];
    expect(isEqual(actual, expected)).to.be.true;
  });

  it('widget should referenced correct source', async () => {
    const referencedSource = dashboard.widgets[0].sources[0].source;
    const sourceId = dashboard.sources[0]._id;
    await expect(referencedSource).to.be.equal(sourceId);
  });
});
