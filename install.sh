#!/bin/sh
set -eo pipefail

OS=$(uname -s)
REPO="https://api.github.com/repos/therealjasonkenney/dev/tarball/main"

PROJECT_DIR="${HOME}/Developer/projects/dev"

if [ -d "${PROJECT_DIR}" ]; then
  printf "This has already been installed on your computer in ${PROJECT_DIR}.\n"

  source "${PROJECT_DIR}/os/${OS}/xdg.env.sh"

  make -C ${PROJECT_DIR} install
else
  PROJECT_DIR=/tmp/dev

  mkdir -p ${PROJECT_DIR}

  curl -fsSL ${REPO} | tar -xz -C ${PROJECT_DIR} --strip-components 1

  source "${PROJECT_DIR}/os/${OS}/xdg.env.sh"

  make -C ${PROJECT_DIR} bootstrap

  make -C ${PROJECT_DIR} install
fi
