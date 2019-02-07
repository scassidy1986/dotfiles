#!/usr/bin/env sh

#if which jenv >/dev/null 2>&1; then
#  export PATH="$HOME/.jenv/bin:$PATH"
#  eval "$(jenv init -)"
#fi
#if which renv >/dev/null 2>&1; then
#  eval "$(renv init -)"
#fi
#if which nodenv >/dev/null 2>&1; then
#  eval "$(nodenv init -)"
#fi

export _RBENV_LOADED=1
export _PYENV_LOADED=1
export _GOENV_LOADED=1

_version_file_readable () {
  [[ -f "${1}" && -r "${1}" ]]
}

_load_rbenv () {
  version_file=".ruby-version"
  if _version_file_readable "${version_file}" && [[ ${_RBENV_LOADED} -eq 1 ]]; then
    echo "> Found ${version_file}, loading ..." 
    eval "$(rbenv init -)"
    export _RBENV_LOADED=0
  fi
}

_load_pyenv () {
  version_file=".python-version"
  if _version_file_readable "${version_file}" && [[ ${_PYENV_LOADED} -eq 1 ]]; then
    echo "> Found ${version_file}, loading ..." 
    eval "$(pyenv init -)"
    export _PYENV_LOADED=0
  fi
}

_load_goenv () {
  version_file=".go-version"
  if _version_file_readable ${version_file} && [[ ${_GOENV_LOADED} -eq 1 ]]; then
    echo "> Found ${version_file}, loading ..." 
    eval "$(goenv init -)"
    export _GOENV_LOADED=0
  fi
}

autoload -Uz add-zsh-hook

add-zsh-hook chpwd _load_rbenv
add-zsh-hook chpwd _load_pyenv
add-zsh-hook chpwd _load_goenv
