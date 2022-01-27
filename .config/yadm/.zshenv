export DEBUG_LOGGING_ENABLED=false

# +----------------------------------------+
# + Homebrew
# +----------------------------------------+
if [ "$(uname -m)" = "arm64" ]; then
  export HOMEBREW_PREFIX="/opt/homebrew";
  export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
  export HOMEBREW_REPOSITORY="/opt/homebrew";
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
  export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
  export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
  # NVM
  export NVM_HOMEBREW="$(brew --prefix)/opt/nvm"
fi

# +----------------------------------------+
# + Options
# +----------------------------------------+
setopt autocd
setopt appendhistory
setopt extendedglob
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt interactive_comments
setopt pushd_ignore_dups
setopt promptsubst

unsetopt correct

export DISABLE_UPDATE_PROMPT="true"

# Stop brew automatically cleaning up old packages....
export HOMEBREW_NO_INSTALL_CLEANUP=1

# +----------------------------------------+
# + Command History
# +----------------------------------------+
export HIST_STAMPS="%d/%m/%Y %T"
export HISTSIZE=2000
export HISTFILE="${HOME}/.history"
export SAVEHIST=${HISTSIZE}

# Kubernetes
export KUBECONFIG_HOME="${HOME}/.kube/conf"

# Terraform
export TF_PLUGIN_CACHE_DIR="${HOME}/.terraform.d/plugins_cache"

# goenv
export GOENV_ROOT="${HOME}/.goenv"

# jq
# https://stedolan.github.io/jq/manual/#Colors
export JQ_COLORS="1;31:0;39:0;39:0;39:0;32:1;39:1;39"

