ZSH_DISABLE_COMPFIX="true"

test -f ~/.zshenv && source ~/.zshenv
test -f ~/.logging && source ~/.logging

function _source () {
  if [[ -f ${1} && -r ${1} ]]; then
    log_debug "Sourcing file ${1} ..."
    source ${1}
  else
    log_warn "File ${1} does not exist, nothing to source"
  fi
}

function _source_folder () {
  if [[ -d ${1} ]]; then
    for file in $(ls -1 ${1} | sort -V); do
      _source ${1}/${file}
    done
  else
    log_warn "Folder ${1} does not exist, nothing to source"
  fi
}

# Source common utils etc
_source ~/.env.sh
_source ~/.shell-aliases.sh
_source ~/.shell-functions.sh
_source ~/.terraform-functions.sh
_source_folder ${HOME}/.helpers
_source_folder ${HOME}/.work-helpers

_source "${HOME}/.iterm2_shell_integration.zsh"

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${HOME}/.oh-my-zsh/custom/"

# Terraform...
#export TF_LOG="INFO"

# User configuration
ZSH_THEME="powerlevel9k/powerlevel9k"
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
)

source $ZSH/oh-my-zsh.sh

# To try and make auto-complete a bit faster...

fpath=(
    /usr/local/share/zsh-completions 
    "${fpath[@]}"
)

if is_linux; then
  test -d ~/.linuxbrew && export PATH="${HOME}/.linuxbrew/bin:${HOME}/.linuxbrew/sbin:${PATH}"
  test -d /home/linuxbrew/.linuxbrew && export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"
fi

clean_path

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

