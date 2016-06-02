#!/bin/sh

################################################################################
# Filename: osx/sublime/install.sh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Installs Sublime configuration, including Package Control and various
# packages. Sublime may need to be restarted multiple times befores
# all packages install correctly.
################################################################################


CONFIG="$HOME/Library/Application Support/Sublime Text 3"

# create directories
mkdir -p "$CONFIG/Packages"
mkdir -p "$CONFIG/Installed Packages"

# install package manager
if [ ! -f "$CONFIG/Installed Packages/Package Control.sublime-package" ]; then
    echo "Sublime: Installing Package Manager"
    cd "$CONFIG/Installed Packages"
    curl -O "https://packagecontrol.io/Package Control.sublime-package" > /dev/null
    cd - > /dev/null
fi

# backup existing settings
if [ -d "$CONFIG/Packages/User" ] || [ -f "$CONFIG/Packages/User" ]; then
    echo "Sublime: Backing Up Settings"
    mv "$CONFIG/Packages/User" "$CONFIG/Packages/User.$(date +%s).bak"
fi

# symlink settings
echo "Sublime: Symlinking Settings"
cd "$CONFIG/Packages"
ln -s "$DOTFILES/osx/sublime/config" User

echo "Sublime: Done"
