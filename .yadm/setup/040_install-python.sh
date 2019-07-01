#!/bin/bash

source ${HOME}/.logging
source .helpers

log_info "$0 $@"

install_versions "pyenv" ".python_versions" "pyenv install"
