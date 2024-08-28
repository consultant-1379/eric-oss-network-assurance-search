#! /bin/sh

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:65::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "65", "vd_nssi_qos_PartialDRBAccessibility": 311.0362, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001028", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:65::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "65", "vd_nssi_qos_DLLat_gNB_DU": 236.955326, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001028", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:65::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "65", "vd_nssi_qos_DLDelay_GnbDu": 327.199308, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001028", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:65::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "65", "vd_nssi_qos_DlUeThroughput": 263.389498, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001028", "fk_end_timestamp": "1717001091"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:72::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "72", "vd_nssi_qos_PartialDRBAccessibility": 378.042332, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717000990", "fk_end_timestamp": "1717001147"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:72::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "72", "vd_nssi_qos_DLLat_gNB_DU": 227.821796, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717000990", "fk_end_timestamp": "1717001147"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:72::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "72", "vd_nssi_qos_DLDelay_GnbDu": 461.409856, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717000990", "fk_end_timestamp": "1717001147"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:72::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "72", "vd_nssi_qos_DlUeThroughput": 442.327103, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717000990", "fk_end_timestamp": "1717001147"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:73::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "73", "vd_nssi_qos_PartialDRBAccessibility": 327.22081, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001097", "fk_end_timestamp": "1717001216"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:73::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "73", "vd_nssi_qos_DLLat_gNB_DU": 309.439134, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001097", "fk_end_timestamp": "1717001216"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:73::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "73", "vd_nssi_qos_DLDelay_GnbDu": 387.367684, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001097", "fk_end_timestamp": "1717001216"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:73::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "73", "vd_nssi_qos_DlUeThroughput": 282.189267, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001097", "fk_end_timestamp": "1717001216"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:86::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "86", "vd_nssi_qos_PartialDRBAccessibility": 128.45839, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001051", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:86::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "86", "vd_nssi_qos_DLLat_gNB_DU": 92.098858, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001051", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:86::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "86", "vd_nssi_qos_DLDelay_GnbDu": 90.713977, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001051", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:86::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "86", "vd_nssi_qos_DlUeThroughput": 428.342513, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001051", "fk_end_timestamp": "1717001169"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:3::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "3", "vd_nssi_qos_PartialDRBAccessibility": 333.45472, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001044", "fk_end_timestamp": "1717001144"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:3::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "3", "vd_nssi_qos_DLLat_gNB_DU": 443.585109, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001044", "fk_end_timestamp": "1717001144"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:3::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "3", "vd_nssi_qos_DLDelay_GnbDu": 153.70278, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001044", "fk_end_timestamp": "1717001144"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:3::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "3", "vd_nssi_qos_DlUeThroughput": 218.994287, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001044", "fk_end_timestamp": "1717001144"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:6::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "6", "vd_nssi_qos_PartialDRBAccessibility": 36.65819, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001256"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:6::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "6", "vd_nssi_qos_DLLat_gNB_DU": 185.638615, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001256"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:6::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "6", "vd_nssi_qos_DLDelay_GnbDu": 135.950548, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001256"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:6::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "6", "vd_nssi_qos_DlUeThroughput": 72.288646, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001256"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:9::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "9", "vd_nssi_qos_PartialDRBAccessibility": 253.544653, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001153", "fk_end_timestamp": "1717001310"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:9::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "9", "vd_nssi_qos_DLLat_gNB_DU": 400.42815, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001153", "fk_end_timestamp": "1717001310"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:9::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "9", "vd_nssi_qos_DLDelay_GnbDu": 284.596089, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001153", "fk_end_timestamp": "1717001310"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:9::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "9", "vd_nssi_qos_DlUeThroughput": 281.414471, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001153", "fk_end_timestamp": "1717001310"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:69::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "69", "vd_nssi_qos_PartialDRBAccessibility": 177.65316, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001192"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:69::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "69", "vd_nssi_qos_DLLat_gNB_DU": 470.313757, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001192"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:69::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "69", "vd_nssi_qos_DLDelay_GnbDu": 155.846389, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001192"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:69::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "69", "vd_nssi_qos_DlUeThroughput": 112.403442, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001192"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:72::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "72", "vd_nssi_qos_PartialDRBAccessibility": 2.268897, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001203", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:72::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "72", "vd_nssi_qos_DLLat_gNB_DU": 488.788135, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001203", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:72::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "72", "vd_nssi_qos_DLDelay_GnbDu": 403.194487, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001203", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:72::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "72", "vd_nssi_qos_DlUeThroughput": 476.796773, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001203", "fk_end_timestamp": "1717001306"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:65::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "65", "vd_nssi_qos_PartialDRBAccessibility": 186.16984, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001298"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:65::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "65", "vd_nssi_qos_DLLat_gNB_DU": 459.485036, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001298"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:65::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "65", "vd_nssi_qos_DLDelay_GnbDu": 403.527265, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001298"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:65::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "65", "vd_nssi_qos_DlUeThroughput": 8.054154, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001298"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:83::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "83", "vd_nssi_qos_PartialDRBAccessibility": 152.070494, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001247", "fk_end_timestamp": "1717001367"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:83::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "83", "vd_nssi_qos_DLLat_gNB_DU": 410.704346, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001247", "fk_end_timestamp": "1717001367"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:83::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "83", "vd_nssi_qos_DLDelay_GnbDu": 357.684543, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001247", "fk_end_timestamp": "1717001367"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:83::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "83", "vd_nssi_qos_DlUeThroughput": 365.226873, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001247", "fk_end_timestamp": "1717001367"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:86::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "86", "vd_nssi_qos_PartialDRBAccessibility": 375.108804, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001276"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:86::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "86", "vd_nssi_qos_DLLat_gNB_DU": 12.407923, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001276"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:86::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "86", "vd_nssi_qos_DLDelay_GnbDu": 426.185672, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001276"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:86::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "86", "vd_nssi_qos_DlUeThroughput": 293.720687, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001276"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:71::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "71", "vd_nssi_qos_PartialDRBAccessibility": 180.473124, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001297", "fk_end_timestamp": "1717001369"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:71::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "71", "vd_nssi_qos_DLLat_gNB_DU": 137.276713, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001297", "fk_end_timestamp": "1717001369"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:71::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "71", "vd_nssi_qos_DLDelay_GnbDu": 130.799651, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001297", "fk_end_timestamp": "1717001369"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:71::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "71", "vd_nssi_qos_DlUeThroughput": 155.393695, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001297", "fk_end_timestamp": "1717001369"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:73::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "73", "vd_nssi_qos_PartialDRBAccessibility": 208.656006, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001300", "fk_end_timestamp": "1717001336"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:73::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "73", "vd_nssi_qos_DLLat_gNB_DU": 163.233681, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001300", "fk_end_timestamp": "1717001336"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:73::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "73", "vd_nssi_qos_DLDelay_GnbDu": 446.372332, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001300", "fk_end_timestamp": "1717001336"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:73::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_qos", "context": [ "nssi", "qos" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "73", "vd_nssi_qos_DlUeThroughput": 425.912914, "csac_table": "kpi_csac_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001300", "fk_end_timestamp": "1717001336"}
'

