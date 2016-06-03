#!/bin/sh

################################################################################
# Filename: vim/install.sh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Install Vim configuration.
################################################################################

# backup existing settings
if [ -L "$HOME/.vimrc" ] || [ -f "$HOME/.vimrc" ]; then
    echo "Vim: Backing Up Settings"
    mv "$HOME/.vimrc" "$HOME/.vimrc.$(date +%s).bak"
fi

# symlink settings
echo "Vim: Symlinking Settings"
cd "$HOME"
ln -s "$DOTFILES/vim/vimrc" .vimrc
cd -

echo "Vim: Done"
