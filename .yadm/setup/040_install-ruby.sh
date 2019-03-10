#!/bin/bash

set -e

source ${HOME}/.logging
source .helpers

if which rbenv >/dev/null 2>&1; then
  log_info "Installing ruby version(s)"
  versions=($(read_file_to_array ".rbenv_versions"))
  for version in ${versions[@]}; do
    log_info "Installing ruby ${version}"

    echo y | rbenv install ${version}
  done
else
  log_info "rbenv not installed; nothing to do"
fi

