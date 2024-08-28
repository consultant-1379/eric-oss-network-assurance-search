export function getSourceOptions() {
  return {
    kpi: (metric) => ({
      heading: metric.name,
      kpiType: 'progressBar',
      extraData: {
        maxValue: 100,
      },
    }),
  };
}
