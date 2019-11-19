#!/usr/bin/env sh

source .env
source ${HOME}/.logging
source .helpers

log_info "$0 $@"

source_folder="${YADM_HOME}/zsh-completions"
target_folder="/usr/local/share/zsh-completions"

symlink_directory "${source_folder}" "${target_folder}"
