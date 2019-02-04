#!/usr/bin/env sh

RED="\033[0;31m"
WHITE="\033[0m"

function _log () {
  timestamp=$(date +"%Y-%m-%d %H-%M-%S")
  echo "[${timestamp}] [${1}] ${2}"
}

function log_info () {
  _log "INFO" "${1}"
}

function log_error () {
  _log "ERROR" "${RED}${1}${WHITE}"
}

function is_linux () {
  [[ $('uname') == 'Linux' ]];
}

function is_osx () {
  [[ $('uname') == 'Darwin' ]]
}

function cd() {
  builtin cd "$@" && ll 
}

function trim_whitespace () {
  local var="$*"
  # remove leading whitespace characters
  var="${var#"${var%%[![:space:]]*}"}"
  # remove trailing whitespace characters
  var="${var%"${var##*[![:space:]]}"}"
  echo -n "$var"
}

function _tf_workspace () {
  PS3="Select a workspace: "
  workspaces=($(ls -1 *.tfvars | sed -e 's/\..*$//'))
  select opt in "default" "${workspaces[@]}" "Quit";
  do
    if [ "${opt}" = "Quit" ]; then
      return 0
    fi

    workspace=${opt}
    echo "Setting terraform workspace to ${workspace} ..."
    terraform workspace select ${workspace}
    _exit=$?
    echo "Set terraform workspace to $(terraform workspace show)"
    return ${_exit}
  done
}

function clean_path () {
  if [ -n "${PATH}" ]; then
    old_PATH=${PATH}:; PATH=
    while [ -n "${old_PATH}" ]; do
      x=${old_PATH%%:*}       # the first remaining entry
      case ${PATH}: in
        *:"${x}":*) ;;          # already there
        *) PATH=${PATH}:${x};;    # not there yet
      esac
      old_PATH=${old_PATH#*:}
    done
    PATH=${PATH#:}
    unset old_PATH x
  fi
}

function _export_kubeconfig () {
  PS3="Select a kube config: "
  files=($(ls -1 ${HOME}/.kube/config/* | xargs -n 1 basename))
  select opt in "${files[@]}" "Quit";
  do
    if [ "${opt}" = "Quit" ]; then
      return 0
    fi
    konfig_file="${HOME}/.kube/config/${opt}"
    if [ ! -e "${konfig_file}" ]; then
      echo "Kube config for ${opt} not found (${konfig_file})"
      return 1
    fi
    echo "Setting Kubectl config to '${konfig_file}'"
    export KUBECONFIG=${konfig_file}
    echo " > KUBECONFIG ${KUBECONFIG}"
    return 0
  done
}

