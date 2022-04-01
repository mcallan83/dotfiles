#!/usr/bin/env bash

GITCONFIG="$HOME/.gitconfig"
GITIGNORE="$HOME/.gitignore"

# ask for name and email address
read -r -p "Full Name [Mike Callan]: " NAME
NAME=${NAME:-Mike Callan}

DEFAULT_EMAIL="$(echo 'zpnyyna83@tznvy.pbz' | tr 'A-Za-z' 'N-ZA-Mn-za-m')"
read -r -p "Email [$DEFAULT_EMAIL]: " EMAIL
EMAIL=${EMAIL:-$DEFAULT_EMAIL}

# backup .gitconfig
if [ -f "$GITCONFIG" ]; then
    echo "Git: Backing Up Config"
    mv "$GITCONFIG" "$GITCONFIG.$(date +%s).bak"
fi

# backup .gitignore
if [ -f "$GITIGNORE" ]; then
    echo "Git: Backing Up Ignore File"
    mv "$GITIGNORE" "$GITIGNORE.$(date +%s).bak"
fi

# create .gitignore
cat >> "$GITIGNORE" <<EOF
*.DS_Store
*.swp
EOF

# build .gitconfig
echo "Git: Installing Git Configuration"
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
git config --global core.excludesfile ~/.gitignore
git config --global push.default simple
#git config --global pull.rebase false

# https://github.com/so-fancy/diff-so-fancy
if [ -x "$(command -v diff-so-fancy)" ]
then
    git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
    git config --global color.ui true
    git config --global color.diff-highlight.oldNormal    "red bold"
    git config --global color.diff-highlight.oldHighlight "red bold 52"
    git config --global color.diff-highlight.newNormal    "green bold"
    git config --global color.diff-highlight.newHighlight "green bold 22"
    git config --global color.diff.meta       "11"
    git config --global color.diff.frag       "magenta bold"
    git config --global color.diff.commit     "yellow bold"
    git config --global color.diff.old        "red bold"
    git config --global color.diff.new        "green bold"
    git config --global color.diff.whitespace "red reverse"
    git config --bool --global diff-so-fancy.markEmptyLines false
fi

# append git aliases
git config --global alias.up "!git pull --rebase --prune $* && git submodule update --init --recursive"
git config --global alias.sub "!git submodule foreach git pull origin master"
