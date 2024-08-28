load('config.star', 'get_settings')
settings = get_settings()

running_standalone = not settings.get('guiAggregatorEnabled')
logNeeded = settings.get('deployLogTransformer') and running_standalone
fmNeeded = settings.get('deployFm') and running_standalone
iamNeeded = settings.get('deployIam') and running_standalone
metricsEnabled = (settings.get('metricsEnabled') or fmNeeded or iamNeeded) and running_standalone
iccrNeeded = settings.get('deployIccr')
cnomNeeded = settings.get('deployCNOM')

def deploy_ci_chart(pull_secret, ingressHost, namespace):

  ci_params = [ # Values to set from the command-line
      'global.pullSecret=' + pull_secret,
      'global.security.tls.enabled='+str(settings.get('mTLS')),
      'eric-sec-sip-tls.enabled='+str(settings.get('mTLS') and running_standalone),
      'eric-log-transformer.enabled='+str(logNeeded),
      'eric-pm-server.enabled='+str(settings.get('metricsEnabled')),
      'eric-data-document-database-fault-handling.enabled='+str(fmNeeded),
      'eric-fh-alarm-handler.enabled='+str(fmNeeded),
      'eric-sec-key-management.enabled='+str(running_standalone),
      'eric-eea-ingress-ctrl-applications.enabled='+str(iccrNeeded)
  ]

  if iamNeeded:
    iamAuthFqdn = ''.join(['authn.iam.', ingressHost])
    iamKeycloakFqdn = ''.join(['iam.', ingressHost])
    ci_params.append('eric-sec-access-mgmt.enabled=true')
    ci_params.append('eric-data-document-database-iam.enabled=true')
    ci_params.append('eric-sec-access-mgmt.authenticationProxy.ingress.hostname='+iamAuthFqdn)
    ci_params.append('eric-sec-access-mgmt.ingress.hostname='+iamKeycloakFqdn)

  if cnomNeeded:
    cnomFqdn = ''.join(['cnom.', ingressHost])
    print('\nCNOM UI address: ' + cnomFqdn + '\n')
    ci_params.append('eric-cnom-server.enabled=true')
    ci_params.append('eric-cnom-server.ingress.hostname='+cnomFqdn)

  ci_yaml = helm(
    './charts/ci',
    name='ci', # The release name, equivalent to helm --name
    namespace=namespace, # The namespace to install in, equivalent to helm --namespace
    set=ci_params
  )
  k8s_yaml(ci_yaml, allow_duplicates=True)

  # in case there is Contour, wait for it and save its loadbalancer IP
  if iccrNeeded:
    cmd = 'kubectl -n ${NAMESPACE} get service -o=jsonpath=\'{.items[?(@.spec.type == "LoadBalancer")].status.loadBalancer.ingress[0].ip}\' \
      > tilt.iccr.ip.txt && \
      echo "ICCR address in ${NAMESPACE} namespace:" && cat tilt.iccr.ip.txt && echo "\\n"'
    local_resource(
      'tilt-iccr-ip-fetcher',
      cmd,
      resource_deps=['eric-eea-ingress-ctrl-applications-contour'],
      env = {'NAMESPACE':namespace}
    )

  # Configuring resources dependencies to maintain the deploy order
  if fmNeeded:
    k8s_resource('eric-fh-alarm-handler',
      port_forwards=[
        '5006:5006',   # rest-api for alarms, https
      ],
      resource_deps=['eric-data-message-bus-kf'])
    k8s_resource('eric-data-message-bus-kf', resource_deps=['eric-data-document-database-fault-handling','eric-data-coordinator-zk'])
    k8s_resource('eric-data-document-database-fault-handling', resource_deps=['eric-sec-sip-tls-main', 'eric-sec-key-management-main', 'eric-data-distributed-coordinator-ed', 'eric-pm-server'])
    k8s_resource('eric-data-coordinator-zk', resource_deps=['eric-sec-sip-tls-main', 'eric-sec-key-management-main', 'eric-data-distributed-coordinator-ed'])
    k8s_resource('eric-pm-server', resource_deps=['eric-sec-sip-tls-main', 'eric-sec-key-management-main', 'eric-data-distributed-coordinator-ed'])
