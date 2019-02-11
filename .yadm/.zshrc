ZSH_DISABLE_COMPFIX="true"

test -f ~/.zshenv && source ~/.zshenv

function _source () {
  if [[ -f ${1} && -r ${1} ]]; then
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
for helper in $(ls -1 ~/.helpers); do
  _source ~/.helpers/${helper}
done

_source "${HOME}/.iterm2_shell_integration.zsh"

# Path to your oh-my-zsh installation.
export ZSH="/Users/$(whoami)/.oh-my-zsh"
export ZSH_CUSTOM="/Users/$(whoami)/.yadm/.oh-my-zsh/custom/"

# Terraform...
export TF_PLUGIN_CACHE_DIR="${HOME}/.terraform.d/plugins/"

#ZSH_THEME="scassidy"
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
