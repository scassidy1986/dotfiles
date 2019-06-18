#!/usr/bin/env sh

source ${HOME}/.logging
source .helpers

source_folder="${HOME}/.yadm/scripts"
target_folder="/usr/local/bin"

symlink_directory "${source_folder}" "${target_folder}"
