# Standalone

This folder contains configs, docker-compose files, and Wiremock mappings for standalone mode of GAS.

For more information check [Standalone mode](../docs/development/standalone.md) in the documentation.

## Mock Data

The mock data used to develop the Network Assurance Search microservice is generated using the
Corvus Data Generator. The source code for this tool can be found in `standalone/corvus-data-generator/`.

### Modifying Mock Data

The mock data that is ingested into the Assurance Indexer, the ADP Search Engine, CSAC,
and Assurance Analytics is generated based upon two configuration files:

- `standalone/corvus-data-generator/src/config/data-config.json`
- `standalone/corvus-data-generator/src/config/metrics-config.yaml`

To modify the mock data, changes can be made to the listed files above.

### Refreshing Mock Data

To refresh the mock data after changes have been made to the configuration file(s),
a Python environment is required. Refer to the selection below for an environment
setup guide.

#### Setting Up Python Environment

##### Step 1: Install Pyenv (Mac)

These instructions are for the macOS operating system.

Execute the following commands (assuming homebrew):

```bash
brew update
brew install pyenv
```

Setup your shell environment for Pyenv by executing the following commands (assuming .zsh):

```bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
```

Source your terminal or open a new one and execute:

```bash
pyenv --version
```

You should be able to see the version of pyenv that you've installed.

##### Step 1: Install Pyenv (Debian)

These instructions are for the Debian-based operating systems
(Ubuntu, Fedora, etc.).

Execute the following commands:

```bash
sudo apt update
curl https://pyenv.run | bash
```

To setup your shell environment for Pyenv, add the following four lines to the bottom
of your `.bashrc` file:

```bash
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

Source your terminal or open a new one and execute:

```bash
pyenv --version
```

You should be able to see the version of pyenv that you've installed.

##### Step 2: Install a Python version

Execute the following command to install a specific version of Python:

```bash
pyenv install 3.11.8
```

Once completed, execute the following command to set this version as
the default:

```bash
pyenv global 3.11.8
```

##### Step 3: Verify Python installation

Verify your Python installation by executing the following command:

```bash
python -V
```

The output should be `Python 3.11.8`.

##### Step 4: Install the required Python libraries

To use the Corvus Data Generator, a small number of Python libraries
are required. To install them, run the following two commands:

```bash
cd standalone/corvus-data-generator
pip install -r requirements.txt
```

You should now be able to run this file successfully.

#### Executing Refresh Script

Once a proper Python environment is setup, the mock data can be refreshed
by running the `standalone/refresh_mock_data.sh` shell script. This script
does two things:

- Generates new stubs for the Assurance Indexer Service Wiremock
  container and copies them to the correct locations within the repository.

- Generates new OpenSearch data scripts and copies them to the
  correct locations within the repository.

To run the refresh script, execute the following two commands:

```bash
cd standalone
./refresh_mock_data.sh
```
