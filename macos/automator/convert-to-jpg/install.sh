#!/usr/bin/env bash

cd "$HOME/Library/Services" || exit

ln -s "$DOTFILES/macos/automator/convert-to-jpg/convert-to-jpg.workflow" .
