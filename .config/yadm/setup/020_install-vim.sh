#!/usr/bin/env sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source ${DIR}/.env
source ${HOME}/.logging
source ${DIR}/.helpers

log_info "$0 $@"

if command -v vim >/dev/null 2>&1; then
  log_info "=> Bootstraping Vim"
  ln -nfs "${YADM_HOME}/.vimrc" "${HOME}/.vimrc"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >/dev/null 2>&1
  vim '+PlugClean!' '+PlugUpdate' '+qall'
fi
