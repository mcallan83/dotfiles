#!/bin/sh

CONFIG_PATH="$HOME/.hammerspoon"

# backup existing settings
if [ -d "$CONFIG_PATH" ] || [ -f "$CONFIG_PATH" ]; then
    echo "Hammerspoon: Backing Up Settings"
    mv "$CONFIG_PATH" "$CONFIG_PATH.$(date +%s).bak"
fi

# symlink settings
echso "Hammerspoon: Symlinking Settings"
cd "$HOME"
ln -s "$HOME/.dotfiles/osx/hammerspoon/config" ".hammerspoon"
