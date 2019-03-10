#!/usr/bin/env sh

source .helpers

if which rbenv >/dev/null 2>&1; then
  system_type=$(uname -s)
  cwd="${HOME}/.yadm"

  versions=($(read_file_to_array ".rbenv_versions"))
  for version in ${versions[@]}; do
    echo "Installing ruby ${version}"

    echo y | rbenv install ${version}
  done
else
  echo "rbenv not installed; nothing to do"
fi

