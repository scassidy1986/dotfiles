#!/usr/bin/env sh

export _RBENV_LOADED=1
export _PYENV_LOADED=1
export _GOENV_LOADED=1
export _JABBA_LOADED=1

_version_file_readable () {
  [[ -f "${1}" && -r "${1}" ]]
}

_load_rbenv () {
  [[ ${_RBENV_LOADED} -eq 0 ]] && return 0
  version_file=".ruby-version"
  if _version_file_readable "${version_file}"; then
    echo "> Found ${version_file}, loading ..." 
    eval "$(rbenv init -)"
    export _RBENV_LOADED=0
  fi
}

_load_pyenv () {
  [[ ${_PYENV_LOADED} -eq 0 ]] && return 0
  version_file=".python-version"
  if _version_file_readable "${version_file}"; then
    echo "> Found ${version_file}, loading ..." 
    eval "$(pyenv init -)"
    export _PYENV_LOADED=0
  fi
}

_load_goenv () {
  [[ ${_GOENV_LOADED} -eq 0 ]] && return 0
  version_file=".go-version"
  if _version_file_readable ${version_file}; then
    echo "> Found ${version_file}, loading ..." 
    eval "$(goenv init -)"
    export _GOENV_LOADED=0
  fi
}

_load_jabba () {
  [[ ${_JABBA_LOADED} -eq 0 ]] && return 0
  version_file=".jabbarc"
  if _version_file_readable ${version_file}; then
    echo "> Found ${version_file}, loading ..."
    [ -s "/Users/scassidy/.jabba/jabba.sh" ] && source "/Users/scassidy/.jabba/jabba.sh"
    export _JABBA_LOADED=0
  fi
}

autoload -Uz add-zsh-hook

add-zsh-hook chpwd _load_rbenv
add-zsh-hook chpwd _load_pyenv
add-zsh-hook chpwd _load_goenv
add-zsh-hook chpwd _load_jabba
