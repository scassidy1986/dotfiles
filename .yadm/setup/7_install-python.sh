#!/usr/bin/env sh


if which pyenv >/dev/null 2>&1; then
  system_type=$(uname -s)
  cwd="${HOME}/.yadm"

  versions=("3.7.1" "2.7.9")
  for version in ${versions[@]}; do
    echo "Installing python ${version}"

    echo y | pyenv install ${version}
  done
else
  echo "pyenv not installed; nothing to do"
fi

