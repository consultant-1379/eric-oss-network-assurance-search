# Automated script to run NAS non-functional tests

## Introduction

- `non-functional-tests` directory contains two scripts `common_functions.sh` and `run_non_functional_tests.sh`
- `common_functions.sh` contains the core functionality required to run the non-functional tests.
- `run_non_functional_tests.sh` contains the service specific code.
- This document lists out the automated test cases, pre-requisites, clone and own process, supported functionality of this script and instructions
on how to use `run_non_functional_tests.sh` script.

## Automated test cases

1. Characteristics
    1. Startup time (to fully ready)
    2. Restart time (to fully ready)
    3. Upgrade time (to fully ready)
    4. Rollback time (to fully ready)
    5. Image Size
    6. Microservice memory footprint required
    7. Microservice CPU footprint required
    8. Service metrics exposure
2. Deployment
    1. Scale-out
    2. Scale-in
3. Robustness
    1. Service restart: All instances of a given service restart simultaneously -> The service should come back again without problem.
    2. Liveness and Readiness probes test
    3. SIGTERM and SIGKILL handling
    4. Move between workers

## Prerequisites

The list below contains the prerequisites to run this script:

1. Helm
2. kubectl
3. Docker (the Docker daemon should be up and running)

## Supported functionality

1. Install - Installs the NAS
2. Uninstall - Uninstalls the NAS
3. Run tests - Installs the NAS and runs all non-functional tests.

> Test results are written to `results_<timestamp>.txt` files within the `non-functional-tests/results` directory. Test logs are written
> to `log_<timestamp>.txt` files within the `non-functional-tests/logs` directory.

## Running the script

The script takes one of these options `-i`, `-u`, `-r`, `-h`

### Usage

1. To install the NAS

    ```bash
    ./run_non_functional_tests.sh -i
    ```

    Running this command prompts for following info

    example:

    ```text
    Enter SIGNUM: signum
    Enter host password for user 'signum':
    Enter email: your.email@ericsson.com
    Do you want to use existing namespace (y/n): n
    Enter namespace: corvus-signum
    Enter NAS helm chart version: 1.243.0-1
    ```

2. To uninstall the NAS

    ```bash
    ./run_non_functional_tests.sh -u
    ```

    Running this command prompts for following info

    example:

    ```text
    Enter namespace: corvus-signum
    Do you want to delete namespace(y/n): y
    ```

3. To install the NAS and run all non-functional tests

    ```bash
    ./run_non_functional_tests.sh -r
    ```

    Running this command prompts for following info

    example:

    ```text
    Enter SIGNUM: signum
    Enter host password for user 'signum':
    Enter email: your.email@ericsson.com
    Do you want to use existing namespace (y/n): n
    Enter namespace: corvus-signum
    Enter the NAS helm chart version: 1.243.0-1
    Enter the NAS helm chart version for upgrade: 1.244.0-1
    Docker image tag: 1.243.0-1
    Do you want to delete namespace after tests executed (y/n): y
    ```

4. To display help information

```text
./run_non_functional_tests.sh -h
```

Running this command will display below info

```text

**************************************************************************************
run_non_functional_tests.sh is a utility to setup an ESOA service on k8s cluster and run manual tests.
**************************************************************************************
Usage: run_non_functional_tests.sh [-i] [-u] [-r] [-h]

Options:
  -i : Installs the NAS
  -u : Uninstalls the NAS
  -r : Installs the NAS and runs manual tests
  -h : Displays help information
```

> Note: This script must be run from within the `non_functional_tests` directory.
