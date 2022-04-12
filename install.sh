#!/usr/bin/env bash

SOURCE="https://github.com/mcallan83/dotfiles"
TARGET="${DOTFILES:-$HOME/.dotfiles}"

if ! [ -x "$(command -v git)" ]; then
    if [[ $(uname -s) == 'Darwin' ]]; then
        sudo softwareupdate -i -a
        xcode-select --install
    else
        echo 'Install Git and try again.'
        exit 1
    fi

fi

if [[ ! -d $TARGET ]]; then
    echo -e "Cloning Dotfiles:"
    git clone --recursive $SOURCE $TARGET || exit 1
fi

cp "$TARGET/zsh/.zshenv" "$HOME/.zshenv"

if [[ ! -f "$HOME/.zshrc" ]]; then
    ln -s "$TARGET/zsh/.zshrc" "$HOME/.zshrc"
else
    echo "$HOME/.zshrc already exists. Cannot symlink."
fi


