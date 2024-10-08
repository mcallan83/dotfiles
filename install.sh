#!/usr/bin/env bash

SOURCE="https://github.com/mcallan83/dotfiles"
TARGET="${DOTFILES:-$HOME/.dotfiles}"

if ! [ -x "$(command -v git)" ]; then
    sudo softwareupdate -i -a
    xcode-select --install
fi

if [[ ! -d $TARGET ]]; then
    git clone --recursive $SOURCE $TARGET || exit 1
fi

if [[ -f "$HOME/.zshenv" ]]; then
    mv "$HOME/.zshenv" "$HOME/.zshenv.$(date +%F_%T).bak"
fi

if [[ -f "$HOME/.zshrc" ]]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.$(date +%F_%T).bak"
fi

if [[ -f "$HOME/.zprofile" ]]; then
    mv "$HOME/.zprofile" "$HOME/.zprofile.$(date +%F_%T).bak"
fi

cp "$TARGET/zsh/.zshenv" "$HOME/.zshenv"
ln -s "$TARGET/zsh/.zshrc" "$HOME/.zshrc"
ln -s "$TARGET/zsh/.zprofile" "$HOME/.zprofile"

curl -L https://iterm2.com/shell_integration/zsh -o "$HOME/.iterm2_shell_integration.zsh"

exec zsh
