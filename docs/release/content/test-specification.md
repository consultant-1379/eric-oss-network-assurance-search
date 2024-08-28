# Test specification

## Test levels

Describe the materialization and the test terminology of the test levels in this project at high level.

### Unit testing

A unit test exercises the smallest piece of testable software in the application to determine
whether it behaves as expected. Unit tests are typically written at the class level or around a
small group of related classes. Finally the most important in this level, the unit under test is
isolated from its collaborators.

For the frontend part this project has web component based EUISDK components as units. Every UI component
and panels are tested as a `@eui/lit-component` unit. On the other hand the UI project has a utility
layer where a relevant part of the business logic can be found. These util javascript modules
contain pure logic without any UI visualization. These are tested per class as a unit.

For the backend part this project has service classes and a kind of static functions without state
as units.

Unit tests are executed during the precodereview (and the drop) pipeline execution for each commit
patchset (and merge).

The used test frameworks/tools to create & run & report tests and results are the followings at this
level:

- `mocha`: Mocha is a feature-rich JavaScript test framework running on Node.js and in the browser,
  making asynchronous testing simple and fun.
- `chai`: Chai is an assertion library, similar to Node's built-in assert.
- `sinon`: Standalone test spies, stubs and mocks for JavaScript.
- `mochawesome`: Mochawesome is a custom reporter for use with the JavaScript testing framework, mocha.

### Component testing

Unit testing alone doesn't provide guarantees about the behaviour of the system. Up till now we have
good coverage of each of the core modules of the system in isolation. However, there is no coverage
of those modules when they work together. To verify that each module correctly interacts with its
collaborators, more coarse grained testing is required and this is the relevant test level what is
called as component testing in this project.

- `pact`: Used for backend consumer contract testing
- `mocha`: Mocha is a feature-rich JavaScript test framework running on Node.js and in the browser,
  making asynchronous testing simple and fun.
- `chai`: Chai is an assertion library, similar to Node's built-in assert.
- `playwright`: To be scheduled

### Integration testing

An integration test verifies the communication paths and interactions between components to detect interface defects.
These tests collect modules together and test them as a subsystem in order to verify that they collaborate as intended
to achieve some larger piece of behaviour.

For the backend in this project this means communication with the discovered APIs and the Kubernetes
API to achieve the required business logic. On the other hand it means communication towards the
generic ADP services too.

For the frontend this means in the Kubernetes cluster it can work together with the backend and the
authentication and authorization generic service as well.

This type of testing is currently done manually by the development team using the environments which we have access to.

## All functional test categories

Describe the test materialization of the functional requirements in high level. High level means
that all requirements are categorized and the following chapters describes the "how is it tested" to
all category. These categories can be called test conditions if you would like to follow the istqb
definitions.

Unit test level is used in all cases, so it is not highlighted every time.

### All UI features testing

Current status: tested

There are several UI features. On the other hand they are tested in the same way in high level,
so this chapter aggregates them.

#### Description

| Feature | Description |
| ------- | ----------- |
| View KPIs in a Table | Users can explore most recent KPI rollups for combinations of network characteristics in a table|
| View KPIs for different computation contexts | Users can explore different KPI rollup scopes in Context tabs|
| Filter KPIs in a Table | Users can create and manage complex filters to explore KPI data in a Context table|
| View a history of values for a KPI in a chart format | Users can select a result in the table to view the Historical Dashboard - visualizes the KPI status over time|
| Contextually link to a tab with preapplied filters | Users can share or bookmark their current Context tab with any applied filters they might have configured |
| Customizable context tabs | Users can configure aspects of the Context tab with a name of their choosing, filters, and table settings to their preference|
| Locally persisted application state | The users Service Assurance Dashboard customizations will be stored in the browser local storage for next visit as long as the customized Context tab is still open in the Service Assurance Dashboard|

#### Test instructions

Every UI component - what are introduced to achieve the above features - are tested individually in
unit testing and together at component level as it described above in the Test levels chapter. At
component level the mock data contains more products and more applications per products.

At integration level this type of testing is currently done manually by the development team using the environments which we have access to.

### mTLS feature testing

Current status: manually tested

#### Description

Mutual TLS is an encrypted authentication and authorization protocol in machine-to-machine
communication. This kind of communication should be configurable in two dimension. One dimension is
whether the TLS is on or off, and the other one is the client certificate is validated or not in
case of the TLS is on.

The Network Assurance Search service communicates with the ingress controller, Assurance Indexer,
and ADP Search Engine. All communications towards the target services are configurable only in one
dimension (mtls or not).

In these communications the backend service should provide the correct client certificate or
validate the consumer service client certificate.

### Authentication and authorization feature testing

Current status: manually tested

#### Description

In this feature the microservice shall handle login/logout and RBAC (role based access control)
towards the protected endpoints and the single page application URL too.

## All non-functional test categories

Describe the test materialization of the non-functional requirements in high level. High level means
that every technical scopes, relevant rules and frameworks are defined to all category.

### Install test and upgrade testing

Test implementation status: Tested.

Install test means a clean install of the service, where all of the resources are deployed as a
first time.
Upgrade test means an upgrade from the previous release version to the actual drop version.

The install and the upgrade test is created with the test.py from the ADP `bob-py3kubehelmbuilder`
enabler tool in the precodereview and the drop pipelines. The upgrade and the installation tested
with the delivered values.yaml default configuration. Test validates the followings:

- Helm chart can be deployed without any error.
- The service liveness and readiness state is good.

This service is stateless, so most of the case the upgrade could not be a problem, but it should be
tested because if there are any not handled non-backward compatible changes in the service
configmap, then the rolling upgrade can be stuck.

## Rollback testing

Test implementation status: not implemented.

Rollback is a required process in case the current state of the Deployment is not stable due to the
application code or the configuration. In this case the customer can undo the actual release or can
rollback to one of the previous revision.

This microservice is stateless currently, but a rollback could be a problem because of the configmap
changes between two version.

To test a rollback the best procedure is to call `helm rollback` from the actual drop version to the
latest release. The test validates the success state of the rollback. If the rollback can done
without any issues then it means the service can handle the configmap invalid state to the actual version.

## Scaling testing

Test implementation status: tested.

Kubernetes provides manual and auto scaling, but this service currently supports only the
manual scaling.

During a scaling test the service can be scaled in and out to achieve the desired number of
replicas. At the end of the process all of the pods shall be in ready state.

This kind of test is [provided][1] in the ADP staging.

### Load testing

Test implementation status: not implemented.

Load testing is the simplest form of performance testing. A load test is usually conducted to
understand the behaviour of the system under a specific expected load.

In case of this project this load is the expected concurrent number of users on the application
performing a specific number of transactions within the set duration. This test will give out the
response times of all the important business critical transactions. The service is monitored during
the test, this will assist in identifying bottlenecks.

The load test driver for this project is the [k6 tool](https://k6.io/).

It is tested in a kubernetes in an environment with mock stub services, because the discovered
services should not affect the results. Scenario is the following (VU means virtual user):

1. rumps up to 30 VUs during 1m then
2. up to 100 VUs during 2m, then
3. stay on 100 VUs during 1m, then
4. down to 0 VUs during 2m

The measured response times and memory and cpu usage are saved and checked between all drops to
raise error in case of an unexpected peak after a wrong implementation.

### Robustness & Resiliency testing

Test implementation status: tested

Robustness is the ability of a system to cope with errors during execution and cope with erroneous
input.
Resilience is the ability to provide and maintain an acceptable level of service in the face of
faults and challenges to normal operation.

These kind of testing can be performed at component testing level with the best precision, because
all kind of network errors and configuration errors can be emulated best on that level.

On the other hand this kind of tests are provided in the ADP staging as well as a [minimal][1] with
[pod management][2]:

- Robustness: single service instance failure test
- Resilience: all instance failure at the same time for the service

### Stability testing

Test implementation status: on-going in adp staging and adp never down staging.

Stability Testing is the process for determining whether the service is able to keep the liveness
status and there is no any restart during a long period. During this period the environment should
be changed sometimes and the service endpoints polled periodically.

In case of this service the best environment changes to deploy or replace the actual discovered
services with new ones.

On the other hand testing the service above more environments can be called stability testing too
and this is fulfilled in the ADP staging, because every service tested above KaaS, NFVI, EKS.

The ADP [never down staging][2] seems to be a correct stability testing environment, because the
deployed service never deleted, just upgraded in that environment.

[1]: https://adpci.sero.wh.rnd.internal.ericsson.com/site/test_specs/Adp_Test_Specification.html
[2]: https://confluence.lmera.ericsson.se/display/ACD/ADP+Staging+Test+Scope
