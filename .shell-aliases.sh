#!/usr/bin/env sh

# aliases
alias ls="ls -G"
alias ll="ls -lhG"

# brew
alias brew-bundle="brew bundle --file=~/.Brewfile --verbose"
alias brew-bundle-check="brew-bundle check"
alias brew-bundle-list="brew-bundle list"

# helpers
alias netstat-listen="netstat -atunlp"

# k8s

# auto-correct...
alias brew="nocorrect brew"
alias kapitan="nocorrect kapitan"
alias pip="nocorrect pip"
alias pip3="nocorrect pip3"
alias helm="nocorrect helm"
alias minikube="nocorrect minikube"
alias kubectl="nocorrect kubectl"

# helpers
alias uuid-v4="python -c 'import sys,uuid; sys.stdout.write(str(uuid.uuid4()))'"
# friendly names
