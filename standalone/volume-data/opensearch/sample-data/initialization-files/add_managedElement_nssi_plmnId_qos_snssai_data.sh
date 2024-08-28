#! /bin/sh

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:2-1002::qos:80::plmnId:302-490::nssi:macNsiDedicated20230728x1543_corNssiService::managedElement:me-5-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-5-id", "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-490", "c_qos": "80", "c_snssai": "2-1002", "vd_managedElement_nssi_plmnId_qos_snssai_DLLat_gNB_DU": 386.952403, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001010", "fk_end_timestamp": "1717001058"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:2-1002::qos:80::plmnId:302-490::nssi:macNsiDedicated20230728x1543_corNssiService::managedElement:me-5-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-5-id", "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-490", "c_qos": "80", "c_snssai": "2-1002", "vd_managedElement_nssi_plmnId_qos_snssai_DLDelay_GnbDu": 201.294486, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001010", "fk_end_timestamp": "1717001058"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:2-1002::qos:80::plmnId:302-490::nssi:macNsiDedicated20230728x1543_corNssiService::managedElement:me-5-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-5-id", "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-490", "c_qos": "80", "c_snssai": "2-1002", "vd_managedElement_nssi_plmnId_qos_snssai_DlUeThroughput": 243.905308, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001010", "fk_end_timestamp": "1717001058"}
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:2-1002::qos:80::plmnId:302-490::nssi:macNsiDedicated20230728x1543_corNssiService::managedElement:me-5-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-5-id", "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-490", "c_qos": "80", "c_snssai": "2-1002", "vd_managedElement_nssi_plmnId_qos_snssai_PartialDRBAccessibility": 272.868259, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001010", "fk_end_timestamp": "1717001058"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:4-3002::qos:5::plmnId:302-221::nssi:MMSharedSlice_1_NSSI::managedElement:me-9-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-9-id", "c_nssi": "MMSharedSlice_1_NSSI", "c_plmnId": "302-221", "c_qos": "5", "c_snssai": "4-3002", "vd_managedElement_nssi_plmnId_qos_snssai_DLLat_gNB_DU": 34.693631, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001054", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:4-3002::qos:5::plmnId:302-221::nssi:MMSharedSlice_1_NSSI::managedElement:me-9-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-9-id", "c_nssi": "MMSharedSlice_1_NSSI", "c_plmnId": "302-221", "c_qos": "5", "c_snssai": "4-3002", "vd_managedElement_nssi_plmnId_qos_snssai_DLDelay_GnbDu": 219.274272, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001054", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:4-3002::qos:5::plmnId:302-221::nssi:MMSharedSlice_1_NSSI::managedElement:me-9-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-9-id", "c_nssi": "MMSharedSlice_1_NSSI", "c_plmnId": "302-221", "c_qos": "5", "c_snssai": "4-3002", "vd_managedElement_nssi_plmnId_qos_snssai_DlUeThroughput": 268.819371, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001054", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:4-3002::qos:5::plmnId:302-221::nssi:MMSharedSlice_1_NSSI::managedElement:me-9-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-9-id", "c_nssi": "MMSharedSlice_1_NSSI", "c_plmnId": "302-221", "c_qos": "5", "c_snssai": "4-3002", "vd_managedElement_nssi_plmnId_qos_snssai_PartialDRBAccessibility": 162.981899, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001054", "fk_end_timestamp": "1717001082"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:2-4001::qos:70::plmnId:302-820::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-3-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-3-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-820", "c_qos": "70", "c_snssai": "2-4001", "vd_managedElement_nssi_plmnId_qos_snssai_DLLat_gNB_DU": 267.814492, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001110", "fk_end_timestamp": "1717001222"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:2-4001::qos:70::plmnId:302-820::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-3-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-3-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-820", "c_qos": "70", "c_snssai": "2-4001", "vd_managedElement_nssi_plmnId_qos_snssai_DLDelay_GnbDu": 200.492547, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001110", "fk_end_timestamp": "1717001222"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:2-4001::qos:70::plmnId:302-820::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-3-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-3-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-820", "c_qos": "70", "c_snssai": "2-4001", "vd_managedElement_nssi_plmnId_qos_snssai_DlUeThroughput": 126.298477, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001110", "fk_end_timestamp": "1717001222"}
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:2-4001::qos:70::plmnId:302-820::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-3-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-3-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-820", "c_qos": "70", "c_snssai": "2-4001", "vd_managedElement_nssi_plmnId_qos_snssai_PartialDRBAccessibility": 433.985264, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001110", "fk_end_timestamp": "1717001222"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:2-3002::qos:6::plmnId:302-720::nssi:MMPSharedSlice_NSSI::managedElement:me-11-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-11-id", "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-720", "c_qos": "6", "c_snssai": "2-3002", "vd_managedElement_nssi_plmnId_qos_snssai_DLLat_gNB_DU": 483.384248, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001115", "fk_end_timestamp": "1717001257"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:2-3002::qos:6::plmnId:302-720::nssi:MMPSharedSlice_NSSI::managedElement:me-11-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-11-id", "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-720", "c_qos": "6", "c_snssai": "2-3002", "vd_managedElement_nssi_plmnId_qos_snssai_DLDelay_GnbDu": 3.130684, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001115", "fk_end_timestamp": "1717001257"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:2-3002::qos:6::plmnId:302-720::nssi:MMPSharedSlice_NSSI::managedElement:me-11-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-11-id", "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-720", "c_qos": "6", "c_snssai": "2-3002", "vd_managedElement_nssi_plmnId_qos_snssai_DlUeThroughput": 301.891743, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001115", "fk_end_timestamp": "1717001257"}
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:2-3002::qos:6::plmnId:302-720::nssi:MMPSharedSlice_NSSI::managedElement:me-11-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-11-id", "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-720", "c_qos": "6", "c_snssai": "2-3002", "vd_managedElement_nssi_plmnId_qos_snssai_PartialDRBAccessibility": 16.924769, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001115", "fk_end_timestamp": "1717001257"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:2-1001::qos:4::plmnId:302-820::nssi:MMPSharedSlice_NSSI::managedElement:me-9-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-9-id", "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-820", "c_qos": "4", "c_snssai": "2-1001", "vd_managedElement_nssi_plmnId_qos_snssai_DLLat_gNB_DU": 399.836288, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001175", "fk_end_timestamp": "1717001296"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:2-1001::qos:4::plmnId:302-820::nssi:MMPSharedSlice_NSSI::managedElement:me-9-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-9-id", "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-820", "c_qos": "4", "c_snssai": "2-1001", "vd_managedElement_nssi_plmnId_qos_snssai_DLDelay_GnbDu": 414.730888, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001175", "fk_end_timestamp": "1717001296"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:2-1001::qos:4::plmnId:302-820::nssi:MMPSharedSlice_NSSI::managedElement:me-9-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-9-id", "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-820", "c_qos": "4", "c_snssai": "2-1001", "vd_managedElement_nssi_plmnId_qos_snssai_DlUeThroughput": 253.527164, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001175", "fk_end_timestamp": "1717001296"}
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:2-1001::qos:4::plmnId:302-820::nssi:MMPSharedSlice_NSSI::managedElement:me-9-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-9-id", "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-820", "c_qos": "4", "c_snssai": "2-1001", "vd_managedElement_nssi_plmnId_qos_snssai_PartialDRBAccessibility": 451.052537, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001175", "fk_end_timestamp": "1717001296"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:3-4002::qos:65::plmnId:302-320::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-4-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-4-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-320", "c_qos": "65", "c_snssai": "3-4002", "vd_managedElement_nssi_plmnId_qos_snssai_DLLat_gNB_DU": 429.884638, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001239", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:3-4002::qos:65::plmnId:302-320::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-4-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-4-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-320", "c_qos": "65", "c_snssai": "3-4002", "vd_managedElement_nssi_plmnId_qos_snssai_DLDelay_GnbDu": 266.372443, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001239", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:3-4002::qos:65::plmnId:302-320::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-4-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-4-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-320", "c_qos": "65", "c_snssai": "3-4002", "vd_managedElement_nssi_plmnId_qos_snssai_DlUeThroughput": 245.282397, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001239", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:3-4002::qos:65::plmnId:302-320::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-4-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-4-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-320", "c_qos": "65", "c_snssai": "3-4002", "vd_managedElement_nssi_plmnId_qos_snssai_PartialDRBAccessibility": 366.255667, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001239", "fk_end_timestamp": "1717001306"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:2-3001::qos:66::plmnId:302-222::nssi:MMPSharedSlice_NSSI::managedElement:me-7-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-7-id", "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-222", "c_qos": "66", "c_snssai": "2-3001", "vd_managedElement_nssi_plmnId_qos_snssai_DLLat_gNB_DU": 496.63794, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001267", "fk_end_timestamp": "1717001310"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:2-3001::qos:66::plmnId:302-222::nssi:MMPSharedSlice_NSSI::managedElement:me-7-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-7-id", "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-222", "c_qos": "66", "c_snssai": "2-3001", "vd_managedElement_nssi_plmnId_qos_snssai_DLDelay_GnbDu": 213.459637, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001267", "fk_end_timestamp": "1717001310"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:2-3001::qos:66::plmnId:302-222::nssi:MMPSharedSlice_NSSI::managedElement:me-7-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-7-id", "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-222", "c_qos": "66", "c_snssai": "2-3001", "vd_managedElement_nssi_plmnId_qos_snssai_DlUeThroughput": 431.26347, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001267", "fk_end_timestamp": "1717001310"}
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:2-3001::qos:66::plmnId:302-222::nssi:MMPSharedSlice_NSSI::managedElement:me-7-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-7-id", "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-222", "c_qos": "66", "c_snssai": "2-3001", "vd_managedElement_nssi_plmnId_qos_snssai_PartialDRBAccessibility": 92.797651, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001267", "fk_end_timestamp": "1717001310"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:1-1001::qos:82::plmnId:302-820::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-2-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-2-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-820", "c_qos": "82", "c_snssai": "1-1001", "vd_managedElement_nssi_plmnId_qos_snssai_DLLat_gNB_DU": 485.118208, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001290", "fk_end_timestamp": "1717001417"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:1-1001::qos:82::plmnId:302-820::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-2-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-2-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-820", "c_qos": "82", "c_snssai": "1-1001", "vd_managedElement_nssi_plmnId_qos_snssai_DLDelay_GnbDu": 302.360284, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001290", "fk_end_timestamp": "1717001417"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:1-1001::qos:82::plmnId:302-820::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-2-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-2-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-820", "c_qos": "82", "c_snssai": "1-1001", "vd_managedElement_nssi_plmnId_qos_snssai_DlUeThroughput": 134.589103, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001290", "fk_end_timestamp": "1717001417"}
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:1-1001::qos:82::plmnId:302-820::nssi:macNsiDedicated20230728x1543_qosh96mac::managedElement:me-2-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-2-id", "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-820", "c_qos": "82", "c_snssai": "1-1001", "vd_managedElement_nssi_plmnId_qos_snssai_PartialDRBAccessibility": 345.757663, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001290", "fk_end_timestamp": "1717001417"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:1-4000::qos:69::plmnId:302-820::nssi:macNsiDedicated20230728x1543_corNssiService::managedElement:me-1-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-1-id", "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-820", "c_qos": "69", "c_snssai": "1-4000", "vd_managedElement_nssi_plmnId_qos_snssai_DLLat_gNB_DU": 455.808613, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001436"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:1-4000::qos:69::plmnId:302-820::nssi:macNsiDedicated20230728x1543_corNssiService::managedElement:me-1-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-1-id", "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-820", "c_qos": "69", "c_snssai": "1-4000", "vd_managedElement_nssi_plmnId_qos_snssai_DLDelay_GnbDu": 383.311681, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001436"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:1-4000::qos:69::plmnId:302-820::nssi:macNsiDedicated20230728x1543_corNssiService::managedElement:me-1-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-1-id", "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-820", "c_qos": "69", "c_snssai": "1-4000", "vd_managedElement_nssi_plmnId_qos_snssai_DlUeThroughput": 373.576778, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001436"}
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:1-4000::qos:69::plmnId:302-820::nssi:macNsiDedicated20230728x1543_corNssiService::managedElement:me-1-id::"}}
{ "full_context": "managedElement_nssi_plmnId_qos_snssai", "context": [ "managedElement", "nssi", "plmnId", "qos", "snssai" ], "c_managedElement": "me-1-id", "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-820", "c_qos": "69", "c_snssai": "1-4000", "vd_managedElement_nssi_plmnId_qos_snssai_PartialDRBAccessibility": 430.252676, "csac_table": "kpi_csac_managedelement_nssi_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001436"}
'

