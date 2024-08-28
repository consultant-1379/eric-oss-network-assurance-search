#! /bin/sh

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:1-3001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-3001", "vi_snssai_AMFMeanRegNbr": 1, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001000", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:1-3001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-3001", "vd_snssai_PDUSessionEstSR": 472.562835, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001000", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:1-3001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-3001", "vd_snssai_PDUSessModSR": 46.772413, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001000", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:1-3001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-3001", "vi_snssai_AMFMaxRegNbr": 62, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001000", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:1-3001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-3001", "vd_snssai_UTSNSI": 93.620635, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001000", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:1-3001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-3001", "vd_snssai_DTSNSI": 348.397115, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001000", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:1-3001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-3001", "vd_snssai_PDUSesMeanNbr": 339.485353, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001000", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:1-3001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-3001", "vi_snssai_PDUSesMaxNbr": 237, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001000", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:1-3001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-3001", "vi_snssai_ULIpv4PacketsDr": 102, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001000", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:1-3001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-3001", "vi_snssai_DLIpv4PacketsDr": 151, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001000", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:1-3001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-3001", "vi_snssai_ULIpv6PacketsDr": 30, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001000", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:1-3001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-3001", "vi_snssai_DLIpv6PacketsDr": 427, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001000", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:1-3001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-3001", "vi_snssai_DLUnstrPacketsDr": 177, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001000", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:1-3001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-3001", "vi_snssai_ULUnstrPacketsDr": 493, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001000", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:1-3001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-3001", "vd_snssai_PFCPSessEstFR": 461.356681, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001000", "fk_end_timestamp": "1717001082"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:1-3001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-3001", "vd_snssai_PFCPSessModFR": 62.824675, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001000", "fk_end_timestamp": "1717001082"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:2-1001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1001", "vi_snssai_AMFMeanRegNbr": 291, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001125"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:2-1001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1001", "vd_snssai_PDUSessionEstSR": 383.119949, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001125"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:2-1001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1001", "vd_snssai_PDUSessModSR": 477.597673, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001125"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:2-1001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1001", "vi_snssai_AMFMaxRegNbr": 52, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001125"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:2-1001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1001", "vd_snssai_UTSNSI": 469.972591, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001125"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:2-1001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1001", "vd_snssai_DTSNSI": 499.287273, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001125"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:2-1001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1001", "vd_snssai_PDUSesMeanNbr": 119.469597, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001125"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:2-1001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1001", "vi_snssai_PDUSesMaxNbr": 194, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001125"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:2-1001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1001", "vi_snssai_ULIpv4PacketsDr": 3, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001125"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:2-1001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1001", "vi_snssai_DLIpv4PacketsDr": 469, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001125"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:2-1001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1001", "vi_snssai_ULIpv6PacketsDr": 157, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001125"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:2-1001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1001", "vi_snssai_DLIpv6PacketsDr": 183, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001125"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:2-1001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1001", "vi_snssai_DLUnstrPacketsDr": 96, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001125"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:2-1001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1001", "vi_snssai_ULUnstrPacketsDr": 5, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001125"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:2-1001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1001", "vd_snssai_PFCPSessEstFR": 480.138086, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001125"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:2-1001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1001", "vd_snssai_PFCPSessModFR": 269.656889, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001065", "fk_end_timestamp": "1717001125"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:2-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1002", "vi_snssai_AMFMeanRegNbr": 154, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001055", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:2-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1002", "vd_snssai_PDUSessionEstSR": 263.575374, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001055", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:2-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1002", "vd_snssai_PDUSessModSR": 421.809384, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001055", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:2-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1002", "vi_snssai_AMFMaxRegNbr": 406, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001055", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:2-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1002", "vd_snssai_UTSNSI": 469.283304, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001055", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:2-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1002", "vd_snssai_DTSNSI": 343.383326, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001055", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:2-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1002", "vd_snssai_PDUSesMeanNbr": 166.756658, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001055", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:2-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1002", "vi_snssai_PDUSesMaxNbr": 352, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001055", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:2-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1002", "vi_snssai_ULIpv4PacketsDr": 70, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001055", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:2-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1002", "vi_snssai_DLIpv4PacketsDr": 147, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001055", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:2-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1002", "vi_snssai_ULIpv6PacketsDr": 243, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001055", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:2-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1002", "vi_snssai_DLIpv6PacketsDr": 58, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001055", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:2-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1002", "vi_snssai_DLUnstrPacketsDr": 32, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001055", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:2-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1002", "vi_snssai_ULUnstrPacketsDr": 483, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001055", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:2-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1002", "vd_snssai_PFCPSessEstFR": 40.063047, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001055", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:2-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-1002", "vd_snssai_PFCPSessModFR": 357.545615, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001055", "fk_end_timestamp": "1717001169"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:2-2000::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-2000", "vi_snssai_AMFMeanRegNbr": 322, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001056", "fk_end_timestamp": "1717001164"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:2-2000::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-2000", "vd_snssai_PDUSessionEstSR": 88.716674, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001056", "fk_end_timestamp": "1717001164"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:2-2000::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-2000", "vd_snssai_PDUSessModSR": 356.066626, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001056", "fk_end_timestamp": "1717001164"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:2-2000::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-2000", "vi_snssai_AMFMaxRegNbr": 34, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001056", "fk_end_timestamp": "1717001164"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:2-2000::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-2000", "vd_snssai_UTSNSI": 460.137944, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001056", "fk_end_timestamp": "1717001164"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:2-2000::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-2000", "vd_snssai_DTSNSI": 127.591684, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001056", "fk_end_timestamp": "1717001164"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:2-2000::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-2000", "vd_snssai_PDUSesMeanNbr": 239.021369, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001056", "fk_end_timestamp": "1717001164"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:2-2000::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-2000", "vi_snssai_PDUSesMaxNbr": 326, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001056", "fk_end_timestamp": "1717001164"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:2-2000::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-2000", "vi_snssai_ULIpv4PacketsDr": 396, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001056", "fk_end_timestamp": "1717001164"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:2-2000::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-2000", "vi_snssai_DLIpv4PacketsDr": 327, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001056", "fk_end_timestamp": "1717001164"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:2-2000::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-2000", "vi_snssai_ULIpv6PacketsDr": 356, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001056", "fk_end_timestamp": "1717001164"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:2-2000::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-2000", "vi_snssai_DLIpv6PacketsDr": 451, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001056", "fk_end_timestamp": "1717001164"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:2-2000::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-2000", "vi_snssai_DLUnstrPacketsDr": 267, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001056", "fk_end_timestamp": "1717001164"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:2-2000::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-2000", "vi_snssai_ULUnstrPacketsDr": 245, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001056", "fk_end_timestamp": "1717001164"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:2-2000::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-2000", "vd_snssai_PFCPSessEstFR": 293.062841, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001056", "fk_end_timestamp": "1717001164"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:2-2000::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-2000", "vd_snssai_PFCPSessModFR": 286.40732, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001056", "fk_end_timestamp": "1717001164"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:2-4001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4001", "vi_snssai_AMFMeanRegNbr": 170, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001107", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:2-4001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4001", "vd_snssai_PDUSessionEstSR": 95.433729, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001107", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:2-4001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4001", "vd_snssai_PDUSessModSR": 135.626204, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001107", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:2-4001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4001", "vi_snssai_AMFMaxRegNbr": 381, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001107", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:2-4001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4001", "vd_snssai_UTSNSI": 362.326418, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001107", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:2-4001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4001", "vd_snssai_DTSNSI": 296.720931, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001107", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:2-4001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4001", "vd_snssai_PDUSesMeanNbr": 95.205503, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001107", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:2-4001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4001", "vi_snssai_PDUSesMaxNbr": 109, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001107", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:2-4001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4001", "vi_snssai_ULIpv4PacketsDr": 475, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001107", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:2-4001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4001", "vi_snssai_DLIpv4PacketsDr": 129, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001107", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:2-4001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4001", "vi_snssai_ULIpv6PacketsDr": 268, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001107", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:2-4001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4001", "vi_snssai_DLIpv6PacketsDr": 204, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001107", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:2-4001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4001", "vi_snssai_DLUnstrPacketsDr": 447, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001107", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:2-4001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4001", "vi_snssai_ULUnstrPacketsDr": 306, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001107", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:2-4001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4001", "vd_snssai_PFCPSessEstFR": 417.806746, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001107", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:2-4001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4001", "vd_snssai_PFCPSessModFR": 174.887076, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001107", "fk_end_timestamp": "1717001190"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:3-2001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2001", "vi_snssai_AMFMeanRegNbr": 482, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001103", "fk_end_timestamp": "1717001158"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:3-2001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2001", "vd_snssai_PDUSessionEstSR": 95.815575, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001103", "fk_end_timestamp": "1717001158"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:3-2001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2001", "vd_snssai_PDUSessModSR": 182.239904, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001103", "fk_end_timestamp": "1717001158"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:3-2001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2001", "vi_snssai_AMFMaxRegNbr": 74, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001103", "fk_end_timestamp": "1717001158"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:3-2001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2001", "vd_snssai_UTSNSI": 414.738615, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001103", "fk_end_timestamp": "1717001158"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:3-2001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2001", "vd_snssai_DTSNSI": 197.790761, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001103", "fk_end_timestamp": "1717001158"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:3-2001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2001", "vd_snssai_PDUSesMeanNbr": 428.075597, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001103", "fk_end_timestamp": "1717001158"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:3-2001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2001", "vi_snssai_PDUSesMaxNbr": 434, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001103", "fk_end_timestamp": "1717001158"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:3-2001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2001", "vi_snssai_ULIpv4PacketsDr": 339, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001103", "fk_end_timestamp": "1717001158"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:3-2001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2001", "vi_snssai_DLIpv4PacketsDr": 110, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001103", "fk_end_timestamp": "1717001158"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:3-2001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2001", "vi_snssai_ULIpv6PacketsDr": 114, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001103", "fk_end_timestamp": "1717001158"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:3-2001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2001", "vi_snssai_DLIpv6PacketsDr": 483, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001103", "fk_end_timestamp": "1717001158"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:3-2001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2001", "vi_snssai_DLUnstrPacketsDr": 239, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001103", "fk_end_timestamp": "1717001158"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:3-2001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2001", "vi_snssai_ULUnstrPacketsDr": 239, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001103", "fk_end_timestamp": "1717001158"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:3-2001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2001", "vd_snssai_PFCPSessEstFR": 130.394699, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001103", "fk_end_timestamp": "1717001158"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:3-2001::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2001", "vd_snssai_PFCPSessModFR": 259.84993, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001103", "fk_end_timestamp": "1717001158"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:3-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-1002", "vi_snssai_AMFMeanRegNbr": 460, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001117", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:3-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-1002", "vd_snssai_PDUSessionEstSR": 325.625282, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001117", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:3-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-1002", "vd_snssai_PDUSessModSR": 101.127418, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001117", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:3-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-1002", "vi_snssai_AMFMaxRegNbr": 153, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001117", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:3-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-1002", "vd_snssai_UTSNSI": 168.285495, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001117", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:3-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-1002", "vd_snssai_DTSNSI": 326.20979, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001117", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:3-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-1002", "vd_snssai_PDUSesMeanNbr": 166.721401, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001117", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:3-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-1002", "vi_snssai_PDUSesMaxNbr": 310, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001117", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:3-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-1002", "vi_snssai_ULIpv4PacketsDr": 400, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001117", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:3-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-1002", "vi_snssai_DLIpv4PacketsDr": 370, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001117", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:3-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-1002", "vi_snssai_ULIpv6PacketsDr": 193, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001117", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:3-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-1002", "vi_snssai_DLIpv6PacketsDr": 158, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001117", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:3-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-1002", "vi_snssai_DLUnstrPacketsDr": 342, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001117", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:3-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-1002", "vi_snssai_ULUnstrPacketsDr": 496, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001117", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:3-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-1002", "vd_snssai_PFCPSessEstFR": 331.848069, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001117", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:3-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-1002", "vd_snssai_PFCPSessModFR": 428.514401, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001117", "fk_end_timestamp": "1717001190"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:1-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-1002", "vi_snssai_AMFMeanRegNbr": 359, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:1-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-1002", "vd_snssai_PDUSessionEstSR": 279.852541, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:1-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-1002", "vd_snssai_PDUSessModSR": 78.447339, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:1-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-1002", "vi_snssai_AMFMaxRegNbr": 339, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:1-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-1002", "vd_snssai_UTSNSI": 467.60391, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:1-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-1002", "vd_snssai_DTSNSI": 232.248867, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:1-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-1002", "vd_snssai_PDUSesMeanNbr": 58.80941, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:1-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-1002", "vi_snssai_PDUSesMaxNbr": 402, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:1-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-1002", "vi_snssai_ULIpv4PacketsDr": 435, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:1-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-1002", "vi_snssai_DLIpv4PacketsDr": 301, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:1-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-1002", "vi_snssai_ULIpv6PacketsDr": 174, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:1-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-1002", "vi_snssai_DLIpv6PacketsDr": 141, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:1-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-1002", "vi_snssai_DLUnstrPacketsDr": 398, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:1-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-1002", "vi_snssai_ULUnstrPacketsDr": 340, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:1-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-1002", "vd_snssai_PFCPSessEstFR": 403.735679, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001305"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:1-1002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-1002", "vd_snssai_PFCPSessModFR": 99.678834, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001174", "fk_end_timestamp": "1717001305"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_AMFMeanRegNbr": 247, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001218", "fk_end_timestamp": "1717001377"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vd_snssai_PDUSessionEstSR": 467.368037, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001218", "fk_end_timestamp": "1717001377"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vd_snssai_PDUSessModSR": 404.808814, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001218", "fk_end_timestamp": "1717001377"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_AMFMaxRegNbr": 37, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001218", "fk_end_timestamp": "1717001377"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vd_snssai_UTSNSI": 291.615249, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001218", "fk_end_timestamp": "1717001377"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vd_snssai_DTSNSI": 19.689126, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001218", "fk_end_timestamp": "1717001377"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vd_snssai_PDUSesMeanNbr": 436.098647, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001218", "fk_end_timestamp": "1717001377"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_PDUSesMaxNbr": 301, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001218", "fk_end_timestamp": "1717001377"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_ULIpv4PacketsDr": 171, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001218", "fk_end_timestamp": "1717001377"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_DLIpv4PacketsDr": 30, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001218", "fk_end_timestamp": "1717001377"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_ULIpv6PacketsDr": 270, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001218", "fk_end_timestamp": "1717001377"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_DLIpv6PacketsDr": 109, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001218", "fk_end_timestamp": "1717001377"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_DLUnstrPacketsDr": 439, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001218", "fk_end_timestamp": "1717001377"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_ULUnstrPacketsDr": 384, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001218", "fk_end_timestamp": "1717001377"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vd_snssai_PFCPSessEstFR": 125.655045, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001218", "fk_end_timestamp": "1717001377"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vd_snssai_PFCPSessModFR": 302.603803, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001218", "fk_end_timestamp": "1717001377"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_AMFMeanRegNbr": 499, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001268", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vd_snssai_PDUSessionEstSR": 406.248038, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001268", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vd_snssai_PDUSessModSR": 453.330532, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001268", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_AMFMaxRegNbr": 244, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001268", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vd_snssai_UTSNSI": 367.356573, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001268", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vd_snssai_DTSNSI": 355.207908, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001268", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vd_snssai_PDUSesMeanNbr": 343.255146, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001268", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_PDUSesMaxNbr": 25, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001268", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_ULIpv4PacketsDr": 426, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001268", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_DLIpv4PacketsDr": 486, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001268", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_ULIpv6PacketsDr": 118, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001268", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_DLIpv6PacketsDr": 264, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001268", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_DLUnstrPacketsDr": 110, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001268", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vi_snssai_ULUnstrPacketsDr": 162, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001268", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vd_snssai_PFCPSessEstFR": 290.797447, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001268", "fk_end_timestamp": "1717001306"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:3-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "3-2002", "vd_snssai_PFCPSessModFR": 377.575887, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001268", "fk_end_timestamp": "1717001306"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:1-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-2002", "vi_snssai_AMFMeanRegNbr": 20, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001386"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:1-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-2002", "vd_snssai_PDUSessionEstSR": 418.850357, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001386"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:1-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-2002", "vd_snssai_PDUSessModSR": 1.044797, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001386"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:1-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-2002", "vi_snssai_AMFMaxRegNbr": 218, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001386"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:1-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-2002", "vd_snssai_UTSNSI": 359.579514, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001386"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:1-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-2002", "vd_snssai_DTSNSI": 47.394997, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001386"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:1-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-2002", "vd_snssai_PDUSesMeanNbr": 264.539192, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001386"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:1-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-2002", "vi_snssai_PDUSesMaxNbr": 177, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001386"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:1-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-2002", "vi_snssai_ULIpv4PacketsDr": 273, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001386"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:1-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-2002", "vi_snssai_DLIpv4PacketsDr": 388, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001386"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:1-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-2002", "vi_snssai_ULIpv6PacketsDr": 411, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001386"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:1-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-2002", "vi_snssai_DLIpv6PacketsDr": 164, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001386"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:1-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-2002", "vi_snssai_DLUnstrPacketsDr": 357, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001386"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:1-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-2002", "vi_snssai_ULUnstrPacketsDr": 410, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001386"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:1-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-2002", "vd_snssai_PFCPSessEstFR": 244.38224, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001386"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:1-2002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "1-2002", "vd_snssai_PFCPSessModFR": 439.755717, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001223", "fk_end_timestamp": "1717001386"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:2-3002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-3002", "vi_snssai_AMFMeanRegNbr": 357, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001332", "fk_end_timestamp": "1717001474"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:2-3002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-3002", "vd_snssai_PDUSessionEstSR": 18.867016, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001332", "fk_end_timestamp": "1717001474"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:2-3002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-3002", "vd_snssai_PDUSessModSR": 240.167726, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001332", "fk_end_timestamp": "1717001474"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:2-3002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-3002", "vi_snssai_AMFMaxRegNbr": 143, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001332", "fk_end_timestamp": "1717001474"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:2-3002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-3002", "vd_snssai_UTSNSI": 241.150474, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001332", "fk_end_timestamp": "1717001474"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:2-3002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-3002", "vd_snssai_DTSNSI": 305.390375, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001332", "fk_end_timestamp": "1717001474"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:2-3002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-3002", "vd_snssai_PDUSesMeanNbr": 174.312436, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001332", "fk_end_timestamp": "1717001474"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:2-3002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-3002", "vi_snssai_PDUSesMaxNbr": 189, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001332", "fk_end_timestamp": "1717001474"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:2-3002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-3002", "vi_snssai_ULIpv4PacketsDr": 30, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001332", "fk_end_timestamp": "1717001474"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:2-3002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-3002", "vi_snssai_DLIpv4PacketsDr": 402, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001332", "fk_end_timestamp": "1717001474"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:2-3002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-3002", "vi_snssai_ULIpv6PacketsDr": 1, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001332", "fk_end_timestamp": "1717001474"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:2-3002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-3002", "vi_snssai_DLIpv6PacketsDr": 73, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001332", "fk_end_timestamp": "1717001474"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:2-3002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-3002", "vi_snssai_DLUnstrPacketsDr": 211, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001332", "fk_end_timestamp": "1717001474"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:2-3002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-3002", "vi_snssai_ULUnstrPacketsDr": 355, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001332", "fk_end_timestamp": "1717001474"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:2-3002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-3002", "vd_snssai_PFCPSessEstFR": 488.989934, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001332", "fk_end_timestamp": "1717001474"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:2-3002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-3002", "vd_snssai_PFCPSessModFR": 342.54851, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001332", "fk_end_timestamp": "1717001474"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:2-4002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4002", "vi_snssai_AMFMeanRegNbr": 276, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001344"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:2-4002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4002", "vd_snssai_PDUSessionEstSR": 79.531106, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001344"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:2-4002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4002", "vd_snssai_PDUSessModSR": 486.590274, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001344"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:2-4002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4002", "vi_snssai_AMFMaxRegNbr": 224, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001344"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:2-4002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4002", "vd_snssai_UTSNSI": 240.71343, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001344"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:2-4002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4002", "vd_snssai_DTSNSI": 433.832208, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001344"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:2-4002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4002", "vd_snssai_PDUSesMeanNbr": 316.432035, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001344"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:2-4002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4002", "vi_snssai_PDUSesMaxNbr": 253, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001344"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:2-4002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4002", "vi_snssai_ULIpv4PacketsDr": 258, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001344"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:2-4002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4002", "vi_snssai_DLIpv4PacketsDr": 67, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001344"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:2-4002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4002", "vi_snssai_ULIpv6PacketsDr": 372, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001344"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:2-4002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4002", "vi_snssai_DLIpv6PacketsDr": 47, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001344"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:2-4002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4002", "vi_snssai_DLUnstrPacketsDr": 479, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001344"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:2-4002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4002", "vi_snssai_ULUnstrPacketsDr": 53, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001344"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:2-4002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4002", "vd_snssai_PFCPSessEstFR": 29.410834, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001344"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:2-4002::"}}
{ "full_context": "snssai", "context": [ "snssai" ], "c_snssai": "2-4002", "vd_snssai_PFCPSessModFR": 169.378799, "csac_table": "kpi_csac_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001296", "fk_end_timestamp": "1717001344"}
'

