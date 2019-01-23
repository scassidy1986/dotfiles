#!/usr/bin/env sh

function is_linux () {
  [[ $('uname') == 'Linux' ]];
}

function is_osx () {
  [[ $('uname') == 'Darwin' ]]
}

function cd() {
    builtin cd "$@" && ll 
}

function clean_path () {
  if [ -n "${PATH}" ]; then
    old_PATH=${PATH}:; PATH=
    while [ -n "${old_PATH}" ]; do
      x=${old_PATH%%:*}       # the first remaining entry
      case ${PATH}: in
        *:"${x}":*) ;;          # already there
        *) PATH=${PATH}:${x};;    # not there yet
      esac
      old_PATH=${old_PATH#*:}
    done
    PATH=${PATH#:}
    unset old_PATH x
  fi
}

