#!/bin/bash

source ${HOME}/.logging
source .helpers

if which pyenv >/dev/null 2>&1; then
  log_info "Installing python version(s)"
  versions=($(read_file_to_array ".pyenv_versions"))
  for version in ${versions[@]}; do
    log_info "Installing python ${version}"

    echo y | pyenv install ${version}
  done
else
  log_info "pyenv not installed; nothing to do"
fi

