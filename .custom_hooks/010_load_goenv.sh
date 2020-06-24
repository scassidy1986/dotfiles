#!/usr/bin/env sh

declare -rx GOENV_VERSION_FILE=".go-version"

_check_for_goenv () {
  if [[ -f "${GOENV_VERSION_FILE}" ]]; then
    zsh_hook_debug "===> Found ${GOENV_VERSION_FILE}, loading ..."
    eval "$(goenv init -)"
    export PATH="${GOROOT}/bin:${GOPATH}/bin:${PATH}"
    add-zsh-hook -d precmd _check_for_goenv
  fi
}

add-zsh-hook precmd _check_for_goenv
