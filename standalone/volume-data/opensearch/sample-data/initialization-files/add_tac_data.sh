#! /bin/sh

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:807::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "807", "vd_tac_PartialDRBAccessibility": 281.455541, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001017", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:807::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "807", "vd_tac_DLLat_gNB_DU": 221.802188, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001017", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:807::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "807", "vd_tac_DLDelay_GnbDu": 88.520935, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001017", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:807::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "807", "vd_tac_DlUeThroughput": 218.216033, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001017", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:807::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "807", "vd_tac_UlUeThroughput": 223.360372, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001017", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:807::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "807", "vd_tac_GRANGOSR": 417.400457, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001017", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:807::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "807", "vd_tac_5GSEPHOSR": 459.933376, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001017", "fk_end_timestamp": "1717001178"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:365::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "365", "vd_tac_PartialDRBAccessibility": 318.846243, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001048", "fk_end_timestamp": "1717001175"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:365::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "365", "vd_tac_DLLat_gNB_DU": 312.687472, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001048", "fk_end_timestamp": "1717001175"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:365::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "365", "vd_tac_DLDelay_GnbDu": 142.265138, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001048", "fk_end_timestamp": "1717001175"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:365::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "365", "vd_tac_DlUeThroughput": 223.991484, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001048", "fk_end_timestamp": "1717001175"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:365::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "365", "vd_tac_UlUeThroughput": 266.848819, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001048", "fk_end_timestamp": "1717001175"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:365::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "365", "vd_tac_GRANGOSR": 162.920017, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001048", "fk_end_timestamp": "1717001175"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:365::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "365", "vd_tac_5GSEPHOSR": 316.274739, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001048", "fk_end_timestamp": "1717001175"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:416::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "416", "vd_tac_PartialDRBAccessibility": 33.516082, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001133", "fk_end_timestamp": "1717001155"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:416::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "416", "vd_tac_DLLat_gNB_DU": 380.767279, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001133", "fk_end_timestamp": "1717001155"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:416::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "416", "vd_tac_DLDelay_GnbDu": 388.159752, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001133", "fk_end_timestamp": "1717001155"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:416::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "416", "vd_tac_DlUeThroughput": 308.958089, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001133", "fk_end_timestamp": "1717001155"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:416::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "416", "vd_tac_UlUeThroughput": 341.085669, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001133", "fk_end_timestamp": "1717001155"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:416::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "416", "vd_tac_GRANGOSR": 154.626903, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001133", "fk_end_timestamp": "1717001155"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:416::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "416", "vd_tac_5GSEPHOSR": 221.729324, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001133", "fk_end_timestamp": "1717001155"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:343::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "343", "vd_tac_PartialDRBAccessibility": 364.188021, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001180", "fk_end_timestamp": "1717001310"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:343::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "343", "vd_tac_DLLat_gNB_DU": 226.458184, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001180", "fk_end_timestamp": "1717001310"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:343::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "343", "vd_tac_DLDelay_GnbDu": 17.81869, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001180", "fk_end_timestamp": "1717001310"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:343::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "343", "vd_tac_DlUeThroughput": 463.32071, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001180", "fk_end_timestamp": "1717001310"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:343::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "343", "vd_tac_UlUeThroughput": 477.002509, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001180", "fk_end_timestamp": "1717001310"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:343::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "343", "vd_tac_GRANGOSR": 162.780464, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001180", "fk_end_timestamp": "1717001310"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:343::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "343", "vd_tac_5GSEPHOSR": 356.62688, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001180", "fk_end_timestamp": "1717001310"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:753::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "753", "vd_tac_PartialDRBAccessibility": 371.845851, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001176", "fk_end_timestamp": "1717001276"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:753::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "753", "vd_tac_DLLat_gNB_DU": 381.538616, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001176", "fk_end_timestamp": "1717001276"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:753::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "753", "vd_tac_DLDelay_GnbDu": 250.45358, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001176", "fk_end_timestamp": "1717001276"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:753::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "753", "vd_tac_DlUeThroughput": 302.590611, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001176", "fk_end_timestamp": "1717001276"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:753::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "753", "vd_tac_UlUeThroughput": 18.885978, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001176", "fk_end_timestamp": "1717001276"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:753::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "753", "vd_tac_GRANGOSR": 38.75946, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001176", "fk_end_timestamp": "1717001276"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:753::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "753", "vd_tac_5GSEPHOSR": 200.04236, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001176", "fk_end_timestamp": "1717001276"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:416::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "416", "vd_tac_PartialDRBAccessibility": 315.823986, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001311"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:416::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "416", "vd_tac_DLLat_gNB_DU": 109.869072, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001311"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:416::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "416", "vd_tac_DLDelay_GnbDu": 421.533689, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001311"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:416::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "416", "vd_tac_DlUeThroughput": 139.148109, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001311"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:416::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "416", "vd_tac_UlUeThroughput": 317.373032, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001311"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:416::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "416", "vd_tac_GRANGOSR": 484.189338, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001311"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:416::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "416", "vd_tac_5GSEPHOSR": 122.648377, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001311"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:343::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "343", "vd_tac_PartialDRBAccessibility": 245.006014, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001225", "fk_end_timestamp": "1717001266"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:343::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "343", "vd_tac_DLLat_gNB_DU": 105.089372, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001225", "fk_end_timestamp": "1717001266"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:343::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "343", "vd_tac_DLDelay_GnbDu": 90.077162, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001225", "fk_end_timestamp": "1717001266"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:343::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "343", "vd_tac_DlUeThroughput": 293.980716, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001225", "fk_end_timestamp": "1717001266"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:343::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "343", "vd_tac_UlUeThroughput": 229.007424, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001225", "fk_end_timestamp": "1717001266"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:343::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "343", "vd_tac_GRANGOSR": 464.336311, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001225", "fk_end_timestamp": "1717001266"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:343::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "343", "vd_tac_5GSEPHOSR": 323.627106, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001225", "fk_end_timestamp": "1717001266"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:613::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "613", "vd_tac_PartialDRBAccessibility": 115.549128, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001232", "fk_end_timestamp": "1717001398"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:613::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "613", "vd_tac_DLLat_gNB_DU": 174.945877, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001232", "fk_end_timestamp": "1717001398"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:613::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "613", "vd_tac_DLDelay_GnbDu": 262.478493, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001232", "fk_end_timestamp": "1717001398"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:613::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "613", "vd_tac_DlUeThroughput": 28.833505, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001232", "fk_end_timestamp": "1717001398"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:613::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "613", "vd_tac_UlUeThroughput": 268.868242, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001232", "fk_end_timestamp": "1717001398"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:613::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "613", "vd_tac_GRANGOSR": 248.651447, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001232", "fk_end_timestamp": "1717001398"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:613::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "613", "vd_tac_5GSEPHOSR": 258.091208, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001232", "fk_end_timestamp": "1717001398"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:613::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "613", "vd_tac_PartialDRBAccessibility": 170.671624, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001305", "fk_end_timestamp": "1717001454"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:613::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "613", "vd_tac_DLLat_gNB_DU": 200.972336, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001305", "fk_end_timestamp": "1717001454"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:613::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "613", "vd_tac_DLDelay_GnbDu": 64.96679, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001305", "fk_end_timestamp": "1717001454"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:613::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "613", "vd_tac_DlUeThroughput": 376.66808, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001305", "fk_end_timestamp": "1717001454"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:613::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "613", "vd_tac_UlUeThroughput": 80.549608, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001305", "fk_end_timestamp": "1717001454"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:613::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "613", "vd_tac_GRANGOSR": 7.514842, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001305", "fk_end_timestamp": "1717001454"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:613::"}}
{ "full_context": "tac", "context": [ "tac" ], "c_tac": "613", "vd_tac_5GSEPHOSR": 193.815007, "csac_table": "kpi_csac_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001305", "fk_end_timestamp": "1717001454"}
'

