#!/bin/sh

CONFIG="$HOME/.config"

# create config directory
mkdir -p "$CONFIG"

# backup existing config
if [ -f "$CONFIG/starship.toml" ]; then
    echo "Starship: Backing Up Config"
    mv "$CONFIG/starship.toml" "$CONFIG/starship.toml.$(date +%F-%T).bak"
fi

# symlink settings
echo "Starship: Symlinking Settings"
cd "$CONFIG"
ln -s "$DOTFILES/osx/starship/starship.toml" starship.toml
