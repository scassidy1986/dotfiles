#!/bin/bash

source ${HOME}/.logging
source .helpers

if which goenv >/dev/null 2>&1; then
  system_type=$(uname -s)
  cwd="${HOME}/.yadm"

  versions=($(read_file_to_array ".goenv_versions"))
  for version in ${versions[@]}; do
    log_info "Installing go ${version}"

    echo y | goenv install ${version}
  done
else
  log_info "goenv not installed; nothing to do"
fi

