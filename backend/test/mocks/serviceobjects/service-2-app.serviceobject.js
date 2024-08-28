export default {
  metadata: {
    name: 'help-content-service-2',
    labels: {
      'help.ericsson.com/part-of': 'workspace-gui',
      'app.kubernetes.io/name': 'help-content-service-2',
      'app.kubernetes.io/version': '1.0',
    },
    annotations: {
      'help.ericsson.com/protocol': 'https',
    },
  },
  spec: {
    selector: { 'dui-generic': 'service-2' },
    ports: [{ port: 4000 }],
  },
};
