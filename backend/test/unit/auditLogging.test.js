import { expect } from 'chai';
import * as td from 'testdouble';
import * as loggingMock from '../mocks/modules/logging.mock.js';

const DUMMY_META = {
  req: {
    user: {
      username: 'dummy_username',
      email: 'dummy@email.com',
    },
    originalUrl: 'dummy_url',
    method: 'dummy_method',
    message: 'dummy_message',
  },
  res: {
    getHeader: (header) => header,
    statusCode: 202,
  },
};

const loggerMock = {
  info: td.func(),
  warning: td.func(),
  error: td.func(),
  debug: td.func(),
  critical: td.func(),
};

describe('test auditLogger', () => {
  let auditLogger;
  before(async () => {
    await td.replaceEsm('../../services/logging.js', {
      ...loggingMock,
      getLogger: () => loggerMock,
    });
    auditLogger = (await import('../../services/auditLogging.js')).getAuditLogger(DUMMY_META);
    td.reset();
  });

  after(() => {
    td.reset();
  });

  describe('logger has every method properly', () => {
    it('should throw error with log', () => {
      expect(() => auditLogger.log()).to.throw(
        Error,
        'getAuditLogger does not support the generic log method directly.',
      );
    });
    it('should have info method', () => {
      expect(auditLogger.info).not.throw();
      loggerMock.info('test');
      td.verify(loggerMock.info('test'), {
        ignoreExtraArgs: true,
        times: 1,
      });
    });
    it('should have warning method', () => {
      expect(auditLogger.warning).not.throw();
      loggerMock.warning('test');
      td.verify(loggerMock.warning('test'), {
        ignoreExtraArgs: true,
        times: 1,
      });
    });
    it('should have error method', () => {
      expect(auditLogger.error).not.throw();
      loggerMock.error('test');
      td.verify(loggerMock.error('test'), {
        ignoreExtraArgs: true,
        times: 1,
      });
    });
    it('should have debug method', () => {
      expect(auditLogger.debug).not.throw();
      loggerMock.debug('test');
      td.verify(loggerMock.debug('test'), {
        ignoreExtraArgs: true,
        times: 1,
      });
    });
    it('should have critical method', () => {
      expect(auditLogger.critical).not.throw();
      loggerMock.critical('test');
      td.verify(loggerMock.critical('test'), {
        ignoreExtraArgs: true,
        times: 1,
      });
    });
  });
});
