#!/bin/zsh

set -euo pipefail

NODE_VERSION=24
PHP_VERSION=8.5
RUST_VERSION=stable

# install homebrew
if [[ ! -x /opt/homebrew/bin/brew ]]; then
  homebrew_installer="$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  /bin/bash -c "$homebrew_installer"
fi
brew_env="$(/opt/homebrew/bin/brew shellenv)"
eval "$brew_env"
brew analytics off

# install mise
if ! command -v mise >/dev/null 2>&1; then
  brew install mise
fi

# install mise php plugin
installed_plugins="$(mise plugins ls)"
plugins=("${(@f)installed_plugins}")
if (( ! ${plugins[(Ie)php]} )); then
  mise plugins install php 'https://github.com/verzly/mise-php#latest'
fi

# install and configure php and rust
mise use --global "php@$PHP_VERSION"
mise use --global "rust@$RUST_VERSION"

mise_env="$(mise env --shell zsh)"
eval "$mise_env"

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
if ! "$PNPM_HOME/bin/npm" --version >/dev/null 2>&1 ||
  ! "$PNPM_HOME/bin/npx" --version >/dev/null 2>&1; then
  pnpm add --global npm@latest --force
fi

# ask which brewfile to install
if read -r "answer?Would you like to install a Brewfile? [y/N] " &&
  [[ "${answer:l}" == y || "${answer:l}" == yes ]]; then
  brewfiles_dir="${0:A:h}/../homebrew"
  brewfiles=("$brewfiles_dir"/*Brewfile*(N.))
  if (( ${#brewfiles} == 0 )); then
    print -u2 "No Brewfiles found in $brewfiles_dir."
    exit 1
  fi
  brewfile=''
  PS3='Select a Brewfile to install: '
  select brewfile in "${brewfiles[@]:t}"; do
    if [[ -n "$brewfile" ]]; then
      break
    fi
  done
  if [[ -n "$brewfile" ]]; then
    brew bundle --file "$brewfiles_dir/$brewfile"
  else
    print 'Brewfile selection cancelled; continuing without Homebrew install.'
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

# output env info
npx --yes envinfo
