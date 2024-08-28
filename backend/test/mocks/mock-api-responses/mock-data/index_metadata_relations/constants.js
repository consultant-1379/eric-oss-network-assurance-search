import { createRequire } from 'module';

const require = createRequire(import.meta.url);

const fullContextSpecsAbc0Doc = require('./FullContextSpecs_ABC_0.json');
const fullContextSpecsFooBarBaz0Doc = require('./FullContextSpecs_FooBarBaz_0.json');
const fullContextSpecsFooBarBaz1Doc = require('./FullContextSpecs_FooBarBaz_1.json');
const relationsABC0Doc = require('./Relations_ABC_0.json');
const relationsFooBarBaz0Doc = require('./Relations_FooBarBaz_0.json');
const relationsFooBarBaz1Doc = require('./Relations_FooBarBaz_1.json');

const FULLCONTEXT_DOCS = new Map([
  [encodeURIComponent('ContextB-ContextC'), fullContextSpecsAbc0Doc],
  [encodeURIComponent('BAR'), fullContextSpecsFooBarBaz0Doc],
  [encodeURIComponent('BAZ'), fullContextSpecsFooBarBaz1Doc],
]);

const METADATA_RELATIONS_DOCS = new Map([
  ['ContextB-ContextC', relationsABC0Doc],
  ['BAR', relationsFooBarBaz0Doc],
  ['BAZ', relationsFooBarBaz1Doc],
]);

export { FULLCONTEXT_DOCS, METADATA_RELATIONS_DOCS };
