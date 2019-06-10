export DEBUG_LOGGING_ENABLED=false

# +----------------------------------------+
# + Options
# +----------------------------------------+
setopt autocd
setopt appendhistory
setopt correct_all
setopt extendedglob
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt interactive_comments
setopt pushd_ignore_dups
setopt promptsubst

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

# Golang
export GOHOME="${HOME}/go"
export GOPATH="${GOHOME}:${GOHOME}/bin"

# Python

# Terraform
export TF_PLUGIN_CACHE_DIR="${HOME}/.terraform.d/plugins_cache"

export PATH="/usr/local/opt/gnu-getopt/bin:${GOPATH}:${PATH}"

