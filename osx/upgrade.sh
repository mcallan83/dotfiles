#!/usr/bin/env bash

################################################################################
# Filename: osx/upgrade.sh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Upgrade the folliwng:
#   - System software (with --system flag)
#   - Homebrew (and Casks)
#   - Vagrant plugins
#   - Composer (and global packages)
#   - NVM (and global NPM packages for all installed Node versions)
################################################################################

banner() {
    echo -e "\n\n\033[0;34m"
    printf "%0.s#" {1..80}
    echo -e "\n# Upgrading: ${1}"
    printf "%0.s#" {1..80}
    echo -e "$(tput sgr0)\n"
    return
}

# mac os system update
if [[ "$*" == *--system* ]]; then
    softwareupdate -i -a
fi

# homebrew
if test "$(which brew)"; then
    banner "Homebrew"
    brew analytics off
    brew update
    brew upgrade
    brew cask upgrade
    brew cleanup
    (cd "$(brew --repo)" && git prune && git gc)
    rm -rf "$(brew --cache)"
    brew doctor
    brew cask doctor
fi

# fix permissions
banner "Fixing Permissions"
echo "/usr/local/share/zsh"
chmod go-w /usr/local/share/zsh
echo "/usr/local/share/zsh/site-functions"
chmod go-w /usr/local/share/zsh/site-functions

# vagrant plugins
if test "$(which vagrant)"; then
    banner "Vagrant Plugins"
    vagrant plugin repair
    vagrant plugin update
fi

# composer
if test "$(which composer)"; then
    banner "Composer"
    composer self-update
    composer global update
fi

# nvm/node
if [ -d "$NVM_DIR" ]; then
    banner "Upgrade NVM"
    # shellcheck disable=SC2164
    cd "$NVM_DIR"
    git fetch --tags origin
    COMMIT="$(git rev-list --tags --max-count=1)"
    TAG="$(git describe --abbrev=0 --tags --match "v[0-9]*" "$COMMIT")"
    git checkout "$TAG"
    # shellcheck disable=SC1090
    \. "$NVM_DIR/nvm.sh"

    banner "Reinstall Node And Global NPM Packages"
    NODE_VERSIONS=$(nvm list | awk '/default/ {exit} {print}' | sed 's/.*v//' | sed 's/\..*//')
    echo "$NODE_VERSIONS" | while IFS= read -r VERSION; do
      nvm install "$VERSION"
      nvm use "$VERSION"
      npm -g update
    done
    nvm use default
fi

# register update time
git config --global dotfiles.lastupdate "$(date +%Y%m%d%H%M)"
