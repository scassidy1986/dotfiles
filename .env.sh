# History
HIST_STAMPS="dd/mm/yyyy"
HISTCONTROL=ignoredups:erasedups  # no duplicate entries
HISTSIZE=100000                   # big big history
HISTFILESIZE=100000               # big big history

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

