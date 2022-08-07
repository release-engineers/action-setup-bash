#!/usr/bin/env bash

set -e -o pipefail -o errtrace -o functrace

trap_error_report() {
  lineno=$1
  command=$2
  echo "GitHub Workflow erred in bash at line $lineno on command: $command" >&2
}

trap 'trap_error_report "${LINENO}" "${BASH_COMMAND}"' ERR
