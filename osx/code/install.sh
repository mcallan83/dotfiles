#!/bin/sh

################################################################################
# Filename: osx/code/install.sh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Installs Visual Studio Code configuration.
################################################################################

CONFIG="$HOME/Library/Application Support/Code/User"

# create directories
mkdir -p "$CONFIG"

# backup existing settings
echo "Code: Backing Up Existing Settings"

if [ -d "$CONFIG/snippets" ] || [ -f "$CONFIG/snippets" ]; then
    mv "$CONFIG/snippets" "$CONFIG/snippets.$(date +%s).bak"
fi

if [ -f "$CONFIG/keybindings.json" ]; then
    mv "$CONFIG/keybindings.json" "$CONFIG/keybindings.json.$(date +%s).bak"
fi

if [ -f "$CONFIG/settings.json" ]; then
    mv "$CONFIG/settings.json" "$CONFIG/settings.json.$(date +%s).bak"
fi

# symlink settings
echo "Code: Symlinking Settings"
cd "$CONFIG"
ln -s "$DOTFILES/osx/code/config/snippets" snippets
ln -s "$DOTFILES/osx/code/config/keybindings.json" keybindings.json
ln -s "$DOTFILES/osx/code/config/settings.json" settings.json

echo "Code: Done"
