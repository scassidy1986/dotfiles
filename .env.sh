#!/usr/bin/env sh

autoload -Uz add-zsh-hook

_version_file_readable () {
  [[ -f "${1}" ]]
}

_check_for_rbenv () {
  version_file=".ruby-version"
  if _version_file_readable "${version_file}"; then
    echo "===> Found ${version_file}, loading ..." 
    _load_rbenv
  fi
}

_check_for_pyenv () {
  version_file=".python-version"
  if _version_file_readable "${version_file}"; then
    echo "===> Found ${version_file}, loading ..." 
    _load_pyenv
  fi
}

_check_for_goenv () {
  version_file=".go-version"
  if _version_file_readable ${version_file}; then
    echo "===> Found ${version_file}, loading ..." 
    _load_goenv
  fi
}

_check_for_jabba () {
  version_file=".jabbarc"
  if _version_file_readable ${version_file}; then
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
  add-zsh-hook precmd _check_for_goenv
}

_load_jabba () {
  [ -s "/Users/scassidy/.jabba/jabba.sh" ] && source "/Users/scassidy/.jabba/jabba.sh"
  add-zsh-hook precmd _check_for_jabba
}

add-zsh-hook precmd _check_for_rbenv 
add-zsh-hook precmd _check_for_pyenv
add-zsh-hook precmd _check_for_goenv
add-zsh-hook precmd _check_for_jabba

