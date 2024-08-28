#! /bin/sh

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_AMFMeanRegNbr": 147, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PDUSessionEstSR": 201.69567, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PDUSessModSR": 14.662062, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_AMFMaxRegNbr": 445, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"UTSNSI@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_UTSNSI": 166.884711, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"DTSNSI@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_DTSNSI": 459.170235, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"UGTPTN@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_UGTPTN": 65.089553, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"DGTPTN@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_DGTPTN": 344.688454, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PDUSesMeanNbr": 199.675532, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_PDUSesMaxNbr": 384, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_ULIpv4PacketsDr": 214, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_DLIpv4PacketsDr": 394, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_ULIpv6PacketsDr": 317, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_DLIpv6PacketsDr": 464, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_DLUnstrPacketsDr": 321, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_ULUnstrPacketsDr": 428, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PFCPSessEstFR": 200.661214, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PFCPSessModFR": 385.966471, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717000980", "fk_end_timestamp": "1717001109"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_AMFMeanRegNbr": 477, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_PDUSessionEstSR": 145.265368, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_PDUSessModSR": 455.498541, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_AMFMaxRegNbr": 367, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"UTSNSI@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_UTSNSI": 366.895927, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"DTSNSI@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_DTSNSI": 121.10108, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"UGTPTN@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_UGTPTN": 204.245334, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"DGTPTN@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_DGTPTN": 499.341939, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_PDUSesMeanNbr": 166.825551, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_PDUSesMaxNbr": 395, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_ULIpv4PacketsDr": 139, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_DLIpv4PacketsDr": 386, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_ULIpv6PacketsDr": 321, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_DLIpv6PacketsDr": 301, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_DLUnstrPacketsDr": 167, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_ULUnstrPacketsDr": 83, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_PFCPSessEstFR": 302.26402, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_PFCPSessModFR": 231.599417, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001070", "fk_end_timestamp": "1717001139"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_AMFMeanRegNbr": 106, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PDUSessionEstSR": 245.556009, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PDUSessModSR": 273.175654, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_AMFMaxRegNbr": 480, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"UTSNSI@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_UTSNSI": 475.557821, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"DTSNSI@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_DTSNSI": 87.360014, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"UGTPTN@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_UGTPTN": 457.328373, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"DGTPTN@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_DGTPTN": 459.22217, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PDUSesMeanNbr": 154.001842, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_PDUSesMaxNbr": 456, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_ULIpv4PacketsDr": 60, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_DLIpv4PacketsDr": 384, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_ULIpv6PacketsDr": 322, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_DLIpv6PacketsDr": 113, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_DLUnstrPacketsDr": 290, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_ULUnstrPacketsDr": 352, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PFCPSessEstFR": 114.594318, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PFCPSessModFR": 489.10114, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001068", "fk_end_timestamp": "1717001187"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_AMFMeanRegNbr": 431, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_PDUSessionEstSR": 244.506589, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_PDUSessModSR": 396.354767, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_AMFMaxRegNbr": 29, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"UTSNSI@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_UTSNSI": 287.642366, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"DTSNSI@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_DTSNSI": 477.289026, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"UGTPTN@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_UGTPTN": 258.381736, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"DGTPTN@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_DGTPTN": 194.276783, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_PDUSesMeanNbr": 62.042799, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_PDUSesMaxNbr": 384, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_ULIpv4PacketsDr": 309, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_DLIpv4PacketsDr": 423, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_ULIpv6PacketsDr": 476, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_DLIpv6PacketsDr": 186, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_DLUnstrPacketsDr": 21, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_ULUnstrPacketsDr": 184, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_PFCPSessEstFR": 258.403934, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_PFCPSessModFR": 175.00057, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001106", "fk_end_timestamp": "1717001205"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_AMFMeanRegNbr": 467, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_PDUSessionEstSR": 106.961903, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_PDUSessModSR": 35.471894, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_AMFMaxRegNbr": 13, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"UTSNSI@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_UTSNSI": 124.198307, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"DTSNSI@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_DTSNSI": 161.855493, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"UGTPTN@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_UGTPTN": 77.108444, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"DGTPTN@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_DGTPTN": 203.136, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_PDUSesMeanNbr": 86.327605, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_PDUSesMaxNbr": 210, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_ULIpv4PacketsDr": 32, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_DLIpv4PacketsDr": 325, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_ULIpv6PacketsDr": 217, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_DLIpv6PacketsDr": 257, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_DLUnstrPacketsDr": 339, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vi_nf_ULUnstrPacketsDr": 141, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_PFCPSessEstFR": 185.400616, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nf:AMF_BC::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_BC", "vd_nf_PFCPSessModFR": 47.063188, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001131", "fk_end_timestamp": "1717001232"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_AMFMeanRegNbr": 105, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PDUSessionEstSR": 369.58709, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PDUSessModSR": 481.762627, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_AMFMaxRegNbr": 210, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"UTSNSI@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_UTSNSI": 41.623299, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"DTSNSI@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_DTSNSI": 337.040003, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"UGTPTN@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_UGTPTN": 188.179707, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"DGTPTN@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_DGTPTN": 155.076976, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PDUSesMeanNbr": 427.765455, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_PDUSesMaxNbr": 488, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_ULIpv4PacketsDr": 309, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_DLIpv4PacketsDr": 80, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_ULIpv6PacketsDr": 432, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_DLIpv6PacketsDr": 494, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_DLUnstrPacketsDr": 57, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_ULUnstrPacketsDr": 496, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PFCPSessEstFR": 231.353902, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PFCPSessModFR": 60.11085, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001192", "fk_end_timestamp": "1717001252"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_AMFMeanRegNbr": 366, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_PDUSessionEstSR": 28.834078, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_PDUSessModSR": 486.42133, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_AMFMaxRegNbr": 228, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"UTSNSI@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_UTSNSI": 23.603896, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"DTSNSI@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_DTSNSI": 303.723451, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"UGTPTN@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_UGTPTN": 474.077364, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"DGTPTN@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_DGTPTN": 465.206101, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_PDUSesMeanNbr": 475.582337, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_PDUSesMaxNbr": 469, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_ULIpv4PacketsDr": 155, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_DLIpv4PacketsDr": 490, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_ULIpv6PacketsDr": 417, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_DLIpv6PacketsDr": 362, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_DLUnstrPacketsDr": 335, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vi_nf_ULUnstrPacketsDr": 52, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_PFCPSessEstFR": 384.968633, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nf:AMF_ON1::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON1", "vd_nf_PFCPSessModFR": 133.902671, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001227", "fk_end_timestamp": "1717001357"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_AMFMeanRegNbr": 65, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PDUSessionEstSR": 16.345052, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PDUSessModSR": 407.248307, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_AMFMaxRegNbr": 459, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"UTSNSI@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_UTSNSI": 17.95195, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"DTSNSI@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_DTSNSI": 55.136078, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"UGTPTN@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_UGTPTN": 383.299811, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"DGTPTN@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_DGTPTN": 485.304117, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PDUSesMeanNbr": 115.904177, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_PDUSesMaxNbr": 257, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_ULIpv4PacketsDr": 398, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_DLIpv4PacketsDr": 291, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_ULIpv6PacketsDr": 423, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_DLIpv6PacketsDr": 2, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_DLUnstrPacketsDr": 146, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vi_nf_ULUnstrPacketsDr": 342, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PFCPSessEstFR": 63.993592, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nf:AMF_ON2::"}}
{ "full_context": "nf", "context": [ "nf" ], "c_nf": "AMF_ON2", "vd_nf_PFCPSessModFR": 160.11251, "csac_table": "kpi_csac_nf_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001282", "fk_end_timestamp": "1717001397"}
'

