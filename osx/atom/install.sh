#!/bin/sh

CONFIG="$HOME/.atom"

# backup existing settings
if [ -d "$CONFIG" ]; then
    echo "Atom: Backing Up Settings"
    mv "$CONFIG" "$CONFIG.$(date +%F-%T).bak"
fi

# symlink settings
echo "Atom: Symlinking Settings"
cd "$HOME"
ln -s "$HOME/.dotfiles/osx/atom/atom" ".atom"

echo "Atom: Done"

echo ""

echo "Note: To install Atom packages, manually install the \"Package Sync\" package and run sync."
