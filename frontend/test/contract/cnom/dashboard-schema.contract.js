/* eslint-disable prettier/prettier */
import { expect } from '@open-wc/testing';
import { loadConfig } from '../../../src/config/configManager.js';
import { schemas } from '../../../../consumer-contract-tests/cnomJsonSchemas/cnomJsonSchemas.js';
import HistoricalMetricsDashboard from '../../../src/components/historical-metrics-dashboard/historical-metrics-dashboard.js';
import getVisualizationDirectives from '../../../src/services/historicalDashboard/getVisualizationDirectives.js';
import { dashboardModel } from '../../../src/services/historicalDashboard/dashboardGenerator.js';
import {
  dataModifyingAjv,
  loadSchemas,
  prettifyAjvErrorsText,
} from '../../utils/jsonValidation.js';

import uiConfiguration from '../../../mocks/app/network-assurance-dashboard/getUiConfigurationResponse.json';
import context1 from '../../../mocks/contract/cnom/context1.json';
import metrics1 from '../../../mocks/contract/cnom/metrics1.json';
import context2 from '../../../mocks/contract/cnom/context2.json';
import metrics2 from '../../../mocks/contract/cnom/metrics2.json';

const dashboardModelSchemaId = 'https://cnom.ericsson.com/schemas/dashboardModel.schema.json';
const postgresSchemaName = 'kpi';

function handleAjvErrors(ajvInstance) {
  const errors = prettifyAjvErrorsText(ajvInstance);
  if (errors.length > 0) {
    console.log(errors);
  }
}

function validateDashboardModel(ajvInstance, generatedDashboardModel, expectedValue) {
  const isValidSchema = ajvInstance.validate(dashboardModelSchemaId, generatedDashboardModel);
  if (ajvInstance.errors) {
    handleAjvErrors(ajvInstance);
  }
  expect(isValidSchema).to.equal(expectedValue);
}

describe('<e-historical-metrics-dashboard> Component Tests', () => {
  before(async () => {
    await loadConfig();
    HistoricalMetricsDashboard.register();
    loadSchemas(schemas);
  });

  describe('CNOM dashboardModel generator contract tests', () => {
    it('should generate a dashboard model which conforms to the CNOM dashboard schema', () => {
      const generatedDashboardModel = dashboardModel(
        getVisualizationDirectives(context1, metrics1, uiConfiguration, postgresSchemaName),
        metrics1,
      );
      validateDashboardModel(dataModifyingAjv, generatedDashboardModel, true);
    });

    it('should generate another dashboard model which conforms to the CNOM dashboard schema', () => {
      const generatedDashboardModel = dashboardModel(
        getVisualizationDirectives(context2, metrics2, uiConfiguration, postgresSchemaName),
        metrics2,
      );
      validateDashboardModel(dataModifyingAjv, generatedDashboardModel, true);
    });

    it('should handle an undefined context and empty metrics', () => {
      const generatedDashboardModel = dashboardModel(
        getVisualizationDirectives(undefined, [], uiConfiguration, postgresSchemaName),
        [],
      );
      validateDashboardModel(dataModifyingAjv, generatedDashboardModel, true);
    });
  });
});
