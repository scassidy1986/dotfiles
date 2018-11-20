#!/usr/bin/env sh

system_type=$(uname -s)
cwd="${HOME}/.yadm"

source_folder="${cwd}/scripts"
target_folder="/usr/local/bin"

bin_scripts=$(ls ${cwd}/scripts/)
for file in ${bin_scripts}
do
  source="${source_folder}/${file}"
  target="${target_folder}/${file}"
  echo "Linking script '${file}' to '${target}'"
  ln -nfs ${source} ${target}
done

