#!/usr/bin/env sh

source .env
source ${HOME}/.logging

log_info "$0 $@"

if command -v vim >/dev/null 2>&1; then
  log_info "=> Bootstraping Vim"
  ln -nfs "${YADM_HOME}/.vimrc" "${HOME}/.vimrc"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >/dev/null 2>&1
  vim '+PlugClean!' '+PlugUpdate' '+qall'
fi
