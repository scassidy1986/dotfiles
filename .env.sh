#!/usr/bin/env sh

export _RBENV_LOADED=1
export _PYENV_LOADED=1
export _GOENV_LOADED=1
export _JABBA_LOADED=1

export ZSH_PLUGINS="${ZSH}/plugins"

autoload -Uz add-zsh-hook

_version_file_readable () {
  [[ -f "${1}" ]]
}


_check_for_rbenv () {
  [[ ${_RBENV_LOADED} -eq 0 ]] && return 0
  version_file=".ruby-version"
  if _version_file_readable "${version_file}"; then
    echo "===> Found ${version_file}, loading ..." 
    _load_rbenv
  fi
}

_load_rbenv () {
  source "${ZSH_PLUGINS}/rbenv/rbenv.plugin.zsh"
  export _RBENV_LOADED=0
}

_check_for_pyenv () {
  [[ ${_PYENV_LOADED} -eq 0 ]] && return 0
  version_file=".python-version"
  if _version_file_readable "${version_file}"; then
    echo "===> Found ${version_file}, loading ..." 
    _load_pyenv
  fi
}

_load_pyenv () {
  source "${ZSH_PLUGINS}/pyenv/pyenv.plugin.zsh"
  export _PYENV_LOADED=0
}


_check_for_goenv () {
  [[ ${_GOENV_LOADED} -eq 0 ]] && return 0
  version_file=".go-version"
  if _version_file_readable ${version_file}; then
    echo "===> Found ${version_file}, loading ..." 
    _load_goenv
  fi
}

_load_goenv () {
  eval "$(goenv init -)"
  source "${ZSH_PLUGINS}/go/go.plugin.zsh"
  export PATH="${GOROOT}/bin:${GOPATH}/bin:${PATH}"
  export _GOENV_LOADED=0
}


_check_for_jabba () {
  version_file=".jabbarc"
  if _version_file_readable ${version_file}; then
    if [[ ${_JABBA_LOADED} -eq 1 ]]; then
      _load_jabba
    fi
    jabba use
  fi
}

_load_jabba () {
  [ -s "/Users/scassidy/.jabba/jabba.sh" ] && source "/Users/scassidy/.jabba/jabba.sh"
  export _JABBA_LOADED=0
}

add-zsh-hook precmd _check_for_rbenv 
add-zsh-hook precmd _check_for_pyenv
add-zsh-hook precmd _check_for_goenv
add-zsh-hook precmd _check_for_jabba
