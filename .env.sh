#!/usr/bin/env sh

if which jenv >/dev/null 2>&1; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi
if which pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
if which rbenv >/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi
if which renv >/dev/null 2>&1; then
  eval "$(renv init -)"
fi
if which nodenv >/dev/null 2>&1; then
  eval "$(nodenv init -)"
fi
if which goenv >/dev/null 2>&1; then
  eval "$(goenv init -)"
fi
