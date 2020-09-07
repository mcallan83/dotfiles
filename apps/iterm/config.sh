#!/usr/bin/env bash

# shellcheck disable=SC1091
. ../utils.sh

confirm "Configure iTerm?"

defaults write com.googlecode.iterm2 "PrefsCustomFolder" -string "$DOTFILES/apps/iterm"
defaults write com.googlecode.iterm2 "LoadPrefsFromCustomFolder" -bool true
