#! /bin/sh

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:807::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "807", "vd_nssi_tac_PartialDRBAccessibility": 313.436914, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717000986", "fk_end_timestamp": "1717001041"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:807::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "807", "vd_nssi_tac_DLLat_gNB_DU": 282.612821, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717000986", "fk_end_timestamp": "1717001041"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:807::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "807", "vd_nssi_tac_DLDelay_GnbDu": 278.374795, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717000986", "fk_end_timestamp": "1717001041"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:807::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "807", "vd_nssi_tac_DlUeThroughput": 386.536912, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717000986", "fk_end_timestamp": "1717001041"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:807::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "807", "vd_nssi_tac_UlUeThroughput": 124.254266, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717000986", "fk_end_timestamp": "1717001041"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:807::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "807", "vd_nssi_tac_GRANGOSR": 421.416372, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717000986", "fk_end_timestamp": "1717001041"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:807::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "807", "vd_nssi_tac_5GSEPHOSR": 11.954036, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717000986", "fk_end_timestamp": "1717001041"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:416::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "416", "vd_nssi_tac_PartialDRBAccessibility": 70.845558, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001079"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:416::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "416", "vd_nssi_tac_DLLat_gNB_DU": 94.162581, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001079"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:416::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "416", "vd_nssi_tac_DLDelay_GnbDu": 464.870095, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001079"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:416::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "416", "vd_nssi_tac_DlUeThroughput": 186.91332, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001079"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:416::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "416", "vd_nssi_tac_UlUeThroughput": 304.066631, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001079"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:416::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "416", "vd_nssi_tac_GRANGOSR": 345.472074, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001079"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:416::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "416", "vd_nssi_tac_5GSEPHOSR": 225.687244, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001079"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:226::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "226", "vd_nssi_tac_PartialDRBAccessibility": 404.658027, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001076", "fk_end_timestamp": "1717001131"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:226::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "226", "vd_nssi_tac_DLLat_gNB_DU": 276.333085, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001076", "fk_end_timestamp": "1717001131"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:226::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "226", "vd_nssi_tac_DLDelay_GnbDu": 431.554394, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001076", "fk_end_timestamp": "1717001131"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:226::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "226", "vd_nssi_tac_DlUeThroughput": 325.224926, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001076", "fk_end_timestamp": "1717001131"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:226::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "226", "vd_nssi_tac_UlUeThroughput": 498.976466, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001076", "fk_end_timestamp": "1717001131"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:226::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "226", "vd_nssi_tac_GRANGOSR": 74.822445, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001076", "fk_end_timestamp": "1717001131"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:226::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "226", "vd_nssi_tac_5GSEPHOSR": 388.378569, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001076", "fk_end_timestamp": "1717001131"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:289::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "289", "vd_nssi_tac_PartialDRBAccessibility": 38.491203, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001111", "fk_end_timestamp": "1717001165"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:289::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "289", "vd_nssi_tac_DLLat_gNB_DU": 170.728697, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001111", "fk_end_timestamp": "1717001165"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:289::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "289", "vd_nssi_tac_DLDelay_GnbDu": 295.461193, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001111", "fk_end_timestamp": "1717001165"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:289::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "289", "vd_nssi_tac_DlUeThroughput": 13.899785, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001111", "fk_end_timestamp": "1717001165"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:289::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "289", "vd_nssi_tac_UlUeThroughput": 433.537462, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001111", "fk_end_timestamp": "1717001165"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:289::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "289", "vd_nssi_tac_GRANGOSR": 342.526629, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001111", "fk_end_timestamp": "1717001165"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:289::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "289", "vd_nssi_tac_5GSEPHOSR": 93.303671, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001111", "fk_end_timestamp": "1717001165"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:519::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "519", "vd_nssi_tac_PartialDRBAccessibility": 104.68545, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001129", "fk_end_timestamp": "1717001227"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:519::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "519", "vd_nssi_tac_DLLat_gNB_DU": 294.973639, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001129", "fk_end_timestamp": "1717001227"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:519::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "519", "vd_nssi_tac_DLDelay_GnbDu": 51.650765, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001129", "fk_end_timestamp": "1717001227"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:519::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "519", "vd_nssi_tac_DlUeThroughput": 195.712705, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001129", "fk_end_timestamp": "1717001227"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:519::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "519", "vd_nssi_tac_UlUeThroughput": 107.53241, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001129", "fk_end_timestamp": "1717001227"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:519::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "519", "vd_nssi_tac_GRANGOSR": 341.422795, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001129", "fk_end_timestamp": "1717001227"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:519::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "519", "vd_nssi_tac_5GSEPHOSR": 51.588459, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001129", "fk_end_timestamp": "1717001227"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:519::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "519", "vd_nssi_tac_PartialDRBAccessibility": 213.819432, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001158", "fk_end_timestamp": "1717001275"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:519::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "519", "vd_nssi_tac_DLLat_gNB_DU": 86.906923, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001158", "fk_end_timestamp": "1717001275"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:519::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "519", "vd_nssi_tac_DLDelay_GnbDu": 53.684845, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001158", "fk_end_timestamp": "1717001275"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:519::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "519", "vd_nssi_tac_DlUeThroughput": 384.886224, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001158", "fk_end_timestamp": "1717001275"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:519::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "519", "vd_nssi_tac_UlUeThroughput": 379.165567, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001158", "fk_end_timestamp": "1717001275"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:519::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "519", "vd_nssi_tac_GRANGOSR": 198.766919, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001158", "fk_end_timestamp": "1717001275"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:519::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "519", "vd_nssi_tac_5GSEPHOSR": 118.287824, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001158", "fk_end_timestamp": "1717001275"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:249::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "249", "vd_nssi_tac_PartialDRBAccessibility": 382.472562, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001209", "fk_end_timestamp": "1717001338"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:249::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "249", "vd_nssi_tac_DLLat_gNB_DU": 459.470508, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001209", "fk_end_timestamp": "1717001338"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:249::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "249", "vd_nssi_tac_DLDelay_GnbDu": 345.946269, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001209", "fk_end_timestamp": "1717001338"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:249::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "249", "vd_nssi_tac_DlUeThroughput": 121.393365, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001209", "fk_end_timestamp": "1717001338"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:249::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "249", "vd_nssi_tac_UlUeThroughput": 245.523088, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001209", "fk_end_timestamp": "1717001338"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:249::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "249", "vd_nssi_tac_GRANGOSR": 292.163352, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001209", "fk_end_timestamp": "1717001338"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:249::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "249", "vd_nssi_tac_5GSEPHOSR": 431.098238, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001209", "fk_end_timestamp": "1717001338"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:613::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "613", "vd_nssi_tac_PartialDRBAccessibility": 377.204502, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:613::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "613", "vd_nssi_tac_DLLat_gNB_DU": 238.104234, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:613::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "613", "vd_nssi_tac_DLDelay_GnbDu": 170.605431, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:613::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "613", "vd_nssi_tac_DlUeThroughput": 150.121921, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:613::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "613", "vd_nssi_tac_UlUeThroughput": 348.3242, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:613::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "613", "vd_nssi_tac_GRANGOSR": 346.376521, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:613::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_tac": "613", "vd_nssi_tac_5GSEPHOSR": 223.259415, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001306"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:647::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "647", "vd_nssi_tac_PartialDRBAccessibility": 26.616928, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001252", "fk_end_timestamp": "1717001287"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:647::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "647", "vd_nssi_tac_DLLat_gNB_DU": 359.684964, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001252", "fk_end_timestamp": "1717001287"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:647::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "647", "vd_nssi_tac_DLDelay_GnbDu": 193.552189, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001252", "fk_end_timestamp": "1717001287"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:647::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "647", "vd_nssi_tac_DlUeThroughput": 410.693943, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001252", "fk_end_timestamp": "1717001287"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:647::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "647", "vd_nssi_tac_UlUeThroughput": 228.750271, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001252", "fk_end_timestamp": "1717001287"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:647::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "647", "vd_nssi_tac_GRANGOSR": 414.518956, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001252", "fk_end_timestamp": "1717001287"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:647::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "647", "vd_nssi_tac_5GSEPHOSR": 312.842653, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001252", "fk_end_timestamp": "1717001287"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:742::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "742", "vd_nssi_tac_PartialDRBAccessibility": 449.914341, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001239", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:742::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "742", "vd_nssi_tac_DLLat_gNB_DU": 129.186945, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001239", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:742::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "742", "vd_nssi_tac_DLDelay_GnbDu": 145.823377, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001239", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:742::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "742", "vd_nssi_tac_DlUeThroughput": 450.773172, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001239", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:742::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "742", "vd_nssi_tac_UlUeThroughput": 80.885674, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001239", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:742::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "742", "vd_nssi_tac_GRANGOSR": 421.77118, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001239", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:742::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_tac": "742", "vd_nssi_tac_5GSEPHOSR": 315.53731, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001239", "fk_end_timestamp": "1717001327"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:613::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "613", "vd_nssi_tac_PartialDRBAccessibility": 247.357716, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001243", "fk_end_timestamp": "1717001380"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:613::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "613", "vd_nssi_tac_DLLat_gNB_DU": 77.705855, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001243", "fk_end_timestamp": "1717001380"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:613::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "613", "vd_nssi_tac_DLDelay_GnbDu": 289.049105, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001243", "fk_end_timestamp": "1717001380"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:613::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "613", "vd_nssi_tac_DlUeThroughput": 368.361283, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001243", "fk_end_timestamp": "1717001380"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:613::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "613", "vd_nssi_tac_UlUeThroughput": 262.668521, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001243", "fk_end_timestamp": "1717001380"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:613::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "613", "vd_nssi_tac_GRANGOSR": 297.575825, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001243", "fk_end_timestamp": "1717001380"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:613::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "613", "vd_nssi_tac_5GSEPHOSR": 31.068401, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001243", "fk_end_timestamp": "1717001380"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:343::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "343", "vd_nssi_tac_PartialDRBAccessibility": 144.403142, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001298", "fk_end_timestamp": "1717001381"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:343::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "343", "vd_nssi_tac_DLLat_gNB_DU": 108.023164, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001298", "fk_end_timestamp": "1717001381"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:343::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "343", "vd_nssi_tac_DLDelay_GnbDu": 326.135509, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001298", "fk_end_timestamp": "1717001381"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:343::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "343", "vd_nssi_tac_DlUeThroughput": 58.650335, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001298", "fk_end_timestamp": "1717001381"}
{"index":{"_index":"soa","_id":"UlUeThroughput@tac:343::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "343", "vd_nssi_tac_UlUeThroughput": 263.651256, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001298", "fk_end_timestamp": "1717001381"}
{"index":{"_index":"soa","_id":"GRANGOSR@tac:343::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "343", "vd_nssi_tac_GRANGOSR": 331.931386, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001298", "fk_end_timestamp": "1717001381"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@tac:343::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_tac", "context": [ "nssi", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_tac": "343", "vd_nssi_tac_5GSEPHOSR": 113.955916, "csac_table": "kpi_csac_nssi_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001298", "fk_end_timestamp": "1717001381"}
'

