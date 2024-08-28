const path = require('path');

module.exports = {
  // extends: ['@open-wc/eslint-config', "eslint-config-prettier"],
  rules: {
    // devDependencies
    'import/no-extraneous-dependencies': [
      'error',
      {
        devDependencies: [
          path.join(__dirname, '*.*'),
          path.join(__dirname, 'test/**'),
          path.join(__dirname, 'scripts/**'),
          path.join(__dirname, 'dev/**'),
        ],
      },
    ],
    'new-cap': [
      'error',
      {
        'newIsCapExceptionPattern': '^superagent\\..',
        'capIsNewExceptions': ["JSONPath"]
      }
    ]
  }
};
