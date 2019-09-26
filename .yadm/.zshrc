ZSH_DISABLE_COMPFIX="true"

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${ZSH}/custom/"
export ZSH_PLUGINS="${ZSH}/plugins"

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
_source_folder ~/.helpers
_source_folder ~/.work-helpers

_source ~/.iterm2_shell_integration.zsh

for file in $(ls -1 ${HOME}/.autoload/); do
  autoload ${file}
done

# User configuration
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

HOMEBREW_PREFIX=$(brew --prefix)
fpath=(
  ${HOMEBREW_PREFIX}/share/zsh/site-functions
  ${HOMEBREW_PREFIX}/etc/bash_completion.d
  /usr/local/share/zsh-completions 
  ${HOME}/.autoload
  ${fpath}
)

plugins=(
  git 
  brew 
  osx 
  docker
  terraform
)

_source ${ZSH}/oh-my-zsh.sh

if is_linux; then
  test -d ~/.linuxbrew && export PATH="${HOME}/.linuxbrew/bin:${HOME}/.linuxbrew/sbin:${PATH}"
  test -d /home/linuxbrew/.linuxbrew && export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"
fi

if [[ "${COMPINIT_ON_STARTUP:-1}" -eq 0 ]]; then
  # Execute code in the background to not affect the current session
  autoload -Uz compinit
  compinit
  {
    # Compile zcompdump, if modified, to increase startup speed.
    zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
    if [[ -s "${zcompdump}" && (! -s "${zcompdump}.zwc" || "${zcompdump}" -nt "${zcompdump}.zwc") ]]; then
      log_debug "Compiling ${zcompdump}"
      zcompile "${zcompdump}"
    fi
  } &! 
fi

export JETBRAINS_BIN="${HOME}/.jetbrains"
# Golang
export GOHOME="${HOME}/go"
export GOPATH="${GOHOME}"
export GOENV_ROOT="${HOME}/.goenv"
export PATH="/usr/local/opt/gnu-getopt/bin:${GOPATH}:${GOPATH}/bin:${GOENV_ROOT}/bin:${JETBRAINS_BIN}:${PATH}"

clean_path

autoload -U +X bashcompinit && bashcompinit

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
