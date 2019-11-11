#!/usr/bin/env sh

autoload -Uz add-zsh-hook

declare -rx RBENV_VERSION_FILE=".ruby-version"
declare -rx PYENV_VERSION_FILE=".python-version"
declare -rx GOENV_VERSION_FILE=".go-version"
declare -rx JABBA_VERSION_FILE=".jabbarc"

_version_file_readable () {
  [[ -f "${1}" ]]
}

_check_for_rbenv () {
  if _version_file_readable "${RBENV_VERSION_FILE}"; then
    echo "===> Found ${RBENV_VERSION_FILE}, loading ..." 
    _load_rbenv
  fi
}

_check_for_pyenv () {
  if _version_file_readable "${PYENV_VERSION_FILE}"; then
    echo "===> Found ${PYENV_VERSION_FILE}, loading ..." 
    _load_pyenv
  fi
}

_check_for_goenv () {
  if _version_file_readable ${GOENV_VERSION_FILE}; then
    echo "===> Found ${GOENV_VERSION_FILE}, loading ..." 
    _load_goenv
  fi
}

_check_for_jabba () {
  if _version_file_readable ${JABBA_VERSION_FILE}; then
    _load_jabba
    jabba use
  fi
}

_load_rbenv () {
  source "${ZSH_PLUGINS}/rbenv/rbenv.plugin.zsh"
  add-zsh-hook -d precmd _check_for_rbenv 
}

_load_pyenv () {
  source "${ZSH_PLUGINS}/pyenv/pyenv.plugin.zsh"
  add-zsh-hook -d precmd _check_for_pyenv 
}

_load_goenv () {
  eval "$(goenv init -)"
  source "${ZSH_PLUGINS}/go/go.plugin.zsh"
  export PATH="${GOROOT}/bin:${GOPATH}/bin:${PATH}"
}

_load_jabba () {
  [ -s "/Users/scassidy/.jabba/jabba.sh" ] && source "/Users/scassidy/.jabba/jabba.sh"
  add-zsh-hook -d precmd _check_for_jabba
}

add-zsh-hook precmd _check_for_rbenv 
add-zsh-hook precmd _check_for_pyenv
add-zsh-hook precmd _check_for_goenv
add-zsh-hook precmd _check_for_jabba

