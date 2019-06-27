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
  builtin cd "$@" && ls -lhG
}

function kubectl() {
  if ! type __start_kubectl >/dev/null 2>&1; then
    unfunction "$0"
    source <(command kubectl completion zsh)
  fi

  command $0 "$@"
}

function clean_path () {
  if [ -n "${PATH}" ]; then
    OLD_PATH=${PATH}:; PATH=
    while [ -n "${OLD_PATH}" ]; do
      x=${OLD_PATH%%:*}       # the first remaining entry
      case ${PATH}: in
        *:"${x}":*) ;;          # already there
        *) PATH=${PATH}:${x};;    # not there yet
      esac
      OLD_PATH=${OLD_PATH#*:}
    done
    PATH=${PATH#:}
    unset OLD_PATH x
  fi
}

function _kubectl_proxy () {
  if [[ -z "${KUBECONFIG}" ]]; then
    log_error "KUBECONFIG is not set"
    return 1
  fi

  return 0  
}
