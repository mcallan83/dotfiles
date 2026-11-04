#!/usr/bin/env zsh

GITCONFIG="$HOME/.gitconfig"
GITIGNORE="$HOME/.gitignore"

# ask for name and email address
DEFAULT_NAME="$(echo 'Zvxr Pnyyna' | tr 'A-Za-z' 'N-ZA-Mn-za-m')"
printf "Full Name [$DEFAULT_NAME]: "
read -r NAME
NAME=${NAME:-$DEFAULT_NAME}

DEFAULT_EMAIL="$(echo 'zpnyyna83@tznvy.pbz' | tr 'A-Za-z' 'N-ZA-Mn-za-m')"
printf "Email [$DEFAULT_EMAIL]: "
read -r EMAIL
EMAIL=${EMAIL:-$DEFAULT_EMAIL}

# backup .gitconfig
if [ -f "$GITCONFIG" ]; then
    echo "Git: Backing Up Git Config"
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
echo "Git: Applying Git Config"
git config --global core.excludesfile ~/.gitignore
git config --global init.defaultBranch master
git config --global pull.rebase false
git config --global push.default simple
git config --global user.email "$EMAIL"
git config --global user.name "$NAME"

# diff ansible vault encrypted files
git config --global diff.ansible-vault.textconv "ansible-vault view"

# delta
if [ -x "$(command -v delta)" ]
then
    git config --global core.pager delta
    git config --global interactive.diffFilter 'delta --color-only'
    git config --global delta.navigate true
    git config --global merge.conflictStyle zdiff3
fi

# append git aliases
git config --global alias.sub "!git submodule foreach git pull origin master"
git config --global alias.uncommit 'reset --soft HEAD~1'
git config --global alias.up "!git pull --rebase --prune $* && git submodule update --init --recursive"
