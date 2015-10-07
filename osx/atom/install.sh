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
if [ -d "$CONFIG" ]; then
    echo "Atom: Backing Up Settings"
    mv "$CONFIG" "$CONFIG.$(date +%F-%T).bak"
fi

# symlink settings
echo "Atom: Symlinking Settings"
cd "$HOME"
ln -s "$HOME/.dotfiles/osx/atom/config" ".atom"

echo "Atom: Done"
echo ""
echo "Atom: To install Atom packages, manually install the \"Package Sync\" package and run the \"Package Sync: Sync\" command."
