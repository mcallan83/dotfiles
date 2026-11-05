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

if ! command -v pnpm >/dev/null 2>&1; then
  curl -fsSL https://get.pnpm.io/install.sh |
    env PNPM_NO_MODIFY_PATH=1 sh -
fi

# install node and npm
pnpm runtime set node "$NODE_VERSION" --global
pnpm add --global npm

php --version
composer --version
pnpm --version
node --version
npm --version

# ask which brewfile to install
brewfiles_dir="${0:A:h}/../homebrew"
brewfiles=("$brewfiles_dir"/*.Brewfile(N))
original_columns=$COLUMNS
COLUMNS=1
print 'Select a Brewfile to install:'
select brewfile in "${brewfiles[@]:t}" 'Skip'; do
  if [[ -z "$brewfile" ]]; then
    print 'Invalid selection.'
    continue
  fi
  if [[ "$brewfile" != 'Skip' ]]; then
    brew bundle --file "${brewfiles[$REPLY]}" ||
      print -u2 'Brew Bundle Install Failed'
  fi
  break
done
COLUMNS=$original_columns

# install khord
if [[ ! -d /Applications/Khord.app ]]; then
  khord_tmp="$(mktemp -d "${TMPDIR:-/tmp}/khord.XXXXXX")"
  trap 'rm -rf -- "$khord_tmp"' EXIT
  git clone --depth 1 https://github.com/mcallan83/khord "$khord_tmp"
  "$khord_tmp/build.sh"
  ditto "$khord_tmp/build/Khord.app" /Applications/Khord.app
fi

# configure apps
dotfiles_dir="${0:A:h}/../.."
for config in ghostty git starship tinycast vim; do
  print
  if read -r "answer?Configure $config? [y/N] " &&
    [[ "${answer:l}" == y || "${answer:l}" == yes ]]; then
    zsh "$dotfiles_dir/$config/setup.zsh"
  fi
done
