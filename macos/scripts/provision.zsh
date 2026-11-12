#!/bin/zsh

set -euo pipefail

NODE_VERSION=24
PHP_VERSION=8.5

# install homebrew
if [[ ! -x /opt/homebrew/bin/brew ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew analytics off
fi

# install mise
if ! command -v mise >/dev/null 2>&1; then
  brew install mise
fi

# install mise php plugin
mise plugins install php 'https://github.com/verzly/mise-php#latest'

# install php
if ! command -v php >/dev/null 2>&1; then
  mise use --global "php@$PHP_VERSION"
fi

eval "$(mise env --shell zsh)"

# install laravel installer
composer global require laravel/installer

# install pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME/bin:$PNPM_HOME:$PATH"

if ! pnpm --version >/dev/null 2>&1; then
  curl -fsSL https://get.pnpm.io/install.sh |
    env PNPM_NO_MODIFY_PATH=1 sh -
  rehash
fi

# install node and npm
pnpm runtime set node "$NODE_VERSION" --global
if npm --version >/dev/null 2>&1; then
  pnpm add --global npm
else
  pnpm add --global npm@latest --force
fi

php --version
composer --version
pnpm --version
node --version
npm --version

# ask which brewfile to install
brew install gum
brewfiles_dir="${0:A:h}/../homebrew"
brewfiles=("$brewfiles_dir"/*Brewfile*(N.))
if ! brewfile=$(gum choose --header 'Select a Brewfile to install:' "${brewfiles[@]:t}" 'Skip Homebrew Install'); then
  print 'Brewfile selection cancelled; continuing without Homebrew install.'
  brewfile='Skip Homebrew Install'
fi
if [[ "$brewfile" != 'Skip Homebrew Install' ]]; then
  if ! brew bundle --file "$brewfiles_dir/$brewfile"; then
    print -u2 'Brew Bundle Install Failed'
    exit 1
  fi
fi

# install khord
if [[ ! -d /Applications/Khord.app ]]; then
  khord_tmp="$(mktemp -d "${TMPDIR:-/tmp}/khord.XXXXXX")"
  trap 'rm -rf -- "$khord_tmp"' EXIT
  git clone --depth 1 https://github.com/mcallan83/khord "$khord_tmp"
  "$khord_tmp/build.sh"
  ditto "$khord_tmp/build/Khord.app" /Applications/Khord.app
fi

dotfiles_dir="${0:A:h}/../.."

# configure apps
for config in ghostty git starship tinycast vim; do
  print
  if read -r "answer?Configure $config? [y/N] " &&
    [[ "${answer:l}" == y || "${answer:l}" == yes ]]; then
    zsh "$dotfiles_dir/$config/setup.zsh"
  fi
done

# symlink update script to local bin
mkdir -p "$HOME/.local/bin"
ln -sfn "$dotfiles_dir/macos/scripts/update.zsh" "$HOME/.local/bin/update"
