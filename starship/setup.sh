#!/usr/bin/env bash
set -e

STARSHIP_CONFIG_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
DESTINATION_PATH="$HOME/.config"
STARSHIP_CONFIG_PATH="$DESTINATION_PATH/starship.toml"

# create config directory
mkdir -p "$DESTINATION_PATH"

# back up any existing config, including a dangling symlink
if [[ -e "$STARSHIP_CONFIG_PATH" || -L "$STARSHIP_CONFIG_PATH" ]]; then
    echo "Starship: Backing Up Config"
    mv "$STARSHIP_CONFIG_PATH" "$STARSHIP_CONFIG_PATH.$(date +%F_%T).bak"
fi

# symlink settings
echo "Starship: Symlinking Settings"
ln -s "$STARSHIP_CONFIG_DIR/starship.toml" "$STARSHIP_CONFIG_PATH"
