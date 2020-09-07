#!/usr/bin/env bash

# shellcheck disable=SC1091
. ../utils.sh

confirm "Configure Karabiner Elements?"

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

echo ""
echo ""
echo "Warning: This config has two conflicting caps lock rules. Manually ensure that only one rule is loaded inside of Karabiner."
