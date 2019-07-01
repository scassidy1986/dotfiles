#!/bin/bash

source ${HOME}/.logging
source .helpers

log_info "$0 $@"

install_versions "rbenv" ".ruby_versions" "rbenv install"
