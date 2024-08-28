// Top Level Schemas
import dashboardModelSchema from './dashboardModel.schema.json';
import dashboardSchema from './dashboard.schema.json';
import definitionsSchema from './definitions.schema.json';

// Source Schemas
import sourceSchema from './sources/source.schema.json';
import pmStatsQueryServiceSourceSchema from './sources/pmStatsQueryServiceSource.schema.json';

// Widget Schemas
import widgetSchema from './widgets/widget.schema.json';
import barChartWidgetSchema from './widgets/barChartWidget.schema.json';
import donutWidgetSchema from './widgets/donutWidget.schema.json';
import gaugeWidgetSchema from './widgets/gaugeWidget.schema.json';
import graphWidgetSchema from './widgets/graphWidget.schema.json';
import kpiWidgetSchema from './widgets/kpiWidget.schema.json';
import overviewTablesWidgetSchema from './widgets/overviewTablesWidget.schema.json';
import settingsWidgetSchema from './widgets/settingsWidget.schema.json';
import stackedAreaWidgetSchema from './widgets/stackedAreaWidget.schema.json';
import tableWidgetSchema from './widgets/tableWidget.schema.json';
import timelineWidgetSchema from './widgets/timelineWidget.schema.json';
import viewSelectorWidgetSchema from './widgets/viewSelectorWidget.schema.json';

const schemas = [
  // Top Level Schemas
  dashboardModelSchema,
  dashboardSchema,
  definitionsSchema,

  // Source Schemas
  sourceSchema,
  pmStatsQueryServiceSourceSchema,

  // Widget Schemas
  widgetSchema,
  barChartWidgetSchema,
  donutWidgetSchema,
  gaugeWidgetSchema,
  graphWidgetSchema,
  kpiWidgetSchema,
  overviewTablesWidgetSchema,
  settingsWidgetSchema,
  stackedAreaWidgetSchema,
  tableWidgetSchema,
  timelineWidgetSchema,
  viewSelectorWidgetSchema,
];

export { schemas };
