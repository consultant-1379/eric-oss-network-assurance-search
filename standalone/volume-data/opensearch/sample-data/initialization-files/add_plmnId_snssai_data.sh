#! /bin/sh

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vd_plmnId_snssai_PartialDRBAccessibility": 390.665252, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vd_plmnId_snssai_DLLat_gNB_DU": 309.564738, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vd_plmnId_snssai_DLDelay_GnbDu": 418.369126, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vd_plmnId_snssai_DlUeThroughput": 176.999019, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"UlUeThroughput@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vd_plmnId_snssai_UlUeThroughput": 343.167299, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"GRANGOSR@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vd_plmnId_snssai_GRANGOSR": 468.718755, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vd_plmnId_snssai_5GSEPHOSR": 466.698442, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vi_plmnId_snssai_AMFMeanRegNbr": 30, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vd_plmnId_snssai_PDUSessionEstSR": 460.951996, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vd_plmnId_snssai_PDUSessModSR": 288.088644, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vi_plmnId_snssai_AMFMaxRegNbr": 279, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vd_plmnId_snssai_UTSNSI": 346.571104, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vd_plmnId_snssai_DTSNSI": 171.056855, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vd_plmnId_snssai_PDUSesMeanNbr": 192.881251, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vi_plmnId_snssai_PDUSesMaxNbr": 454, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vi_plmnId_snssai_ULIpv4PacketsDr": 140, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vi_plmnId_snssai_ULIpv6PacketsDr": 462, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vi_plmnId_snssai_DLIpv6PacketsDr": 34, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vi_plmnId_snssai_DLUnstrPacketsDr": 395, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vi_plmnId_snssai_ULUnstrPacketsDr": 4, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vd_plmnId_snssai_PFCPSessEstFR": 492.738941, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:4-3001::plmnId:302-490::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-490", "c_snssai": "4-3001", "vd_plmnId_snssai_PFCPSessModFR": 396.835597, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001029", "fk_end_timestamp": "1717001115"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vd_plmnId_snssai_PartialDRBAccessibility": 489.438484, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vd_plmnId_snssai_DLLat_gNB_DU": 378.189861, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vd_plmnId_snssai_DLDelay_GnbDu": 287.380132, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vd_plmnId_snssai_DlUeThroughput": 421.212769, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"UlUeThroughput@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vd_plmnId_snssai_UlUeThroughput": 184.488981, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"GRANGOSR@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vd_plmnId_snssai_GRANGOSR": 44.969824, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vd_plmnId_snssai_5GSEPHOSR": 339.023907, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vi_plmnId_snssai_AMFMeanRegNbr": 265, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vd_plmnId_snssai_PDUSessionEstSR": 147.532342, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vd_plmnId_snssai_PDUSessModSR": 93.747281, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vi_plmnId_snssai_AMFMaxRegNbr": 80, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vd_plmnId_snssai_UTSNSI": 160.286231, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vd_plmnId_snssai_DTSNSI": 251.892854, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vd_plmnId_snssai_PDUSesMeanNbr": 41.841354, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vi_plmnId_snssai_PDUSesMaxNbr": 23, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vi_plmnId_snssai_ULIpv4PacketsDr": 207, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vi_plmnId_snssai_ULIpv6PacketsDr": 275, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vi_plmnId_snssai_DLIpv6PacketsDr": 297, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vi_plmnId_snssai_DLUnstrPacketsDr": 61, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vi_plmnId_snssai_ULUnstrPacketsDr": 310, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vd_plmnId_snssai_PFCPSessEstFR": 280.78268, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:2-2001::plmnId:302-720::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-720", "c_snssai": "2-2001", "vd_plmnId_snssai_PFCPSessModFR": 286.564049, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001061", "fk_end_timestamp": "1717001092"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vd_plmnId_snssai_PartialDRBAccessibility": 389.821377, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vd_plmnId_snssai_DLLat_gNB_DU": 180.899039, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vd_plmnId_snssai_DLDelay_GnbDu": 404.246254, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vd_plmnId_snssai_DlUeThroughput": 145.985874, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"UlUeThroughput@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vd_plmnId_snssai_UlUeThroughput": 498.48692, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"GRANGOSR@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vd_plmnId_snssai_GRANGOSR": 467.117121, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vd_plmnId_snssai_5GSEPHOSR": 463.476091, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vi_plmnId_snssai_AMFMeanRegNbr": 257, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vd_plmnId_snssai_PDUSessionEstSR": 258.465434, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vd_plmnId_snssai_PDUSessModSR": 23.694329, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vi_plmnId_snssai_AMFMaxRegNbr": 191, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vd_plmnId_snssai_UTSNSI": 294.731027, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vd_plmnId_snssai_DTSNSI": 217.402508, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vd_plmnId_snssai_PDUSesMeanNbr": 164.817001, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vi_plmnId_snssai_PDUSesMaxNbr": 38, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vi_plmnId_snssai_ULIpv4PacketsDr": 225, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vi_plmnId_snssai_ULIpv6PacketsDr": 355, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vi_plmnId_snssai_DLIpv6PacketsDr": 454, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vi_plmnId_snssai_DLUnstrPacketsDr": 162, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vi_plmnId_snssai_ULUnstrPacketsDr": 326, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vd_plmnId_snssai_PFCPSessEstFR": 431.878009, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:2-3002::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "2-3002", "vd_plmnId_snssai_PFCPSessModFR": 56.379579, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001057", "fk_end_timestamp": "1717001101"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vd_plmnId_snssai_PartialDRBAccessibility": 173.014286, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vd_plmnId_snssai_DLLat_gNB_DU": 250.724858, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vd_plmnId_snssai_DLDelay_GnbDu": 226.349519, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vd_plmnId_snssai_DlUeThroughput": 132.824509, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"UlUeThroughput@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vd_plmnId_snssai_UlUeThroughput": 61.520868, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"GRANGOSR@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vd_plmnId_snssai_GRANGOSR": 117.682079, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vd_plmnId_snssai_5GSEPHOSR": 295.847898, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vi_plmnId_snssai_AMFMeanRegNbr": 352, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vd_plmnId_snssai_PDUSessionEstSR": 290.268959, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vd_plmnId_snssai_PDUSessModSR": 227.49259, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vi_plmnId_snssai_AMFMaxRegNbr": 45, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vd_plmnId_snssai_UTSNSI": 82.052114, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vd_plmnId_snssai_DTSNSI": 68.191541, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vd_plmnId_snssai_PDUSesMeanNbr": 479.439001, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vi_plmnId_snssai_PDUSesMaxNbr": 33, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vi_plmnId_snssai_ULIpv4PacketsDr": 250, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vi_plmnId_snssai_ULIpv6PacketsDr": 134, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vi_plmnId_snssai_DLIpv6PacketsDr": 208, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vi_plmnId_snssai_DLUnstrPacketsDr": 363, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vi_plmnId_snssai_ULUnstrPacketsDr": 276, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vd_plmnId_snssai_PFCPSessEstFR": 207.946349, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:3-3001::plmnId:302-221::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-221", "c_snssai": "3-3001", "vd_plmnId_snssai_PFCPSessModFR": 479.469395, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001236"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vd_plmnId_snssai_PartialDRBAccessibility": 302.109565, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vd_plmnId_snssai_DLLat_gNB_DU": 367.569616, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vd_plmnId_snssai_DLDelay_GnbDu": 42.853094, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vd_plmnId_snssai_DlUeThroughput": 485.20803, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"UlUeThroughput@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vd_plmnId_snssai_UlUeThroughput": 445.863786, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"GRANGOSR@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vd_plmnId_snssai_GRANGOSR": 162.023229, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vd_plmnId_snssai_5GSEPHOSR": 26.434101, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vi_plmnId_snssai_AMFMeanRegNbr": 142, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vd_plmnId_snssai_PDUSessionEstSR": 193.000712, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vd_plmnId_snssai_PDUSessModSR": 437.358976, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vi_plmnId_snssai_AMFMaxRegNbr": 28, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vd_plmnId_snssai_UTSNSI": 254.363999, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vd_plmnId_snssai_DTSNSI": 154.114783, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vd_plmnId_snssai_PDUSesMeanNbr": 286.465444, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vi_plmnId_snssai_PDUSesMaxNbr": 104, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vi_plmnId_snssai_ULIpv4PacketsDr": 52, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vi_plmnId_snssai_ULIpv6PacketsDr": 255, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vi_plmnId_snssai_DLIpv6PacketsDr": 106, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vi_plmnId_snssai_DLUnstrPacketsDr": 134, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vi_plmnId_snssai_ULUnstrPacketsDr": 388, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vd_plmnId_snssai_PFCPSessEstFR": 95.279384, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:1-4000::plmnId:302-222::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-222", "c_snssai": "1-4000", "vd_plmnId_snssai_PFCPSessModFR": 230.361767, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001118", "fk_end_timestamp": "1717001190"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vd_plmnId_snssai_PartialDRBAccessibility": 57.353951, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vd_plmnId_snssai_DLLat_gNB_DU": 54.680902, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vd_plmnId_snssai_DLDelay_GnbDu": 213.992962, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vd_plmnId_snssai_DlUeThroughput": 362.475222, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"UlUeThroughput@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vd_plmnId_snssai_UlUeThroughput": 111.937906, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"GRANGOSR@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vd_plmnId_snssai_GRANGOSR": 479.784008, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vd_plmnId_snssai_5GSEPHOSR": 176.224104, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vi_plmnId_snssai_AMFMeanRegNbr": 376, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vd_plmnId_snssai_PDUSessionEstSR": 33.637043, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vd_plmnId_snssai_PDUSessModSR": 40.447509, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vi_plmnId_snssai_AMFMaxRegNbr": 253, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vd_plmnId_snssai_UTSNSI": 412.344994, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vd_plmnId_snssai_DTSNSI": 105.969073, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vd_plmnId_snssai_PDUSesMeanNbr": 446.659477, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vi_plmnId_snssai_PDUSesMaxNbr": 301, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vi_plmnId_snssai_ULIpv4PacketsDr": 449, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vi_plmnId_snssai_ULIpv6PacketsDr": 168, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vi_plmnId_snssai_DLIpv6PacketsDr": 300, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vi_plmnId_snssai_DLUnstrPacketsDr": 297, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vi_plmnId_snssai_ULUnstrPacketsDr": 396, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vd_plmnId_snssai_PFCPSessEstFR": 93.254257, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:2-4000::plmnId:302-610::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-610", "c_snssai": "2-4000", "vd_plmnId_snssai_PFCPSessModFR": 333.226518, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001206", "fk_end_timestamp": "1717001285"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vd_plmnId_snssai_PartialDRBAccessibility": 113.095645, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vd_plmnId_snssai_DLLat_gNB_DU": 467.350786, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vd_plmnId_snssai_DLDelay_GnbDu": 470.206177, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vd_plmnId_snssai_DlUeThroughput": 22.411456, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"UlUeThroughput@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vd_plmnId_snssai_UlUeThroughput": 340.829582, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"GRANGOSR@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vd_plmnId_snssai_GRANGOSR": 113.590128, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vd_plmnId_snssai_5GSEPHOSR": 414.74317, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vi_plmnId_snssai_AMFMeanRegNbr": 457, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vd_plmnId_snssai_PDUSessionEstSR": 178.140583, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vd_plmnId_snssai_PDUSessModSR": 489.465708, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vi_plmnId_snssai_AMFMaxRegNbr": 499, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vd_plmnId_snssai_UTSNSI": 495.802116, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vd_plmnId_snssai_DTSNSI": 53.31841, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vd_plmnId_snssai_PDUSesMeanNbr": 280.936216, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vi_plmnId_snssai_PDUSesMaxNbr": 388, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vi_plmnId_snssai_ULIpv4PacketsDr": 243, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vi_plmnId_snssai_ULIpv6PacketsDr": 264, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vi_plmnId_snssai_DLIpv6PacketsDr": 185, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vi_plmnId_snssai_DLUnstrPacketsDr": 337, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vi_plmnId_snssai_ULUnstrPacketsDr": 370, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vd_plmnId_snssai_PFCPSessEstFR": 363.732924, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:3-2002::plmnId:302-491::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-491", "c_snssai": "3-2002", "vd_plmnId_snssai_PFCPSessModFR": 497.128582, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001286"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vd_plmnId_snssai_PartialDRBAccessibility": 74.822499, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vd_plmnId_snssai_DLLat_gNB_DU": 310.682894, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vd_plmnId_snssai_DLDelay_GnbDu": 122.524645, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vd_plmnId_snssai_DlUeThroughput": 415.961624, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"UlUeThroughput@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vd_plmnId_snssai_UlUeThroughput": 245.902864, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"GRANGOSR@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vd_plmnId_snssai_GRANGOSR": 75.497371, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vd_plmnId_snssai_5GSEPHOSR": 125.386344, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vi_plmnId_snssai_AMFMeanRegNbr": 172, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vd_plmnId_snssai_PDUSessionEstSR": 316.524418, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vd_plmnId_snssai_PDUSessModSR": 127.019437, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vi_plmnId_snssai_AMFMaxRegNbr": 439, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vd_plmnId_snssai_UTSNSI": 416.354631, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vd_plmnId_snssai_DTSNSI": 29.5196, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vd_plmnId_snssai_PDUSesMeanNbr": 378.371004, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vi_plmnId_snssai_PDUSesMaxNbr": 341, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vi_plmnId_snssai_ULIpv4PacketsDr": 480, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vi_plmnId_snssai_ULIpv6PacketsDr": 186, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vi_plmnId_snssai_DLIpv6PacketsDr": 114, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vi_plmnId_snssai_DLUnstrPacketsDr": 147, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vi_plmnId_snssai_ULUnstrPacketsDr": 27, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vd_plmnId_snssai_PFCPSessEstFR": 414.204603, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:4-4002::plmnId:302-220::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-220", "c_snssai": "4-4002", "vd_plmnId_snssai_PFCPSessModFR": 258.082279, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001271", "fk_end_timestamp": "1717001406"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vd_plmnId_snssai_PartialDRBAccessibility": 185.165852, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vd_plmnId_snssai_DLLat_gNB_DU": 9.96876, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vd_plmnId_snssai_DLDelay_GnbDu": 304.772813, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"DlUeThroughput@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vd_plmnId_snssai_DlUeThroughput": 382.549594, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"UlUeThroughput@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vd_plmnId_snssai_UlUeThroughput": 287.83838, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"GRANGOSR@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vd_plmnId_snssai_GRANGOSR": 314.09327, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vd_plmnId_snssai_5GSEPHOSR": 426.372444, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vi_plmnId_snssai_AMFMeanRegNbr": 104, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vd_plmnId_snssai_PDUSessionEstSR": 38.944887, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vd_plmnId_snssai_PDUSessModSR": 359.632997, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vi_plmnId_snssai_AMFMaxRegNbr": 380, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vd_plmnId_snssai_UTSNSI": 187.34284, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vd_plmnId_snssai_DTSNSI": 172.297907, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vd_plmnId_snssai_PDUSesMeanNbr": 266.752926, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vi_plmnId_snssai_PDUSesMaxNbr": 102, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vi_plmnId_snssai_ULIpv4PacketsDr": 379, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vi_plmnId_snssai_ULIpv6PacketsDr": 371, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vi_plmnId_snssai_DLIpv6PacketsDr": 137, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vi_plmnId_snssai_DLUnstrPacketsDr": 487, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vi_plmnId_snssai_ULUnstrPacketsDr": 105, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vd_plmnId_snssai_PFCPSessEstFR": 272.94804, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:3-4000::plmnId:302-860::"}}
{ "full_context": "plmnId_snssai", "context": [ "plmnId", "snssai" ], "c_plmnId": "302-860", "c_snssai": "3-4000", "vd_plmnId_snssai_PFCPSessModFR": 372.215764, "csac_table": "kpi_csac_plmnid_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001393"}
'

