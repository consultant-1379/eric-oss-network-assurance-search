export default {
  metadata: {
    name: 'help-content-service-1',
    labels: {
      'help.ericsson.com/part-of': 'workspace-gui',
      'app.kubernetes.io/name': 'help-content-service-1',
      'app.kubernetes.io/version': '1.0.2-2',
    },
  },
  spec: {
    selector: { 'dui-generic': 'annotation' },
    ports: [{ port: 4000 }],
  },
};
