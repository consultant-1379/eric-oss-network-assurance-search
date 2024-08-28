import express from 'express';

import { auditLog } from './auditLog.js';
import { bodyParserLimit, urlEncodingLimit } from './requestSizeLimit.js';
import { corsMiddleware } from './security.js';

export default (app) => {
  app.use(express.urlencoded({ extended: true }));

  // Add Middleware
  app.use(bodyParserLimit);
  app.use(urlEncodingLimit);
  app.use(auditLog);
  app.use(corsMiddleware);
};
