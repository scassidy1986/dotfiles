#!/bin/bash

_source ${HOME}/.logging

function is_linux () {
  if [[ $(uname -s) =~ "Linux" ]]; then
    return
  fi
  false
}

function is_osx () {
  if [[ $(uname -s) =~ "Darwin" ]]; then
    return
  fi
  false
}

function cd () {
  builtin cd "$@" && ll 
}

function trim_whitespace () {
  local var="$*"
  # remove leading whitespace characters
  var="${var#"${var%%[![:space:]]*}"}"
  # remove trailing whitespace characters
  var="${var%"${var##*[![:space:]]}"}"
  echo -n "$var"
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

function _kubectl_proxy () {
  if [[ -z "${KUBECONFIG}" ]]; then
    log_error "KUBECONFIG is not set"
    return 1
  fi

  return 0  
}
