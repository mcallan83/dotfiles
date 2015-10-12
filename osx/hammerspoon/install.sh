#!/bin/sh

################################################################################
# Filename: osx/hammerspoon/install.sh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Installs Hammerspoon configuration.
################################################################################

CONFIG="$HOME/.hammerspoon"

# backup existing settings
if [ -d "$CONFIG" ] || [ -f "$CONFIG" ]; then
    echo "Hammerspoon: Backing Up Settings"
    mv "$CONFIG" "$CONFIG.$(date +%s).bak"
fi

# symlink settings
echo "Hammerspoon: Symlinking Settings"
cd "$HOME"
ln -s "$HOME/.dotfiles/osx/hammerspoon/config" ".hammerspoon"

echo "Hammerspoon: Done"
