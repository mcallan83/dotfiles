#!/bin/sh

DESTINATION="$HOME/.config/karabiner"

# create config directory
mkdir -p "$DESTINATION"

# backup existing config
if [ -f "$DESTINATION/karabiner.json" ]; then
    echo "Karabiner Elements: Backing Up Config"
    mv "$DESTINATION/karabiner.json" "$DESTINATION/karabiner.json.$(date +%F-%T).bak"
fi

# symlink settings
echo "Karabiner Elements: Copying Settings"
cd "$DESTINATION"
cp -r "$DOTFILES/osx/karabiner-elements/karabiner.json" "karabiner.json"

echo ""
echo ""
echo "Warning: This config has two conflicting caps lock rules. Manually ensure that only one rule is loaded inside of Karabiner."
