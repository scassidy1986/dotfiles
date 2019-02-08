#!/usr/bin/env sh

_source ${HOME}/.logging

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
    log_info "Setting terraform workspace to ${workspace} ..."
    terraform workspace select ${workspace}
    _exit=$?
    log_info "Set terraform workspace to $(terraform workspace show)"
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
  local conf_dir="${KUBECONFIG_HOME:-${HOME}/.kube/conf}"
  if [[ ! -d ${conf_dir} ]]; then
    log_error "Kube config directory does not exist @ [${conf_dir}]"
    return 1
  fi

  PS3="Select a kube config (${conf_dir}): "
  files=($(ls -1 ${conf_dir}/kubeconfig-* | xargs -n 1 basename))
  select opt in "${files[@]}" "Quit";
  do
    if [ "${opt}" = "Quit" ]; then
      return 0
    fi
    konfig_file="${conf_dir}/${opt}"
    if [ ! -e "${konfig_file}" ]; then
      log_error "Kube config for ${opt} not found (${konfig_file})"
      return 1
    fi
    log_info "Setting Kubectl config to '${konfig_file}'"
    export KUBECONFIG=${konfig_file}
    log_info " > KUBECONFIG      ${KUBECONFIG}"
    log_info " > Dashboard Token $(get-kubernetes-secret --secret dashboard-kubernetes-dashboard-token --quiet)"
    return 0
  done
}

function _kubectl_proxy () {
  if [[ -z "${KUBECONFIG}" ]]; then
    log_error "KUBECONFIG is not set"
    return 1
  fi

  return 0  
}
