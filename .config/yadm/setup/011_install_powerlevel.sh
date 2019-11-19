#!/usr/bin/env sh

source .env
source ${HOME}/.logging
source .helpers

log_info "$0 $@"

log_info "=> Setting up Powerlevel10k"

repo="https://github.com/romkatv/powerlevel10k.git"
powerlevel_folder="${HOME}/.oh-my-zsh/custom/themes/powerlevel10k"

if [ -d "${powerlevel_folder}" ]; then
  log_info "==> Powerlevel already installed @ ${powerlevel_folder}; updating..."
  ( cd ${powerlevel_folder} && git pull > /dev/null 2>&1 )
else
  log_info "==> Installing Powerlevel10k..."
  git clone ${repo} ${powerlevel_folder}
fi

if [ -e "${YADM_HOME}/.powerlevel" ]; then
  ln -nfs "${YADM_HOME}/.powerlevel" "${HOME}/.powerlevel"
fi

log_info "Done!"
