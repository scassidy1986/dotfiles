#!/bin/bash

source .env
source ${HOME}/.logging
source .helpers

log_info "$0 $@"

install_versions "goenv" ".go_versions" "goenv install"
