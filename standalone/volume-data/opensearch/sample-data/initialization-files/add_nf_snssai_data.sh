#! /bin/sh

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:4-4000::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4000", "vi_nf_snssai_AMFMeanRegNbr": 150, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001188"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:4-4000::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4000", "vd_nf_snssai_PDUSessionEstSR": 305.445499, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001188"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:4-4000::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4000", "vd_nf_snssai_PDUSessModSR": 455.100594, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001188"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:4-4000::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4000", "vi_nf_snssai_AMFMaxRegNbr": 262, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001188"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:4-4000::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4000", "vd_nf_snssai_UTSNSI": 93.857593, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001188"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:4-4000::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4000", "vd_nf_snssai_DTSNSI": 339.107639, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001188"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:4-4000::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4000", "vd_nf_snssai_PDUSesMeanNbr": 385.472454, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001188"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:4-4000::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4000", "vi_nf_snssai_PDUSesMaxNbr": 177, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001188"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:4-4000::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4000", "vi_nf_snssai_ULIpv4PacketsDr": 17, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001188"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:4-4000::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4000", "vi_nf_snssai_DLIpv4PacketsDr": 351, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001188"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:4-4000::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4000", "vi_nf_snssai_ULIpv6PacketsDr": 87, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001188"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:4-4000::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4000", "vi_nf_snssai_DLIpv6PacketsDr": 67, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001188"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:4-4000::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4000", "vi_nf_snssai_DLUnstrPacketsDr": 121, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001188"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:4-4000::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4000", "vi_nf_snssai_ULUnstrPacketsDr": 207, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001188"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:4-4000::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4000", "vd_nf_snssai_PFCPSessEstFR": 176.727321, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001188"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:4-4000::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4000", "vd_nf_snssai_PFCPSessModFR": 75.275257, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001037", "fk_end_timestamp": "1717001188"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:4-4002::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-4002", "vi_nf_snssai_AMFMeanRegNbr": 51, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717000998", "fk_end_timestamp": "1717001054"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:4-4002::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-4002", "vd_nf_snssai_PDUSessionEstSR": 225.284239, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717000998", "fk_end_timestamp": "1717001054"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:4-4002::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-4002", "vd_nf_snssai_PDUSessModSR": 440.34841, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717000998", "fk_end_timestamp": "1717001054"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:4-4002::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-4002", "vi_nf_snssai_AMFMaxRegNbr": 99, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717000998", "fk_end_timestamp": "1717001054"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:4-4002::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-4002", "vd_nf_snssai_UTSNSI": 248.323344, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717000998", "fk_end_timestamp": "1717001054"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:4-4002::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-4002", "vd_nf_snssai_DTSNSI": 35.233603, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717000998", "fk_end_timestamp": "1717001054"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:4-4002::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-4002", "vd_nf_snssai_PDUSesMeanNbr": 453.183449, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717000998", "fk_end_timestamp": "1717001054"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:4-4002::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-4002", "vi_nf_snssai_PDUSesMaxNbr": 240, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717000998", "fk_end_timestamp": "1717001054"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:4-4002::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-4002", "vi_nf_snssai_ULIpv4PacketsDr": 225, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717000998", "fk_end_timestamp": "1717001054"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:4-4002::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-4002", "vi_nf_snssai_DLIpv4PacketsDr": 37, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717000998", "fk_end_timestamp": "1717001054"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:4-4002::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-4002", "vi_nf_snssai_ULIpv6PacketsDr": 485, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717000998", "fk_end_timestamp": "1717001054"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:4-4002::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-4002", "vi_nf_snssai_DLIpv6PacketsDr": 459, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717000998", "fk_end_timestamp": "1717001054"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:4-4002::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-4002", "vi_nf_snssai_DLUnstrPacketsDr": 242, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717000998", "fk_end_timestamp": "1717001054"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:4-4002::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-4002", "vi_nf_snssai_ULUnstrPacketsDr": 8, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717000998", "fk_end_timestamp": "1717001054"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:4-4002::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-4002", "vd_nf_snssai_PFCPSessEstFR": 447.498362, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717000998", "fk_end_timestamp": "1717001054"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:4-4002::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-4002", "vd_nf_snssai_PFCPSessModFR": 343.423376, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717000998", "fk_end_timestamp": "1717001054"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_AMFMeanRegNbr": 25, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001049", "fk_end_timestamp": "1717001182"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vd_nf_snssai_PDUSessionEstSR": 351.450848, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001049", "fk_end_timestamp": "1717001182"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vd_nf_snssai_PDUSessModSR": 115.320483, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001049", "fk_end_timestamp": "1717001182"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_AMFMaxRegNbr": 9, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001049", "fk_end_timestamp": "1717001182"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vd_nf_snssai_UTSNSI": 86.082399, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001049", "fk_end_timestamp": "1717001182"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vd_nf_snssai_DTSNSI": 59.750672, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001049", "fk_end_timestamp": "1717001182"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vd_nf_snssai_PDUSesMeanNbr": 473.693722, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001049", "fk_end_timestamp": "1717001182"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_PDUSesMaxNbr": 89, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001049", "fk_end_timestamp": "1717001182"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_ULIpv4PacketsDr": 305, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001049", "fk_end_timestamp": "1717001182"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_DLIpv4PacketsDr": 174, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001049", "fk_end_timestamp": "1717001182"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_ULIpv6PacketsDr": 444, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001049", "fk_end_timestamp": "1717001182"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_DLIpv6PacketsDr": 453, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001049", "fk_end_timestamp": "1717001182"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_DLUnstrPacketsDr": 87, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001049", "fk_end_timestamp": "1717001182"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_ULUnstrPacketsDr": 238, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001049", "fk_end_timestamp": "1717001182"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vd_nf_snssai_PFCPSessEstFR": 260.850655, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001049", "fk_end_timestamp": "1717001182"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vd_nf_snssai_PFCPSessModFR": 123.872138, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001049", "fk_end_timestamp": "1717001182"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:4-2002::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2002", "vi_nf_snssai_AMFMeanRegNbr": 265, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001050", "fk_end_timestamp": "1717001202"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:4-2002::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2002", "vd_nf_snssai_PDUSessionEstSR": 150.457909, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001050", "fk_end_timestamp": "1717001202"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:4-2002::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2002", "vd_nf_snssai_PDUSessModSR": 171.762848, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001050", "fk_end_timestamp": "1717001202"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:4-2002::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2002", "vi_nf_snssai_AMFMaxRegNbr": 354, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001050", "fk_end_timestamp": "1717001202"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:4-2002::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2002", "vd_nf_snssai_UTSNSI": 455.674285, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001050", "fk_end_timestamp": "1717001202"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:4-2002::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2002", "vd_nf_snssai_DTSNSI": 485.858202, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001050", "fk_end_timestamp": "1717001202"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:4-2002::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2002", "vd_nf_snssai_PDUSesMeanNbr": 154.34309, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001050", "fk_end_timestamp": "1717001202"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:4-2002::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2002", "vi_nf_snssai_PDUSesMaxNbr": 459, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001050", "fk_end_timestamp": "1717001202"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:4-2002::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2002", "vi_nf_snssai_ULIpv4PacketsDr": 358, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001050", "fk_end_timestamp": "1717001202"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:4-2002::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2002", "vi_nf_snssai_DLIpv4PacketsDr": 117, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001050", "fk_end_timestamp": "1717001202"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:4-2002::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2002", "vi_nf_snssai_ULIpv6PacketsDr": 228, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001050", "fk_end_timestamp": "1717001202"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:4-2002::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2002", "vi_nf_snssai_DLIpv6PacketsDr": 411, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001050", "fk_end_timestamp": "1717001202"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:4-2002::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2002", "vi_nf_snssai_DLUnstrPacketsDr": 458, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001050", "fk_end_timestamp": "1717001202"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:4-2002::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2002", "vi_nf_snssai_ULUnstrPacketsDr": 82, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001050", "fk_end_timestamp": "1717001202"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:4-2002::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2002", "vd_nf_snssai_PFCPSessEstFR": 154.828341, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001050", "fk_end_timestamp": "1717001202"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:4-2002::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2002", "vd_nf_snssai_PFCPSessModFR": 195.513132, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001050", "fk_end_timestamp": "1717001202"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_AMFMeanRegNbr": 84, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001090", "fk_end_timestamp": "1717001179"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vd_nf_snssai_PDUSessionEstSR": 241.559828, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001090", "fk_end_timestamp": "1717001179"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vd_nf_snssai_PDUSessModSR": 198.35235, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001090", "fk_end_timestamp": "1717001179"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_AMFMaxRegNbr": 428, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001090", "fk_end_timestamp": "1717001179"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vd_nf_snssai_UTSNSI": 189.418364, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001090", "fk_end_timestamp": "1717001179"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vd_nf_snssai_DTSNSI": 74.944033, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001090", "fk_end_timestamp": "1717001179"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vd_nf_snssai_PDUSesMeanNbr": 12.365567, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001090", "fk_end_timestamp": "1717001179"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_PDUSesMaxNbr": 205, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001090", "fk_end_timestamp": "1717001179"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_ULIpv4PacketsDr": 418, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001090", "fk_end_timestamp": "1717001179"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_DLIpv4PacketsDr": 255, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001090", "fk_end_timestamp": "1717001179"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_ULIpv6PacketsDr": 445, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001090", "fk_end_timestamp": "1717001179"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_DLIpv6PacketsDr": 179, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001090", "fk_end_timestamp": "1717001179"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_DLUnstrPacketsDr": 356, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001090", "fk_end_timestamp": "1717001179"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vi_nf_snssai_ULUnstrPacketsDr": 411, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001090", "fk_end_timestamp": "1717001179"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vd_nf_snssai_PFCPSessEstFR": 161.35812, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001090", "fk_end_timestamp": "1717001179"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:3-3000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "3-3000", "vd_nf_snssai_PFCPSessModFR": 442.599571, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001090", "fk_end_timestamp": "1717001179"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:4-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-3000", "vi_nf_snssai_AMFMeanRegNbr": 17, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001234"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:4-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-3000", "vd_nf_snssai_PDUSessionEstSR": 411.300963, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001234"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:4-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-3000", "vd_nf_snssai_PDUSessModSR": 23.72325, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001234"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:4-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-3000", "vi_nf_snssai_AMFMaxRegNbr": 261, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001234"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:4-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-3000", "vd_nf_snssai_UTSNSI": 12.289383, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001234"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:4-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-3000", "vd_nf_snssai_DTSNSI": 418.688525, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001234"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:4-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-3000", "vd_nf_snssai_PDUSesMeanNbr": 5.324483, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001234"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:4-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-3000", "vi_nf_snssai_PDUSesMaxNbr": 129, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001234"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:4-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-3000", "vi_nf_snssai_ULIpv4PacketsDr": 358, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001234"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:4-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-3000", "vi_nf_snssai_DLIpv4PacketsDr": 316, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001234"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:4-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-3000", "vi_nf_snssai_ULIpv6PacketsDr": 115, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001234"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:4-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-3000", "vi_nf_snssai_DLIpv6PacketsDr": 382, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001234"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:4-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-3000", "vi_nf_snssai_DLUnstrPacketsDr": 66, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001234"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:4-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-3000", "vi_nf_snssai_ULUnstrPacketsDr": 303, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001234"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:4-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-3000", "vd_nf_snssai_PFCPSessEstFR": 296.844164, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001234"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:4-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-3000", "vd_nf_snssai_PFCPSessModFR": 48.289632, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001124", "fk_end_timestamp": "1717001234"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:2-2001::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-2001", "vi_nf_snssai_AMFMeanRegNbr": 175, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001320"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:2-2001::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-2001", "vd_nf_snssai_PDUSessionEstSR": 97.924744, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001320"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:2-2001::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-2001", "vd_nf_snssai_PDUSessModSR": 468.728337, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001320"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:2-2001::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-2001", "vi_nf_snssai_AMFMaxRegNbr": 162, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001320"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:2-2001::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-2001", "vd_nf_snssai_UTSNSI": 264.203345, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001320"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:2-2001::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-2001", "vd_nf_snssai_DTSNSI": 353.745206, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001320"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:2-2001::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-2001", "vd_nf_snssai_PDUSesMeanNbr": 466.938764, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001320"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:2-2001::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-2001", "vi_nf_snssai_PDUSesMaxNbr": 223, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001320"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:2-2001::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-2001", "vi_nf_snssai_ULIpv4PacketsDr": 135, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001320"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:2-2001::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-2001", "vi_nf_snssai_DLIpv4PacketsDr": 249, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001320"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:2-2001::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-2001", "vi_nf_snssai_ULIpv6PacketsDr": 305, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001320"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:2-2001::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-2001", "vi_nf_snssai_DLIpv6PacketsDr": 100, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001320"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:2-2001::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-2001", "vi_nf_snssai_DLUnstrPacketsDr": 253, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001320"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:2-2001::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-2001", "vi_nf_snssai_ULUnstrPacketsDr": 256, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001320"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:2-2001::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-2001", "vd_nf_snssai_PFCPSessEstFR": 318.361063, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001320"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:2-2001::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-2001", "vd_nf_snssai_PFCPSessModFR": 342.117165, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001196", "fk_end_timestamp": "1717001320"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:4-2000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-2000", "vi_nf_snssai_AMFMeanRegNbr": 50, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001182", "fk_end_timestamp": "1717001229"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:4-2000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-2000", "vd_nf_snssai_PDUSessionEstSR": 65.906781, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001182", "fk_end_timestamp": "1717001229"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:4-2000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-2000", "vd_nf_snssai_PDUSessModSR": 275.340124, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001182", "fk_end_timestamp": "1717001229"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:4-2000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-2000", "vi_nf_snssai_AMFMaxRegNbr": 311, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001182", "fk_end_timestamp": "1717001229"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:4-2000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-2000", "vd_nf_snssai_UTSNSI": 90.321185, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001182", "fk_end_timestamp": "1717001229"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:4-2000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-2000", "vd_nf_snssai_DTSNSI": 402.009165, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001182", "fk_end_timestamp": "1717001229"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:4-2000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-2000", "vd_nf_snssai_PDUSesMeanNbr": 67.041965, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001182", "fk_end_timestamp": "1717001229"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:4-2000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-2000", "vi_nf_snssai_PDUSesMaxNbr": 398, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001182", "fk_end_timestamp": "1717001229"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:4-2000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-2000", "vi_nf_snssai_ULIpv4PacketsDr": 271, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001182", "fk_end_timestamp": "1717001229"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:4-2000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-2000", "vi_nf_snssai_DLIpv4PacketsDr": 212, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001182", "fk_end_timestamp": "1717001229"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:4-2000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-2000", "vi_nf_snssai_ULIpv6PacketsDr": 367, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001182", "fk_end_timestamp": "1717001229"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:4-2000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-2000", "vi_nf_snssai_DLIpv6PacketsDr": 482, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001182", "fk_end_timestamp": "1717001229"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:4-2000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-2000", "vi_nf_snssai_DLUnstrPacketsDr": 287, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001182", "fk_end_timestamp": "1717001229"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:4-2000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-2000", "vi_nf_snssai_ULUnstrPacketsDr": 232, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001182", "fk_end_timestamp": "1717001229"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:4-2000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-2000", "vd_nf_snssai_PFCPSessEstFR": 141.925939, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001182", "fk_end_timestamp": "1717001229"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:4-2000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "4-2000", "vd_nf_snssai_PFCPSessModFR": 445.905899, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001182", "fk_end_timestamp": "1717001229"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:2-2001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "2-2001", "vi_nf_snssai_AMFMeanRegNbr": 144, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001278"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:2-2001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "2-2001", "vd_nf_snssai_PDUSessionEstSR": 479.258678, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001278"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:2-2001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "2-2001", "vd_nf_snssai_PDUSessModSR": 407.271392, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001278"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:2-2001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "2-2001", "vi_nf_snssai_AMFMaxRegNbr": 113, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001278"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:2-2001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "2-2001", "vd_nf_snssai_UTSNSI": 277.272465, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001278"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:2-2001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "2-2001", "vd_nf_snssai_DTSNSI": 219.414046, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001278"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:2-2001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "2-2001", "vd_nf_snssai_PDUSesMeanNbr": 457.844795, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001278"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:2-2001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "2-2001", "vi_nf_snssai_PDUSesMaxNbr": 309, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001278"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:2-2001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "2-2001", "vi_nf_snssai_ULIpv4PacketsDr": 225, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001278"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:2-2001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "2-2001", "vi_nf_snssai_DLIpv4PacketsDr": 85, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001278"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:2-2001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "2-2001", "vi_nf_snssai_ULIpv6PacketsDr": 380, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001278"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:2-2001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "2-2001", "vi_nf_snssai_DLIpv6PacketsDr": 311, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001278"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:2-2001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "2-2001", "vi_nf_snssai_DLUnstrPacketsDr": 261, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001278"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:2-2001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "2-2001", "vi_nf_snssai_ULUnstrPacketsDr": 230, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001278"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:2-2001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "2-2001", "vd_nf_snssai_PFCPSessEstFR": 1.362156, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001278"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:2-2001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "2-2001", "vd_nf_snssai_PFCPSessModFR": 162.955743, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001211", "fk_end_timestamp": "1717001278"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:4-4002::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4002", "vi_nf_snssai_AMFMeanRegNbr": 209, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001246", "fk_end_timestamp": "1717001277"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:4-4002::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4002", "vd_nf_snssai_PDUSessionEstSR": 327.432708, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001246", "fk_end_timestamp": "1717001277"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:4-4002::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4002", "vd_nf_snssai_PDUSessModSR": 303.331528, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001246", "fk_end_timestamp": "1717001277"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:4-4002::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4002", "vi_nf_snssai_AMFMaxRegNbr": 430, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001246", "fk_end_timestamp": "1717001277"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:4-4002::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4002", "vd_nf_snssai_UTSNSI": 371.273111, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001246", "fk_end_timestamp": "1717001277"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:4-4002::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4002", "vd_nf_snssai_DTSNSI": 315.948574, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001246", "fk_end_timestamp": "1717001277"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:4-4002::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4002", "vd_nf_snssai_PDUSesMeanNbr": 170.584802, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001246", "fk_end_timestamp": "1717001277"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:4-4002::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4002", "vi_nf_snssai_PDUSesMaxNbr": 73, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001246", "fk_end_timestamp": "1717001277"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:4-4002::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4002", "vi_nf_snssai_ULIpv4PacketsDr": 366, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001246", "fk_end_timestamp": "1717001277"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:4-4002::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4002", "vi_nf_snssai_DLIpv4PacketsDr": 165, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001246", "fk_end_timestamp": "1717001277"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:4-4002::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4002", "vi_nf_snssai_ULIpv6PacketsDr": 196, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001246", "fk_end_timestamp": "1717001277"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:4-4002::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4002", "vi_nf_snssai_DLIpv6PacketsDr": 4, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001246", "fk_end_timestamp": "1717001277"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:4-4002::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4002", "vi_nf_snssai_DLUnstrPacketsDr": 463, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001246", "fk_end_timestamp": "1717001277"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:4-4002::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4002", "vi_nf_snssai_ULUnstrPacketsDr": 32, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001246", "fk_end_timestamp": "1717001277"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:4-4002::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4002", "vd_nf_snssai_PFCPSessEstFR": 166.743351, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001246", "fk_end_timestamp": "1717001277"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:4-4002::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "4-4002", "vd_nf_snssai_PFCPSessModFR": 258.021601, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001246", "fk_end_timestamp": "1717001277"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:1-2001::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "1-2001", "vi_nf_snssai_AMFMeanRegNbr": 46, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001274", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:1-2001::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "1-2001", "vd_nf_snssai_PDUSessionEstSR": 339.094561, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001274", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:1-2001::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "1-2001", "vd_nf_snssai_PDUSessModSR": 242.39522, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001274", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:1-2001::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "1-2001", "vi_nf_snssai_AMFMaxRegNbr": 362, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001274", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:1-2001::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "1-2001", "vd_nf_snssai_UTSNSI": 338.443598, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001274", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:1-2001::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "1-2001", "vd_nf_snssai_DTSNSI": 109.783362, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001274", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:1-2001::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "1-2001", "vd_nf_snssai_PDUSesMeanNbr": 203.573121, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001274", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:1-2001::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "1-2001", "vi_nf_snssai_PDUSesMaxNbr": 157, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001274", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:1-2001::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "1-2001", "vi_nf_snssai_ULIpv4PacketsDr": 261, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001274", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:1-2001::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "1-2001", "vi_nf_snssai_DLIpv4PacketsDr": 53, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001274", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:1-2001::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "1-2001", "vi_nf_snssai_ULIpv6PacketsDr": 132, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001274", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:1-2001::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "1-2001", "vi_nf_snssai_DLIpv6PacketsDr": 193, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001274", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:1-2001::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "1-2001", "vi_nf_snssai_DLUnstrPacketsDr": 403, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001274", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:1-2001::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "1-2001", "vi_nf_snssai_ULUnstrPacketsDr": 342, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001274", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:1-2001::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "1-2001", "vd_nf_snssai_PFCPSessEstFR": 418.927356, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001274", "fk_end_timestamp": "1717001319"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:1-2001::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "1-2001", "vd_nf_snssai_PFCPSessModFR": 444.819729, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001274", "fk_end_timestamp": "1717001319"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:4-2000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2000", "vi_nf_snssai_AMFMeanRegNbr": 328, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001302"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:4-2000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2000", "vd_nf_snssai_PDUSessionEstSR": 361.63104, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001302"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:4-2000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2000", "vd_nf_snssai_PDUSessModSR": 282.059781, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001302"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:4-2000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2000", "vi_nf_snssai_AMFMaxRegNbr": 233, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001302"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:4-2000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2000", "vd_nf_snssai_UTSNSI": 66.489349, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001302"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:4-2000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2000", "vd_nf_snssai_DTSNSI": 234.166353, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001302"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:4-2000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2000", "vd_nf_snssai_PDUSesMeanNbr": 170.978111, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001302"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:4-2000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2000", "vi_nf_snssai_PDUSesMaxNbr": 310, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001302"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:4-2000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2000", "vi_nf_snssai_ULIpv4PacketsDr": 478, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001302"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:4-2000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2000", "vi_nf_snssai_DLIpv4PacketsDr": 288, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001302"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:4-2000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2000", "vi_nf_snssai_ULIpv6PacketsDr": 324, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001302"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:4-2000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2000", "vi_nf_snssai_DLIpv6PacketsDr": 292, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001302"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:4-2000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2000", "vi_nf_snssai_DLUnstrPacketsDr": 189, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001302"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:4-2000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2000", "vi_nf_snssai_ULUnstrPacketsDr": 363, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001302"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:4-2000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2000", "vd_nf_snssai_PFCPSessEstFR": 266.215554, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001302"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:4-2000::nf:AMF_ON1::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON1", "c_snssai": "4-2000", "vd_nf_snssai_PFCPSessModFR": 386.902849, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001230", "fk_end_timestamp": "1717001302"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:3-4001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "3-4001", "vi_nf_snssai_AMFMeanRegNbr": 278, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001376"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:3-4001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "3-4001", "vd_nf_snssai_PDUSessionEstSR": 437.950914, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001376"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:3-4001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "3-4001", "vd_nf_snssai_PDUSessModSR": 14.356066, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001376"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:3-4001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "3-4001", "vi_nf_snssai_AMFMaxRegNbr": 297, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001376"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:3-4001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "3-4001", "vd_nf_snssai_UTSNSI": 213.162478, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001376"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:3-4001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "3-4001", "vd_nf_snssai_DTSNSI": 183.439704, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001376"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:3-4001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "3-4001", "vd_nf_snssai_PDUSesMeanNbr": 185.794023, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001376"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:3-4001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "3-4001", "vi_nf_snssai_PDUSesMaxNbr": 168, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001376"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:3-4001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "3-4001", "vi_nf_snssai_ULIpv4PacketsDr": 334, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001376"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:3-4001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "3-4001", "vi_nf_snssai_DLIpv4PacketsDr": 239, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001376"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:3-4001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "3-4001", "vi_nf_snssai_ULIpv6PacketsDr": 157, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001376"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:3-4001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "3-4001", "vi_nf_snssai_DLIpv6PacketsDr": 225, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001376"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:3-4001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "3-4001", "vi_nf_snssai_DLUnstrPacketsDr": 280, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001376"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:3-4001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "3-4001", "vi_nf_snssai_ULUnstrPacketsDr": 453, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001376"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:3-4001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "3-4001", "vd_nf_snssai_PFCPSessEstFR": 35.647672, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001376"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:3-4001::nf:AMF_ON2::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_ON2", "c_snssai": "3-4001", "vd_nf_snssai_PFCPSessModFR": 308.189538, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001334", "fk_end_timestamp": "1717001376"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@snssai:2-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-3000", "vi_nf_snssai_AMFMeanRegNbr": 151, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001293", "fk_end_timestamp": "1717001395"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@snssai:2-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-3000", "vd_nf_snssai_PDUSessionEstSR": 134.641443, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001293", "fk_end_timestamp": "1717001395"}
{"index":{"_index":"soa","_id":"PDUSessModSR@snssai:2-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-3000", "vd_nf_snssai_PDUSessModSR": 315.993167, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001293", "fk_end_timestamp": "1717001395"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@snssai:2-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-3000", "vi_nf_snssai_AMFMaxRegNbr": 141, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001293", "fk_end_timestamp": "1717001395"}
{"index":{"_index":"soa","_id":"UTSNSI@snssai:2-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-3000", "vd_nf_snssai_UTSNSI": 51.028337, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001293", "fk_end_timestamp": "1717001395"}
{"index":{"_index":"soa","_id":"DTSNSI@snssai:2-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-3000", "vd_nf_snssai_DTSNSI": 392.956497, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001293", "fk_end_timestamp": "1717001395"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@snssai:2-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-3000", "vd_nf_snssai_PDUSesMeanNbr": 69.556574, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001293", "fk_end_timestamp": "1717001395"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@snssai:2-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-3000", "vi_nf_snssai_PDUSesMaxNbr": 398, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001293", "fk_end_timestamp": "1717001395"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@snssai:2-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-3000", "vi_nf_snssai_ULIpv4PacketsDr": 422, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001293", "fk_end_timestamp": "1717001395"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@snssai:2-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-3000", "vi_nf_snssai_DLIpv4PacketsDr": 79, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001293", "fk_end_timestamp": "1717001395"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@snssai:2-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-3000", "vi_nf_snssai_ULIpv6PacketsDr": 335, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001293", "fk_end_timestamp": "1717001395"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@snssai:2-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-3000", "vi_nf_snssai_DLIpv6PacketsDr": 141, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001293", "fk_end_timestamp": "1717001395"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@snssai:2-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-3000", "vi_nf_snssai_DLUnstrPacketsDr": 126, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001293", "fk_end_timestamp": "1717001395"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@snssai:2-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-3000", "vi_nf_snssai_ULUnstrPacketsDr": 222, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001293", "fk_end_timestamp": "1717001395"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@snssai:2-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-3000", "vd_nf_snssai_PFCPSessEstFR": 309.43369, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001293", "fk_end_timestamp": "1717001395"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@snssai:2-3000::nf:AMF_BC::"}}
{ "full_context": "nf_snssai", "context": [ "nf", "snssai" ], "c_nf": "AMF_BC", "c_snssai": "2-3000", "vd_nf_snssai_PFCPSessModFR": 374.626253, "csac_table": "kpi_csac_nf_snssai_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001293", "fk_end_timestamp": "1717001395"}
'

