#!/bin/zsh

# MacOS Provisioning Script

set -e
set -o pipefail

# install homebrew
if [[ ! -x /opt/homebrew/bin/brew ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# install mise with php plugin
if ! command -v mise >/dev/null 2>&1; then
  brew install mise
fi

# install mise php plugin
mise plugins install php 'https://github.com/verzly/mise-php#latest'

# install php
if ! command -v php >/dev/null 2>&1; then
  mise use --global php@8.5
fi

eval "$(mise env --shell zsh)"

# install laravel installer
composer global require laravel/installer

# install pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME/bin:$PNPM_HOME:$PATH"

if ! command -v pnpm >/dev/null 2>&1; then
  curl -fsSL https://get.pnpm.io/install.sh |
    env PNPM_NO_MODIFY_PATH=1 sh -
fi

# install node and npm
pnpm runtime set node 24 --global
pnpm add --global npm

php --version
composer --version
node --version
npm --version

# ask to install packages from Brewfile
brewfile="${0:A:h}/../Brewfile"
printf 'Install packages from %s? [y/N] ' "$brewfile"
read -r install_brewfile
if [[ "$install_brewfile" == [yY] ]]; then
  brew bundle --file "$brewfile"
fi
