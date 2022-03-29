#!/usr/bin/env bash

################################################################################
# Upgrades the following:
#
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
    brew cleanup
    cd "$(brew --repo)" && git prune && git gc
    rm -rf "$(brew --cache)"
    brew doctor --verbose
fi

# vagrant plugins
if test "$(which vagrant)"; then
    banner "Vagrant Plugins"
    vagrant plugin repair
    vagrant plugin update
fi

# composer
if test "$(which composer)"; then
    banner "Composer"
    composer self-update --2
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
fi

# register update time
git config --global dotfiles.lastupdate "$(date +%Y%m%d%H%M)"
