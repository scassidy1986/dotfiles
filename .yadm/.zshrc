ZSH_DISABLE_COMPFIX="true"

test -f ~/.zshenv && source ~/.zshenv
test -f ~/.logging && source ~/.logging

function _source () {
  if [[ -f ${1} && -r ${1} ]]; then
    source ${1}
  else
    log_warn "File ${1} does not exist, nothing to source"
  fi
}

# Source common utils etc
_source ~/.env.sh
_source ~/.shell-aliases.sh
_source ~/.shell-functions.sh
_source ~/.terraform-functions.sh
for helper in $(ls -1 ~/.helpers | sort -V); do
  _source ~/.helpers/${helper}
done
for helper in $(ls -1 ~/.work-helpers | sort -V); do
  _source ~/.work-helpers/${helper}
done

_source "${HOME}/.iterm2_shell_integration.zsh"

# Terraform...
export TF_LOG="INFO"

# Path to your oh-my-zsh installation.
export ZSH="/Users/$(whoami)/.oh-my-zsh"
export ZSH_CUSTOM="/Users/$(whoami)/.yadm/.oh-my-zsh/custom/"

ZSH_THEME="powerlevel9k/powerlevel9k"
# User configuration
_source ~/.powerlevel

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
    git 
    brew 
    osx 
    docker
    jenv
    pyenv
    rbenv
    tfenv
    terraform
    kubectl
)

source $ZSH/oh-my-zsh.sh

# To try and make auto-complete a bit faster...
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
  compinit
else
  compinit -C
fi
#for dump in ~/.zcompdump(N.mh+24); do
#  compinit
#done

compinit -C

fpath=(
    /usr/local/share/zsh-completions 
    "${fpath[@]}"
)

clean_path
