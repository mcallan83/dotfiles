#!/usr/bin/env bash
################################################################################
# Filename: macos/install.sh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Installer script to provision a new Mac via the following tasks:
#
#   - Install Homebrew
#   - Install Homebrew packages, Casks, and Apple App Store apps from Brewfile
#   - Fix permissions
#   - Configure PHP
#   - Install global Composer packages
#   - Install and configure NVM
#   - Install global NPM packages for each version of Node
#   - Install Vagrant plugins
#   - Configure Vagrant for sudoless NFS
#
# Script is idempotent and can be run multiple times without unexpected
# results. Sign into Apple App Store before beginning.
###############################################################################

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

read -p "Sign in to the Apple App Store and press any key to continue."

banner() {
    echo -e "\n\n\033[0;34m"
    printf "%0.s#" {1..80}
    echo -e "\n# macOS Provision: ${1}"
    printf "%0.s#" {1..80}
    echo -e "$(tput sgr0)\n"
    return
}

################################################################################
# Homebrew
################################################################################

if test ! "$(which brew)"; then
    banner "Installing Homebrew"
    mkdir homebrew
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
fi

brew analytics off

BREWFILE_PATH="$(dirname "$0")/Brewfile"
if [ -f "$BREWFILE_PATH" ]; then
    BREWFILE=$(<"$BREWFILE_PATH")
else
    BREWFILE=$(curl https://raw.githubusercontent.com/mcallan83/dotfiles/master/macos/Brewfile)
fi

echo "$BREWFILE" | brew bundle install --file=- --no-lock
echo "$BREWFILE" | brew bundle cleanup --file=- -f

brew doctor
brew cask doctor

################################################################################
# Fixing Permissions
################################################################################

banner "Fixing Permissions"

echo "/usr/local/share/zsh"
chmod go-w /usr/local/share/zsh

echo "/usr/local/share/zsh/site-functions"
chmod go-w /usr/local/share/zsh/site-functions

################################################################################
# PHP
################################################################################

banner "Configuring PHP"

    PHP_VERSIONS=$(ls -1 /usr/local/etc/php)
    echo "$PHP_VERSIONS" | while IFS= read -r VERSION; do
        echo "Configuring: PHP $VERSION"
        sed -i '' 's/;date.timezone.*/date.timezone = America\/Chicago/' "/usr/local/etc/php/$VERSION/php.ini"
        sed -i '' 's/;phar.readonly.*/phar.readonly = Off/' "/usr/local/etc/php/$VERSION/php.ini"
    done

brew list | grep php | xargs -L1 brew unlink
brew link --force --overwrite php@$(echo "$PHP_VERSIONS" | tail -n1)

composer global require consolidation/cgr

cgr hirak/prestissimo
cgr laravel/installer
cgr tightenco/takeout

composer self-update
composer global update

################################################################################
# Node Version Manager
################################################################################

banner "Installing Node Version Manager"

if [[ ! -d "$HOME/.nvm" ]]; then
    banner "Install Node Version Manager"
    mkdir "$HOME/.nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
fi

NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1090
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

cat << 'EOF' > "$NVM_DIR/default-packages"
@vue/cli
fkill-cli
vmd
yarn
EOF

nvm install 14
nvm install 12

nvm alias default 12
nvm use default

################################################################################
# Vagrant
################################################################################

# Install Vagrant Hostsupdater Plugin
banner "Install Vagrant Plugins"
vagrant plugin repair
# https://github.com/cogitatio/vagrant-hostsupdater
vagrant plugin install vagrant-hostsupdater

# Sudoless NFS with Vagrant
# https://gist.github.com/joemaller/6764700
# http://stackoverflow.com/questions/323957
banner "Configure: Sudoless NFS with Vagrant"

TMP=$(mktemp -t vagrant_sudoers)
# shellcheck disable=SC2024
sudo cat /etc/sudoers > "$TMP"
sed -i '' '/# VAGRANT-START/,/# VAGRANT-END/d' "$TMP"
cat >> "$TMP" <<EOF
# VAGRANT-START
Cmnd_Alias VAGRANT_HOSTS_ADD = /bin/sh -c echo "*" >> /etc/hosts
Cmnd_Alias VAGRANT_HOSTS_REMOVE = /usr/bin/sed -i -e /*/ d /etc/hosts
%admin ALL=(root) NOPASSWD: VAGRANT_HOSTS_ADD, VAGRANT_HOSTS_REMOVE
Cmnd_Alias VAGRANT_EXPORTS_ADD = /usr/bin/tee -a /etc/exports
Cmnd_Alias VAGRANT_NFSD = /sbin/nfsd restart
Cmnd_Alias VAGRANT_EXPORTS_REMOVE = /usr/bin/sed -E -e /*/ d -ibak /etc/exports
%admin ALL=(root) NOPASSWD: VAGRANT_EXPORTS_ADD, VAGRANT_NFSD, VAGRANT_EXPORTS_REMOVE
# VAGRANT-END
EOF

if visudo -c -f "$TMP"; then
    # shellcheck disable=SC2002
    cat "$TMP" | sudo tee /etc/sudoers
fi

rm -f "$TMP"
