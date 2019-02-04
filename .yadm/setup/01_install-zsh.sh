#!/usr/bin/env sh

if command -v zsh >/dev/null 2>&1; then
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" >/dev/null 2>&1
  ln -nfs "${HOME}/.yadm/.oh-my-zsh/" "${HOME}/.oh-my-zsh/"
  ln -nfs "${HOME}/.yadm/.zshrc" "${HOME}/.zshrc"
  source "${HOME}/.zshrc"
else
  echo "zsh not found"
fi
