#!/bin/sh
################################################################################
# Filename: osx/atom/install.sh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Installs Atom configuration. After running this script, manually install the
# "Package Sync" package and run the "Package Sync: Sync" command.
################################################################################

CONFIG="$HOME/.atom"

# backup existing settings
if [ -d "$CONFIG" ] || [ -f "$CONFIG" ]; then
    echo "Atom: Backing Up Settings"
    mv "$CONFIG" "$CONFIG.$(date +%s).bak"
fi

# symlink settings
echo "Atom: Symlinking Settings"
cd "$HOME"
ln -s "$DOTFILES/osx/atom/config" ".atom"

# install packages
if [ -f "$CONFIG/packages.txt" ]; then
    echo "Atom: Installing Packages"
    apm install --packages-file "$CONFIG/packages.txt"
fi

echo "Atom: Done"
