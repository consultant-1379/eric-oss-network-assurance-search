import chai from 'chai';
import chaiHttp from 'chai-http';
import express from 'express';
import { bodyParserLimit, urlEncodingLimit } from '../../middleware/requestSizeLimit.js';

const { expect } = chai;
chai.use(chaiHttp);

const app = express();
app.use(bodyParserLimit);
app.use(urlEncodingLimit);

app.post('/endpoint', (req, res) => {
  res.sendStatus(200);
});

describe('Unit test for request limit size', () => {
  it('should not be greater than 50MB', (done) => {
    // create a large request body ~2MB
    const requestData =
      '[SAMPLE - DATA TEST DATA TEST DATA TEST DATA TEST DATA TEST DATA TEST DATA TEST DATA TEST  DATA TEST DATA TEST DATA TEST DATA TEST]'.repeat(
        1000000,
      );

    // send a POST request to the endpoint with the large request body
    chai
      .request(app)
      .post('/endpoint')
      .send(requestData)
      .end((err, res) => {
        // the request will be rejected with error code 413 "Request Entity Too Large"
        expect(res.status).to.be.equal(413);
        done();
      });
  });

  it('should less than 50MB', (done) => {
    // create a large request body
    const requestData = '<request data goes here>';
    // send a POST request to the endpoint with the small request body
    chai
      .request(app)
      .post('/endpoint')
      .send(requestData)
      .end((err, res) => {
        expect(res.status).to.be.equal(200);
        done();
      });
  });
});
