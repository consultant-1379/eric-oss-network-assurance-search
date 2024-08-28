import { getAuditLogger } from '../services/auditLogging.js';

async function auditLog(req, res, next) {
  req.loggerAudit = getAuditLogger({
    req,
    res,
  });

  next();
  await req.loggerAudit.info();
}

export { auditLog };
