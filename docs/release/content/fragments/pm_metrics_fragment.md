<!-- markdownlint-disable MD025 -->

|Metrics Name|Description|Type|Status|Category|Labels|
|:---|:---|:---|:---|:---|:---|
|eric_oss_help_aggregator_process_cpu_user_seconds_total|Total user CPU time spent in seconds.|counter|stable|Use|app|
|eric_oss_help_aggregator_process_cpu_system_seconds_total|Total system CPU time spent in seconds.|counter|stable|Use|app|
|eric_oss_help_aggregator_process_cpu_seconds_total|Total user and system CPU time spent in seconds.|counter|stable|Use|app|
|eric_oss_help_aggregator_process_start_time_seconds|Start time of the process since unix epoch in seconds.|gauge|stable|Use|app|
|eric_oss_help_aggregator_process_resident_memory_bytes|Resident memory size in bytes.|gauge|stable|Use|app|
|eric_oss_help_aggregator_process_virtual_memory_bytes|Virtual memory size in bytes.|gauge|stable|Use|app|
|eric_oss_help_aggregator_process_heap_bytes|Process heap size in bytes.|gauge|stable|Use|app|
|eric_oss_help_aggregator_process_open_fds|Number of open file descriptors.|gauge|stable|Use|app|
|eric_oss_help_aggregator_process_max_fds|Maximum number of open file descriptors.|gauge|stable|USe|app|
|eric_oss_help_aggregator_nodejs_eventloop_lag_seconds|Lag of event loop in seconds.|gauge|stable|uSe|app|
|eric_oss_help_aggregator_nodejs_eventloop_lag_min_seconds|The minimum recorded event loop delay.|gauge|stable|uSe|app|
|eric_oss_help_aggregator_nodejs_eventloop_lag_max_seconds|The maximum recorded event loop delay.|gauge|stable|uSe|app|
|eric_oss_help_aggregator_nodejs_eventloop_lag_mean_seconds|The mean of the recorded event loop delays.|gauge|stable|uSe|app|
|eric_oss_help_aggregator_nodejs_eventloop_lag_stddev_seconds|The standard deviation of the recorded event loop delays.|gauge|stable|uSe|app|
|eric_oss_help_aggregator_nodejs_eventloop_lag_p50_seconds|The 50th percentile of the recorded event loop delays.|gauge|stable|uSe|app|
|eric_oss_help_aggregator_nodejs_eventloop_lag_p90_seconds|The 90th percentile of the recorded event loop delays.|gauge|stable|uSe|app|
|eric_oss_help_aggregator_nodejs_eventloop_lag_p99_seconds|The 99th percentile of the recorded event loop delays.|gauge|stable|uSe|app|
|eric_oss_help_aggregator_nodejs_active_handles|Number of active libuv handles grouped by handle type. Every handle type is C++ class name.|gauge|stable|Use|type, app|
|eric_oss_help_aggregator_nodejs_active_handles_total|Total number of active handles.|gauge|stable|Use|app|
|eric_oss_help_aggregator_nodejs_active_requests|Number of active libuv requests grouped by request type. Every request type is C++ class name.|gauge|stable|Red||
|eric_oss_help_aggregator_nodejs_active_requests_total|Total number of active requests.|gauge|stable|Red|app|
|eric_oss_help_aggregator_nodejs_heap_size_total_bytes|Process heap size from Node.js in bytes.|gauge|stable|Use|app|
|eric_oss_help_aggregator_nodejs_heap_size_used_bytes|Process heap size used from Node.js in bytes.|gauge|stable|Use|app|
|eric_oss_help_aggregator_nodejs_external_memory_bytes|Node.js external memory size in bytes.|gauge|stable|uSe|app|
|eric_oss_help_aggregator_nodejs_heap_space_size_total_bytes|Process heap space size total from Node.js in bytes.|gauge|stable|Use|space, app|
|eric_oss_help_aggregator_nodejs_heap_space_size_used_bytes|Process heap space size used from Node.js in bytes.|gauge|stable|Use|space, app|
|eric_oss_help_aggregator_nodejs_heap_space_size_available_bytes|Process heap space size available from Node.js in bytes.|gauge|stable|Use|space, app|
|eric_oss_help_aggregator_nodejs_version_info|Node.js version info.|gauge|stable||version, major, minor, patch, app|
|eric_oss_help_aggregator_nodejs_gc_duration_seconds|Garbage collection duration by kind, one of major, minor, incremental or weakcb.|histogram|stable|USE|le, kind, app|
|eric_oss_help_aggregator_http_request_duration_seconds|duration histogram of http responses labeled with: status_code|histogram|stable|reD|le, status_code, app|
|eric_oss_help_aggregator_service_num|Total amount of Help Aggregator resources of service type|gauge|stable|Use|app|
|eric_oss_help_aggregator_pod_num|Total amount of Help Aggregator resources of pod type|gauge|stable|Use|app|
|eric_oss_help_aggregator_endpoint_num|Total amount of Help Aggregator resources of endpoint type|gauge|stable|Use|app|
|eric_oss_help_aggregator_ui_meta_v1_apps_http_requests_total|Amount of requests to the "/ui-meta/v1/apps" API|counter|stable|Red|protocol, endpoint, method, code, app|
|eric_oss_help_aggregator_ui_meta_v1_groups_http_requests_total|Amount of requests to the "/ui-meta/v1/groups" API|counter|stable|Red|protocol, endpoint, method, code, app|
|eric_oss_help_aggregator_ui_meta_v1_components_http_requests_total|Amount of requests to the "/ui-meta/v1/components" API|counter|stable|Red|protocol, endpoint, method, code, app|
|eric_oss_help_aggregator_ui_http_requests_total|Amount of requests to the "/ui" API|counter|stable|Red|protocol, endpoint, method, code, app|
|eric_oss_help_aggregator_ui_serve_v1_import_map_http_requests_total|Amount of requests to the "/ui-serve/v1/import-map" API|counter|stable|Red|protocol, endpoint, method, code, app|
|eric_oss_help_aggregator_ui_serve_v1_list_packages_http_requests_total|Amount of requests to the "/ui-serve/v1/list-packages" API|counter|stable|Red|protocol, endpoint, method, code, app|
