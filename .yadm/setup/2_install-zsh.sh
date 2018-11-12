#!/usr/bin/env sh

if command -v zsh >/dev/null 2>&1; then
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" >/dev/null 2>&1
  cp -R ../.oh-my-zsh/ ~/.oh-my-zsh/
  cp -R ../.zshrc ~/.zshrc
  source ~/.zshrc
else
  echo "zsh not found"
fi
