#!/usr/bin/env sh

zsh_hook_debug() {
  if [ "${ZSH_CUSTOM_HOOKS_DEBUG:-false}" = true ]; then
    echo "$*"
  fi
}