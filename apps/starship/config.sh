#!/usr/bin/env bash

# shellcheck disable=SC1091
. ../utils.sh

confirm "Configure Starship?"

DESTINATION_PATH="$HOME/.config"

# create config directory
mkdir -p "$DESTINATION_PATH"

# backup existing config
if [ -L "$DESTINATION_PATH/starship.toml" ]; then
    echo "Starship: Backing Up Config"
    mv "$DESTINATION_PATH/starship.toml" "$DESTINATION_PATH/starship.toml.$(date +%F-%T).bak"
fi

# symlink settings
echo "Starship: Symlinking Settings"
ln -s "$DOTFILES/apps/starship/starship.toml" "$DESTINATION_PATH/starship.toml"
