#!/usr/bin/env bash
set -eo pipefail

ROOT_PATH=$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && cd .. && pwd)

export GEOMETRY_PATH="${APP_ROOT_PATH:-${ROOT_PATH}}"

export CONFIG_PATH="${CONFIG_PATH:-${GEOMETRY_PATH}/geometry.ini}"
export REPO_PATH="${REPO_PATH:-${GEOMETRY_PATH}/repo.path}"
export BINARY_PATH="${BINARY_PATH:-${GEOMETRY_PATH}/bin}"

export PLATFORM_PATH="${PLATFORM_PATH:-${GEOMETRY_PATH}/ostis-web-platform}"

export SC_WEB_REPO="${SC_WEB_REPO:-https://github.com/NikitaZotov/sc-web.git}"
export SC_WEB_BRANCH="${SC_WEB_BRANCH:-feat/harmonise_sc_types}"
export SC_WEB_COMMIT="${SC_WEB_COMMIT:-""}"

export SC_MACHINE_REPO="${SC_MACHINE_REPO:-https://github.com/NikitaZotov/sc-machine.git}"
export SC_MACHINE_BRANCH="${SC_MACHINE_BRANCH:-fix/kb_builder_config}"
export SC_MACHINE_COMMIT="${SC_MACHINE_COMMIT:-""}"

if [[ -d "${PLATFORM_PATH}" ]];
then
  source "${PLATFORM_PATH}/scripts/set_vars.sh"
fi
