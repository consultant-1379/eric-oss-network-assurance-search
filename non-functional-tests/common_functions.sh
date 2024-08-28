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

SECONDS=0
NEW_INSTALL=100
FILE_DATE_SUFFIX=`date +%Y.%m.%d.%H.%M.%S`

# Define variables
SIGNUM=${SIGNUM:-}
ENCRYPTED_PASSWORD=${ENCRYPTED_PASSWORD:-}
REUSE_NAMESPACE=${REUSE_NAMESPACE:-}
NAMESPACE=${NAMESPACE:-}
INSTALL_CHART_VERSION=${INSTALL_CHART_VERSION:-}
DELETE_NS=${DELETE_NS:-}
UPGRADE_CHART_VERSION=${UPGRADE_CHART_VERSION:-}
DOCKER_VERSION=${DOCKER_VERSION:-}

create_log_file() {
  local LOG_FILE="./logs/log_$FILE_DATE_SUFFIX.log"
  exec 1> >(tee $LOG_FILE) 2>&1
}

create_results_file() {
  echo "Creating results file..."
  RESULTS_FILE="./results/results_$FILE_DATE_SUFFIX.txt"
  touch $RESULTS_FILE
}

print_var() {
  echo "Printing user input..."
  echo "SIGNUM: $SIGNUM"
  echo "REUSE_NAMESPACE: $REUSE_NAMESPACE"
  echo "NAMESPACE: $NAMESPACE"
  echo "INSTALL_CHART_VERSION: $INSTALL_CHART_VERSION"
  echo "DELETE_NS: $DELETE_NS"
  echo "UPGRADE_CHART_VERSION: $UPGRADE_CHART_VERSION"
  echo "DOCKER_VERSION: $DOCKER_VERSION"
}

create_namespace () {
  if [[ "$REUSE_NAMESPACE" == "y" ]] || [[ "$REUSE_NAMESPACE" == "Y" ]]
  then
    echo "Using existing namespace $NAMESPACE"
  else
    echo "Creating namespace $NAMESPACE..."
    kubectl create namespace $NAMESPACE
  fi
}

setup () {
  echo "Installing $SERVICE_NAME... "
  create_namespace
  create_secrets
  install_service
}

teardown () {
  uninstall_services
  delete_secrets
}

delete_namespace() {
  #Delete namespace based on input
  if [[ "$DELETE_NS" == "y" ]] || [[ "$DELETE_NS" == "Y" ]]
  then
    echo "Deleting namespace $NAMESPACE..."
    kubectl delete ns $NAMESPACE
  fi
}

#Checks for pod ready status to be 'true' to ensure pod is ready and running
is_service_ready () {
  local IS_READY_START_TIME=$SECONDS
  local IS_READY_TIME_DIFF=0
  local IS_READY="false"

  #While loop runs until pod is Ready or timeout
  while [[ $IS_READY == "false" ]] && [[ $IS_READY_TIME_DIFF -le $POD_READY_TIMEOUT_SEC ]]
  do
    sleep 10
    IS_READY=$(kubectl get pod $POD_NAME -o jsonpath='{.status.containerStatuses[0].ready}' --namespace=$NAMESPACE)
    echo "ready status: $IS_READY"
    if [[ $IS_READY == "true" ]]; then
      echo "$SERVICE_NAME pod is ready"
      return 0
    fi

    echo "Waiting for $SERVICE_NAME to be ready..."
    IS_READY_TIME_DIFF=$(($SECONDS - $IS_READY_START_TIME))
    echo "time diff : $IS_READY_TIME_DIFF"
  done

  return 1

}

get_pod_names() {
  POD_NAMES=($(kubectl get pods --namespace $NAMESPACE -l $POD_SELECTOR -o name | grep "pod/$DEPLOYMENT_NAME.*" | sed "s/pod\/\($DEPLOYMENT_NAME.*\)/\1/g"))
}

get_pod_names_by_status() {
  local TARGET_STATUS
  # If status is not passed as argument, using the default value of "Running"
  if [[ $# -eq 0 ]]; then
    TARGET_STATUS="Running"
  else
    TARGET_STATUS=$1
  fi

  # Getting all pod names
  get_pod_names

  local MATCHED_PODS=()
  # Checking status of each pod
  for i in "${POD_NAMES[@]}"
  do
    read -r NAME READY STATUS RESTARTS AGE < <(kubectl get pods --namespace $NAMESPACE | grep "$i")
    if [[ "$STATUS" == "$TARGET_STATUS" ]]; then
      # Adding pod name to the array
      MATCHED_PODS+=($NAME)
    fi
  done

  # Storing matched pod names in the global variable
  POD_NAMES=("${MATCHED_PODS[@]}")
}

get_deployment_readiness_details() {
  read -r NAME READY UP_TO_DATE AVAILABLE AGE < <(kubectl get deployments --namespace $NAMESPACE | grep "$DEPLOYMENT_NAME")
  echo "NUMBER_OF_READY_PODS=$AVAILABLE; NUMBER_OF_TOTAL_PODS=$UP_TO_DATE"
}

wait_for_all_pods_to_start() {
  echo "Waiting for pods to start..."
  get_pod_names
  for i in "${POD_NAMES[@]}"
  do
    echo "Waiting for pod $i to be ready..."
    wait_for_service_to_run $i
    local POD_STARTED="$?"
    if [[ $POD_STARTED -eq 1 ]]; then
      # Pod did not start successfully
      return 1
    fi
  done

  # All pods started successfully
  return 0
}

wait_for_all_pods_to_terminate() {
  echo "Waiting for pods to terminate..."
  local TIMEOUT=180
  local TIME_DIFF=0
  get_pod_names_by_status "Terminating"
  while [[ ${#POD_NAMES[@]} != 0 ]]
  do
    sleep 10
    get_pod_names_by_status "Terminating"
    echo "Number of terminating pods: ${#POD_NAMES[@]}"

    TIME_DIFF=$((TIME_DIFF+10))
    if [[ $TIME_DIFF -ge $TIMEOUT ]]; then
      return 1
    fi
  done

  # All pods terminated successfully
  return 0
}

service_is_scaled() {
  # Getting the deployment details
  eval $(get_deployment_readiness_details)
  echo "NUMBER_OF_READY_PODS=$NUMBER_OF_READY_PODS"
  echo "NUMBER_OF_TOTAL_PODS=$NUMBER_OF_TOTAL_PODS"

  # If the number of ready pods equals the number of total pods,
  # the scaling has succeeded. If not, the scaling has failed.
  if [[ $NUMBER_OF_READY_PODS == $NUMBER_OF_TOTAL_PODS ]]; then
    # Scaling successful
    return 0
  else
    # Scaling unsuccessful
    return 1
  fi
}

scale_in() {
  local NUMBER_OF_REPLICAS
  # If number of replicas is not passed as argument, using the default value of 1 replica
  if [[ $# -eq 0 ]]; then
    NUMBER_OF_REPLICAS=1
  else
    NUMBER_OF_REPLICAS=$1
  fi

  echo "Scaling to $NUMBER_OF_REPLICAS replicas"
  kubectl scale deployment $DEPLOYMENT_NAME --replicas=$NUMBER_OF_REPLICAS --namespace=$NAMESPACE

  wait_for_all_pods_to_terminate
  local PODS_TERMINATED="$?"
  if [[ $PODS_TERMINATED -eq 1 ]]; then
    # Pods did not terminate successfully
    return 1
  fi

  # Verifying that the service has scaled succesfully
  if service_is_scaled; then
    # Scale in succeeded
    return 0
  fi

  # Scale in failed
  return 1
}

scale_out() {
  local NUMBER_OF_REPLICAS
  # If number of replicas is not passed as argument, using the default value of 1 replica
  if [[ $# -eq 0 ]]; then
    NUMBER_OF_REPLICAS=3
  else
    NUMBER_OF_REPLICAS=$1
  fi

  echo "Scaling to $NUMBER_OF_REPLICAS replicas"
  kubectl scale deployment $DEPLOYMENT_NAME --replicas=$NUMBER_OF_REPLICAS --namespace=$NAMESPACE

  # Waiting for scaling to complete
  wait_for_all_pods_to_start
  local PODS_STARTED="$?"
  if [[ $PODS_STARTED -eq 1 ]]; then
    # Pods did not start successfully
    return 1
  fi

  # Verifying that the service has scaled succesfully
  if service_is_scaled; then
    # Scale out succeeded
    return 0
  fi

  # Scale out failed
  return 1
}

run_scaling_tests() {
  setup

  # === Scale Out Tests ===
  echo "*************************************"
  echo "            scale-out                "
  echo "*************************************"
  local SCALE_OUT_RESULT

  # Scaling out to 3 replicas
  scale_out 3
  local SUCCESS="$?"
  if [[ $SUCCESS -eq 1 ]]; then
    SCALE_OUT_RESULT="FAILED"
  fi

  # Scaling out to 4 replicas
  scale_out 4
  SUCCESS="$?"
  if [[ $SUCCESS -eq 1 ]]; then
    SCALE_OUT_RESULT="FAILED"
  fi

  # Scaling out to 7 replicas
  scale_out 7
  SUCCESS="$?"
  if [[ $SUCCESS -eq 1 ]]; then
    SCALE_OUT_RESULT="FAILED"
  fi

  if [[ $SCALE_OUT_RESULT == "FAILED" ]]; then
    echo "*************************************"
    echo "       scale-out test FAILED         "
    echo "*************************************"
    echo "scale-in test SKIPPED"
    echo "Scale-in test is dependent on scale-out test setup. Since scale-out test failed, skipping scale-in test..."
    echo "Fix scale-out issue to run scale-in test..."
    echo "scale_out: FAILED" | tee -a $RESULTS_FILE
    echo "scale_in: SKIPPED" | tee -a $RESULTS_FILE
    teardown
    return
  fi

  echo "*************************************"
  echo "       scale-out test PASSED         "
  echo "*************************************"
  echo "scale_out: PASSED" | tee -a $RESULTS_FILE

  # === Scale In Tests ===
  echo "*************************************"
  echo "            scale-in                 "
  echo "*************************************"
  local SCALE_IN_RESULT="PASSED"

  # Scaling down to 6 replicas
  scale_in 6
  SUCCESS="$?"
  if [[ $SUCCESS -eq 1 ]]; then
    SCALE_IN_RESULT="FAILED"
  fi

  # Scaling down to 5 replicas
  scale_in 5
  SUCCESS="$?"
  if [[ $SUCCESS -eq 1 ]]; then
    SCALE_IN_RESULT="FAILED"
  fi

  # Scaling down to 1 replica
  scale_in 1
  SUCCESS="$?"
  if [[ $SUCCESS -eq 1 ]]; then
    SCALE_IN_RESULT="FAILED"
  fi

  echo "*************************************"
  echo "       scale-in test $SCALE_IN_RESULT         "
  echo "*************************************"
  echo "scale_in: $SCALE_IN_RESULT" | tee -a $RESULTS_FILE

  teardown
}

sigterm_n_liveness_readiness () {
  echo "*************************************"
  echo "        SIGTERM and SIGKILL         "
  echo "*************************************"

  setup

  # Scaling service to 1 replica
  scale_in 1
  local SUCCESS="$?"
  if [[ $SUCCESS -eq 1 ]]; then
    SIGTERM_RESULT="FAILED"
  fi

  wait_for_service_to_run
  local SERVICE_INSTALL_STATUS_BEFORE_DELETE="$?"

  local POD_NAME_BEFORE_DELETE=$(get_pod_name)

  # Use this deployment to check liveness and readiness
  liveness_readiness_test

  echo "Terminating pod $POD_NAME_BEFORE_DELETE"
  kubectl delete pod $POD_NAME_BEFORE_DELETE --namespace=$NAMESPACE

  # Waiting for pod to terminate
  echo "Waiting for pod to terminate..."
  get_pod_names_by_status "Terminating"
  while [[ ${#POD_NAMES[@]} != 0 ]]
  do
    sleep 10
    get_pod_names_by_status "Terminating"
    echo "Number of terminating pods: ${#POD_NAMES[@]}"
  done

  local POD_NAME_AFTER_DELETE=$(get_pod_name)

  wait_for_service_to_run
  local POD_INSTALL_TYPE="$?"

  local SIGTERM_RESULT
  if [[ $POD_NAME_BEFORE_DELETE != $POD_NAME_AFTER_DELETE ]]
  then
    SIGTERM_RESULT="PASSED"
    echo "$SERVICE_NAME pod terminated and restarted successfully."
  else
    SIGTERM_RESULT="FAILED"
    echo "$SERVICE_NAME pod terminated but did not restart successfully."
  fi

  echo "*************************************"
  echo "     SIGTERM and SIGKILL $SIGTERM_RESULT    "
  echo "*************************************"
  echo "sigterm_sigkill: $SIGTERM_RESULT"  | tee -a $RESULTS_FILE

  teardown
}

move_btw_workers () {
  echo "*************************************"
  echo "        Move between workers         "
  echo "*************************************"

  setup
  wait_for_service_to_run

  # Scaling service to 1 replica for simplicity
  scale_in 1

  local POD_NAME_BEFORE_MOVE=$(get_pod_name)
  local POD_NODE_BEFORE_MOVE=$(kubectl get pod $POD_NAME_BEFORE_MOVE -o jsonpath='{.spec.nodeName}' --namespace=$NAMESPACE)

  local TARGET_NODE=$(kubectl get node -o "jsonpath={.items[0].metadata.name}" --namespace=$NAMESPACE)

  if [[ $TARGET_NODE == $POD_NODE_BEFORE_MOVE ]]
  then
    TARGET_NODE=$(kubectl get node -o "jsonpath={.items[1].metadata.name}" --namespace=$NAMESPACE)
  fi

  echo "Moving $SERVICE_NAME pod from worker node $POD_NODE_BEFORE_MOVE to $TARGET_NODE"

  local PATCH_STRING='{"spec": {"template": {"spec": {"nodeSelector": {"kubernetes.io/hostname":"target_node"}}}}}'
  local PATCH_COMMAND=$(echo kubectl patch deployment $DEPLOYMENT_NAME --namespace=$NAMESPACE --patch \'$(echo ${PATCH_STRING/target_node/$TARGET_NODE})\')
  eval $PATCH_COMMAND

  echo "Moved $SERVICE_NAME pod from worker node $POD_NODE_BEFORE_MOVE to $TARGET_NODE"

  local POD1=$(get_pod_name)
  local POD2=$(get_second_pod_name)

  if [[ $POD1 == $POD_NAME_BEFORE_MOVE ]]
  then
    POD_NAME_AFTER_MOVE=$POD2
  else
    POD_NAME_AFTER_MOVE=$POD1
  fi

  wait_for_service_to_run $POD_NAME_AFTER_MOVE

  local POD_NODE_AFTER_MOVE=$(kubectl get pod $POD_NAME_AFTER_MOVE -o jsonpath='{.spec.nodeName}' --namespace=$NAMESPACE)

  local RESULT
  if [[ $TARGET_NODE == $POD_NODE_AFTER_MOVE ]]
  then
    echo "$SERVICE_NAME pod successfully moved between worker nodes: $POD_NODE_BEFORE_MOVE to $TARGET_NODE"
    RESULT="PASSED"
  else
    echo "$SERVICE_NAME pod failed to move between worker nodes: $POD_NODE_BEFORE_MOVE to $TARGET_NODE"
    RESULT="FAILED"
  fi

  echo "*************************************"
  echo "     Move between workers $RESULT     "
  echo "*************************************"
  echo "move_btw_workers: $RESULT" | tee -a $RESULTS_FILE

  teardown
}

restart() {
  # Getting the pod names before restart
  get_pod_names
  local POD_NAMES_BEFORE_RESTART=("${POD_NAMES[@]}")

  # Deleting all pods
  kubectl delete pod ${POD_NAMES[*]} --namespace=$NAMESPACE

  # Wait for all pods to terminate
  wait_for_all_pods_to_terminate
  local PODS_TERMINATED="$?"
  if [[ $PODS_TERMINATED -eq 1 ]]; then
    # Pods did not start successfully
    return 1
  fi

  # Waiting for all new pods to start
  wait_for_all_pods_to_start
  local PODS_STARTED="$?"
  if [[ $PODS_STARTED -eq 1 ]]; then
    # Pods did not start successfully
    return 1
  fi

  # Getting the pod names after restart
  get_pod_names
  local POD_NAMES_AFTER_RESTART=("${POD_NAMES[@]}")

  # Checking if the pod names after restart are different than the ones before restart
  for i in "${POD_NAMES_AFTER_RESTART[@]}"
  do
    if [[ " ${POD_NAMES_BEFORE_RESTART[*]} " =~ [[:space:]]${i}[[:space:]] ]]; then
      # A pod did not restart
      return 1
    fi
  done

  # Restart successful
  return 0
}

run_restart_test() {
  echo "All instances of $SERVICE_NAME service restart simultaneously -> service should come back again without any problem."
  echo "*************************************"
  echo "           Restart             "
  echo "*************************************"

  local RESULT="PASSED"

  # Install service
  setup

  # Wait for all pods to be ready
  wait_for_all_pods_to_start
  local PODS_STARTED="$?"
  if [[ $PODS_STARTED -eq 1 ]]; then
    # Pods did not start successfully
    RESULT="FAILED"
  fi

  # Restarting service pods
  restart
  local SUCCESS="$?"
  if [[ $SUCCESS -eq 1 ]]; then
    RESULT="FAILED"
  fi

  if [[ $RESULT == "PASSED" ]]; then
    echo "All instances of $SERVICE_NAME service restart simultaneously -> service comes back again without any problem."
  else
    echo "All instances of $SERVICE_NAME service restart simultaneously -> service does not come back properly."
  fi

  echo "*************************************"
  echo "        Restart $RESULT         "
  echo "*************************************"
  echo "restart: $RESULT" | tee -a $RESULTS_FILE

  teardown
}

metrics_and_resources () {
  echo "**************************************************"
  echo "  Calculating $SERVICE_NAME metrics and resources "
  echo "**************************************************"
  setup
  wait_for_service_to_run
  local INSTALL_STATUS="$?"

  if [[ $INSTALL_STATUS -eq 0 ]]
  then
    echo "$SERVICE_NAME installation failed."
    echo "*********************************************************"
    echo " Calculating $SERVICE_NAME metrics and resources FAILED "
    echo "*********************************************************"

    teardown
    return
  fi

  get_service_metrics

  #Memory and CPU usage
  local MEMORY_N_CPU=$(kubectl top pod -l $POD_SELECTOR --namespace=$NAMESPACE)
  local MEMORY=$(echo $MEMORY_N_CPU | awk '{print $NF}')
  local CPU=$(echo $MEMORY_N_CPU | awk '{print $(NF-1)}')

  echo "*******Microservice memory and CPU footprint********"
  echo
  echo "memory: $MEMORY" | tee -a $RESULTS_FILE
  echo "cpu: $CPU" | tee -a $RESULTS_FILE
  echo

  #Docker image size
  docker login -u $SIGNUM -p $SELI_ARTIFACTORY_REPO_PASS $DOCKER_RESPOSITORY
  docker pull $DOCKER_RESPOSITORY/$DEPLOYMENT_NAME:$DOCKER_VERSION
  sleep 30 # wait for the docker image to be pulled
  local IMAGE_SIZE=$(docker image ls | grep "$DOCKER_VERSION" | awk '{print $NF}')

  echo "*******Docker Image Size and details********"
  echo
  echo "image_size: $IMAGE_SIZE" | tee -a $RESULTS_FILE
  echo

 teardown
}

restart_upgrade_rollback_time () {
  #New Install
  setup
  wait_for_all_pods_to_start

  # Restart
  RESTART_START_TIME=$SECONDS
  echo "restart start time : $RESTART_START_TIME"
  restart
  RESTART_END_TIME=$SECONDS
  echo "restart end time : $RESTART_END_TIME"

  local RESTART_TIME=$(($RESTART_END_TIME-$RESTART_START_TIME))
  echo "restart_time: $RESTART_TIME" | tee -a $RESULTS_FILE
  echo "*******$SERVICE_NAME restart time********"
  echo
  echo $RESTART_TIME
  echo

  #Upgrade
  get_pod_names
  POD_NAMES_BEFORE_UPGRADE=("${POD_NAMES[@]}")

  UPGRADE_START_TIME=$SECONDS
  echo "upgrade start time : $UPGRADE_START_TIME"
  upgrade_service

  get_pod_names
  POD_NAMES_AFTER_UPGRADE=("${POD_NAMES[@]}")

  # Waiting for the upgraded pods to start
  for POD_NAME in "${POD_NAMES_AFTER_UPGRADE[@]}"
  do
    if [[ ! " ${POD_NAMES_BEFORE_UPGRADE[*]} " =~ [[:space:]]${POD_NAME}[[:space:]] ]]; then
      # Pod name is new, therefore it must be an upgraded pod
      wait_for_service_to_run $POD_NAME
    fi
  done

  UPGRADE_END_TIME=$SECONDS
  echo "upgrade end time : $UPGRADE_END_TIME"

  local UPGRADE_TIME=$(($UPGRADE_END_TIME-$UPGRADE_START_TIME))

  echo "upgrade_time: $UPGRADE_TIME" | tee -a $RESULTS_FILE
  echo "*******$SERVICE_NAME upgrade time********"
  echo
  echo  $UPGRADE_TIME
  echo

  #Rollback
  get_pod_names
  POD_NAMES_BEFORE_ROLLBACK=("${POD_NAMES[@]}")

  ROLLBACK_START_TIME=$SECONDS
  echo "rollback start time : $ROLLBACK_START_TIME"
  helm rollback $SERVICE_HELM_CHART_NAME 1 --namespace $NAMESPACE

  get_pod_names
  POD_NAMES_AFTER_ROLLBACK=("${POD_NAMES[@]}")

  # Waiting for the upgraded pods to start
  for POD_NAME in "${POD_NAMES_AFTER_ROLLBACK[@]}"
  do
    if [[ ! " ${POD_NAMES_BEFORE_ROLLBACK[*]} " =~ [[:space:]]${POD_NAME}[[:space:]] ]]; then
      # Pod name is new, therefore it must be an upgraded pod
      wait_for_service_to_run $POD_NAME
    fi
  done

  ROLLBACK_END_TIME=$SECONDS
  echo "rollback end time : $ROLLBACK_END_TIME"

  local ROLLBACK_TIME=$(($ROLLBACK_END_TIME-$ROLLBACK_START_TIME))

  echo "rollback_time: $ROLLBACK_TIME" | tee -a $RESULTS_FILE
  echo -e "*******$SERVICE_NAME rollback time********"
  echo -e $ROLLBACK_TIME

  teardown
}

#Gets service pod name. If there are multiple instances(pods) of a service then this function returns first pod in 'kubectl get pods' response
get_pod_name () {
  local POD_NAME=$(kubectl get pods --namespace $NAMESPACE -l $POD_SELECTOR -o name | grep "pod/$DEPLOYMENT_NAME.*" | sed -n 1p | cut -c 5-)
  echo $POD_NAME
}

#If there are multiple instances(pods) of a service then this function returns second pod in 'kubectl get pods' response
get_second_pod_name () {
  local POD_NAME=$(kubectl get pods --namespace $NAMESPACE -l $POD_SELECTOR -o name | grep "pod/$DEPLOYMENT_NAME.*" | sed -n 2p | cut -c 5-)
  echo $POD_NAME
}

run_non_functional_tests () {
  # Create file with timestamp
  print_var
  create_results_file

  echo "Starting non_functional tests..."

  echo "=============================" | tee -a $RESULTS_FILE
  echo "=== characteristics tests ===" | tee -a $RESULTS_FILE
  echo "=============================" | tee -a $RESULTS_FILE
  metrics_and_resources
  restart_upgrade_rollback_time

  echo "" | tee -a $RESULTS_FILE
  echo "============================" | tee -a $RESULTS_FILE
  echo "===== deployment tests =====" | tee -a $RESULTS_FILE
  echo "============================" | tee -a $RESULTS_FILE
  run_scaling_tests

  echo "" | tee -a $RESULTS_FILE
  echo "============================" | tee -a $RESULTS_FILE
  echo "===== robustness tests =====" | tee -a $RESULTS_FILE
  echo "============================" | tee -a $RESULTS_FILE
  sigterm_n_liveness_readiness
  move_btw_workers
  run_restart_test
}

# Function to prompt for user input if variable is not set
prompt_input() {
  local var_name=$1
  local prompt_message=$2
  if [[ -z "${!var_name}" ]]
  then
    echo -n "$prompt_message"
    read -r "${var_name?}"
  fi
}

# Function to handle installation
handle_install() {
  prompt_input SIGNUM "Enter SIGNUM: "

  if [ -z "${SELI_ARTIFACTORY_REPO_PASS}" ]; then
    SELI_ARTIFACTORY_REPO_PASS=$(
      curl -s -u "$SIGNUM" https://arm.seli.gic.ericsson.se/artifactory/api/security/encryptedPassword
    )
  fi

  if [ -z "${SERO_ARTIFACTORY_REPO_PASS}" ]; then
    SERO_ARTIFACTORY_REPO_PASS=$(
      curl -s -u "$SIGNUM" https://arm.sero.gic.ericsson.se/artifactory/api/security/encryptedPassword
    )
  fi

  prompt_input REUSE_NAMESPACE "Do you want to use existing namespace (y/n): "
  prompt_input NAMESPACE "Enter namespace: "
  prompt_input INSTALL_CHART_VERSION "Enter $SERVICE_NAME helm chart version: "
}

# Function to handle uninstallation
handle_uninstall() {
  prompt_input NAMESPACE "Enter namespace: "
  prompt_input DELETE_NS "Do you want to delete namespace (y/n): "
  teardown
  delete_namespace
}

# Function to handle running tests
handle_run_tests() {
  handle_install
  prompt_input UPGRADE_CHART_VERSION "Enter $SERVICE_NAME helm chart version for upgrade: "
  prompt_input DOCKER_VERSION "Docker image tag: "
  prompt_input DELETE_NS "Do you want to delete namespace after tests executed (y/n): "
  run_non_functional_tests
  delete_namespace
}

# Function to display help information
display_help() {
  cat <<-EOF
**************************************************************************************
$SCRIPT_NAME is a utility to setup an ESOA service on k8s cluster and run manual tests.
**************************************************************************************
Usage: $SCRIPT_NAME [-i] [-u] [-r] [-h]

Options:
  -i : Installs the $SERVICE_NAME
  -u : Uninstalls the $SERVICE_NAME
  -r : Installs the $SERVICE_NAME and runs manual tests
  -h : Displays help information

EOF
}

# Main function to handle script options
main() {
  set_service_variables
  create_log_file

  while getopts 'iurh' OPTION; do
    case "$OPTION" in
      i) handle_install && setup ;;
      u) handle_uninstall ;;
      r) handle_run_tests ;;
      h) display_help; exit 0 ;;
      ?) display_help; exit 1 ;;
    esac
  done

  [[ $OPTION == 'i' || $OPTION == 'u' || $OPTION == 'r' ]] && echo "***Script took $SECONDS seconds to complete.***"
}

# Run the main function
main "$@"
