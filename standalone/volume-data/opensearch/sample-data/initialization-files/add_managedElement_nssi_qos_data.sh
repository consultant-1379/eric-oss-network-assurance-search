#! /bin/sh

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:3::nssi:MMSharedSlice_1_NSSI::managedElement:me-11-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-11-id", "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "3", "vd_managedElement_nssi_qos_PartialDRBAccessibility": 366.169834, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001034", "fk_end_timestamp": "1717001127"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:3::nssi:MMSharedSlice_1_NSSI::managedElement:me-11-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-11-id", "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "3", "vd_managedElement_nssi_qos_DLLat_gNB_DU": 381.256661, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001034", "fk_end_timestamp": "1717001127"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:3::nssi:MMSharedSlice_1_NSSI::managedElement:me-11-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-11-id", "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "3", "vd_managedElement_nssi_qos_DLDelay_GnbDu": 286.352567, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001034", "fk_end_timestamp": "1717001127"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:3::nssi:MMSharedSlice_1_NSSI::managedElement:me-11-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-11-id", "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "3", "vd_managedElement_nssi_qos_DlUeThroughput": 272.914829, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001034", "fk_end_timestamp": "1717001127"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:69::nssi:MMSharedSlice_1_NSSI::managedElement:me-6-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-6-id", "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "69", "vd_managedElement_nssi_qos_PartialDRBAccessibility": 158.650222, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001005", "fk_end_timestamp": "1717001075"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:69::nssi:MMSharedSlice_1_NSSI::managedElement:me-6-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-6-id", "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "69", "vd_managedElement_nssi_qos_DLLat_gNB_DU": 335.629615, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001005", "fk_end_timestamp": "1717001075"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:69::nssi:MMSharedSlice_1_NSSI::managedElement:me-6-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-6-id", "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "69", "vd_managedElement_nssi_qos_DLDelay_GnbDu": 106.858557, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001005", "fk_end_timestamp": "1717001075"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:69::nssi:MMSharedSlice_1_NSSI::managedElement:me-6-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-6-id", "c_nssi": "MMSharedSlice_1_NSSI", "c_qos": "69", "vd_managedElement_nssi_qos_DlUeThroughput": 499.497866, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001005", "fk_end_timestamp": "1717001075"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:73::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-7-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-7-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "73", "vd_managedElement_nssi_qos_PartialDRBAccessibility": 40.292273, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001051", "fk_end_timestamp": "1717001107"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:73::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-7-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-7-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "73", "vd_managedElement_nssi_qos_DLLat_gNB_DU": 136.092154, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001051", "fk_end_timestamp": "1717001107"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:73::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-7-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-7-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "73", "vd_managedElement_nssi_qos_DLDelay_GnbDu": 482.737222, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001051", "fk_end_timestamp": "1717001107"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:73::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-7-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-7-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "73", "vd_managedElement_nssi_qos_DlUeThroughput": 264.740067, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001051", "fk_end_timestamp": "1717001107"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:85::nssi:MMPSharedSlice_NSSI::managedElement:me-5-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-5-id", "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "85", "vd_managedElement_nssi_qos_PartialDRBAccessibility": 465.101257, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001072", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:85::nssi:MMPSharedSlice_NSSI::managedElement:me-5-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-5-id", "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "85", "vd_managedElement_nssi_qos_DLLat_gNB_DU": 241.422553, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001072", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:85::nssi:MMPSharedSlice_NSSI::managedElement:me-5-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-5-id", "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "85", "vd_managedElement_nssi_qos_DLDelay_GnbDu": 290.164604, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001072", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:85::nssi:MMPSharedSlice_NSSI::managedElement:me-5-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-5-id", "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "85", "vd_managedElement_nssi_qos_DlUeThroughput": 431.733672, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001072", "fk_end_timestamp": "1717001139"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:65::nssi:MMPSharedSlice_NSSI::managedElement:me-9-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-9-id", "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "65", "vd_managedElement_nssi_qos_PartialDRBAccessibility": 217.911022, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001121", "fk_end_timestamp": "1717001262"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:65::nssi:MMPSharedSlice_NSSI::managedElement:me-9-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-9-id", "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "65", "vd_managedElement_nssi_qos_DLLat_gNB_DU": 361.203318, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001121", "fk_end_timestamp": "1717001262"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:65::nssi:MMPSharedSlice_NSSI::managedElement:me-9-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-9-id", "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "65", "vd_managedElement_nssi_qos_DLDelay_GnbDu": 87.994505, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001121", "fk_end_timestamp": "1717001262"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:65::nssi:MMPSharedSlice_NSSI::managedElement:me-9-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-9-id", "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "65", "vd_managedElement_nssi_qos_DlUeThroughput": 229.60626, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001121", "fk_end_timestamp": "1717001262"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:3::nssi:macNsiDedicated20230728x1543_corNssiService::managedElement:me-11-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-11-id", "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "3", "vd_managedElement_nssi_qos_PartialDRBAccessibility": 462.292144, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001251"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:3::nssi:macNsiDedicated20230728x1543_corNssiService::managedElement:me-11-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-11-id", "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "3", "vd_managedElement_nssi_qos_DLLat_gNB_DU": 46.634734, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001251"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:3::nssi:macNsiDedicated20230728x1543_corNssiService::managedElement:me-11-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-11-id", "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "3", "vd_managedElement_nssi_qos_DLDelay_GnbDu": 318.246788, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001251"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:3::nssi:macNsiDedicated20230728x1543_corNssiService::managedElement:me-11-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-11-id", "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "3", "vd_managedElement_nssi_qos_DlUeThroughput": 64.75178, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001251"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:83::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-2-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-2-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "83", "vd_managedElement_nssi_qos_PartialDRBAccessibility": 146.774266, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001179", "fk_end_timestamp": "1717001223"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:83::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-2-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-2-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "83", "vd_managedElement_nssi_qos_DLLat_gNB_DU": 224.117767, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001179", "fk_end_timestamp": "1717001223"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:83::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-2-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-2-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "83", "vd_managedElement_nssi_qos_DLDelay_GnbDu": 326.705063, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001179", "fk_end_timestamp": "1717001223"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:83::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-2-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-2-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "83", "vd_managedElement_nssi_qos_DlUeThroughput": 377.21077, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001179", "fk_end_timestamp": "1717001223"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:73::nssi:macNsiDedicated20230728x1543_corNssiService::managedElement:me-1-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-1-id", "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "73", "vd_managedElement_nssi_qos_PartialDRBAccessibility": 41.572625, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001212", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:73::nssi:macNsiDedicated20230728x1543_corNssiService::managedElement:me-1-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-1-id", "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "73", "vd_managedElement_nssi_qos_DLLat_gNB_DU": 263.307813, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001212", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:73::nssi:macNsiDedicated20230728x1543_corNssiService::managedElement:me-1-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-1-id", "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "73", "vd_managedElement_nssi_qos_DLDelay_GnbDu": 323.721793, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001212", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:73::nssi:macNsiDedicated20230728x1543_corNssiService::managedElement:me-1-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-1-id", "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_qos": "73", "vd_managedElement_nssi_qos_DlUeThroughput": 251.242307, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001212", "fk_end_timestamp": "1717001306"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:5::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-9-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-9-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "5", "vd_managedElement_nssi_qos_PartialDRBAccessibility": 46.841358, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001240", "fk_end_timestamp": "1717001362"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:5::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-9-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-9-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "5", "vd_managedElement_nssi_qos_DLLat_gNB_DU": 374.213072, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001240", "fk_end_timestamp": "1717001362"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:5::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-9-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-9-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "5", "vd_managedElement_nssi_qos_DLDelay_GnbDu": 142.09065, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001240", "fk_end_timestamp": "1717001362"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:5::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-9-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-9-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_qos": "5", "vd_managedElement_nssi_qos_DlUeThroughput": 425.122276, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001240", "fk_end_timestamp": "1717001362"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@qos:79::nssi:MMPSharedSlice_NSSI::managedElement:me-6-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-6-id", "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "79", "vd_managedElement_nssi_qos_PartialDRBAccessibility": 328.65614, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001307", "fk_end_timestamp": "1717001439"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@qos:79::nssi:MMPSharedSlice_NSSI::managedElement:me-6-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-6-id", "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "79", "vd_managedElement_nssi_qos_DLLat_gNB_DU": 346.332038, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001307", "fk_end_timestamp": "1717001439"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@qos:79::nssi:MMPSharedSlice_NSSI::managedElement:me-6-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-6-id", "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "79", "vd_managedElement_nssi_qos_DLDelay_GnbDu": 361.672873, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001307", "fk_end_timestamp": "1717001439"}
{"index":{"_index":"soa","_id":"DlUeThroughput@qos:79::nssi:MMPSharedSlice_NSSI::managedElement:me-6-id::"}}
{ "full_context": "managedElement_nssi_qos", "context": [ "managedElement", "nssi", "qos" ], "c_managedElement": "me-6-id", "c_nssi": "MMPSharedSlice_NSSI", "c_qos": "79", "vd_managedElement_nssi_qos_DlUeThroughput": 199.656598, "csac_table": "kpi_csac_managedelement_nssi_qos_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001307", "fk_end_timestamp": "1717001439"}
'

