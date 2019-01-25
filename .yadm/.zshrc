ZSH_DISABLE_COMPFIX="true"

# Source common utils etc
test -f ~/.env.sh && source ~/.env.sh
test -f ~/.shell-aliases.sh && source ~/.shell-aliases.sh
test -f ~/.shell-functions.sh && source ~/.shell-functions.sh
test -f ~/.more-shell-aliases.sh && source ~/.more-shell-aliases.sh
test -f ~/.more-shell-functions.sh && source ~/.more-shell-functions.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export GOPATH="${HOME}/go:${HOME}/go/bin"
export PATH="${PATH}:${GOPATH}"

# Path to your oh-my-zsh installation.
export ZSH="/Users/$(whoami)/.oh-my-zsh"
export ZSH_CUSTOM="/Users/$(whoami)/.yadm/.oh-my-zsh/custom/"

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

#  +----------------------------------------+
#  + Aliases
#  +----------------------------------------+
alias zshconfig="vim ~/.zshrc"
alias zshconfig_reload=". ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

alias ll="ls -lthrG"
alias ls="ls -G"

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
