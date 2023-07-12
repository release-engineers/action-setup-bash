<!-- README.md is auto-generated from README.md.template -->

# [release-engineers/action-setup-bash](https://github.com/release-engineers)

[![Status: Production ready](https://img.shields.io/badge/status-production_ready-green)](https://release-engineers.com/open-source-badges/)

`action-setup-bash` sets up ~/.bash_profile for stricter error handling and more detailed error reporting.

## Usage

Refer to the [example workflow](.github/workflows/example.yml);

```yml
name: Example

on:
  workflow_dispatch:

defaults:
  run:
    shell: bash --login {0}

jobs:
  run:
    runs-on: ubuntu-latest
    steps:
      - uses: release-engineers/action-setup-bash@v1
      - run: |
          echo "With the default shell set to bash --login, 'run' steps in this GitHub Workflow run ~/.bash_profile"
          echo "Any errors that occur after the setup action will be more detailed and halt the workflow"
          echo "Time to crash;"
          exit 1

```

## Bash Profile

To see what's added to bash_profile, refer to [bash_profile.sh](bash_profile.sh);

```bash
#!/usr/bin/env bash

set -e -o pipefail -o errtrace -o functrace

trap_error_report() {
  lineno=$1
  command=$2
  echo "GitHub Workflow erred in bash at line $lineno on command: $command" >&2
}

trap 'trap_error_report "${LINENO}" "${BASH_COMMAND}"' ERR

```
