#! /bin/sh

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PartialDRBAccessibility": 238.037843, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DLLat_gNB_DU": 298.37475, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DLDelay_GnbDu": 294.738823, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"DlUeThroughput@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DlUeThroughput": 121.218952, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"UlUeThroughput@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_UlUeThroughput": 357.469287, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"GRANGOSR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_GRANGOSR": 199.396995, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_5GSEPHOSR": 247.529585, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_AMFMeanRegNbr": 99, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PDUSessionEstSR": 146.480907, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PDUSessModSR": 330.327237, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_AMFMaxRegNbr": 287, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"UTSNSI@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_UTSNSI": 102.243262, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"DTSNSI@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DTSNSI": 80.255106, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"DGTPTN@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DGTPTN": 406.196851, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"UGTPTN@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_UGTPTN": 425.227123, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PDUSesMeanNbr": 416.445508, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_PDUSesMaxNbr": 210, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_ULIpv4PacketsDr": 159, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_DLIpv4PacketsDr": 34, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_ULIpv6PacketsDr": 303, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_DLIpv6PacketsDr": 160, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PFCPSessEstFR": 196.733954, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PFCPSessModFR": 334.680303, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001025", "fk_end_timestamp": "1717001130"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vd_nssi_PartialDRBAccessibility": 390.018322, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vd_nssi_DLLat_gNB_DU": 220.361998, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vd_nssi_DLDelay_GnbDu": 295.318155, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"DlUeThroughput@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vd_nssi_DlUeThroughput": 464.927645, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"UlUeThroughput@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vd_nssi_UlUeThroughput": 180.189995, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"GRANGOSR@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vd_nssi_GRANGOSR": 268.866926, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vd_nssi_5GSEPHOSR": 414.141175, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vi_nssi_AMFMeanRegNbr": 407, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vd_nssi_PDUSessionEstSR": 9.006557, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vd_nssi_PDUSessModSR": 66.471625, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vi_nssi_AMFMaxRegNbr": 221, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"UTSNSI@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vd_nssi_UTSNSI": 480.971788, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"DTSNSI@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vd_nssi_DTSNSI": 440.971828, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"DGTPTN@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vd_nssi_DGTPTN": 307.010015, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"UGTPTN@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vd_nssi_UGTPTN": 360.857475, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vd_nssi_PDUSesMeanNbr": 106.149117, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vi_nssi_PDUSesMaxNbr": 380, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vi_nssi_ULIpv4PacketsDr": 40, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vi_nssi_DLIpv4PacketsDr": 73, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vi_nssi_ULIpv6PacketsDr": 296, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vi_nssi_DLIpv6PacketsDr": 419, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vd_nssi_PFCPSessEstFR": 325.691727, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nssi:MMPSharedSlice_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMPSharedSlice_NSSI", "vd_nssi_PFCPSessModFR": 330.727392, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001075", "fk_end_timestamp": "1717001189"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PartialDRBAccessibility": 97.678942, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DLLat_gNB_DU": 64.773569, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DLDelay_GnbDu": 39.229507, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"DlUeThroughput@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DlUeThroughput": 104.032692, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"UlUeThroughput@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_UlUeThroughput": 496.877562, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"GRANGOSR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_GRANGOSR": 288.851985, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_5GSEPHOSR": 240.395229, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_AMFMeanRegNbr": 171, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PDUSessionEstSR": 81.587903, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PDUSessModSR": 145.63608, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_AMFMaxRegNbr": 308, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"UTSNSI@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_UTSNSI": 236.257583, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"DTSNSI@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DTSNSI": 79.484835, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"DGTPTN@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DGTPTN": 94.988571, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"UGTPTN@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_UGTPTN": 496.503412, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PDUSesMeanNbr": 26.511486, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_PDUSesMaxNbr": 93, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_ULIpv4PacketsDr": 149, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_DLIpv4PacketsDr": 204, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_ULIpv6PacketsDr": 35, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_DLIpv6PacketsDr": 150, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PFCPSessEstFR": 117.508524, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PFCPSessModFR": 64.833541, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001096", "fk_end_timestamp": "1717001167"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_PartialDRBAccessibility": 52.946049, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_DLLat_gNB_DU": 14.991969, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_DLDelay_GnbDu": 256.367622, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"DlUeThroughput@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_DlUeThroughput": 189.349026, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"UlUeThroughput@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_UlUeThroughput": 242.627353, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"GRANGOSR@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_GRANGOSR": 213.719128, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_5GSEPHOSR": 489.127902, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vi_nssi_AMFMeanRegNbr": 85, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_PDUSessionEstSR": 386.077267, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_PDUSessModSR": 120.036576, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vi_nssi_AMFMaxRegNbr": 249, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"UTSNSI@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_UTSNSI": 432.855501, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"DTSNSI@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_DTSNSI": 209.032995, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"DGTPTN@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_DGTPTN": 352.234321, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"UGTPTN@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_UGTPTN": 361.204389, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_PDUSesMeanNbr": 303.510561, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vi_nssi_PDUSesMaxNbr": 62, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vi_nssi_ULIpv4PacketsDr": 73, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vi_nssi_DLIpv4PacketsDr": 136, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vi_nssi_ULIpv6PacketsDr": 123, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vi_nssi_DLIpv6PacketsDr": 439, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_PFCPSessEstFR": 6.962168, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_PFCPSessModFR": 499.587755, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001135", "fk_end_timestamp": "1717001169"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_PartialDRBAccessibility": 388.218934, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_DLLat_gNB_DU": 460.217018, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_DLDelay_GnbDu": 101.080046, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"DlUeThroughput@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_DlUeThroughput": 54.521553, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"UlUeThroughput@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_UlUeThroughput": 186.749372, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"GRANGOSR@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_GRANGOSR": 194.588087, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_5GSEPHOSR": 122.262848, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vi_nssi_AMFMeanRegNbr": 113, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_PDUSessionEstSR": 32.896305, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_PDUSessModSR": 241.501011, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vi_nssi_AMFMaxRegNbr": 43, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"UTSNSI@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_UTSNSI": 139.046851, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"DTSNSI@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_DTSNSI": 153.873905, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"DGTPTN@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_DGTPTN": 272.105845, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"UGTPTN@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_UGTPTN": 204.66297, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_PDUSesMeanNbr": 184.641086, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vi_nssi_PDUSesMaxNbr": 289, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vi_nssi_ULIpv4PacketsDr": 396, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vi_nssi_DLIpv4PacketsDr": 401, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vi_nssi_ULIpv6PacketsDr": 241, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vi_nssi_DLIpv6PacketsDr": 330, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_PFCPSessEstFR": 82.356951, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_PFCPSessModFR": 13.596434, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001145", "fk_end_timestamp": "1717001214"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PartialDRBAccessibility": 379.392588, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DLLat_gNB_DU": 40.350005, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DLDelay_GnbDu": 30.868505, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DlUeThroughput@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DlUeThroughput": 189.418185, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"UlUeThroughput@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_UlUeThroughput": 18.33528, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"GRANGOSR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_GRANGOSR": 324.735989, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_5GSEPHOSR": 164.566893, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_AMFMeanRegNbr": 54, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PDUSessionEstSR": 161.611414, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PDUSessModSR": 177.036025, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_AMFMaxRegNbr": 458, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"UTSNSI@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_UTSNSI": 322.640598, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DTSNSI@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DTSNSI": 63.96409, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DGTPTN@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DGTPTN": 351.061617, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"UGTPTN@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_UGTPTN": 448.734456, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PDUSesMeanNbr": 368.351614, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_PDUSesMaxNbr": 198, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_ULIpv4PacketsDr": 29, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_DLIpv4PacketsDr": 436, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_ULIpv6PacketsDr": 207, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_DLIpv6PacketsDr": 338, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PFCPSessEstFR": 300.525902, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PFCPSessModFR": 1.079293, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001167", "fk_end_timestamp": "1717001190"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_PartialDRBAccessibility": 119.449347, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_DLLat_gNB_DU": 359.18601, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_DLDelay_GnbDu": 238.078012, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"DlUeThroughput@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_DlUeThroughput": 101.842548, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"UlUeThroughput@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_UlUeThroughput": 294.00302, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"GRANGOSR@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_GRANGOSR": 186.020301, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_5GSEPHOSR": 434.80293, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vi_nssi_AMFMeanRegNbr": 415, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_PDUSessionEstSR": 326.014995, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_PDUSessModSR": 211.244525, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vi_nssi_AMFMaxRegNbr": 116, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"UTSNSI@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_UTSNSI": 376.506868, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"DTSNSI@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_DTSNSI": 355.297045, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"DGTPTN@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_DGTPTN": 83.055265, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"UGTPTN@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_UGTPTN": 291.716669, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_PDUSesMeanNbr": 239.589436, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vi_nssi_PDUSesMaxNbr": 376, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vi_nssi_ULIpv4PacketsDr": 202, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vi_nssi_DLIpv4PacketsDr": 6, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vi_nssi_ULIpv6PacketsDr": 169, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vi_nssi_DLIpv6PacketsDr": 85, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_PFCPSessEstFR": 5.844859, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nssi:macNsiDedicated20230728x1543_qosh96mac::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_qosh96mac", "vd_nssi_PFCPSessModFR": 70.129025, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001191", "fk_end_timestamp": "1717001284"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_PartialDRBAccessibility": 204.630586, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_DLLat_gNB_DU": 377.436477, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_DLDelay_GnbDu": 488.617604, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"DlUeThroughput@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_DlUeThroughput": 247.172353, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"UlUeThroughput@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_UlUeThroughput": 226.377328, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"GRANGOSR@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_GRANGOSR": 170.092088, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_5GSEPHOSR": 346.67739, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vi_nssi_AMFMeanRegNbr": 450, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_PDUSessionEstSR": 251.761884, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_PDUSessModSR": 328.752403, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vi_nssi_AMFMaxRegNbr": 184, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"UTSNSI@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_UTSNSI": 89.802576, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"DTSNSI@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_DTSNSI": 285.983105, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"DGTPTN@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_DGTPTN": 455.75985, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"UGTPTN@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_UGTPTN": 417.360315, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_PDUSesMeanNbr": 168.934704, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vi_nssi_PDUSesMaxNbr": 459, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vi_nssi_ULIpv4PacketsDr": 440, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vi_nssi_DLIpv4PacketsDr": 471, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vi_nssi_ULIpv6PacketsDr": 175, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vi_nssi_DLIpv6PacketsDr": 457, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_PFCPSessEstFR": 342.287622, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nssi:macNsiDedicated20230728x1543_corNssiService::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "macNsiDedicated20230728x1543_corNssiService", "vd_nssi_PFCPSessModFR": 419.116497, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001231", "fk_end_timestamp": "1717001358"}
'

curl -sS -k -XPOST "${SEARCH_ENGINE_URL}/soa/_bulk" -u 'admin:admin' -H 'Content-Type: application/json' -d'
{"index":{"_index":"soa","_id":"PartialDRBAccessibility@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PartialDRBAccessibility": 334.837053, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h4", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"DLLat_gNB_DU@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DLLat_gNB_DU": 132.848557, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h5", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"DLDelay_GnbDu@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DLDelay_GnbDu": 483.89271, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h6", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"DlUeThroughput@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DlUeThroughput": 99.454693, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h7", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"UlUeThroughput@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_UlUeThroughput": 215.8167, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h8", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"GRANGOSR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_GRANGOSR": 15.641549, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h9", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"5GSEPHOSR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_5GSEPHOSR": 380.959766, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33m0", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"AMFMeanRegNbr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_AMFMeanRegNbr": 324, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f4", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"PDUSessionEstSR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PDUSessionEstSR": 175.219271, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f5", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"PDUSessModSR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PDUSessModSR": 398.260358, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f6", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"AMFMaxRegNbr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_AMFMaxRegNbr": 227, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f7", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"UTSNSI@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_UTSNSI": 471.006713, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f8", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"DTSNSI@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DTSNSI": 158.657365, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33f9", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"DGTPTN@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_DGTPTN": 393.390211, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g2", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"UGTPTN@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_UGTPTN": 59.283013, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g1", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"PDUSesMeanNbr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PDUSesMeanNbr": 63.967225, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g3", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"PDUSesMaxNbr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_PDUSesMaxNbr": 357, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g4", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"ULIpv4PacketsDr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_ULIpv4PacketsDr": 308, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g5", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"DLIpv4PacketsDr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_DLIpv4PacketsDr": 3, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g6", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"ULIpv6PacketsDr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_ULIpv6PacketsDr": 160, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g7", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"DLIpv6PacketsDr@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vi_nssi_DLIpv6PacketsDr": 336, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33g8", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"PFCPSessEstFR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PFCPSessEstFR": 416.314442, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h2", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
{"index":{"_index":"soa","_id":"PFCPSessModFR@nssi:MMSharedSlice_1_NSSI::"}}
{ "full_context": "nssi", "context": [ "nssi" ], "c_nssi": "MMSharedSlice_1_NSSI", "vd_nssi_PFCPSessModFR": 22.280433, "csac_table": "kpi_csac_nssi_10", "csac_column": "csac_ffbfa0d1_9257_4cb8_9ae0_f2ed5b7f33h3", "fk_begin_timestamp": "1717001294", "fk_end_timestamp": "1717001327"}
'

