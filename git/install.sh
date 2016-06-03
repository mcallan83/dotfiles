#!/bin/sh
################################################################################
# Filename: git/install.sh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Install GIT configuration.
################################################################################

GITCONFIG="$HOME/.gitconfig"

# ask for name and email address
read -p "Full Name [Mike Callan]: " NAME
NAME=${NAME:-Mike Callan}

read -p "Email [mcallan83@gmail.com]: " EMAIL
EMAIL=${EMAIL:-mcallan83@gmail.com}

# backup existing settings
if [ -f "$GITCONFIG" ]; then
    echo "Git: Backing Up Settings (~/.gitconfig)"
    mv "$GITCONFIG" "$GITCONFIG.$(date +%s).bak"
fi

# build and install .gitconfig
echo "Git: Installing Git Configuration"
git config --global user.name $NAME
git config --global user.email $EMAIL
git config --global push.default simple

if [[ $(uname) == 'Darwin' ]]; then
    git config --global credential.helper osxkeychain
fi
