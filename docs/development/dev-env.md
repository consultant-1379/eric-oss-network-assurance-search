# Development environment

This section provides information about the suggested development environment.
**For a development environment WSL2 is recommended.**

## Requirements

- NodeJs
  - Use v16
  - Advised to install nvm (Node Version Manager) to keep up with future version changes
    - [Linux version](https://github.com/nvm-sh/nvm)
    - [Windows version](https://github.com/coreybutler/nvm-windows)
  - Some dependencies use the node-gyp npm package which can compile native addons.
    It requires some build tools to be available, for more info see: [node-gyp](https://github.com/nodejs/node-gyp)
    - Windows: run as Administrator: `npm install --global windows-build-tools`
    - Linux: in a terminal execute `sudo apt-get install g++ build-essential`
- Docker and Kubernetes
  - Install a WSL2 Linux distribution preferably Ubuntu
  - Install Docker according to the [documentation](https://docs.docker.com/engine/install/ubuntu)
  - For Kubernetes
    - Use [minikube](https://github.com/kubernetes/minikube) for local K8S
    - `Big Presentation` cluster can be accessed with the provided .kube configfile (mock/cluster-config/presentation-big.yaml)
- Helm (no greater then 3.5.2)
  - On how to install refer to this [page](https://helm.sh/docs/intro/install/#from-apt-debianubuntu)
- Bob
  - mainly required for CI pipeline development <https://gerrit-gamma.gic.ericsson.se/plugins/gitiles/adp-cicd/bob>
- Git
  - Source code versioning <https://git-scm.com/>
- Selenium

  - Running Selenium tests requires Java `sudo apt install default-jre default-jdk` and Google Chrome

  ```bash
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i google-chrome-stable_current_amd64.deb
  sudo apt install -f
  ```

- For Windows users there is a complete
  [guide](https://eth-wiki.rnd.ki.sw.ericsson.se/pages/viewpage.action?spaceKey=EIT&title=Test+microservice+image+and+chart+in+local+windows+machine+with+BOB)
  on how to set up a docker/k8s development environment.
  _Note:_ this focuses on _Java_ based development

## Repository

The source code is in Git and the code review is done through Gerrit.
For development, first the repository has to be set up properly.

```bash
git clone ssh://<SIGNUM>@gerrit-gamma.gic.ericsson.se:29418/OSS/com.ericsson.oss.use/eric-oss-network-assurance-search
```

For checking whether the commit message is acceptable according to some message patterns,
there is a script implemented in NodeJS.
After cloning the repo, there is the `git-hooks/commit-msg.d` folder where the two scripts are at
the moment:

- **gerrit-commit-msg** - this is the default Gerrit hook for adding change id to commit messages
- **smi-commit-msg.js** - the new hook to validate the commit message

To use both of these scripts the new git hook (`git-hooks/commit-msg`) simply calls them when triggered.

After running the `install.sh` script, this new commit-msg hook will be enabled so both of the
scripts will be used for the commit messages.

_Note:_ this will override the existing commit-msg hook, which is the Gerrit hook by default.

### Gerrit

The Gerrit server is maintained centrally [Gerrit_Central](https://wiki.lmera.ericsson.se/wiki/Gerrit_Central/Home)
Setup steps: [Setup](https://wiki.lmera.ericsson.se/wiki/Gerrit_Central/Setup)

To start working a properly setup account is required, set up an ssh key at:

- <https://gerrit-gamma.gic.ericsson.se/#/settings/ssh-keys>

In the cloned repository edit the '.git/config' file as shown for proper push and pull URLs:

```propreties
[remote "origin"]
    url = ssh://<SIGNUM>@gerritmirror.lmera.ericsson.se:29418/OSS/com.ericsson.oss.use/eric-oss-network-assurance-search
    pushurl = ssh://<SIGNUM>@gerrit-gamma.gic.ericsson.se:29418/OSS/com.ericsson.oss.use/eric-oss-network-assurance-search
```

Setup a commit hook to generate change-id for every commit:

```bash
gitdir=$(git rev-parse --git-dir); \
  scp -p -P 29418 ${USER}@gerrit-gamma.gic.ericsson.se:hooks/commit-msg ${gitdir}/hooks/
```

Common commands:

```bash
git push origin HEAD:refs/for/master  # push commit for review to the master branch
git commit --amend                    # change commit locally to create a new patchset
```

## Bob

Bob is mainly used in CI to execute commands in docker containers. It can be installed locally
also, which can be convenient for executing tasks.

?> Note for most NodeJS related development task Bob is not needed locally.

The official [User's Guide for Bob](https://gerrit-gamma.gic.ericsson.se/plugins/gitiles/adp-cicd/bob/+/master/USER_GUIDE_2.0.md#Running-bob-in-a-container-on-Windows)

```bash
# clone bob repo
git clone ssh://gerrit-gamma.gic.ericsson.se:29418/adp-cicd/bob
# add an alias to bob
sudo nano ~/.bash_aliases
# file content
alias bob='/<path-to-adp-bob-repo>/bob/bob2.0/bob.py'
```

Running bob tasks require certain environment variables to be set for further details refer to the [guide](https://eth-wiki.rnd.ki.sw.ericsson.se/pages/viewpage.action?spaceKey=EIT&title=Test+microservice+image+and+chart+in+local+windows+machine+with+BOB).

## IDE

The recommended IDE is [Visual Studio Code](https://code.visualstudio.com/). It is an open source
and free, customizable editor, which provides great tooling for JavaScript based development.

To improve developer experience a common set of VSCode settings and extension recommendation is
committed to the repository. The predefined configuration is in the `.vscode` directory in the
repository root. To utilize these open a workspace from the repository root, then accept to install
the recommended extensions. Other settings are automatically used by VSCode.

?> If settings are changed in the `.vscode` folder then a VSCode restart might be needed after
a git pull.

After the extensions are installed, in WSL navigate to the cloned project root and start VSCode with
`code .`.

### Docker base development (Coming...)

VSCode supports docker based development, when the required dependencies and extensions are
installed into a docker image and the IDE remotely connects to a running docker container.

### JSON Schema

There are multiple JSON configs used by Node.js Skeleton. To help the work with complicated JSONs
there are defined JSON Schemas in the repository. VSCode can provide IntelliSense support for JSON files,
like autocomplete, real time validation, show descriptions for attributes on hover.
