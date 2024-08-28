import { expect } from '@open-wc/testing';
import { getDashboardTiles } from '../../../src/services/historicalDashboard/utils';

describe('Historical Dashboard tests of utilities', () => {
  it('should properly extract tiles from dashboard model', async () => {
    const data = {
      $schema: '../../../server/jsonSchemas/dashboardModel.schema.json',
      namespace: 'builtin',
      dashboards: [
        {
          _id: 'default_dashboard',
          title: 'Default Dashboard',
          apps: ['statusOverview'],
          tiles: [
            {
              xSize: 2,
              widget: 'default_example_kpi',
            },
            {
              xSize: 6,
              widget: 'default_example_timeline',
            },
            {
              xSize: 2,
              widget: 'default_example_bar_chart',
            },
            {
              xSize: 10,
              ySize: 2,
              widget: 'pod_table',
            },
          ],
        },
      ],
      widgets: [
        {
          _id: 'default_example_kpi',
          widgetType: 'kpi',
          title: 'KPI',
          sources: [
            {
              heading: 'Total CPU',
              source: 'default_example_cpu_total',
            },
            {
              // eslint-disable-next-line sonarjs/no-duplicate-string
              heading: 'CPU per worker',
              source: 'default_example_cpu_by_worker',
            },
          ],
        },
        {
          _id: 'default_example_timeline',
          widgetType: 'timeline',
          title: 'Total CPU',
          // eslint-disable-next-line sonarjs/no-duplicate-string
          unit: 'cpu seconds/s',
          sources: [{ source: 'default_example_cpu_total' }],
        },
        {
          _id: 'default_example_bar_chart',
          widgetType: 'barChart',
          title: 'CPU per worker',
          unit: 'cpu seconds/s',
          sources: [{ source: 'default_example_cpu_by_worker' }],
        },
      ],
      sources: [
        {
          _id: 'default_example_cpu_total',
          sourceType: 'prometheus',
          // eslint-disable-next-line sonarjs/no-duplicate-string
          query: 'sum(irate(container_cpu_usage_seconds_total[2m]))',
          // eslint-disable-next-line sonarjs/no-duplicate-string
          label: 'Total cpu seconds/s',
        },
        {
          _id: 'default_example_cpu_by_worker',
          sourceType: 'prometheus',
          // eslint-disable-next-line sonarjs/no-duplicate-string
          query: 'sum(irate(container_cpu_usage_seconds_total[2m])) by (kubernetes_io_hostname)',
          splitByLabelName: 'kubernetes_io_hostname',
        },
      ],
    };

    const expected = [
      {
        xSize: 2,
        widget: {
          _id: 'default_example_kpi',
          widgetType: 'kpi',
          title: 'KPI',
          sources: [
            {
              source: {
                _id: 'default_example_cpu_total',
                sourceType: 'prometheus',
                query: 'sum(irate(container_cpu_usage_seconds_total[2m]))',
                label: 'Total cpu seconds/s',
              },
            },
            {
              source: {
                _id: 'default_example_cpu_by_worker',
                sourceType: 'prometheus',
                query:
                  'sum(irate(container_cpu_usage_seconds_total[2m])) by (kubernetes_io_hostname)',
                splitByLabelName: 'kubernetes_io_hostname',
              },
            },
          ],
        },
      },
      {
        xSize: 6,
        widget: {
          _id: 'default_example_timeline',
          widgetType: 'timeline',
          title: 'Total CPU',
          unit: 'cpu seconds/s',
          sources: [
            {
              source: {
                _id: 'default_example_cpu_total',
                sourceType: 'prometheus',
                query: 'sum(irate(container_cpu_usage_seconds_total[2m]))',
                label: 'Total cpu seconds/s',
              },
            },
          ],
        },
      },
      {
        xSize: 2,
        widget: {
          _id: 'default_example_bar_chart',
          widgetType: 'barChart',
          title: 'CPU per worker',
          unit: 'cpu seconds/s',
          sources: [
            {
              source: {
                _id: 'default_example_cpu_by_worker',
                sourceType: 'prometheus',
                query:
                  'sum(irate(container_cpu_usage_seconds_total[2m])) by (kubernetes_io_hostname)',
                splitByLabelName: 'kubernetes_io_hostname',
              },
            },
          ],
        },
      },
      {
        xSize: 10,
        ySize: 2,
        widget: 'pod_table',
      },
    ];
    const actual = getDashboardTiles(data, 'default_dashboard');
    expect(actual).to.deep.equal(expected);
  });
});
