#!/usr/bin/env bash

DESTINATION_PATH="$HOME/.hammerspoon"

# backup existing settings
if [ -L "$DESTINATION_PATH" ]; then
    echo "Hammerspoon: Backing Up Settings"
    mv "$DESTINATION_PATH" "$DESTINATION_PATH.$(date +%s).bak"
fi

# symlink settings
echo "Hammerspoon: Symlinking Settings"
ln -s "$DOTFILES/apps/hammerspoon/config" "$DESTINATION_PATH"
