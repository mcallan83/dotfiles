#!/bin/sh

CONFIG="$HOME/Library/Application Support/Sublime Text 3/Packages"

# create config directory
mkdir -p "$CONFIG"

# backup existing settings
if [ -d "$CONFIG/User" ] || [ -f "$CONFIG/User" ]; then
    echo "Sublime: Backing Up Settings"
    mv "$CONFIG/User" "$CONFIG/User.$(date +%s).bak"
fi

# symlink settings
echo "Sublime: Symlinking Settings"
cd "$CONFIG"
ln -s "$HOME/.dotfiles/osx/sublime/config" User

echo "Sublime: Done"
