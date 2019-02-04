ZSH_DISABLE_COMPFIX="true"

function _source () {
  if [ -e ${1} ]; then
    echo "Sourcing file [${1}]..."
    source ${1}
  else
    echo "File ${1} does not exist, nothing to source"
  fi
}

# Source common utils etc
_source ~/.env.sh
_source ~/.shell-aliases.sh
_source ~/.shell-functions.sh
_source ~/.more-shell-aliases.sh 
_source ~/.more-shell-functions.sh 

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export GOPATH="${HOME}/go:${HOME}/go/bin"
export PATH="${PATH}:${GOPATH}"

# Path to your oh-my-zsh installation.
export ZSH="/Users/$(whoami)/.oh-my-zsh"
export ZSH_CUSTOM="/Users/$(whoami)/.yadm/.oh-my-zsh/custom/"

# Terraform...
export TF_PLUGIN_CACHE_DIR="${HOME}/.terraform.d/plugins/"

#ZSH_THEME="scassidy"
ZSH_THEME="powerlevel9k/powerlevel9k"
# User configuration
test -f ~/.powerlevel && source ~/.powerlevel

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
    git 
    brew 
    osx 
    kubectl
    helm
    jenv
    pyenv
    rbenv
    tfenv
    terraform
)

source $ZSH/oh-my-zsh.sh

#    +----------------------------------------+
#    + Options
#    +----------------------------------------+
setopt autocd
setopt appendhistory
setopt autocd
setopt correct_all
setopt extendedglob
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt interactive_comments
setopt pushd_ignore_dups
setopt promptsubst

#    +----------------------------------------+
#    + Command History
#    +----------------------------------------+
export HIST_STAMPS="%d/%m/%Y %T"
export HISTSIZE=2000
export HISTFILE="${HOME}/.history"
export SAVEHIST=${HISTSIZE}
setopt hist_ignore_all_dups

# To try and make auto-complete a bit faster...
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

fpath=(
    /usr/local/share/zsh-completions 
    "${fpath[@]}"
)

export PATH="/usr/local/opt/gnu-getopt/bin:${PATH}"

clean_path
