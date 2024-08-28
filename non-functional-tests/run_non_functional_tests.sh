#!/bin/bash
#
# COPYRIGHT Ericsson 2023
#
# The copyright to the computer program(s) herein is the property of
# Ericsson Inc. The programs may be used and/or copied only with written
# permission from Ericsson Inc. or in accordance with the terms and
# conditions stipulated in the agreement/contract under which the
# program(s) have been supplied.
#

#Sets service specific variables which will be used in master script.
set_service_variables () {
  SERVICE_NAME="Network Assurance Search" #Used in log statements in master script.
  SERVICE_HELM_CHART_NAME="eric-oss-network-assurance-search" #Used as helm chart name in service script and master script.
  SERVICE_PORT_NUMBER=3000
  DEPLOYMENT_NAME="eric-oss-network-assurance-search" #Used in various commands in master script like 1.deployment scaling, 2.patch, 3.pulling docker image, 4.finding NAS pod name.
  POD_SELECTOR="app.kubernetes.io/name=eric-oss-network-assurance-search" #Used in master script to find NAS pod.
  DOCKER_RESPOSITORY="armdocker.rnd.ericsson.se/proj-eric-oss-drop" #Used in master script to load nas docker image
  HELM_REPOSITORY="https://arm.seli.gic.ericsson.se/artifactory/proj-eric-oss-drop-helm/eric-oss-network-assurance-search/"
  POD_READY_TIMEOUT_SEC=120 #This should be equal to the initialDelaySeconds configured for any service. This is used to check if the POD comes to Running state within this period.
  SCRIPT_NAME="run_non_functional_tests" #This string is used in master script for help text.
}

#Install all secrets required for NAS deployment
create_secrets () {
  echo "Creating secrets..."

  #create secret to pull docker images from armdocker
  kubectl create secret docker-registry armdocker \
    --docker-server=armdocker.rnd.ericsson.se \
    --docker-username=$SIGNUM \
    --docker-password=$SELI_ARTIFACTORY_REPO_PASS \
    --namespace=$NAMESPACE

  #create secret to pull docker images from serodocker
  kubectl create secret docker-registry serodocker \
    --docker-server=serodocker.sero.gic.ericsson.se \
    --docker-username=$SIGNUM \
    --docker-password=$SERO_ARTIFACTORY_REPO_PASS \
    --namespace=$NAMESPACE
}

#Installs NAS service
install_service () {
  helm install $SERVICE_HELM_CHART_NAME \
    "$HELM_REPOSITORY/$DEPLOYMENT_NAME-$INSTALL_CHART_VERSION.tgz" \
    --set global.pullSecret=armdocker \
    --set global.security.tls.enabled=false \
    --set log.streamingMethod=indirect \
    --namespace $NAMESPACE \
    --username=$SIGNUM \
    --password=$SELI_ARTIFACTORY_REPO_PASS
}

#Upgrade NAS service
upgrade_service () {
  helm upgrade $SERVICE_HELM_CHART_NAME \
    "$HELM_REPOSITORY/$DEPLOYMENT_NAME-$UPGRADE_CHART_VERSION.tgz" \
    --set global.pullSecret=armdocker \
    --set global.security.tls.enabled=false \
    --set log.streamingMethod=indirect \
    --namespace $NAMESPACE \
    --username=$SIGNUM \
    --password=$SELI_ARTIFACTORY_REPO_PASS
}

#Uninstall the NAS
uninstall_services () {
  echo "Uninstalling services..."
  helm uninstall $SERVICE_HELM_CHART_NAME --namespace $NAMESPACE
}

#Delete secrets
delete_secrets () {
  echo "Deleting secrets..."
  kubectl delete secret armdocker serodocker --namespace=$NAMESPACE
}

#Checks if NAS is up and running by checking logs.
#Returns 100 for successful new install
#Returns 101 for successful re-install. This code identifies upgraded pod/new pod created after deleting existing pod/scaled out pod/pod moved to new node.
#The test conditions checks for this code 101 to ensure the pod did not attempt to perform actions specific to new install (re-provisioning resources.)
#Returns 1 for failed NAS deployment.
wait_for_service_to_run () {
  local POD_NAME
  local DEPLOYMENT="fail"
  local RETURN_CODE
  local DEPLOYMENT_START_TIME=$SECONDS
  local DEPLOYMENT_TIME_DIFF=0

  #If pod name is not passed as argument get pod name else use the pod name provided as argument.
  if [[ $# -eq 0 ]]; then
    POD_NAME=$(kubectl get pod -l "$POD_SELECTOR" -o jsonpath="{.items[0].metadata.name}" --namespace=$NAMESPACE)
  else
    POD_NAME=$1
  fi

  echo "Checking status of pod: $POD_NAME"

  #Checks logs for successful provisioning or no resources change text.
  #While loop runs until text found or timeout(3min)
  while [[ $DEPLOYMENT == "fail" ]] && [[ $DEPLOYMENT_TIME_DIFF -le 180 ]]
  do
    sleep 10

    kubectl logs $POD_NAME --namespace=$NAMESPACE | fgrep "Listening on port 3000"
    NAS_LISTENING_STATUS_CODE="$?"
    if [[ $NAS_LISTENING_STATUS_CODE -eq 0 ]]; then
      echo "NAS install deployment is successful"
      echo "NAS is up and running."
      DEPLOYMENT="success"
      RETURN_CODE=$NEW_INSTALL
      break
    fi

    echo "Waiting for NAS to start..."

    DEPLOYMENT_TIME_DIFF=$(($SECONDS - $DEPLOYMENT_START_TIME))
  done

  if [[ $DEPLOYMENT == "fail" ]]; then
    echo "NAS deployment failed."
    return 1
  fi

  #Waits for the pod to be ready and running
  is_service_ready
  local IS_READY="$?"

  if [[ $IS_READY -eq 1 ]]; then
    echo "NAS deployment failed."
    return 1
  fi

  return $RETURN_CODE
}

# Each service have different liveness and readiness criteria. So this is service specific code.
liveness_readiness_test () {
  local POD_NAME=$(get_pod_name)
  wait_for_service_to_run $POD_NAME
  local SERVICE_STATUS="$?"

  kubectl describe pod $POD_NAME --namespace=$NAMESPACE | fgrep "Liveness:   http-get"
  local IS_LIVENESS_CONFIGURED="$?"
  kubectl describe pod $POD_NAME --namespace=$NAMESPACE | fgrep "Readiness:  http-get"
  local IS_READINESS_CONFIGURED="$?"

  local LIVENESS_READINESS_RESULT
  if [[ $IS_LIVENESS_CONFIGURED -eq 0 ]] && [[ $IS_READINESS_CONFIGURED -eq 0 ]] && [[ $SERVICE_STATUS -ne 1 ]]
  then
    LIVENESS_READINESS_RESULT="PASSED"
    echo "Successful initialization of NAS Microservice is considered as the criteria for Liveness and Readiness for NAS deployment."
  else
    LIVENESS_READINESS_RESULT="FAILED"
  fi

  echo "*************************************"
  echo "   LIVENESS and READINESS $LIVENESS_READINESS_RESULT     "
  echo "*************************************"
  echo "liveness_readiness: $LIVENESS_READINESS_RESULT"  | tee -a $RESULTS_FILE
}

get_service_metrics () {
  # List of the expected metrics to be exposed
  UNDERSCORED_SERVICE_NAME=$(echo "$SERVICE_HELM_CHART_NAME" | sed -r "s/-/_/g")
  EXPECTED_METRICS=(
    "${UNDERSCORED_SERVICE_NAME}_process_cpu_user_seconds_total"
    "${UNDERSCORED_SERVICE_NAME}_process_cpu_system_seconds_total"
    "${UNDERSCORED_SERVICE_NAME}_process_cpu_seconds_total"
    "${UNDERSCORED_SERVICE_NAME}_process_start_time_seconds"
    "${UNDERSCORED_SERVICE_NAME}_process_resident_memory_bytes"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_eventloop_lag_seconds"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_eventloop_lag_min_seconds"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_eventloop_lag_max_seconds"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_eventloop_lag_mean_seconds"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_eventloop_lag_stddev_seconds"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_eventloop_lag_p50_seconds"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_eventloop_lag_p90_seconds"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_eventloop_lag_p99_seconds"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_active_handles"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_active_handles_total"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_active_requests"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_active_requests_total"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_heap_size_total_bytes"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_heap_size_used_bytes"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_external_memory_bytes"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_heap_space_size_total_bytes"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_heap_space_size_used_bytes"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_heap_space_size_available_bytes"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_version_info"
    "${UNDERSCORED_SERVICE_NAME}_nodejs_gc_duration_seconds"
    "${UNDERSCORED_SERVICE_NAME}_http_request_duration_seconds"
  )

  # port-forward $SERVICE_PORT_NUMBER port to NAS pod to get metrics from actuator endpoint
  local POD_NAME=$(get_pod_name)
  echo "port-forwarding $SERVICE_PORT_NUMBER port..."
  kubectl port-forward $POD_NAME --namespace=$NAMESPACE $SERVICE_PORT_NUMBER:$SERVICE_PORT_NUMBER &
  local PID="$!"
  sleep 20 #Needed this delay because sometimes the curl command is attempted before the port-forwarding and causing failures.
  local METRICS=$(curl -s http://localhost:$SERVICE_PORT_NUMBER/metrics)

  echo "*************************************"
  echo "    Service Metrics Exposure Test    "
  echo "*************************************"
  for EXPECTED_METRIC in ${EXPECTED_METRICS[@]}; do
    # Looking for the expected metric with a value
    EXPOSED_METRIC=$(echo "$METRICS" | grep "$EXPECTED_METRIC{" | sed -r "s/${UNDERSCORED_SERVICE_NAME}_//g" | sed -e 's/{.*}//' | awk '{print $1": " $2}')

    # Checking if the expected metric with a value was not found
    if [ -z "$EXPOSED_METRIC" ]
    then
      # The expected metric with a value was not found but it's possible that the metric
      # is still being exposed but it does not currently have a value
      # Looking for the expected metric without a value
      EXPOSED_METRIC=$(echo "$METRICS" | grep "$EXPECTED_METRIC " | sed -r "s/${UNDERSCORED_SERVICE_NAME}_//g" | sed -e 's/{.*}//' | awk '{print $3": NA"}')
    fi

    # Checking if the expected metric (with or without a value) was not found
    if [ -z "$EXPOSED_METRIC" ]
    then
      # Metrics exposure test failed
      echo "**************************************"
      echo " Service Metrics Exposure Test FAILED "
      echo "**************************************"
      echo "Not all expected metrics are being exposed"
      echo "$EXPECTED_METRIC is missing"
      echo "metrics_exposure: FAILED" | tee -a $RESULTS_FILE
      # Killing the port-forwarding process
      kill $PID
      return 1
    else
      # Converting $EXPOSED_METRIC string into an array
      EXPOSED_METRIC_ARRAY=($EXPOSED_METRIC)
      echo -e "${EXPOSED_METRIC_ARRAY[0]} ${EXPOSED_METRIC_ARRAY[1]}" | tee -a $RESULTS_FILE
    fi
  done

  echo "**************************************"
  echo " Service Metrics Exposure Test PASSED "
  echo "**************************************"
  echo "metrics_exposure: PASSED" | tee -a $RESULTS_FILE

  # Killing the port-forwarding process
  kill $PID
  return 0
}

source common_functions.sh