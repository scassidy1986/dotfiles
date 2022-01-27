ZSH_DISABLE_COMPFIX="true"

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
export ZSH_CUSTOM="${ZSH}/custom/"
export ZSH_PLUGINS="${ZSH}/plugins"
export ZSH_CUSTOM_HOOKS="${HOME}/.custom_hooks/"

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

function echoerr () {
  printf "%s\n" "$*" >&2;
}

# User configuration
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# The following lines were added by compinstall
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Git
GIT_AUTO_FETCH_INTERVAL=1200

HOMEBREW_PREFIX=$(brew --prefix)
fpath=(
  ${HOMEBREW_PREFIX}/share/zsh/site-functions
  ${HOMEBREW_PREFIX}/etc/bash_completion.d
  /usr/local/share/zsh-completions
  ${HOME}/.autoload
  ${fpath}
)

# Plugins
## ssh-agent
zstyle :omz:plugins:ssh-agent quiet no
zstyle :omz:plugins:ssh-agent agent-forwarding yes

plugins=(
  aws
  brew
  colorize
  direnv
  docker
  docker-compose
  git
  git-auto-fetch
  gnu-utils
  history
  jenv
  kubectl
  macos
  mvn
  nvm
  pip
  python
  pyenv
  rbenv
  ruby
  spring
  ssh-agent
)

_source ${ZSH}/oh-my-zsh.sh

# Source common utils etc
_source ~/.shell-aliases.sh
_source_folder ~/.shell-functions

# Load custom zsh hooks
autoload -Uz add-zsh-hook
_source_folder "${ZSH_CUSTOM_HOOKS}"

_source ~/.iterm2_shell_integration.zsh

for file in $(ls -1 ${HOME}/.autoload/); do
  autoload ${file}
done

if is_linux; then
  test -d ~/.linuxbrew && export PATH="${HOME}/.linuxbrew/bin:${HOME}/.linuxbrew/sbin:${PATH}"
  test -d /home/linuxbrew/.linuxbrew && export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:${PATH}"
fi

export EDITOR="vim"
export JETBRAINS_BIN="${HOME}/.jetbrains"
# Golang
export PATH="${JETBRAINS_BIN}:${PATH}"
export PATH="/usr/local/opt/grep/libexec/gnubin:${PATH}"
export PATH="$(brew --prefix openssl)/bin:${PATH}"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:${PATH}"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"
export PATH="/usr/local/opt/bzip2/bin:${PATH}"
export PATH="/usr/local/opt/libiconv/bin:${PATH}"
export PATH="/usr/local/sbin:${PATH}"

_source_folder ~/.work-helpers

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"

_source_folder ~/.completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# GPG
export GPG_TTY=$(tty)

# Tidy up
clean_path

