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

# Output pretty text banner
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

# Install Homebrew
if test ! $(which brew); then
    banner "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

banner "Updating Homebrew"
brew update
brew analytics off

banner "Tapping Additional Homebrew Repos"
brew tap caskroom/fonts
brew tap caskroom/versions
# brew tap homebrew/bundle
# brew tap homebrew/services

banner "Installing Homebrew Packages"
brew install aria2
brew install coreutils
brew install ctags
brew install ctop
brew install ddrescue
brew install fd
brew install ffmpeg
brew install fzf
brew install gcc
brew install git
brew install go
brew install gpg
brew install htop-osx
brew install hub
brew install hudochenkov/sshpass/sshpass
brew install jq
brew install libav
brew install nmap
brew install pandoc
brew install python
brew install rclone
brew install reattach-to-user-namespace
brew install shellcheck
brew install speedtest_cli
brew install ssh-copy-id
brew install testdisk
brew install the_silver_searcher
brew install tmux
brew install tree
brew install vim
brew install wget
brew install xmlstarlet
brew install you-get
brew install youtube-dl
brew install zsh

banner "Installing PHP"

brew install php@7.2
echo "date.timezone = America/Chicago" >> /usr/local/etc/php/7.2/php.ini
echo "phar.readonly = Off" >> /usr/local/etc/php/7.2/php.ini
echo "pcre.jit = 0" >> /usr/local/etc/php/7.2/php.ini

brew install php@7.3
echo "date.timezone = America/Chicago" >> /usr/local/etc/php/7.3/php.ini
echo "phar.readonly = Off" >> /usr/local/etc/php/7.3/php.ini
echo "pcre.jit = 0" >> /usr/local/etc/php/7.3/php.ini

brew install php@7.4
echo "date.timezone = America/Chicago" >> /usr/local/etc/php/7.4/php.ini
echo "phar.readonly = Off" >> /usr/local/etc/php/7.4/php.ini

brew unlink php || true
brew unlink php@7.2 || true
brew unlink php@7.3 || true
brew unlink php@7.4 || true

brew link --force --overwrite php@7.4

brew install composer

# Homebrew Casks
banner "Installing Homebrew Casks"
brew cask
brew cask install alfred
brew cask install angry-ip-scanner
brew cask install arq
brew cask install atom
brew cask install betterzip
brew cask install ccleaner
brew cask install clamxav
brew cask install cyberduck
brew cask install disk-inventory-x
brew cask install docker
brew cask install dropbox
brew cask install etcher
brew cask install firefox
brew cask install google-backup-and-sync
brew cask install google-chrome
brew cask install google-hangouts
brew cask install hammerspoon
brew cask install handbrake
brew cask install iterm2
brew cask install kaleidoscope
brew cask install karabiner-elements
brew cask install keepassxc
brew cask install keyboardcleantool
brew cask install launchcontrol
brew cask install libreoffice
brew cask install numi
brew cask install robo-3t
brew cask install sequel-pro
brew cask install spotify
brew cask install sublime-text
brew cask install the-unarchiver
brew cask install transmission
brew cask install vagrant
brew cask install virtualbox
brew cask install visual-studio-code
brew cask install vlc

brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install qlvideo
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install suspicious-package
brew cask install webpquicklook

brew cask install font-fira-code
brew cask install font-fira-mono
brew cask install font-fira-mono-for-powerline
brew cask install font-fira-sans
brew cask install font-open-sans
brew cask install font-source-code-pro

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

# iTerm 2 Shell Utilities
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh | bash

################################################################################
# Composer Packages
################################################################################

banner "Installing Composer Packages"

composer global require consolidation/cgr

cgr hirak/prestissimo
cgr laravel/installer
cgr laravel/lumen-installer

################################################################################
# Node Version Manager
################################################################################

mkdir "$HOME/.nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install 8
npm install -g vmd @vue/cli yarn
nvm install 10 --reinstall-packages-from=8
nvm install 12 --reinstall-packages-from=8

nvm alias default 12

################################################################################
# Ruby, RVM, and Gems
################################################################################

# Install RVM if not installed
if test ! $(which rvm); then
    banner "Installing RVM"
    gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io | bash -s stable --autolibs=homebrew --ignore-dotfiles
fi

source "$HOME/.rvm/scripts/rvm"

banner "Installing Ruby 2.3"
rvm use 2.3 --default --install
rvm requirements

echo "gem: --no-ri --no-rdoc" > ~/.gemrc

if [ ! -f /usr/local/lib/libgcc_s.10.4.dylib ]; then
    sudo ln -s /usr/lib/libSystem.B.dylib /usr/local/lib/libgcc_s.10.4.dylib
fi

banner "Installing Ruby Gems"

gem install bundler

################################################################################
# Python Packages
################################################################################

banner "Installing Python Packages"

pip install --upgrade pip
pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

pip install aws-shell
pip install flexget
pip install git-remote-dropbox
pip install gsutil
pip install httpie
pip install klaus
pip install ohmu
pip install pygments

################################################################################
# Update and Cleanup
################################################################################

banner "Update and Cleanup"

# homebrew
brew update
brew upgrade
brew cleanup
brew cask cleanup
brew prune
brew doctor

# composer
composer self-update
composer global update

# npm/yarn
# npm install -g npm
# npm update -g
yarn global upgrade

# rvm and gems
rvm requirements
rvm cleanup all
sudo gem update --system
gem update `gem list | cut -d ' ' -f 1`
gem cleanup

# python
pip install --upgrade pip
pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
