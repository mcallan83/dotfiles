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
    echo "Git: Backing Up Settings"
    mv "$GITCONFIG" "$GITCONFIG.$(date +%s).bak"
fi

# build .gitconfig
echo "Git: Installing Git Configuration"
git config --global user.name $NAME
git config --global user.email $EMAIL
git config --global push.default simple
git config --global pull.rebase false

# osx only
if [[ $(uname) == 'Darwin' ]]; then
    git config --global credential.helper osxkeychain
fi

# append git aliases
git config --global alias.up "!git pull --rebase --prune $@ && git submodule update --init --recursive"
git config --global alias.sub "!git submodule foreach git pull origin master"
