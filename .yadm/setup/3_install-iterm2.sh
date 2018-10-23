#!/usr/bin/env sh

if [ -f "${HOME}/.iterm2/com.googlecode.iterm2.plist" ]; then
  echo "Setting iTerm2 preferences"
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.iterm2/"
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
fi
