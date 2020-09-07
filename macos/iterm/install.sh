#!/bin/sh

defaults write com.googlecode.iterm2 "PrefsCustomFolder" -string "$DOTFILES/macos/iterm"
defaults write com.googlecode.iterm2 "LoadPrefsFromCustomFolder" -bool true
