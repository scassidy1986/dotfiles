#!/usr/bin/env sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${DIR}/.env
source ${HOME}/.logging
source ${DIR}/.helpers

log_info "$0 $@"

if command -v atom >/dev/null 2>&1; then
  log_info "=> Installing atom package(s)"

  file=".atom_packages"
  packages=($(read_file_to_array ${file}))
  for package in ${packages[@]}; do
    apm install "${package}"
  done
fi
