#! /bin/sh

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:4::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "4", "vd_qos_PartialDRBAccessibility": 139.798219, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001038", "fk_end_timestamp": "1717001173"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:4::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "4", "vd_qos_DLLat_gNB_DU": 96.979815, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001038", "fk_end_timestamp": "1717001173"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:4::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "4", "vd_qos_DLDelay_GnbDu": 258.844525, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001038", "fk_end_timestamp": "1717001173"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:4::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "4", "vd_qos_DlUeThroughput": 253.591529, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001038", "fk_end_timestamp": "1717001173"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:3::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "3", "vd_qos_PartialDRBAccessibility": 346.187072, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001028", "fk_end_timestamp": "1717001165"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:3::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "3", "vd_qos_DLLat_gNB_DU": 344.396463, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001028", "fk_end_timestamp": "1717001165"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:3::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "3", "vd_qos_DLDelay_GnbDu": 475.822646, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001028", "fk_end_timestamp": "1717001165"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:3::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "3", "vd_qos_DlUeThroughput": 329.901568, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001028", "fk_end_timestamp": "1717001165"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:74::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "74", "vd_qos_PartialDRBAccessibility": 366.437502, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001058", "fk_end_timestamp": "1717001148"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:74::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "74", "vd_qos_DLLat_gNB_DU": 325.028202, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001058", "fk_end_timestamp": "1717001148"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:74::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "74", "vd_qos_DLDelay_GnbDu": 288.62819, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001058", "fk_end_timestamp": "1717001148"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:74::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "74", "vd_qos_DlUeThroughput": 125.343205, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001058", "fk_end_timestamp": "1717001148"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:72::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "72", "vd_qos_PartialDRBAccessibility": 72.157383, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001151", "fk_end_timestamp": "1717001295"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:72::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "72", "vd_qos_DLLat_gNB_DU": 315.921983, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001151", "fk_end_timestamp": "1717001295"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:72::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "72", "vd_qos_DLDelay_GnbDu": 298.576948, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001151", "fk_end_timestamp": "1717001295"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:72::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "72", "vd_qos_DlUeThroughput": 353.927925, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001151", "fk_end_timestamp": "1717001295"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:83::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "83", "vd_qos_PartialDRBAccessibility": 239.240505, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001140", "fk_end_timestamp": "1717001250"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:83::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "83", "vd_qos_DLLat_gNB_DU": 105.116491, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001140", "fk_end_timestamp": "1717001250"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:83::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "83", "vd_qos_DLDelay_GnbDu": 60.592533, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001140", "fk_end_timestamp": "1717001250"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:83::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "83", "vd_qos_DlUeThroughput": 351.189922, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001140", "fk_end_timestamp": "1717001250"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:69::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "69", "vd_qos_PartialDRBAccessibility": 285.563029, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001216"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:69::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "69", "vd_qos_DLLat_gNB_DU": 222.623768, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001216"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:69::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "69", "vd_qos_DLDelay_GnbDu": 62.889208, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001216"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:69::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "69", "vd_qos_DlUeThroughput": 258.924867, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001216"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:72::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "72", "vd_qos_PartialDRBAccessibility": 208.58627, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001245"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:72::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "72", "vd_qos_DLLat_gNB_DU": 313.627673, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001245"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:72::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "72", "vd_qos_DLDelay_GnbDu": 243.123472, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001245"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:72::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "72", "vd_qos_DlUeThroughput": 453.308176, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001245"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:8::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "8", "vd_qos_PartialDRBAccessibility": 328.267059, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001190", "fk_end_timestamp": "1717001272"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:8::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "8", "vd_qos_DLLat_gNB_DU": 300.850347, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001190", "fk_end_timestamp": "1717001272"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:8::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "8", "vd_qos_DLDelay_GnbDu": 457.464868, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001190", "fk_end_timestamp": "1717001272"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:8::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "8", "vd_qos_DlUeThroughput": 112.551306, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001190", "fk_end_timestamp": "1717001272"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:5::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "5", "vd_qos_PartialDRBAccessibility": 458.390983, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001245", "fk_end_timestamp": "1717001340"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:5::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "5", "vd_qos_DLLat_gNB_DU": 431.850101, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001245", "fk_end_timestamp": "1717001340"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:5::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "5", "vd_qos_DLDelay_GnbDu": 247.073283, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001245", "fk_end_timestamp": "1717001340"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:5::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "5", "vd_qos_DlUeThroughput": 262.163646, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001245", "fk_end_timestamp": "1717001340"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:8::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "8", "vd_qos_PartialDRBAccessibility": 164.587895, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001314"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:8::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "8", "vd_qos_DLLat_gNB_DU": 269.847977, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001314"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:8::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "8", "vd_qos_DLDelay_GnbDu": 212.303048, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001314"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:8::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "8", "vd_qos_DlUeThroughput": 486.516954, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001314"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:8::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "8", "vd_qos_PartialDRBAccessibility": 266.92052, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001351"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:8::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "8", "vd_qos_DLLat_gNB_DU": 491.023545, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001351"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:8::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "8", "vd_qos_DLDelay_GnbDu": 7.692603, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001351"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:8::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "8", "vd_qos_DlUeThroughput": 316.621538, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001351"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:73::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "73", "vd_qos_PartialDRBAccessibility": 468.626242, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001312", "fk_end_timestamp": "1717001427"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:73::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "73", "vd_qos_DLLat_gNB_DU": 375.620302, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001312", "fk_end_timestamp": "1717001427"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:73::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "73", "vd_qos_DLDelay_GnbDu": 409.470039, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001312", "fk_end_timestamp": "1717001427"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:73::"}}
{ "full_context": "qos", "context": [ "qos" ], "c_qos": "73", "vd_qos_DlUeThroughput": 297.765425, "csac_table": "kpi_csac_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001312", "fk_end_timestamp": "1717001427"}
'

