#! /bin/sh

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:683::snssai:2-1001::qos:74::plmnId:302-222::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-222", "c_qos": "74", "c_snssai": "2-1001", "c_tac": "683", "vd_nssi_plmnId_qos_snssai_tac_PartialDRBAccessibility": 493.052756, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001192"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:683::snssai:2-1001::qos:74::plmnId:302-222::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-222", "c_qos": "74", "c_snssai": "2-1001", "c_tac": "683", "vd_nssi_plmnId_qos_snssai_tac_DLLat_gNB_DU": 106.210469, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001192"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:683::snssai:2-1001::qos:74::plmnId:302-222::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-222", "c_qos": "74", "c_snssai": "2-1001", "c_tac": "683", "vd_nssi_plmnId_qos_snssai_tac_DLDelay_GnbDu": 337.440774, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001192"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:683::snssai:2-1001::qos:74::plmnId:302-222::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-222", "c_qos": "74", "c_snssai": "2-1001", "c_tac": "683", "vd_nssi_plmnId_qos_snssai_tac_DlUeThroughput": 160.019029, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001192"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:289::snssai:4-3000::qos:3::plmnId:302-491::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-491", "c_qos": "3", "c_snssai": "4-3000", "c_tac": "289", "vd_nssi_plmnId_qos_snssai_tac_PartialDRBAccessibility": 31.93068, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001161"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:289::snssai:4-3000::qos:3::plmnId:302-491::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-491", "c_qos": "3", "c_snssai": "4-3000", "c_tac": "289", "vd_nssi_plmnId_qos_snssai_tac_DLLat_gNB_DU": 492.577179, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001161"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:289::snssai:4-3000::qos:3::plmnId:302-491::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-491", "c_qos": "3", "c_snssai": "4-3000", "c_tac": "289", "vd_nssi_plmnId_qos_snssai_tac_DLDelay_GnbDu": 427.368244, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001161"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:289::snssai:4-3000::qos:3::plmnId:302-491::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-491", "c_qos": "3", "c_snssai": "4-3000", "c_tac": "289", "vd_nssi_plmnId_qos_snssai_tac_DlUeThroughput": 111.344834, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001161"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:365::snssai:3-2002::qos:4::plmnId:302-860::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-860", "c_qos": "4", "c_snssai": "3-2002", "c_tac": "365", "vd_nssi_plmnId_qos_snssai_tac_PartialDRBAccessibility": 223.280927, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001046", "fk_end_timestamp": "1717001162"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:365::snssai:3-2002::qos:4::plmnId:302-860::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-860", "c_qos": "4", "c_snssai": "3-2002", "c_tac": "365", "vd_nssi_plmnId_qos_snssai_tac_DLLat_gNB_DU": 465.936514, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001046", "fk_end_timestamp": "1717001162"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:365::snssai:3-2002::qos:4::plmnId:302-860::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-860", "c_qos": "4", "c_snssai": "3-2002", "c_tac": "365", "vd_nssi_plmnId_qos_snssai_tac_DLDelay_GnbDu": 220.526137, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001046", "fk_end_timestamp": "1717001162"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:365::snssai:3-2002::qos:4::plmnId:302-860::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-860", "c_qos": "4", "c_snssai": "3-2002", "c_tac": "365", "vd_nssi_plmnId_qos_snssai_tac_DlUeThroughput": 186.530766, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001046", "fk_end_timestamp": "1717001162"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:705::snssai:2-1002::qos:9::plmnId:302-221::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-221", "c_qos": "9", "c_snssai": "2-1002", "c_tac": "705", "vd_nssi_plmnId_qos_snssai_tac_PartialDRBAccessibility": 111.730033, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001148", "fk_end_timestamp": "1717001195"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:705::snssai:2-1002::qos:9::plmnId:302-221::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-221", "c_qos": "9", "c_snssai": "2-1002", "c_tac": "705", "vd_nssi_plmnId_qos_snssai_tac_DLLat_gNB_DU": 421.459899, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001148", "fk_end_timestamp": "1717001195"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:705::snssai:2-1002::qos:9::plmnId:302-221::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-221", "c_qos": "9", "c_snssai": "2-1002", "c_tac": "705", "vd_nssi_plmnId_qos_snssai_tac_DLDelay_GnbDu": 89.89323, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001148", "fk_end_timestamp": "1717001195"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:705::snssai:2-1002::qos:9::plmnId:302-221::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-221", "c_qos": "9", "c_snssai": "2-1002", "c_tac": "705", "vd_nssi_plmnId_qos_snssai_tac_DlUeThroughput": 12.288461, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001148", "fk_end_timestamp": "1717001195"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:226::snssai:3-3000::qos:4::plmnId:302-222::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-222", "c_qos": "4", "c_snssai": "3-3000", "c_tac": "226", "vd_nssi_plmnId_qos_snssai_tac_PartialDRBAccessibility": 183.992731, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001105", "fk_end_timestamp": "1717001174"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:226::snssai:3-3000::qos:4::plmnId:302-222::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-222", "c_qos": "4", "c_snssai": "3-3000", "c_tac": "226", "vd_nssi_plmnId_qos_snssai_tac_DLLat_gNB_DU": 472.462843, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001105", "fk_end_timestamp": "1717001174"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:226::snssai:3-3000::qos:4::plmnId:302-222::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-222", "c_qos": "4", "c_snssai": "3-3000", "c_tac": "226", "vd_nssi_plmnId_qos_snssai_tac_DLDelay_GnbDu": 79.115931, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001105", "fk_end_timestamp": "1717001174"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:226::snssai:3-3000::qos:4::plmnId:302-222::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-222", "c_qos": "4", "c_snssai": "3-3000", "c_tac": "226", "vd_nssi_plmnId_qos_snssai_tac_DlUeThroughput": 107.416593, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001105", "fk_end_timestamp": "1717001174"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:289::snssai:2-1002::qos:66::plmnId:302-490::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-490", "c_qos": "66", "c_snssai": "2-1002", "c_tac": "289", "vd_nssi_plmnId_qos_snssai_tac_PartialDRBAccessibility": 305.988034, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001181"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:289::snssai:2-1002::qos:66::plmnId:302-490::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-490", "c_qos": "66", "c_snssai": "2-1002", "c_tac": "289", "vd_nssi_plmnId_qos_snssai_tac_DLLat_gNB_DU": 106.917491, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001181"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:289::snssai:2-1002::qos:66::plmnId:302-490::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-490", "c_qos": "66", "c_snssai": "2-1002", "c_tac": "289", "vd_nssi_plmnId_qos_snssai_tac_DLDelay_GnbDu": 258.17694, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001181"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:289::snssai:2-1002::qos:66::plmnId:302-490::nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "c_plmnId": "302-490", "c_qos": "66", "c_snssai": "2-1002", "c_tac": "289", "vd_nssi_plmnId_qos_snssai_tac_DlUeThroughput": 65.224026, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001181"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:742::snssai:4-1001::qos:71::plmnId:302-880::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-880", "c_qos": "71", "c_snssai": "4-1001", "c_tac": "742", "vd_nssi_plmnId_qos_snssai_tac_PartialDRBAccessibility": 51.291709, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001189", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:742::snssai:4-1001::qos:71::plmnId:302-880::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-880", "c_qos": "71", "c_snssai": "4-1001", "c_tac": "742", "vd_nssi_plmnId_qos_snssai_tac_DLLat_gNB_DU": 196.186042, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001189", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:742::snssai:4-1001::qos:71::plmnId:302-880::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-880", "c_qos": "71", "c_snssai": "4-1001", "c_tac": "742", "vd_nssi_plmnId_qos_snssai_tac_DLDelay_GnbDu": 176.346712, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001189", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:742::snssai:4-1001::qos:71::plmnId:302-880::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-880", "c_qos": "71", "c_snssai": "4-1001", "c_tac": "742", "vd_nssi_plmnId_qos_snssai_tac_DlUeThroughput": 62.374088, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001189", "fk_end_timestamp": "1717001319"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:365::snssai:4-2001::qos:1::plmnId:302-880::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-880", "c_qos": "1", "c_snssai": "4-2001", "c_tac": "365", "vd_nssi_plmnId_qos_snssai_tac_PartialDRBAccessibility": 393.509255, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001178", "fk_end_timestamp": "1717001310"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:365::snssai:4-2001::qos:1::plmnId:302-880::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-880", "c_qos": "1", "c_snssai": "4-2001", "c_tac": "365", "vd_nssi_plmnId_qos_snssai_tac_DLLat_gNB_DU": 196.547315, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001178", "fk_end_timestamp": "1717001310"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:365::snssai:4-2001::qos:1::plmnId:302-880::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-880", "c_qos": "1", "c_snssai": "4-2001", "c_tac": "365", "vd_nssi_plmnId_qos_snssai_tac_DLDelay_GnbDu": 234.690799, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001178", "fk_end_timestamp": "1717001310"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:365::snssai:4-2001::qos:1::plmnId:302-880::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-880", "c_qos": "1", "c_snssai": "4-2001", "c_tac": "365", "vd_nssi_plmnId_qos_snssai_tac_DlUeThroughput": 209.749725, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001178", "fk_end_timestamp": "1717001310"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:753::snssai:4-2000::qos:76::plmnId:302-221::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-221", "c_qos": "76", "c_snssai": "4-2000", "c_tac": "753", "vd_nssi_plmnId_qos_snssai_tac_PartialDRBAccessibility": 450.785376, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001269", "fk_end_timestamp": "1717001329"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:753::snssai:4-2000::qos:76::plmnId:302-221::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-221", "c_qos": "76", "c_snssai": "4-2000", "c_tac": "753", "vd_nssi_plmnId_qos_snssai_tac_DLLat_gNB_DU": 380.754488, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001269", "fk_end_timestamp": "1717001329"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:753::snssai:4-2000::qos:76::plmnId:302-221::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-221", "c_qos": "76", "c_snssai": "4-2000", "c_tac": "753", "vd_nssi_plmnId_qos_snssai_tac_DLDelay_GnbDu": 319.580243, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001269", "fk_end_timestamp": "1717001329"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:753::snssai:4-2000::qos:76::plmnId:302-221::nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "c_plmnId": "302-221", "c_qos": "76", "c_snssai": "4-2000", "c_tac": "753", "vd_nssi_plmnId_qos_snssai_tac_DlUeThroughput": 93.411757, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001269", "fk_end_timestamp": "1717001329"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:343::snssai:2-1002::qos:8::plmnId:302-610::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_plmnId": "302-610", "c_qos": "8", "c_snssai": "2-1002", "c_tac": "343", "vd_nssi_plmnId_qos_snssai_tac_PartialDRBAccessibility": 75.694125, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001243", "fk_end_timestamp": "1717001316"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:343::snssai:2-1002::qos:8::plmnId:302-610::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_plmnId": "302-610", "c_qos": "8", "c_snssai": "2-1002", "c_tac": "343", "vd_nssi_plmnId_qos_snssai_tac_DLLat_gNB_DU": 15.725193, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001243", "fk_end_timestamp": "1717001316"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:343::snssai:2-1002::qos:8::plmnId:302-610::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_plmnId": "302-610", "c_qos": "8", "c_snssai": "2-1002", "c_tac": "343", "vd_nssi_plmnId_qos_snssai_tac_DLDelay_GnbDu": 220.424373, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001243", "fk_end_timestamp": "1717001316"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:343::snssai:2-1002::qos:8::plmnId:302-610::nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMSharedSlice_1_NSSI", "c_plmnId": "302-610", "c_qos": "8", "c_snssai": "2-1002", "c_tac": "343", "vd_nssi_plmnId_qos_snssai_tac_DlUeThroughput": 220.925726, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001243", "fk_end_timestamp": "1717001316"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@tac:705::snssai:4-2001::qos:70::plmnId:302-221::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-221", "c_qos": "70", "c_snssai": "4-2001", "c_tac": "705", "vd_nssi_plmnId_qos_snssai_tac_PartialDRBAccessibility": 284.530419, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001309", "fk_end_timestamp": "1717001355"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@tac:705::snssai:4-2001::qos:70::plmnId:302-221::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-221", "c_qos": "70", "c_snssai": "4-2001", "c_tac": "705", "vd_nssi_plmnId_qos_snssai_tac_DLLat_gNB_DU": 425.867253, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001309", "fk_end_timestamp": "1717001355"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@tac:705::snssai:4-2001::qos:70::plmnId:302-221::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-221", "c_qos": "70", "c_snssai": "4-2001", "c_tac": "705", "vd_nssi_plmnId_qos_snssai_tac_DLDelay_GnbDu": 468.462318, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001309", "fk_end_timestamp": "1717001355"}
{"index":{"_index":"soa","_id":"DlUeThroughput@tac:705::snssai:4-2001::qos:70::plmnId:302-221::nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi_plmnId_qos_snssai_tac", "context": [ "nssi", "plmnId", "qos", "snssai", "tac" ], "c_nssi": "MMPSharedSlice_NSSI", "c_plmnId": "302-221", "c_qos": "70", "c_snssai": "4-2001", "c_tac": "705", "vd_nssi_plmnId_qos_snssai_tac_DlUeThroughput": 138.473827, "csac_table": "kpi_csac_nssi_plmnid_qos_snssai_tac_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001309", "fk_end_timestamp": "1717001355"}
'

