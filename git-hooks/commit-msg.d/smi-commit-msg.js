#!/usr/bin/env node

import * as fs from 'fs';

const MSG_PATTERNS = [
  '((IDUN)-[0-9]+).*?',
  '((ESOA)-[0-9]+).*?',
  '(?:Requirement:\\s*)(no-jira).*?',
];

const PATTERN = new RegExp(MSG_PATTERNS.join('|'), 'i');

function checkCommitMsg() {
  let message = '';
  if (process.argv[2] === '.git/COMMIT_EDITMSG') {
    message = fs.readFileSync(process.argv[2], 'utf8').trim();
  } else {
    [, , message] = process.argv;
  }
  if (!PATTERN.test(message)) {
    console.log('Commit message does not match any patterns');
    console.log('supported patterns:');
    MSG_PATTERNS.forEach((pattern) => {
      console.log(pattern);
    });
    process.exit(1);
  } else {
    process.exit(0);
  }
}

checkCommitMsg();
