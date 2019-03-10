#!/usr/bin/env sh

source .helpers

if which pyenv >/dev/null 2>&1; then
  system_type=$(uname -s)
  cwd="${HOME}/.yadm"

  versions=($(read_file_to_array ".pyenv_versions"))
  for version in ${versions[@]}; do
    echo "Installing python ${version}"

    echo y | pyenv install ${version}
  done
else
  echo "pyenv not installed; nothing to do"
fi

