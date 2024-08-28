#! /bin/sh

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:905::qos:1::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "1", "c_tac": "905", "vd_nssi_qos_tac_PartialDRBAccessibility": 305.999755, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001078"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:905::qos:1::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "1", "c_tac": "905", "vd_nssi_qos_tac_DLLat_gNB_DU": 370.59861, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001078"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:905::qos:1::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "1", "c_tac": "905", "vd_nssi_qos_tac_DLDelay_GnbDu": 303.844936, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001078"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:905::qos:1::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "1", "c_tac": "905", "vd_nssi_qos_tac_DlUeThroughput": 110.984556, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001078"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:289::qos:83::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "83", "c_tac": "289", "vd_nssi_qos_tac_PartialDRBAccessibility": 496.787772, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001024", "fk_end_timestamp": "1717001163"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:289::qos:83::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "83", "c_tac": "289", "vd_nssi_qos_tac_DLLat_gNB_DU": 399.99986, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001024", "fk_end_timestamp": "1717001163"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:289::qos:83::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "83", "c_tac": "289", "vd_nssi_qos_tac_DLDelay_GnbDu": 404.979559, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001024", "fk_end_timestamp": "1717001163"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:289::qos:83::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "83", "c_tac": "289", "vd_nssi_qos_tac_DlUeThroughput": 121.153481, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001024", "fk_end_timestamp": "1717001163"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:647::qos:79::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "79", "c_tac": "647", "vd_nssi_qos_tac_PartialDRBAccessibility": 235.283586, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001063", "fk_end_timestamp": "1717001222"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:647::qos:79::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "79", "c_tac": "647", "vd_nssi_qos_tac_DLLat_gNB_DU": 235.211273, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001063", "fk_end_timestamp": "1717001222"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:647::qos:79::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "79", "c_tac": "647", "vd_nssi_qos_tac_DLDelay_GnbDu": 373.869106, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001063", "fk_end_timestamp": "1717001222"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:647::qos:79::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "79", "c_tac": "647", "vd_nssi_qos_tac_DlUeThroughput": 168.831917, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001063", "fk_end_timestamp": "1717001222"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:613::qos:82::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "82", "c_tac": "613", "vd_nssi_qos_tac_PartialDRBAccessibility": 385.234943, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001125", "fk_end_timestamp": "1717001251"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:613::qos:82::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "82", "c_tac": "613", "vd_nssi_qos_tac_DLLat_gNB_DU": 206.972765, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001125", "fk_end_timestamp": "1717001251"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:613::qos:82::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "82", "c_tac": "613", "vd_nssi_qos_tac_DLDelay_GnbDu": 364.99621, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001125", "fk_end_timestamp": "1717001251"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:613::qos:82::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "82", "c_tac": "613", "vd_nssi_qos_tac_DlUeThroughput": 234.512602, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001125", "fk_end_timestamp": "1717001251"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:753::qos:79::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "79", "c_tac": "753", "vd_nssi_qos_tac_PartialDRBAccessibility": 201.24158, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001206"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:753::qos:79::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "79", "c_tac": "753", "vd_nssi_qos_tac_DLLat_gNB_DU": 329.641713, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001206"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:753::qos:79::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "79", "c_tac": "753", "vd_nssi_qos_tac_DLDelay_GnbDu": 391.129491, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001206"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:753::qos:79::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "79", "c_tac": "753", "vd_nssi_qos_tac_DlUeThroughput": 373.341593, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001206"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:807::qos:71::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "71", "c_tac": "807", "vd_nssi_qos_tac_PartialDRBAccessibility": 468.735487, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001347"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:807::qos:71::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "71", "c_tac": "807", "vd_nssi_qos_tac_DLLat_gNB_DU": 223.795442, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001347"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:807::qos:71::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "71", "c_tac": "807", "vd_nssi_qos_tac_DLDelay_GnbDu": 222.249045, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001347"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:807::qos:71::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "71", "c_tac": "807", "vd_nssi_qos_tac_DlUeThroughput": 71.862152, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001347"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:548::qos:82::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "82", "c_tac": "548", "vd_nssi_qos_tac_PartialDRBAccessibility": 40.75566, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001236", "fk_end_timestamp": "1717001339"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:548::qos:82::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "82", "c_tac": "548", "vd_nssi_qos_tac_DLLat_gNB_DU": 64.482517, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001236", "fk_end_timestamp": "1717001339"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:548::qos:82::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "82", "c_tac": "548", "vd_nssi_qos_tac_DLDelay_GnbDu": 263.469483, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001236", "fk_end_timestamp": "1717001339"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:548::qos:82::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "82", "c_tac": "548", "vd_nssi_qos_tac_DlUeThroughput": 457.749824, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001236", "fk_end_timestamp": "1717001339"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:705::qos:74::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "74", "c_tac": "705", "vd_nssi_qos_tac_PartialDRBAccessibility": 488.679581, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001436"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:705::qos:74::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "74", "c_tac": "705", "vd_nssi_qos_tac_DLLat_gNB_DU": 348.793108, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001436"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:705::qos:74::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "74", "c_tac": "705", "vd_nssi_qos_tac_DLDelay_GnbDu": 97.757602, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001436"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:705::qos:74::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos_tac", "context": [ "nssi", "qos", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "74", "c_tac": "705", "vd_nssi_qos_tac_DlUeThroughput": 420.41949, "csac_table": "kpi_csac_nssi_qos_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001436"}
'

