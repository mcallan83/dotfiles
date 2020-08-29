#!/usr/bin/env bash

################################################################################
# Filename: osx/install.sh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Provisions a development environment on a clean intall of OSX. Script can
# safely run at any time to ensure host machine is up to date with this script.
#
# Installs and updates HomeBrew packages, Homebrew Casks (GUI apps,
# Quicklook plugins, fonts), Composer packages, NPM packages, RVM,
# Ruby gems, and Python packages.
#
# TODO:
#
# - [ ] make script provisionable, so it can be run at any time and will only
#       - [ ] vagrant nfs config

################################################################################

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

banner() {
    echo -e "\n\n\033[0;34m"
    printf "%0.s#" {1..80}
    echo -e "\n# OSX Provision: ${1}"
    printf "%0.s#" {1..80}
    echo -e "$(tput sgr0)\n"
    return
}

################################################################################
# Homebrew
################################################################################

if test ! $(which brew); then
    banner "Installing Homebrew"
    mkdir homebrew
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
fi

brew analytics off

BREWFILE_PATH="$(dirname "$0")/Brewfile"

if [ -f "$BREWFILE_PATH" ]; then
    brew bundle install --no-lock --file="$BREWFILE_PATH"
    brew bundle cleanup -f --file="$BREWFILE_PATH"
else
    BREWFILE=$(curl https://raw.githubusercontent.com/mcallan83/dotfiles/master/osx/Brewfile)
    echo "$BREWFILE" | brew bundle install --file=- --no-lock
    echo "$BREWFILE" | brew bundle cleanup --file=- -f
fi

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

echo "date.timezone = America/Chicago" >> /usr/local/etc/php/7.3/php.ini
echo "phar.readonly = Off" >> /usr/local/etc/php/7.3/php.ini

echo "date.timezone = America/Chicago" >> /usr/local/etc/php/7.4/php.ini
echo "phar.readonly = Off" >> /usr/local/etc/php/7.4/php.ini

brew list | grep php | xargs -L1 brew unlink
brew link --force --overwrite php@7.4

composer global require consolidation/cgr

cgr hirak/prestissimo
cgr laravel/installer
cgr laravel/lumen-installer

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

cat << 'EOF' >> "$NVM_DIR/default-packages"
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
# https://github.com/cogitatio/vagrant-hostsupdater
banner "Install Vagrant Hostsupdater Plugin"
vagrant plugin install vagrant-hostsupdater

# Sudoless NFS with Vagrant
# https://gist.github.com/joemaller/6764700
# http://stackoverflow.com/questions/323957
banner "Configure: Sudoless NFS with Vagrant"

TMP=$(mktemp -t vagrant_sudoers)
sudo cat /etc/sudoers > $TMP
#sed '/# VAGRANT NFS START/,/# VAGRANT NFS END/d' $TMP
cat >> $TMP <<EOF
# VAGRANT START

# VAGRANT HOSTSUPDATER
Cmnd_Alias VAGRANT_HOSTS_ADD = /bin/sh -c echo "*" >> /etc/hosts
Cmnd_Alias VAGRANT_HOSTS_REMOVE = /usr/bin/sed -i -e /*/ d /etc/hosts
%admin ALL=(root) NOPASSWD: VAGRANT_HOSTS_ADD, VAGRANT_HOSTS_REMOVE

# NFS
Cmnd_Alias VAGRANT_EXPORTS_ADD = /usr/bin/tee -a /etc/exports
Cmnd_Alias VAGRANT_NFSD = /sbin/nfsd restart
Cmnd_Alias VAGRANT_EXPORTS_REMOVE = /usr/bin/sed -E -e /*/ d -ibak /etc/exports
%admin ALL=(root) NOPASSWD: VAGRANT_EXPORTS_ADD, VAGRANT_NFSD, VAGRANT_EXPORTS_REMOVE

# VAGRANT END
EOF

visudo -c -f $TMP
if [ $? -eq 0 ]; then
    sudo sh -c "cat $TMP > /etc/sudoers"
fi

rm -f $TMP
