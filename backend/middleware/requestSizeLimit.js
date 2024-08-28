import bodyParser from 'body-parser';

/* This will limit the incoming request size,
If the request exceeds the limit, it will be rejected with below error code.
code code 413 "Request Entity Too Large" */
const MAX_LIMIT = '50mb';

const bodyParserLimit = bodyParser.json({ limit: MAX_LIMIT });
const urlEncodingLimit = bodyParser.urlencoded({ extended: true, limit: MAX_LIMIT });

export { bodyParserLimit, urlEncodingLimit };
