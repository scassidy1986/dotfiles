#!/usr/bin/env sh

function is_linux () {
  [[ $('uname') == 'Linux' ]];
}

function is_osx () {
  [[ $('uname') == 'Darwin' ]]
}

function cd() {
    builtin cd "$@" && ls -lthr
}

