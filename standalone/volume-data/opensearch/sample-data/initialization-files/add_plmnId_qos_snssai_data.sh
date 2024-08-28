#! /bin/sh

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:3-3000::qos:83::plmnId:302-220::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-220", "c_qos": "83", "c_snssai": "3-3000", "vd_plmnId_qos_snssai_PartialDRBAccessibility": 395.448259, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717000995", "fk_end_timestamp": "1717001116"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:3-3000::qos:83::plmnId:302-220::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-220", "c_qos": "83", "c_snssai": "3-3000", "vd_plmnId_qos_snssai_DLLat_gNB_DU": 295.635721, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717000995", "fk_end_timestamp": "1717001116"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:3-3000::qos:83::plmnId:302-220::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-220", "c_qos": "83", "c_snssai": "3-3000", "vd_plmnId_qos_snssai_DLDelay_GnbDu": 452.371914, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717000995", "fk_end_timestamp": "1717001116"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:3-3000::qos:83::plmnId:302-220::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-220", "c_qos": "83", "c_snssai": "3-3000", "vd_plmnId_qos_snssai_DlUeThroughput": 370.483309, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717000995", "fk_end_timestamp": "1717001116"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:4-2001::qos:7::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "7", "c_snssai": "4-2001", "vd_plmnId_qos_snssai_PartialDRBAccessibility": 460.794207, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001095", "fk_end_timestamp": "1717001170"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:4-2001::qos:7::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "7", "c_snssai": "4-2001", "vd_plmnId_qos_snssai_DLLat_gNB_DU": 90.646889, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001095", "fk_end_timestamp": "1717001170"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:4-2001::qos:7::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "7", "c_snssai": "4-2001", "vd_plmnId_qos_snssai_DLDelay_GnbDu": 200.82687, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001095", "fk_end_timestamp": "1717001170"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:4-2001::qos:7::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "7", "c_snssai": "4-2001", "vd_plmnId_qos_snssai_DlUeThroughput": 451.042213, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001095", "fk_end_timestamp": "1717001170"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:4-3001::qos:79::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "79", "c_snssai": "4-3001", "vd_plmnId_qos_snssai_PartialDRBAccessibility": 255.340728, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001148", "fk_end_timestamp": "1717001249"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:4-3001::qos:79::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "79", "c_snssai": "4-3001", "vd_plmnId_qos_snssai_DLLat_gNB_DU": 240.785543, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001148", "fk_end_timestamp": "1717001249"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:4-3001::qos:79::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "79", "c_snssai": "4-3001", "vd_plmnId_qos_snssai_DLDelay_GnbDu": 148.821619, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001148", "fk_end_timestamp": "1717001249"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:4-3001::qos:79::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "79", "c_snssai": "4-3001", "vd_plmnId_qos_snssai_DlUeThroughput": 404.913072, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001148", "fk_end_timestamp": "1717001249"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:2-1002::qos:69::plmnId:302-690::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-690", "c_qos": "69", "c_snssai": "2-1002", "vd_plmnId_qos_snssai_PartialDRBAccessibility": 377.986852, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001122", "fk_end_timestamp": "1717001271"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:2-1002::qos:69::plmnId:302-690::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-690", "c_qos": "69", "c_snssai": "2-1002", "vd_plmnId_qos_snssai_DLLat_gNB_DU": 269.53183, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001122", "fk_end_timestamp": "1717001271"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:2-1002::qos:69::plmnId:302-690::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-690", "c_qos": "69", "c_snssai": "2-1002", "vd_plmnId_qos_snssai_DLDelay_GnbDu": 62.103236, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001122", "fk_end_timestamp": "1717001271"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:2-1002::qos:69::plmnId:302-690::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-690", "c_qos": "69", "c_snssai": "2-1002", "vd_plmnId_qos_snssai_DlUeThroughput": 472.84228, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001122", "fk_end_timestamp": "1717001271"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:4-1001::qos:7::plmnId:302-860::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-860", "c_qos": "7", "c_snssai": "4-1001", "vd_plmnId_qos_snssai_PartialDRBAccessibility": 364.501997, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001156", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:4-1001::qos:7::plmnId:302-860::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-860", "c_qos": "7", "c_snssai": "4-1001", "vd_plmnId_qos_snssai_DLLat_gNB_DU": 367.510586, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001156", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:4-1001::qos:7::plmnId:302-860::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-860", "c_qos": "7", "c_snssai": "4-1001", "vd_plmnId_qos_snssai_DLDelay_GnbDu": 78.96809, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001156", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:4-1001::qos:7::plmnId:302-860::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-860", "c_qos": "7", "c_snssai": "4-1001", "vd_plmnId_qos_snssai_DlUeThroughput": 348.318465, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001156", "fk_end_timestamp": "1717001305"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:2-1001::qos:7::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "7", "c_snssai": "2-1001", "vd_plmnId_qos_snssai_PartialDRBAccessibility": 330.721595, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001199", "fk_end_timestamp": "1717001329"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:2-1001::qos:7::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "7", "c_snssai": "2-1001", "vd_plmnId_qos_snssai_DLLat_gNB_DU": 44.144311, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001199", "fk_end_timestamp": "1717001329"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:2-1001::qos:7::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "7", "c_snssai": "2-1001", "vd_plmnId_qos_snssai_DLDelay_GnbDu": 440.666869, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001199", "fk_end_timestamp": "1717001329"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:2-1001::qos:7::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "7", "c_snssai": "2-1001", "vd_plmnId_qos_snssai_DlUeThroughput": 119.727835, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001199", "fk_end_timestamp": "1717001329"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:4-3000::qos:8::plmnId:302-320::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-320", "c_qos": "8", "c_snssai": "4-3000", "vd_plmnId_qos_snssai_PartialDRBAccessibility": 426.203422, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001190", "fk_end_timestamp": "1717001332"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:4-3000::qos:8::plmnId:302-320::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-320", "c_qos": "8", "c_snssai": "4-3000", "vd_plmnId_qos_snssai_DLLat_gNB_DU": 200.758578, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001190", "fk_end_timestamp": "1717001332"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:4-3000::qos:8::plmnId:302-320::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-320", "c_qos": "8", "c_snssai": "4-3000", "vd_plmnId_qos_snssai_DLDelay_GnbDu": 234.572881, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001190", "fk_end_timestamp": "1717001332"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:4-3000::qos:8::plmnId:302-320::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-320", "c_qos": "8", "c_snssai": "4-3000", "vd_plmnId_qos_snssai_DlUeThroughput": 197.83991, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001190", "fk_end_timestamp": "1717001332"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:2-2002::qos:79::plmnId:302-222::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-222", "c_qos": "79", "c_snssai": "2-2002", "vd_plmnId_qos_snssai_PartialDRBAccessibility": 344.873976, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001188", "fk_end_timestamp": "1717001241"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:2-2002::qos:79::plmnId:302-222::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-222", "c_qos": "79", "c_snssai": "2-2002", "vd_plmnId_qos_snssai_DLLat_gNB_DU": 274.436575, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001188", "fk_end_timestamp": "1717001241"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:2-2002::qos:79::plmnId:302-222::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-222", "c_qos": "79", "c_snssai": "2-2002", "vd_plmnId_qos_snssai_DLDelay_GnbDu": 292.896659, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001188", "fk_end_timestamp": "1717001241"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:2-2002::qos:79::plmnId:302-222::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-222", "c_qos": "79", "c_snssai": "2-2002", "vd_plmnId_qos_snssai_DlUeThroughput": 94.25442, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001188", "fk_end_timestamp": "1717001241"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:4-4002::qos:80::plmnId:302-610::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-610", "c_qos": "80", "c_snssai": "4-4002", "vd_plmnId_qos_snssai_PartialDRBAccessibility": 224.617095, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001237", "fk_end_timestamp": "1717001263"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:4-4002::qos:80::plmnId:302-610::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-610", "c_qos": "80", "c_snssai": "4-4002", "vd_plmnId_qos_snssai_DLLat_gNB_DU": 467.677501, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001237", "fk_end_timestamp": "1717001263"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:4-4002::qos:80::plmnId:302-610::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-610", "c_qos": "80", "c_snssai": "4-4002", "vd_plmnId_qos_snssai_DLDelay_GnbDu": 407.193894, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001237", "fk_end_timestamp": "1717001263"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:4-4002::qos:80::plmnId:302-610::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-610", "c_qos": "80", "c_snssai": "4-4002", "vd_plmnId_qos_snssai_DlUeThroughput": 237.552887, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001237", "fk_end_timestamp": "1717001263"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:4-3002::qos:84::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "84", "c_snssai": "4-3002", "vd_plmnId_qos_snssai_PartialDRBAccessibility": 250.77076, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001278", "fk_end_timestamp": "1717001401"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:4-3002::qos:84::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "84", "c_snssai": "4-3002", "vd_plmnId_qos_snssai_DLLat_gNB_DU": 206.4002, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001278", "fk_end_timestamp": "1717001401"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:4-3002::qos:84::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "84", "c_snssai": "4-3002", "vd_plmnId_qos_snssai_DLDelay_GnbDu": 493.031056, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001278", "fk_end_timestamp": "1717001401"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:4-3002::qos:84::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "84", "c_snssai": "4-3002", "vd_plmnId_qos_snssai_DlUeThroughput": 217.665229, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001278", "fk_end_timestamp": "1717001401"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:3-1002::qos:72::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "72", "c_snssai": "3-1002", "vd_plmnId_qos_snssai_PartialDRBAccessibility": 333.852473, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001321", "fk_end_timestamp": "1717001368"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:3-1002::qos:72::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "72", "c_snssai": "3-1002", "vd_plmnId_qos_snssai_DLLat_gNB_DU": 10.99119, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001321", "fk_end_timestamp": "1717001368"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:3-1002::qos:72::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "72", "c_snssai": "3-1002", "vd_plmnId_qos_snssai_DLDelay_GnbDu": 261.071577, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001321", "fk_end_timestamp": "1717001368"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:3-1002::qos:72::plmnId:302-221::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-221", "c_qos": "72", "c_snssai": "3-1002", "vd_plmnId_qos_snssai_DlUeThroughput": 3.43789, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001321", "fk_end_timestamp": "1717001368"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:2-3001::qos:85::plmnId:302-880::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-880", "c_qos": "85", "c_snssai": "2-3001", "vd_plmnId_qos_snssai_PartialDRBAccessibility": 67.877087, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001321", "fk_end_timestamp": "1717001394"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:2-3001::qos:85::plmnId:302-880::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-880", "c_qos": "85", "c_snssai": "2-3001", "vd_plmnId_qos_snssai_DLLat_gNB_DU": 412.362338, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001321", "fk_end_timestamp": "1717001394"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:2-3001::qos:85::plmnId:302-880::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-880", "c_qos": "85", "c_snssai": "2-3001", "vd_plmnId_qos_snssai_DLDelay_GnbDu": 18.663373, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001321", "fk_end_timestamp": "1717001394"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:2-3001::qos:85::plmnId:302-880::"}}
{ "full_context": "plmnId_qos_snssai", "context": [ "plmnId", "qos", "snssai" ], "c_plmnId": "302-880", "c_qos": "85", "c_snssai": "2-3001", "vd_plmnId_qos_snssai_DlUeThroughput": 496.744839, "csac_table": "kpi_csac_plmnid_qos_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001321", "fk_end_timestamp": "1717001394"}
'

