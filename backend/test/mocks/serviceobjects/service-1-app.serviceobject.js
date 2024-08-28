export default {
  metadata: {
    name: 'help-content-service-1',
    labels: {
      'help.ericsson.com/part-of': 'workspace-gui',
      'app.kubernetes.io/name': 'help-content-service-1',
      'app.kubernetes.io/version': '1.0.2-2',
    },
    annotations: {
      'help.ericsson.com/protocol': 'https',
    },
  },
  spec: {
    selector: { 'dui-generic': 'service-1' },
    ports: [{ port: 4000 }],
  },
};
