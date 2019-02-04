#!/usr/bin/env sh

system_type=$(uname -s)

source_folder="${HOME}/.yadm/scripts"
target_folder="/usr/local/bin"

for file in $(ls -1 ${source_folder}/); 
do
  filename=$(basename ${file})
  target="${target_folder}/${filename}"
  echo "Linking script '${file}' to '${target}'"
  ln -nfs ${file} ${target}
done

