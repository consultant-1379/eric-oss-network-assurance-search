load('config.star', 'get_settings')
settings = get_settings()

def deploy_main_service(arm_url, arm_repo, ingressHost, mainChart_deps, pull_secret, namespace, ha_port, debug_port):

  k8s_resource('eric-oss-network-assurance-search', # deployment name in the k8s yaml
    port_forwards=[
      '{}:3000'.format(ha_port),   # Assurance-search
      '{}:9229'.format(debug_port),    # debugger
    ],
    resource_deps=mainChart_deps
  )

  set_params = [ # Values to set from the command-line
    'imageCredentials.assurancesearch.registry.url=' + arm_url,
    'imageCredentials.pullSecret=' + pull_secret,
    'imageCredentials.assurancesearch.repoPath=' + arm_repo,
    'imageCredentials.assurancesearch.name=eric-oss-network-assurance-search',
    'ingress.enabled='+str(settings.get('ingressEnabled')),
    'ingress.path='+settings.get('ingressPath', '/assurance-search_' + settings.get('dockerUser', 'test')),
    'ingress.hostname='+ingressHost,
    'ingress.tls.enabled='+str(settings.get('ingressEnableTLS')),
    'ingress.useContour='+str(settings.get('ingressUseContour')),
    'ingress.cors.allowOrigin='+str(settings.get('allowOrigin')),
    'ingress.ingressClass='+settings.get('ingressClass'),
    'ingress.adpIccrServiceName='+str(settings.get('adpIccrServiceName')),
    'global.security.tls.enabled='+str(settings.get('mTLS')),
    'service.endpoints.http.tls.verifyClientCertificate='+settings.get('verifyClientCertificate', 'optional'),
    'log.streamingMethod='+settings.get('logStreamingMethod'),
    'configuration.faultIndications.enabled='+str(settings.get('faultIndicationsEnabled')),
    'configuration.logging.defaultLogLevel='+settings.get('logLevel', 'info'),
    'metrics.enabled='+str(settings.get('metricsEnabled')),
    'replicaCount='+str(settings.get('replicaCount', 1)), # live reload only works with single pod
    'configuration.guiAggregator.enabled='+str(settings.get('guiAggregatorEnabled')),
    'configuration.cnom.defaultDashboards.enabled='+str(settings.get('deployCNOM'))
  ]

  # reusing Ingress host when setting up APO FQDN's
  if settings.get('authzProxy'):
    authFqdn = ''.join(['authn.iam.', ingressHost])
    keycloakFqdn = ''.join(['iam.', ingressHost])
    set_params.append('authorizationProxy.enabled='+str(settings.get('authzProxy')))
    set_params.append('authorizationProxy.authnProxyFQDN='+authFqdn)
    set_params.append('authorizationProxy.keycloakFQDN='+keycloakFqdn)
    set_params.append('authorizationProxy.adpIccrServiceName='+str(settings.get('adpIccrServiceName')))

  if settings.get('deployMockServices'):
    set_params.append('manualconfig.services[0].name=help-center-mock-eea')
    set_params.append('manualconfig.services[0].version=1.0.0-0')
    if settings.get('mTLS'):
      set_params.append('manualconfig.services[0].URL=https://help-center-mock-eea-http:4000/ui')
    else:
      set_params.append('manualconfig.services[0].URL=http://help-center-mock-eea-http:4000/ui')

  network_assurance_search_yaml = helm(
    'charts/eric-oss-network-assurance-search/',
    name='eric-oss-network-assurance-search', # The release name, equivalent to helm --name
    namespace=namespace, # The namespace to install in, equivalent to helm --namespace
    set=set_params
  )
  # live reload needs write access to the root fs
  network_assurance_search_yaml = blob(str(network_assurance_search_yaml).replace('readOnlyRootFilesystem: true','readOnlyRootFilesystem: false'))
  k8s_yaml(network_assurance_search_yaml)
