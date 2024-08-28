import { expect } from 'chai';
import { buildSearchMetricsQuery } from '../../../../../services/assurance/search/victoriametrics/query.js';

describe('Unit tests for VictoriaMetrics query building functions', () => {
  describe('tests for buildSearchMetricsQuery', () => {
    const query = {
      contextTypeId: 'nf',
      metricTypes: [
        { id: 'vi_AMFMeanRegNbr' },
        { id: 'vi_PDUSessionEstSR' },
        { id: 'vi_smfModificationCmdRcvd' },
        { id: 'vi_sessionModificationReqRcvd' },
        { id: 'vi_ulIpv6DropPackets' },
        { id: 'vi_dlUnstrDropPackets' },
      ],
      offset: 0,
      length: 30,
    };

    it('it should call victoria metrics API with proper query for the input', () => {
      const res = buildSearchMetricsQuery(query);
      const expectedOutput =
        'with(\n' +
        '  context_filter = {context=~"nf",},\n' +
        '  k1 = last_over_time(vi_AMFMeanRegNbr{context_filter}[15m]),\n' +
        '  k2 = last_over_time(vi_PDUSessionEstSR{context_filter}[15m]),\n' +
        '  k3 = last_over_time(vi_smfModificationCmdRcvd{context_filter}[15m]),\n' +
        '  k4 = last_over_time(vi_sessionModificationReqRcvd{context_filter}[15m]),\n' +
        '  k5 = last_over_time(vi_ulIpv6DropPackets{context_filter}[15m]),\n' +
        '  k6 = last_over_time(vi_dlUnstrDropPackets{context_filter}[15m]),\n' +
        '  count(l, k) = count_values without() (l, k),\n' +
        "  c1 = count('vi_AMFMeanRegNbr',k1),\n" +
        "  c2 = count('vi_PDUSessionEstSR',k2),\n" +
        "  c3 = count('vi_smfModificationCmdRcvd',k3),\n" +
        "  c4 = count('vi_sessionModificationReqRcvd',k4),\n" +
        "  c5 = count('vi_ulIpv6DropPackets',k5),\n" +
        "  c6 = count('vi_dlUnstrDropPackets',k6),\n" +
        '  aggregated = c1 * on(nf) group_left(vi_PDUSessionEstSR) c2 * on(nf) group_left(vi_smfModificationCmdRcvd) c3 * on(nf) group_left(vi_sessionModificationReqRcvd) c4 * on(nf) group_left(vi_ulIpv6DropPackets) c5 * on(nf) group_left(vi_dlUnstrDropPackets) c6,\n' +
        '  limited = limit_offset(30, 0, aggregated)\n' +
        ')(\n' +
        "  sort_by_label_numeric(limited, 'vi_AMFMeanRegNbr')\n" +
        ')';
      expect(res).to.deep.equals(expectedOutput);
    });
  });
});
