#!/usr/bin/env bash

DESTINATION_PATH="$HOME/.config/karabiner"

# create config directory
mkdir -p "$DESTINATION_PATH"

# backup existing config
if [ -f "$DESTINATION_PATH/karabiner.json" ]; then
    echo "Karabiner Elements: Backing Up Config"
    mv "$DESTINATION_PATH/karabiner.json" "$DESTINATION_PATH/karabiner.json.$(date +%F-%T).bak"
fi

# symlink settings
echo "Karabiner Elements: Copying Settings"
cp -r "$DOTFILES/apps/karabiner-elements/karabiner.json" "$DESTINATION_PATH/karabiner.json"
