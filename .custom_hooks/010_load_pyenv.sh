#!/usr/bin/env sh

declare -rx PYENV_VERSION_FILE=".python-version"

_check_for_pyenv () {
  if [[ $+commands[pyenv] -ne 0 ]] && [[ -f "${PYENV_VERSION_FILE}" ]]; then
    zsh_hook_debug "===> Found ${PYENV_VERSION_FILE}, loading ..."
    if which pyenv-virtualenv-init > /dev/null; then 
      zsh_hook_debug "===> Configuring pyenv virtualenv-init"
      eval "$(pyenv virtualenv-init -)"; 
    fi
    add-zsh-hook -d precmd _check_for_pyenv
  fi
}

add-zsh-hook precmd _check_for_pyenv
