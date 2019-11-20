#!/usr/bin/env sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${DIR}/.env
source ${HOME}/.logging
source ${DIR}/.helpers

log_info "$0 $@"

source_folder="${YADM_HOME}/zsh-completions"
target_folder="/usr/local/share/zsh-completions"

symlink_directory "${source_folder}" "${target_folder}"
