import * as path from 'path';
import { execSync } from 'child_process';
import { fileURLToPath } from 'url';
import yargs from 'yargs';
import { hideBin } from 'yargs/helpers';

const commandArgs = yargs(hideBin(process.argv)).argv;

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const execCommand = (command) => {
  console.log(`Executing command: ${command}`);

  execSync(command, { stdio: 'inherit' });
};

const validateExamples = ({ schemaPath }) => {
  const command = `${path.join(
    'node_modules',
    '.bin',
    'openapi-examples-validator',
  )} ${schemaPath}`;

  execCommand(command);
};

const generateMarkdown = ({ schemaPath, outputFileName }) => {
  const outputFile = path.join(__dirname, '..', `markdown/${outputFileName}.md`);

  const command =
    `${path.join('node_modules', '.bin', 'widdershins')}` +
    ` --search false` +
    ` --resolve true` +
    ` --theme 'darkula'` +
    ` --summary` +
    ` --code true` +
    ` --language_tabs 'javascript:JavaScript'` +
    ` --user_templates=./doc_templates/openapi3` +
    ` -o ${outputFile}` +
    ` ${schemaPath}`;

  execCommand(command);
};

const bundle = ({ schemaPath, outputFileName }) => {
  const outputFile = path.join(__dirname, '..', `api_bundled/${outputFileName}.yaml`);

  const command =
    `${path.join('node_modules', '.bin', 'swagger-cli')}` +
    ` bundle` +
    ` -r` +
    ` ${schemaPath}` +
    ` --outfile ${outputFile}` +
    ` --type yaml`;

  execCommand(command);
};

const schemaData = {
  schemaPath: path.join(__dirname, '..', commandArgs.inputFile),
  outputFileName: commandArgs.outputFileName,
};

bundle(schemaData);

if (commandArgs.validateSchemaExamples) {
  validateExamples(schemaData);
}
if (commandArgs.generate) {
  generateMarkdown(schemaData);
}
