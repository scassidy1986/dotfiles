# Source common utils etc
test -f ~/.env.sh && source ~/.env.sh
test -f ~/.shell-aliases.sh && source ~/.shell-aliases.sh
test -f ~/.shell-functions.sh && source ~/.shell-functions.sh
test -f ~/.more-shell-aliases.sh && source ~/.more-shell-aliases.sh
test -f ~/.more-shell-functions.sh && source ~/.more-shell-functions.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/$(whoami)/.oh-my-zsh"
export ZSH_CUSTOM="/Users/$(whoami)/.yadm/.oh-my-zsh/custom/"

#ZSH_THEME="scassidy"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

plugins=(
    git 
    github 
    gradle 
    jira 
    brew 
    osx 
    zsh-syntax-highlighting 
    docker 
    docker-compose
    kubectl
    jenv
    pyenv
    rbenv
    tfenv
    terraform
    vagrant
    virtualbox
)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration
test -f ~/.powerline && source ~/.powerline
#    +----------------------------------------+
#    + Options
#    +----------------------------------------+
setopt autocd

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

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
