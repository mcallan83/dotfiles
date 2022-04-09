#!/usr/bin/env bash

SOURCE="https://github.com/mcallan83/dotfiles"
TARGET="$HOME/.dotfiles"

if ! [ -x "$(command -v git)" ]; then
    if [[ $(uname -s) == 'Darwin' ]]; then
        sudo softwareupdate -i -a
        xcode-select --install
    else
        echo 'Install Git and try again.'
        exit 1
    fi

fi

git clone --recursive $SOURCE $TARGET || exit 1

ln -s "$TARGET/zsh/.zshrc" "$HOME/.zshrc"
