#!/usr/bin/env zsh

GIT_REPO_URL="https://github.com/mcallan83/dotfiles"
TARGET="${TARGET:-$HOME/.dotfiles}"

if ! xcode-select -p >/dev/null 2>&1; then
    xcode-select --install || exit 1
    print 'Finish installing Xcode Command Line Tools, then rerun this script.'
    exit 0
fi

if [[ ! -d "$TARGET" ]]; then
    git clone --recursive "$GIT_REPO_URL" "$TARGET" || exit 1
fi

if [[ -f "$HOME/.zshenv" ]]; then
    mv "$HOME/.zshenv" "$HOME/.zshenv.$(date +%F_%T).bak"
fi

if [[ -f "$HOME/.zshrc" ]]; then
    mv "$HOME/.zshrc" "$HOME/.zshrc.$(date +%F_%T).bak"
fi

cp "$TARGET/zsh/.zshenv" "$HOME/.zshenv"
ln -s "$TARGET/zsh/.zshrc" "$HOME/.zshrc"

exec zsh
