import os from 'os';
import { expect } from 'chai';
import k8sClientMock from '../mocks/modules/k8s.client.mock.js';
import nodeFetchMock from '../mocks/modules/nodeFetch.mock.js';
import fsMock from '../mocks/modules/fsMock.js';
import factory from './factory.js';
// the first test case's before hook will load app.js and its dependencies
// not all dependencies are mocked, as metrics.api.test is also kind of integration test
// the first import of some non-mocked 3pp libs can take up to 5 seconds
// see ADPRS-415 for more details
const INITIAL_LOAD_TIMEOUT = 120_000;
const APP_NAME_USED_IN_METRIC_KEYS = 'eric_oss_network_assurance_search';
const DEFAULT_METRICS = [
  `${APP_NAME_USED_IN_METRIC_KEYS}_process_cpu_user_seconds_total`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_process_cpu_system_seconds_total`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_process_cpu_seconds_total`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_process_start_time_seconds`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_process_resident_memory_bytes`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_eventloop_lag_seconds`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_eventloop_lag_min_seconds`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_eventloop_lag_max_seconds`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_eventloop_lag_mean_seconds`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_eventloop_lag_stddev_seconds`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_eventloop_lag_p50_seconds`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_eventloop_lag_p90_seconds`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_eventloop_lag_p99_seconds`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_active_handles`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_active_handles_total`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_active_requests`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_active_requests_total`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_heap_size_total_bytes`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_heap_size_used_bytes`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_external_memory_bytes`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_heap_space_size_total_bytes`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_heap_space_size_used_bytes`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_heap_space_size_available_bytes`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_version_info`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_nodejs_gc_duration_seconds`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_http_request_duration_seconds`,
];

const osType = os.type();

if (osType !== 'Windows_NT' && osType !== 'Darwin') {
  DEFAULT_METRICS.push(
    `${APP_NAME_USED_IN_METRIC_KEYS}_process_virtual_memory_bytes`,
    `${APP_NAME_USED_IN_METRIC_KEYS}_process_heap_bytes`,
    `${APP_NAME_USED_IN_METRIC_KEYS}_process_open_fds`,
  );
}

if (osType !== 'Darwin') {
  DEFAULT_METRICS.push(`${APP_NAME_USED_IN_METRIC_KEYS}_process_max_fds`);
}

const CUSTOM_COUNTERS = [
  `${APP_NAME_USED_IN_METRIC_KEYS}_internal_api_uiConfig_http_requests_total`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_ui_http_requests_total`,
];
const K8_METRICS = [
  `${APP_NAME_USED_IN_METRIC_KEYS}_pod_num`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_service_num`,
  `${APP_NAME_USED_IN_METRIC_KEYS}_endpoint_num`,
];
const responseCheck = (response) => {
  const { text } = response;
  [...DEFAULT_METRICS, ...CUSTOM_COUNTERS, ...K8_METRICS].forEach((metric) => {
    expect(text).to.have.string(metric);
  });
};
const checkEndpoint = async (request, endpoint, httpCode) =>
  request
    .get(`${endpoint}`)
    .set('Accept', 'application/json')
    .expect(httpCode)
    .expect(responseCheck);
describe('Component tests for metrics API', () => {
  const { loadServer, closeServer } = factory();
  let request;
  // eslint-disable-next-line func-names
  beforeEach(async function () {
    this.timeout(INITIAL_LOAD_TIMEOUT);
    const localConfigMock = {
      libName: 'fs',
      isDefault: false,
      impl: fsMock({ uiServiceConfig: { k8sLabelValue: 'workspace-gui' } }),
    };
    request = await loadServer(
      { libName: '@kubernetes/client-node', isDefault: true, impl: k8sClientMock },
      { libName: 'node-fetch', isDefault: true, impl: nodeFetchMock },
      localConfigMock,
    );
  });
  afterEach(async () => {
    await closeServer();
  });
  it('Successfully returns all required metrics', async () => {
    await checkEndpoint(request, '/metrics', 200);
  });
});
