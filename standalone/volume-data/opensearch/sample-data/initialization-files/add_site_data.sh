#! /bin/sh

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vi_site_AMFMeanRegNbr": 123, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vd_site_PDUSessionEstSR": 291.843648, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"PDUSessModSR@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vd_site_PDUSessModSR": 446.460455, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vi_site_AMFMaxRegNbr": 75, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"UTSNSI@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vd_site_UTSNSI": 369.266355, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"DTSNSI@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vd_site_DTSNSI": 215.358936, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"UGTPTN@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vd_site_UGTPTN": 241.640596, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"DGTPTN@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vd_site_DGTPTN": 431.207339, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vd_site_PDUSesMeanNbr": 472.85337, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vi_site_PDUSesMaxNbr": 75, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vi_site_ULIpv4PacketsDr": 269, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vi_site_DLIpv4PacketsDr": 360, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vi_site_ULIpv6PacketsDr": 225, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vi_site_DLIpv6PacketsDr": 293, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vi_site_DLUnstrPacketsDr": 216, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vi_site_ULUnstrPacketsDr": 240, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vd_site_PFCPSessEstFR": 293.450463, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@site:Site 19::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 19", "vd_site_PFCPSessModFR": 153.289634, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717000996", "fk_end_timestamp": "1717001091"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vi_site_AMFMeanRegNbr": 263, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vd_site_PDUSessionEstSR": 292.82312, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"PDUSessModSR@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vd_site_PDUSessModSR": 484.451716, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vi_site_AMFMaxRegNbr": 271, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"UTSNSI@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vd_site_UTSNSI": 121.845961, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"DTSNSI@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vd_site_DTSNSI": 376.66494, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"UGTPTN@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vd_site_UGTPTN": 58.995103, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"DGTPTN@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vd_site_DGTPTN": 3.218096, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vd_site_PDUSesMeanNbr": 29.366194, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vi_site_PDUSesMaxNbr": 227, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vi_site_ULIpv4PacketsDr": 419, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vi_site_DLIpv4PacketsDr": 410, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vi_site_ULIpv6PacketsDr": 339, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vi_site_DLIpv6PacketsDr": 198, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vi_site_DLUnstrPacketsDr": 180, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vi_site_ULUnstrPacketsDr": 283, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vd_site_PFCPSessEstFR": 119.734087, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@site:Site 20::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 20", "vd_site_PFCPSessModFR": 211.332665, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001002", "fk_end_timestamp": "1717001065"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vi_site_AMFMeanRegNbr": 158, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vd_site_PDUSessionEstSR": 14.334277, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"PDUSessModSR@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vd_site_PDUSessModSR": 156.698745, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vi_site_AMFMaxRegNbr": 174, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"UTSNSI@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vd_site_UTSNSI": 289.289628, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"DTSNSI@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vd_site_DTSNSI": 177.488808, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"UGTPTN@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vd_site_UGTPTN": 471.140841, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"DGTPTN@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vd_site_DGTPTN": 334.388998, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vd_site_PDUSesMeanNbr": 347.035783, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vi_site_PDUSesMaxNbr": 257, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vi_site_ULIpv4PacketsDr": 348, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vi_site_DLIpv4PacketsDr": 40, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vi_site_ULIpv6PacketsDr": 402, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vi_site_DLIpv6PacketsDr": 396, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vi_site_DLUnstrPacketsDr": 356, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vi_site_ULUnstrPacketsDr": 195, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vd_site_PFCPSessEstFR": 68.938341, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@site:Site 8::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 8", "vd_site_PFCPSessModFR": 142.780349, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001052", "fk_end_timestamp": "1717001178"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_AMFMeanRegNbr": 414, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_PDUSessionEstSR": 476.136702, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"PDUSessModSR@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_PDUSessModSR": 276.556781, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_AMFMaxRegNbr": 350, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"UTSNSI@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_UTSNSI": 492.869471, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"DTSNSI@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_DTSNSI": 291.252911, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"UGTPTN@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_UGTPTN": 331.307536, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"DGTPTN@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_DGTPTN": 12.998559, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_PDUSesMeanNbr": 213.878038, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_PDUSesMaxNbr": 395, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_ULIpv4PacketsDr": 362, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_DLIpv4PacketsDr": 170, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_ULIpv6PacketsDr": 429, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_DLIpv6PacketsDr": 406, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_DLUnstrPacketsDr": 483, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_ULUnstrPacketsDr": 178, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_PFCPSessEstFR": 491.38724, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_PFCPSessModFR": 477.689357, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001150", "fk_end_timestamp": "1717001176"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vi_site_AMFMeanRegNbr": 299, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vd_site_PDUSessionEstSR": 410.641413, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"PDUSessModSR@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vd_site_PDUSessModSR": 426.880118, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vi_site_AMFMaxRegNbr": 104, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"UTSNSI@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vd_site_UTSNSI": 81.443371, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"DTSNSI@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vd_site_DTSNSI": 357.418899, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"UGTPTN@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vd_site_UGTPTN": 29.780526, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"DGTPTN@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vd_site_DGTPTN": 314.200732, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vd_site_PDUSesMeanNbr": 498.249226, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vi_site_PDUSesMaxNbr": 491, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vi_site_ULIpv4PacketsDr": 7, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vi_site_DLIpv4PacketsDr": 409, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vi_site_ULIpv6PacketsDr": 151, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vi_site_DLIpv6PacketsDr": 264, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vi_site_DLUnstrPacketsDr": 406, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vi_site_ULUnstrPacketsDr": 314, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vd_site_PFCPSessEstFR": 232.129957, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@site:Site 6::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 6", "vd_site_PFCPSessModFR": 289.82265, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001210", "fk_end_timestamp": "1717001299"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vi_site_AMFMeanRegNbr": 148, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vd_site_PDUSessionEstSR": 381.602861, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"PDUSessModSR@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vd_site_PDUSessModSR": 467.812334, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vi_site_AMFMaxRegNbr": 394, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"UTSNSI@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vd_site_UTSNSI": 78.545621, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"DTSNSI@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vd_site_DTSNSI": 445.538742, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"UGTPTN@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vd_site_UGTPTN": 2.674479, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"DGTPTN@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vd_site_DGTPTN": 72.564806, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vd_site_PDUSesMeanNbr": 129.487121, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vi_site_PDUSesMaxNbr": 220, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vi_site_ULIpv4PacketsDr": 224, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vi_site_DLIpv4PacketsDr": 374, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vi_site_ULIpv6PacketsDr": 104, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vi_site_DLIpv6PacketsDr": 148, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vi_site_DLUnstrPacketsDr": 321, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vi_site_ULUnstrPacketsDr": 390, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vd_site_PFCPSessEstFR": 326.131301, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@site:Site 9::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 9", "vd_site_PFCPSessModFR": 102.851845, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001194", "fk_end_timestamp": "1717001313"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vi_site_AMFMeanRegNbr": 48, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vd_site_PDUSessionEstSR": 451.214874, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"PDUSessModSR@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vd_site_PDUSessModSR": 49.982871, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vi_site_AMFMaxRegNbr": 209, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"UTSNSI@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vd_site_UTSNSI": 315.162573, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"DTSNSI@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vd_site_DTSNSI": 379.853834, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"UGTPTN@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vd_site_UGTPTN": 153.353521, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"DGTPTN@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vd_site_DGTPTN": 335.453714, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vd_site_PDUSesMeanNbr": 265.380117, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vi_site_PDUSesMaxNbr": 414, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vi_site_ULIpv4PacketsDr": 277, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vi_site_DLIpv4PacketsDr": 153, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vi_site_ULIpv6PacketsDr": 339, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vi_site_DLIpv6PacketsDr": 349, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vi_site_DLUnstrPacketsDr": 333, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vi_site_ULUnstrPacketsDr": 189, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vd_site_PFCPSessEstFR": 195.714376, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@site:Site 18::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 18", "vd_site_PFCPSessModFR": 16.757956, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001229", "fk_end_timestamp": "1717001292"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_AMFMeanRegNbr": 406, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_PDUSessionEstSR": 182.709125, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"PDUSessModSR@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_PDUSessModSR": 221.353609, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_AMFMaxRegNbr": 96, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"UTSNSI@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_UTSNSI": 253.859069, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"DTSNSI@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_DTSNSI": 361.746125, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"UGTPTN@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_UGTPTN": 404.318906, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"DGTPTN@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_DGTPTN": 136.512647, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_PDUSesMeanNbr": 313.385135, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_PDUSesMaxNbr": 350, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_ULIpv4PacketsDr": 475, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_DLIpv4PacketsDr": 211, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_ULIpv6PacketsDr": 154, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_DLIpv6PacketsDr": 204, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_DLUnstrPacketsDr": 122, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vi_site_ULUnstrPacketsDr": 6, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_PFCPSessEstFR": 282.238156, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@site:Site 13::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 13", "vd_site_PFCPSessModFR": 207.47381, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001264", "fk_end_timestamp": "1717001358"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vi_site_AMFMeanRegNbr": 447, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vd_site_PDUSessionEstSR": 394.706594, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"PDUSessModSR@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vd_site_PDUSessModSR": 34.566038, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vi_site_AMFMaxRegNbr": 216, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"UTSNSI@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vd_site_UTSNSI": 268.438883, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"DTSNSI@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vd_site_DTSNSI": 154.727531, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"UGTPTN@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vd_site_UGTPTN": 156.369203, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"DGTPTN@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vd_site_DGTPTN": 156.872528, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vd_site_PDUSesMeanNbr": 350.302871, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vi_site_PDUSesMaxNbr": 443, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vi_site_ULIpv4PacketsDr": 451, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vi_site_DLIpv4PacketsDr": 101, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vi_site_ULIpv6PacketsDr": 117, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vi_site_DLIpv6PacketsDr": 379, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"DLUnstrPacketsDr@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vi_site_DLUnstrPacketsDr": 177, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g9", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"ULUnstrPacketsDr@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vi_site_ULUnstrPacketsDr": 403, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h1", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vd_site_PFCPSessEstFR": 252.878094, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@site:Site 3::"}}
{ "full_context": "site", "context": [ "site" ], "c_site": "Site 3", "vd_site_PFCPSessModFR": 40.555019, "csac_table": "kpi_csac_site_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001330", "fk_end_timestamp": "1717001406"}
'

