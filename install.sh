#!/usr/bin/env bash

SOURCE="https://github.com/mcallan83/dotfiles"
TARGET="$HOME/.dotfiles"

if ! [ -x "$(command -v git)" ]; then
    sudo softwareupdate -i -a
    xcode-select --install
fi

git clone --recursive $SOURCE $TARGET

ln -s "$TARGET/zsh/.zshrc" "$HOME/.zshrc"
