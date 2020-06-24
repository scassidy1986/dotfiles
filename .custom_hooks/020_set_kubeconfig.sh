#!/usr/bin/env sh

declare -rx TERRAFORM_DIRECTORY=".terraform"
declare -rx TERRAFORM_ENV_FILE=".terraform/environment"

_check_for_kube_config () {
  if [[ -f "${TERRAFORM_ENV_FILE}" ]]; then
    local workspace="$(cat ${TERRAFORM_ENV_FILE})"
    zsh_hook_debug "Found ${TERRAFORM_ENV_FILE} / ${workspace} ..."
    if _kubeconfig_exists ${workspace}; then
      zsh_hook_debug "Found kubeconfig for ${workspace} - sourcing!"
      _export_kubeconfig "${workspace}"
    fi
  fi
}

add-zsh-hook precmd _check_for_kube_config
