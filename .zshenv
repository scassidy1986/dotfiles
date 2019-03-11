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

# +----------------------------------------+
# + Command History
# +----------------------------------------+
export HIST_STAMPS="%d/%m/%Y %T"
export HISTSIZE=2000
export HISTFILE="${HOME}/.history"
export SAVEHIST=${HISTSIZE}

export KUBECONFIG_HOME="${HOME}/.kube/conf"

export GOHOME="/Users/scassidy/go"
export GOPATH="/Users/scassidy/go:/Users/scassidy/go/bin"
export PATH="/usr/local/opt/gnu-getopt/bin:${GOPATH}:${PATH}"

