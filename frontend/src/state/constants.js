export const APP_SCHEMA_VERSION = '1.0.2';

export const DEFAULT_STATE = {
  version: APP_SCHEMA_VERSION,
  settings: {},
  browsers: [],
  onboardingHelp: { appHelp: true, filterHelp: true, browserHelp: true },
  filterCategories: [
    {
      type: 'context',
      title: 'Context Filters',
      selection: 'checkbox',
      fields: [],
      help: 'NETWORK_FILTER_TOOLTIP_MESSAGE',
    },
    {
      type: 'metric',
      title: 'KPI Filters',
      selection: 'radio',
      fields: [],
      help: 'MEASUREMENT_FILTER_TOOLTIP_MESSAGE',
    },
  ],
  error: undefined,
  postgresSchemaName: 'kpi',
};

export const NON_PERSISTED_STATE = {
  loading: true,
  error: undefined,
  discoveryCompleted: false,
  contexts: [],
  indices: [],
};

export const DEFAULT_METRIC_BROWSER = {
  title: 'Metric Browser',
  filters: [],
  loading: false,
  match: '',
  browserError: undefined,
  fetchError: undefined,
  settings: { autoRefresh: true, rowHeight: 'compact' },
  data: {
    total: 0,
    numpages: 1,
    numentries: 13,
    currentpage: 1,
    tableData: [],
    sort: {
      sortBy: undefined,
      sortOrder: undefined,
    },
  },
  metricCategoryPickerData: {
    viewAllSelected: false,
    maxPillCount: 10,
  },
  historicalDashboardData: {
    historicalDashboardModel: {},
    showHistoricalDashboard: false,
  },
};

export const NEW_TAB_SETTINGS = {
  loading: true,
  browserError: undefined,
  fetchError: undefined,
  active: true,
};
