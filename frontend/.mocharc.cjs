module.exports = {
  require: [
    '@babel/register',
  ],
  timeout: 5000,
  // exit: true, // don't use it, instead fix tests to stop background processes
  recursive: true,
  colors: true,
  spec: 'test/**/*.spec.js',
};
