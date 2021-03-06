#!/usr/bin/env sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${DIR}/.env
source ${HOME}/.logging

log_info "$0 $@"

system_type=$(uname -s)

source_folder="${HOME}/.config/yadm/helpers"
target_folder="${HOME}"

for file in $(ls -1 ${source_folder}/);
do
  filename=$(basename ${file})
  target="${target_folder}/.${filename}"
  log_info "==> Linking script '${file}' to '${target}'"
  ln -nfs ${file} ${target}
done
