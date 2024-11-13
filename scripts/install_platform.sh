#!/usr/bin/env bash
set -eo pipefail

CURRENT_DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd)
source "${CURRENT_DIR}/formats.sh"

cd "${CURRENT_DIR}/.." && git submodule update --init --recursive

source "${CURRENT_DIR}/set_vars.sh"

stage "Install ostis-web-platform"

"${PLATFORM_PATH}/scripts/install_submodules.sh"
"${PLATFORM_PATH}/scripts/install_dependencies.sh" --dev
"${PLATFORM_PATH}/scripts/build_platform.sh"

stage "ostis-platform is installed successfully"
