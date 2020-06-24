#!/usr/bin/env sh

declare -rx JAVA_VERSION_FILE=".java-version"

_check_for_jenv () {
  if [[ -f "${JAVA_VERSION_FILE}" ]]; then
    zsh_hook_debug "===> Found ${JAVA_VERSION_FILE}, loading ..."
    source "${ZSH_PLUGINS}/jenv/jenv.plugin.zsh"
    add-zsh-hook -d precmd _check_for_jenv
  fi
}

add-zsh-hook precmd _check_for_jenv