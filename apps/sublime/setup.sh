#!/usr/bin/env bash

DESTINATION_PATH="$HOME/Library/Application Support/Sublime Text 3"

# create directories
mkdir -p "$DESTINATION_PATH/Packages"
mkdir -p "$DESTINATION_PATH/Installed Packages"

# install package manager
if [ ! -f "$DESTINATION_PATH/Installed Packages/Package Control.sublime-package" ]; then
    echo "Sublime: Installing Package Manager"
    (
        cd "$DESTINATION_PATH/Installed Packages"
        curl -O "https://packagecontrol.io/Package%20Control.sublime-package" > /dev/null
    )
fi

# backup existing settings
if [ -L "$DESTINATION_PATH/Packages/User" ]; then
    echo "Sublime: Backing Up Settings"
    mv "$DESTINATION_PATH/Packages/User" "$DESTINATION_PATH/Packages/User.$(date +%s).bak"
fi

# symlink settings
echo "Sublime: Symlinking Settings"
ln -s "$DOTFILES/apps/sublime/config" "$DESTINATION_PATH/Packages/User"
echo "Sublime: Done"
