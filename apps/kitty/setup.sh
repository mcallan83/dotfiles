#!/usr/bin/env bash

DESTINATION_PATH="$HOME/.config/kitty"

# create config directory
mkdir -p "$DESTINATION_PATH"

# backup existing config
if [ -f "$DESTINATION_PATH/kitty.conf" ]; then
    echo "Kitty: Backing Up Config"
    mv "$DESTINATION_PATH/kitty.conf" "$DESTINATION_PATH/kitty.conf.$(date +%F-%T).bak"
fi

# symlink settings
echo "Kitty: Symlinking Settings"
ln -s "$DOTFILES/apps/kitty/kitty.conf" "$DESTINATION_PATH/kitty.conf"
