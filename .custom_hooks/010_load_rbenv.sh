#!/usr/bin/env sh

declare -rx RBENV_VERSION_FILE=".ruby-version"

_check_for_rbenv () {
  if [[ -f "${RBENV_VERSION_FILE}" ]]; then
    zsh_hook_debug "===> Found ${RBENV_VERSION_FILE}, loading ..."
    source "${ZSH_PLUGINS}/rbenv/rbenv.plugin.zsh"
    add-zsh-hook -d precmd _check_for_rbenv
  fi
}

add-zsh-hook precmd _check_for_rbenv
