#!/bin/sh

defaults write com.googlecode.iterm2 "PrefsCustomFolder" -string "$DOTFILES/apps/iterm"
defaults write com.googlecode.iterm2 "LoadPrefsFromCustomFolder" -bool true
