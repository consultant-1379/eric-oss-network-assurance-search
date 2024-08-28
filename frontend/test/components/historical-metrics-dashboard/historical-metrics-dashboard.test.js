import { expect, fixture, html } from '@open-wc/testing';
import { isRendered } from '../../utils/isRendered.js';
import HistoricalMetricsDashboard from '../../../src/components/historical-metrics-dashboard/historical-metrics-dashboard.js'; //
import { nextTick } from '../../utils/utils.js';
import getVisualizationDirectives from '../../../src/services/historicalDashboard/getVisualizationDirectives.js';
import context from '../../../mocks/components/historical-metrics-dashboard/context.json';
import emptyHistoricalDashboardModel from '../../../mocks/components/historical-metrics-dashboard/emptyHistoricalDashboardModel.json';
import fullHistoricalDashboardModel from '../../../mocks/components/historical-metrics-dashboard/fullHistoricalDashboardModel.json';
import { loadConfig } from '../../../src/config/configManager.js';

const postgresSchemaName = 'kpi';

describe('<e-historical-metrics-dashboard> Component Tests', () => {
  let container;

  const renderContainer = async ({ historicalDashboardModel }) => {
    const historicalMetricsDashboardTemplate = html`
      <e-historical-metrics-dashboard
        .historicalDashboardModel=${historicalDashboardModel}
      ></e-historical-metrics-dashboard>
    `;
    const element = await fixture(historicalMetricsDashboardTemplate);
    await isRendered(element);
    return element;
  };

  before(async () => {
    await loadConfig();
    HistoricalMetricsDashboard.register();
  });

  describe('Basic component setup', () => {
    it('should render <e-historical-metrics-dashboard>', async () => {
      container = await renderContainer({
        historicalDashboardModel: emptyHistoricalDashboardModel,
      });
      expect(container).to.exist;
    });

    it('should render iframe', async () => {
      container = await renderContainer({
        historicalDashboardModel: emptyHistoricalDashboardModel,
      });
      const iframe = container.shadowRoot.querySelector('iframe');
      expect(iframe).to.exist;
    });

    it.skip('should show loading banner', async () => {
      container = await renderContainer({
        historicalDashboardModel: emptyHistoricalDashboardModel,
      });

      window.postMessage('Loaded', '*');
      container._loaded = true;
      await nextTick();

      const banner = container.shadowRoot.querySelector('#loading-banner');
      expect(banner).to.exist;
    });

    it('call getTheme function', async () => {
      container = await renderContainer({
        historicalDashboardModel: emptyHistoricalDashboardModel,
      });
      const theme = container.getTheme();
      expect(theme).to.not.exist;
    });

    it('should getVisualizationDirectives function return valid widgetOptions', async () => {
      container = await renderContainer({
        historicalDashboardModel: emptyHistoricalDashboardModel,
      });

      const rValue = getVisualizationDirectives(context, postgresSchemaName);
      expect(rValue).to.exist;
    });

    it('should send message via postMessage function', async () => {
      let eventDetails;
      window.addEventListener('message', (event) => {
        eventDetails = event;
      });

      container = await renderContainer({
        historicalDashboardModel: emptyHistoricalDashboardModel,
      });
      const theme = 'dark';
      const themeDetails = { detail: { theme } };
      container.themeChanged(themeDetails);
      container.syncTheme();
      window.postMessage(themeDetails, '*');

      await nextTick();
      expect(eventDetails).to.exist;
    });

    it('should dashboardModel function return valid widgetOptions', async () => {
      let eventDetails;
      window.addEventListener('message', (event) => {
        eventDetails = event;
      });

      container = await renderContainer({
        historicalDashboardModel: fullHistoricalDashboardModel,
      });
      container.updateAssuranceDashboard();

      window.postMessage('callBackFromCNOM', '*');
      await nextTick();
      expect(eventDetails).to.exist;
    });
  });
});
