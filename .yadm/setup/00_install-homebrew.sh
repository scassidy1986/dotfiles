#!/usr/bin/env sh

system_type=$(uname -s)
brewfile_suffix=""

# install homebrew if it's missing
if [[ ${system_type} == "Darwin" ]]; then
  brewfile_suffix="mac"

  if ! command -v brew >/dev/null 2>&1; then
    echo "> Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "> Homebrew installed"
  fi
elif [[ ${system_type} == "Linux" ]]; then
  brewfile_suffix="linux"

  if ! command -v brew >/dev/null 2>&1; then
    echo "> Installing homebrew"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
  else
    echo "> Homebrew installed"
  fi
  test -d ~/.linuxbrew && PATH="${HOME}/.linuxbrew/bin:${HOME}/.linuxbrew/sbin:${PATH}"
  test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"
fi

echo "> brew bundle"
brew tap homebrew/bundle
brew bundle --file="${HOME}/.Brewfile.${brewfile_suffix}"
