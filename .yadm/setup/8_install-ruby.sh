#!/usr/bin/env sh

if which rbenv >/dev/null 2>&1; then
  system_type=$(uname -s)
  cwd="${HOME}/.yadm"

  versions=("2.2.6" "2.3.3" "2.4.0" "2.4.1")
  for version in ${versions[@]}; do
    echo "Installing ruby ${version}"

    echo y | rbenv install ${version}
  done
else
  echo "rbenv not installed; nothing to do"
fi

