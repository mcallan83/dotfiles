#!/bin/sh

CONFIG="$HOME/.config/karabiner"

# create config directory
mkdir -p "$CONFIG"

# backup existing config
if [ -f "$CONFIG/karabiner.json" ]; then
    echo "Karabiner Elements: Backing Up Config"
    mv "$CONFIG/karabiner.json" "$CONFIG/karabiner.json.$(date +%F-%T).bak"
fi

# symlink settings
echo "Karabiner Elements: Copying Settings"
cd "$CONFIG"
cp -r "$DOTFILES/osx/karabiner-elements/config/karabiner.json" "karabiner.json"


echo ""
echo ""
echo "Warning: This config has two conflicting caps lock rules. Manually ensure that only one rule is loaded inside of Karabiner."
