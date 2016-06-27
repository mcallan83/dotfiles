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

# osx only
if [[ $(uname) == 'Darwin' ]]; then
    git config --global credential.helper osxkeychain
fi

# append git aliases
tee -a "$GITCONFIG" > /dev/null <<'EOF'
[alias]
    rebase-branch = "!git rebase -i `git merge-base master HEAD`"
    review = difftool origin/master...
    save = !git add -A && git commit -m 'SAVEPOINT'
    undo = reset HEAD~1 --mixed
    up = !git pull --rebase --prune $@ && git submodule update --init --recursive
    wc = "!git whatchanged -p --abbrev-commit --pretty=medium"
    reword = "commit -v --amend"
EOF

git config --global alias.amend "commit -a --amend"
