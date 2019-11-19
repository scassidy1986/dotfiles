#!/usr/bin/env sh

source .env
source ${HOME}/.logging
source .helpers

log_info "$0 $@"

if command -v atom >/dev/null 2>&1; then
  log_info "=> Installing atom package(s)"

  file=".atom_packages"
  packages=($(read_file_to_array ${file}))
  for package in ${packages[@]}; do
    apm install "${package}"
  done
fi
