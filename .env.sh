#!/usr/bin/env sh

export _RBENV_LOADED=1
export _PYENV_LOADED=1
export _GOENV_LOADED=1
export _JABBA_LOADED=1

autoload -Uz add-zsh-hook

_version_file_readable () {
  [[ -f "${1}" ]]
}

_load_rbenv () {
  [[ ${_RBENV_LOADED} -eq 0 ]] && return 0
  version_file=".ruby-version"
  if _version_file_readable "${version_file}"; then
    echo "===> Found ${version_file}, loading ..." 
    eval "$(rbenv init -)"
    export _RBENV_LOADED=0
  fi
}

_load_pyenv () {
  [[ ${_PYENV_LOADED} -eq 0 ]] && return 0
  version_file=".python-version"
  if _version_file_readable "${version_file}"; then
    echo "===> Found ${version_file}, loading ..." 
    eval "$(pyenv init -)"
    export _PYENV_LOADED=0
  fi
}

_load_goenv () {
  [[ ${_GOENV_LOADED} -eq 0 ]] && return 0
  version_file=".go-version"
  if _version_file_readable ${version_file}; then
    echo "===> Found ${version_file}, loading ..." 
    eval "$(goenv init -)"
    export _GOENV_LOADED=0
  fi
}

_load_jabba () {
  version_file=".jabbarc"
  if _version_file_readable ${version_file}; then
    if [[ ${_JABBA_LOADED} -eq 1 ]]; then
      echo "===> Found ${version_file}, loading ..."
      [ -s "/Users/scassidy/.jabba/jabba.sh" ] && source "/Users/scassidy/.jabba/jabba.sh"
      export _JABBA_LOADED=0
    fi
    jabba use
  fi
}

add-zsh-hook precmd _load_rbenv 
add-zsh-hook precmd _load_pyenv
add-zsh-hook precmd _load_goenv
add-zsh-hook precmd _load_jabba
