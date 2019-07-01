#!/usr/bin/env sh

source ${HOME}/.logging
source .helpers

log_info "$0 $@"

source_folder="${HOME}/.yadm/scripts"
target_folder="/usr/local/bin"

symlink_directory "${source_folder}" "${target_folder}"
