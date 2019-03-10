#!/bin/bash

source ${HOME}/.logging
source .helpers

log_info "Setting up Powerlevel9k"

powerlevel_folder="${HOME}/.oh-my-zsh/custom/themes/powerlevel9k"

if [ -d "${powerlevel_folder}" ]; then
  log_info " - Powerline already installed @ ${powerline_folder}; updating..."
  ( cd ${powerline_folder} && git pull > /dev/null 2>&1 )
else
  log_info " - Installing Powerlevel9k..."
  git clone https://github.com/bhilburn/powerlevel9k.git ${HOME}/.oh-my-zsh/custom/themes/powerlevel9k
fi

if [ -e "${HOME}/.yadm/.powerlevel" ]; then
  ln -nfs "${HOME}/.yadm/.powerlevel" "${HOME}/.powerlevel"
fi

log_info "Done!"
