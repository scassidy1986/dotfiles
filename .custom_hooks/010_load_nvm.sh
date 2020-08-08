#!/usr/bin/env sh

declare -rx NVM_VERSION_FILE=".nvmrc"

export NVM_DIR="${HOME}/.nvm"

_check_for_nvm () {
  if [[ -f "${NVM_VERSION_FILE}" ]]; then
    zsh_hook_debug "===> Found ${NVM_VERSION_FILE}, loading ..."    
    
    export NVM_DIR="${HOME}/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "${nvmrc_path}" ]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

      if [ "${nvmrc_node_version}" = "N/A" ]; then
        nvm install
      elif [ "${nvmrc_node_version}" != "${node_version}" ]; then
        nvm use
      fi
    elif [ "${node_version}" != "$(nvm version default)" ]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi

    add-zsh-hook -d precmd _check_for_nvm
  fi
}

add-zsh-hook precmd _check_for_nvm
