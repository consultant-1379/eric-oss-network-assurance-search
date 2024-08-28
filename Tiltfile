load('./tilt-lib/config.star', 'get_settings')
settings = get_settings()
arm_url = settings.get('arm_url')
arm_repo = settings.get('arm_repo')
pull_secret = settings.get('pull_secret')
ha_port = str(settings.get('forwardingPort'))
debug_port = str(settings.get('debugPort'))
namespace = 'default'
mainChart_deps = []

# this variable is used both in Assurance Search and CI block
ingressHost = settings.get('ingressHost', 'localhost:{}'.format(ha_port))
iccrIp = settings.get('ingressIP', '')
# overwriting it using actual IP in case of Contour
if settings.get('deployIccr'):
  # after .txt is updated by "tilt-iccr-ip-fetcher", Tiltfile is retriggered and ingressHost is recalculated
  iccrIp = read_file('tilt.iccr.ip.txt', default = '')
  iccrIp = str(iccrIp)

if iccrIp:
  ingressHost = ''.join([str(settings.get('dockerUser')),'.ha.', iccrIp, '.nip.io'])
  protocol = 'http'
  if (settings.get('ingressEnableTLS')):
    protocol = 'https'
  uiUrl=''.join([protocol, '://', ingressHost, '/ui'])
  print('\nHelp Aggregator UI address: ' + uiUrl + '\n')

# Handle remote mode
load('./tilt-lib/init-namespace.star', 'init_namespace', 'docker_login', 'generate_namespace_name')
if settings.get('mode') == 'remote':
  allow_k8s_contexts(settings.get('kubecontext'))
  namespace = generate_namespace_name()
  init_namespace(namespace)
  #local('kubectl config set-context --current --namespace=' + namespace)
  docker_login()

# Load statement can not be moved to if statement, because Tilt does not allow that.
load('./tilt-lib/generate-mock.star', 'generate_mock_service', 'build_mock_service_image')

if settings.get('deployMockServices') or settings.get('deployEsmServices'):
  build_mock_service_image()

if settings.get('deployMockServices'):
  #mock_id, port_offset, namespace, public_path, context_root
  generate_mock_service('eea', 20, namespace, iccrIp, 'help-center-mock-eea', 'ui')
  generate_mock_service('ecm', 30, namespace, iccrIp, 'help-center-mock-ecm', 'some-path')
  generate_mock_service('eea-real-doc', 40, namespace, iccrIp, 'eea-library-overview', 'overview')
# TODO Any ESM mock in Help Center?
# if settings.get('deployEsmServices'):
#   #mock_id, port_offset, namespace, public_path
#   generate_mock_service('esma', 50, namespace, 'esm-container')
#   generate_mock_service('esmb', 60, namespace, 'esm-service-1')
#   generate_mock_service('esmc', 70, namespace, 'esm-service-2')

load('./tilt-lib/deploy-main-service.star', 'deploy_main_service')
load('./tilt-lib/build-main-service.star', 'build_main_service')
load('./tilt-lib/deploy-ci-chart.star', 'deploy_ci_chart')
ciChartNeeded = (settings.get('mTLS') or settings.get('deployFm') or settings.get('deployLogTransformer') or settings.get('deployIam') or settings.get('deployIccr') or settings.get('deployCNOM') or settings.get('metricsEnabled')) and not settings.get('isCiChartDeployed')
if ciChartNeeded:
  deploy_ci_chart(pull_secret, ingressHost, namespace)

if settings.get('deployMainService'):

  # in case of Contour, only deploy Help Aggregator after tilt-iccr-ip-fetcher is ready
  if settings.get('deployIccr') and settings.get('ingressEnabled') and settings.get('ingressUseContour'):
    mainChart_deps.append('tilt-iccr-ip-fetcher')

  if settings.get('deployFm') and not settings.get('guiAggregatorEnabled'):
    mainChart_deps.append('eric-fh-alarm-handler')

  build_main_service(arm_url, arm_repo)
  deploy_main_service(arm_url, arm_repo, ingressHost, mainChart_deps, pull_secret, namespace, ha_port, debug_port)
