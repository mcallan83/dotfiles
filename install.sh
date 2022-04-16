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
    git clone --recursive $SOURCE $TARGET || exit 1
fi

if [[ -f "$HOME/.zshenv" || -f "$HOME/.zshrc" ]]; then
    echo -e "Remove ~/.zshenv and ~/.zshrc and run installer again."
    exit 1
fi

cp "$TARGET/zsh/.zshenv" "$HOME/.zshenv"
ln -s "$TARGET/zsh/.zshrc" "$HOME/.zshrc"

curl -L https://iterm2.com/shell_integration/zsh -o "$HOME/.iterm2_shell_integration.zsh"

exec zsh
