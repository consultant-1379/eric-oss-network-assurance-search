const readFile = (uiServiceConfig, manualConfig, filePath) => {
  switch (filePath) {
    case 'config/backend-service-config/backend-service-config.json':
      return JSON.stringify(uiServiceConfig);
    case 'config/backend-service-config/manual-service-config.json':
      return JSON.stringify(manualConfig);
    default:
      return '';
  }
};

const fsMock = ({ uiServiceConfig, manualConfig }) => ({
  readFileSync: (filePath) => readFile(uiServiceConfig, manualConfig, filePath),
  createReadStream: (filePath) => readFile(uiServiceConfig, manualConfig, filePath),
  promises: {
    mkdir: () => true,
    stat: () => undefined,
  },
  statSync: () => undefined,
  existsSync: () => false,
});

export default fsMock;
