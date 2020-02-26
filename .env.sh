#!/usr/bin/env sh

autoload -Uz add-zsh-hook

declare -rx RBENV_VERSION_FILE=".ruby-version"
declare -rx PYENV_VERSION_FILE=".python-version"
declare -rx GOENV_VERSION_FILE=".go-version"
declare -rx JABBA_VERSION_FILE=".jabbarc"
declare -rx JAVA_VERSION_FILE=".java-version"
declare -rx TERRAFORM_DIRECTORY=".terraform"
declare -rx TERRAFORM_ENV_FILE=".terraform/environment"

_file_readable () {
  [[ -f "${1}" ]]
}

_directory_readable () {
  [[ -d "${1}" ]]
}

_check_for_rbenv () {
  if _file_readable "${RBENV_VERSION_FILE}"; then
    echo "===> Found ${RBENV_VERSION_FILE}, loading ..."
    _load_rbenv
  fi
}

_check_for_pyenv () {
  if _file_readable "${PYENV_VERSION_FILE}"; then
    echo "===> Found ${PYENV_VERSION_FILE}, loading ..."
    _load_pyenv
  fi
}

_check_for_goenv () {
  if _file_readable ${GOENV_VERSION_FILE}; then
    echo "===> Found ${GOENV_VERSION_FILE}, loading ..."
    _load_goenv
  fi
}

_check_for_jabba () {
  if _file_readable ${JABBA_VERSION_FILE} || _file_readable ${JAVA_VERSION_FILE}; then
    echo "===> Found ${JABBA_VERSION_FILE}|${JAVA_VERSION_FILE}, loading ..."
    _load_jabba
  fi
  if _file_readable ${JABBA_VERSION_FILE}; then
    jabba use
  fi
}

_check_for_kube_config () {
  if _file_readable "${TERRAFORM_ENV_FILE}"; then
    local workspace="$(cat ${TERRAFORM_ENV_FILE})"
    if _kubeconfig_exists ${workspace}; then
      _export_kubeconfig "${workspace}"
    fi
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
  export PATH="${GOROOT}/bin:${GOPATH}/bin:${PATH}"
  add-zsh-hook -d precmd _check_for_goenv
}

_load_jabba () {
  [ -s "/Users/scassidy/.jabba/jabba.sh" ] && source "/Users/scassidy/.jabba/jabba.sh"
  add-zsh-hook -d precmd _check_for_jabba
}

add-zsh-hook precmd _check_for_rbenv
add-zsh-hook precmd _check_for_pyenv
add-zsh-hook precmd _check_for_goenv
add-zsh-hook precmd _check_for_jabba
add-zsh-hook precmd _check_for_kube_config
