#!/usr/bin/env bash

ITERM_FOLDER="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

defaults write com.googlecode.iterm2 "PrefsCustomFolder" -string "$ITERM_FOLDER"
defaults write com.googlecode.iterm2 "LoadPrefsFromCustomFolder" -bool true
