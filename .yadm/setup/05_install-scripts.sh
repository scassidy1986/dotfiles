#!/usr/bin/env sh

system_type=$(uname -s)

source_folder="${HOME}/.yadm/scripts"
target_folder="/usr/local/bin"

for file in $(ls -1 ${source_folder}/); 
do
  filename=$(basename ${file})
  source="${source_folder}/${filename}"
  target="${target_folder}/${filename}"
  if [ -L ${target} ]; then
    echo "> ${target} exists, removing..."
    rm ${target}
  fi
  if [ ! -L ${target} ]; then
    echo "> Linking script '${source}' to '${target}'"
    ln -nfs ${source} ${target}
  fi
done

