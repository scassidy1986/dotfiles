#!/bin/bash

source .env
source ${HOME}/.logging
source .helpers

log_info "$0 $@"

install_versions "jabba" ".java_versions" "jabba install"
