#! /bin/sh

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_PartialDRBAccessibility": 476.318603, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001010", "fk_end_timestamp": "1717001106"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_DLLat_gNB_DU": 86.040161, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001010", "fk_end_timestamp": "1717001106"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_DLDelay_GnbDu": 381.147372, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001010", "fk_end_timestamp": "1717001106"}
{"index":{"_index":"soa","_id":"DlUeThroughput@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_DlUeThroughput": 16.831818, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001010", "fk_end_timestamp": "1717001106"}
{"index":{"_index":"soa","_id":"UlUeThroughput@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_UlUeThroughput": 173.943157, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001010", "fk_end_timestamp": "1717001106"}
{"index":{"_index":"soa","_id":"GRANGOSR@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_GRANGOSR": 358.164461, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001010", "fk_end_timestamp": "1717001106"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_5GSEPHOSR": 281.056583, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001010", "fk_end_timestamp": "1717001106"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_PartialDRBAccessibility": 161.352954, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001156"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_DLLat_gNB_DU": 87.197673, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001156"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_DLDelay_GnbDu": 259.242164, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001156"}
{"index":{"_index":"soa","_id":"DlUeThroughput@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_DlUeThroughput": 280.446502, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001156"}
{"index":{"_index":"soa","_id":"UlUeThroughput@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_UlUeThroughput": 253.237374, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001156"}
{"index":{"_index":"soa","_id":"GRANGOSR@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_GRANGOSR": 261.168634, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001156"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_5GSEPHOSR": 50.234669, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001156"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@managedElement:me-3-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-3-id", "vd_managedElement_PartialDRBAccessibility": 207.547156, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001100", "fk_end_timestamp": "1717001211"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@managedElement:me-3-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-3-id", "vd_managedElement_DLLat_gNB_DU": 71.335267, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001100", "fk_end_timestamp": "1717001211"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@managedElement:me-3-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-3-id", "vd_managedElement_DLDelay_GnbDu": 475.781527, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001100", "fk_end_timestamp": "1717001211"}
{"index":{"_index":"soa","_id":"DlUeThroughput@managedElement:me-3-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-3-id", "vd_managedElement_DlUeThroughput": 211.910376, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001100", "fk_end_timestamp": "1717001211"}
{"index":{"_index":"soa","_id":"UlUeThroughput@managedElement:me-3-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-3-id", "vd_managedElement_UlUeThroughput": 486.206057, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001100", "fk_end_timestamp": "1717001211"}
{"index":{"_index":"soa","_id":"GRANGOSR@managedElement:me-3-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-3-id", "vd_managedElement_GRANGOSR": 67.157291, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001100", "fk_end_timestamp": "1717001211"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@managedElement:me-3-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-3-id", "vd_managedElement_5GSEPHOSR": 242.11013, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001100", "fk_end_timestamp": "1717001211"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@managedElement:me-2-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-2-id", "vd_managedElement_PartialDRBAccessibility": 89.76701, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001134", "fk_end_timestamp": "1717001251"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@managedElement:me-2-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-2-id", "vd_managedElement_DLLat_gNB_DU": 214.63062, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001134", "fk_end_timestamp": "1717001251"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@managedElement:me-2-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-2-id", "vd_managedElement_DLDelay_GnbDu": 165.729377, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001134", "fk_end_timestamp": "1717001251"}
{"index":{"_index":"soa","_id":"DlUeThroughput@managedElement:me-2-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-2-id", "vd_managedElement_DlUeThroughput": 452.687274, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001134", "fk_end_timestamp": "1717001251"}
{"index":{"_index":"soa","_id":"UlUeThroughput@managedElement:me-2-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-2-id", "vd_managedElement_UlUeThroughput": 455.395115, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001134", "fk_end_timestamp": "1717001251"}
{"index":{"_index":"soa","_id":"GRANGOSR@managedElement:me-2-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-2-id", "vd_managedElement_GRANGOSR": 116.492186, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001134", "fk_end_timestamp": "1717001251"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@managedElement:me-2-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-2-id", "vd_managedElement_5GSEPHOSR": 316.469342, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001134", "fk_end_timestamp": "1717001251"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@managedElement:me-9-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-9-id", "vd_managedElement_PartialDRBAccessibility": 85.88434, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001129", "fk_end_timestamp": "1717001256"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@managedElement:me-9-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-9-id", "vd_managedElement_DLLat_gNB_DU": 170.536918, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001129", "fk_end_timestamp": "1717001256"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@managedElement:me-9-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-9-id", "vd_managedElement_DLDelay_GnbDu": 301.739278, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001129", "fk_end_timestamp": "1717001256"}
{"index":{"_index":"soa","_id":"DlUeThroughput@managedElement:me-9-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-9-id", "vd_managedElement_DlUeThroughput": 21.606098, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001129", "fk_end_timestamp": "1717001256"}
{"index":{"_index":"soa","_id":"UlUeThroughput@managedElement:me-9-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-9-id", "vd_managedElement_UlUeThroughput": 287.763598, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001129", "fk_end_timestamp": "1717001256"}
{"index":{"_index":"soa","_id":"GRANGOSR@managedElement:me-9-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-9-id", "vd_managedElement_GRANGOSR": 94.593019, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001129", "fk_end_timestamp": "1717001256"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@managedElement:me-9-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-9-id", "vd_managedElement_5GSEPHOSR": 205.370193, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001129", "fk_end_timestamp": "1717001256"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@managedElement:me-11-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-11-id", "vd_managedElement_PartialDRBAccessibility": 122.638604, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001139", "fk_end_timestamp": "1717001274"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@managedElement:me-11-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-11-id", "vd_managedElement_DLLat_gNB_DU": 349.690876, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001139", "fk_end_timestamp": "1717001274"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@managedElement:me-11-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-11-id", "vd_managedElement_DLDelay_GnbDu": 477.394788, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001139", "fk_end_timestamp": "1717001274"}
{"index":{"_index":"soa","_id":"DlUeThroughput@managedElement:me-11-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-11-id", "vd_managedElement_DlUeThroughput": 233.739174, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001139", "fk_end_timestamp": "1717001274"}
{"index":{"_index":"soa","_id":"UlUeThroughput@managedElement:me-11-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-11-id", "vd_managedElement_UlUeThroughput": 382.557061, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001139", "fk_end_timestamp": "1717001274"}
{"index":{"_index":"soa","_id":"GRANGOSR@managedElement:me-11-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-11-id", "vd_managedElement_GRANGOSR": 148.093193, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001139", "fk_end_timestamp": "1717001274"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@managedElement:me-11-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-11-id", "vd_managedElement_5GSEPHOSR": 224.737603, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001139", "fk_end_timestamp": "1717001274"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_PartialDRBAccessibility": 375.556668, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001216", "fk_end_timestamp": "1717001283"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_DLLat_gNB_DU": 304.141845, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001216", "fk_end_timestamp": "1717001283"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_DLDelay_GnbDu": 345.749108, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001216", "fk_end_timestamp": "1717001283"}
{"index":{"_index":"soa","_id":"DlUeThroughput@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_DlUeThroughput": 227.666078, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001216", "fk_end_timestamp": "1717001283"}
{"index":{"_index":"soa","_id":"UlUeThroughput@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_UlUeThroughput": 337.3979, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001216", "fk_end_timestamp": "1717001283"}
{"index":{"_index":"soa","_id":"GRANGOSR@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_GRANGOSR": 156.776415, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001216", "fk_end_timestamp": "1717001283"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@managedElement:me-8-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-8-id", "vd_managedElement_5GSEPHOSR": 359.366197, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001216", "fk_end_timestamp": "1717001283"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@managedElement:me-6-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-6-id", "vd_managedElement_PartialDRBAccessibility": 396.201763, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001181", "fk_end_timestamp": "1717001243"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@managedElement:me-6-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-6-id", "vd_managedElement_DLLat_gNB_DU": 183.31735, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001181", "fk_end_timestamp": "1717001243"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@managedElement:me-6-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-6-id", "vd_managedElement_DLDelay_GnbDu": 313.576862, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001181", "fk_end_timestamp": "1717001243"}
{"index":{"_index":"soa","_id":"DlUeThroughput@managedElement:me-6-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-6-id", "vd_managedElement_DlUeThroughput": 194.260475, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001181", "fk_end_timestamp": "1717001243"}
{"index":{"_index":"soa","_id":"UlUeThroughput@managedElement:me-6-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-6-id", "vd_managedElement_UlUeThroughput": 409.031703, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001181", "fk_end_timestamp": "1717001243"}
{"index":{"_index":"soa","_id":"GRANGOSR@managedElement:me-6-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-6-id", "vd_managedElement_GRANGOSR": 441.674293, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001181", "fk_end_timestamp": "1717001243"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@managedElement:me-6-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-6-id", "vd_managedElement_5GSEPHOSR": 267.050599, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001181", "fk_end_timestamp": "1717001243"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@managedElement:me-11-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-11-id", "vd_managedElement_PartialDRBAccessibility": 25.813852, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001236", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@managedElement:me-11-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-11-id", "vd_managedElement_DLLat_gNB_DU": 254.123205, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001236", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@managedElement:me-11-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-11-id", "vd_managedElement_DLDelay_GnbDu": 119.422085, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001236", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"DlUeThroughput@managedElement:me-11-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-11-id", "vd_managedElement_DlUeThroughput": 254.584155, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001236", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"UlUeThroughput@managedElement:me-11-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-11-id", "vd_managedElement_UlUeThroughput": 272.758201, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001236", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"GRANGOSR@managedElement:me-11-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-11-id", "vd_managedElement_GRANGOSR": 95.848473, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001236", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@managedElement:me-11-id::"}}
{ "full_context": "managedElement", "context": [ "managedElement" ], "c_managedElement": "me-11-id", "vd_managedElement_5GSEPHOSR": 399.945232, "csac_table": "kpi_csac_managedelement_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001236", "fk_end_timestamp": "1717001357"}
'

