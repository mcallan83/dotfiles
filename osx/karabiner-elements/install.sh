#!/bin/sh

CONFIG="$HOME/.config/karabiner"

# create config directory
mkdir -p "$CONFIG"

# backup existing private.xml
if [ -f "$CONFIG/karabiner.json" ]; then
    echo "Karabiner Elements: Backing Up Config"
    mv "$CONFIG/karabiner.json" "$CONFIG/karabiner.json.$(date +%F-%T).bak"
fi

# copy current private.xml to config directory
cp "$DOTFILES/vendor/osx/keyboard/karabiner/karabiner.json" "$CONFIG/karabiner.json"

# initialize settings
echo "Karabiner Elements: Initializing Settings"

echo "Karabiner Elements: Done"
