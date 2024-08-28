export function getWidgetOptions() {
  return {
    kpi: () => ({ showTimestamp: true }),
    barChart: () => ({
      thresholds: [],
    }),
    gauge: () => ({
      size: 'medium',
      dataKey: 'Cavendish',
      min: 0,
      max: 100,
      limits: [
        { from: 1, to: 10, label: 'Low', color: 'red' },
        { from: 90, to: 100, label: 'High', color: 'yellow' },
        {
          from: 10,
          to: 90,
          label: 'Normal',
          color: 'transparent',
        },
      ],
    }),
    donut: () => {},
    timeline: () => ({
      thresholds: [],
      rightPanelContent: {
        features: ['settings', 'valuesTable'],
        openByDefault: 'none',
      },
    }),
  };
}
