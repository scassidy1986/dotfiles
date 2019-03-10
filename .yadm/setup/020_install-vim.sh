#!/usr/bin/env sh

if command -v vim >/dev/null 2>&1; then
  echo "Bootstraping Vim"
  ln -nfs ${HOME}/.yadm/.vimrc ${HOME}/.vimrc 
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >/dev/null 2>&1
  vim '+PlugClean!' '+PlugUpdate' '+qall'
fi
