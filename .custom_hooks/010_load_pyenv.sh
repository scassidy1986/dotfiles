#!/usr/bin/env sh

declare -rx PYENV_VERSION_FILE=".python-version"

_check_for_pyenv () {
  if [[ -f "${PYENV_VERSION_FILE}" ]]; then
    zsh_hook_debug "===> Found ${PYENV_VERSION_FILE}, loading ..."
    source "${ZSH_PLUGINS}/pyenv/pyenv.plugin.zsh"
    add-zsh-hook -d precmd _check_for_pyenv
  fi
}

add-zsh-hook precmd _check_for_pyenv
