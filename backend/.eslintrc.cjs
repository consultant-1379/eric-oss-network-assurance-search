const path = require('path');

module.exports = {
  // extends: ['airbnb-base', 'prettier'],
  // plugins: ['prettier', 'chai-friendly'],
  env: {
    node: true,
    mocha: true,
  },
  rules: {
    // devDependencies
    'import/no-extraneous-dependencies': [
      'error',
      {
        devDependencies: [
          path.join(__dirname, '*.*'),
          path.join(__dirname, 'test/**'),
          path.join(__dirname, 'scripts/**'),
        ],
      }
    ],
  },
};
