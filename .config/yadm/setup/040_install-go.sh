#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${DIR}/.env
source ${HOME}/.logging
source ${DIR}.helpers

log_info "$0 $@"

install_versions "goenv" ".go_versions" "goenv install"
