#!/usr/bin/env sh

system_type=$(uname -s)

# install homebrew if it's missing
if [[ ${system_type} == "Darwin" ]]; then

  # install homebrew if it's missing
  if ! command -v brew >/dev/null 2>&1; then
    echo "> Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "> Homebrew installed"
  fi

  echo "> brew bundle"
  brew tap homebrew/bundle
  brew bundle --file="${HOME}/.Brewfile.mac"
fi

if [[ ${system_type} == "Linux" ]]; then

  if ! command -v brew >/dev/null 2>&1; then
    echo "> Installing homebrew"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
  else
    echo "> Homebrew installed"
  fi
  test -d ~/.linuxbrew && PATH="${HOME}/.linuxbrew/bin:${HOME}/.linuxbrew/sbin:${PATH}"
  test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"

  echo "> brew bundle"
  brew tap homebrew/bundle
  brew bundle --file="${HOME}/.Brewfile.linux"
fi

