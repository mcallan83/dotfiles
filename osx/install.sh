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
#       - [ ] move chrome to apps folder
#       - [ ] php mongo
# - [ ] configure dnsmasq to work with wildcard *.dev domains mapped to
#       homestead
#       - https://dyrynda.com.au/blog/dead-simple-domain-mapping-in-laravel-homestead
#       - https://murze.be/2016/01/some-laravel-homestead-tips/
# - [ ] map local dotfiles to ~/.dotfiles on homestead
# - [ ] configure local php to work with mongo
# - [ ] finish homestead function to detect if not inited
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
brew tap caskroom/cask
brew tap caskroom/fonts
brew tap caskroom/versions
brew tap homebrew/bundle
brew tap homebrew/dupes
brew tap homebrew/php
brew tap homebrew/science
brew tap homebrew/services
brew tap homebrew/versions
brew tap thoughtbot/formulae
brew tap neovim/neovim

banner "Installing Homebrew Packages"
brew install --HEAD neovim
brew install aria2
brew install autossh
brew install bash-completion
brew install brew-cask
brew install coreutils
brew install ctags
brew install ddrescue
brew install dnsmasq
brew install ffmpeg
brew install gcc
brew install getmail
brew install git
brew install go
brew install gpg
brew install highlight
brew install htop-osx
brew install hub
brew install imagemagick --with-webp
brew install jq
brew install libav
brew install lua
brew install mongodb
brew install mysql
brew install nmap
brew install node
brew install pandoc
brew install python
brew install rclone
brew install reattach-to-user-namespace
brew install shellcheck
brew install speedtest_cli
brew install ssh-copy-id
brew install sshrc
brew install stormssh
brew install terminal-notifier
brew install tesseract
brew install testdisk
brew install the_silver_searcher
brew install theharvester
brew install tig
brew install tmux
brew install tree
brew install vim --override-system-vi
brew install wget --with-iri
brew install xmlstarlet
brew install yarn
brew install you-get
brew install youtube-dl
brew install zsh

# PHP 5.6
banner "Installing PHP 7.1"
brew install homebrew/php/php71
echo "date.timezone = America/Chicago" >> /usr/local/etc/php/7.1/php.ini
echo "phar.readonly = Off" >> /usr/local/etc/php/7.1/php.ini

brew install homebrew/php/adminer
brew install homebrew/php/composer
brew install homebrew/php/php71-intl
brew install homebrew/php/php71-mcrypt
brew install homebrew/php/php71-mongodb

# Homebrew Casks
banner "Installing Homebrew Casks"
brew cask
brew cask install adium
brew cask install aerial
brew cask install alfred
brew cask install angry-ip-scanner
brew cask install appcleaner
brew cask install arq
brew cask install atom
brew cask install bettertouchtool
brew cask install cakebrew
brew cask install ccleaner
brew cask install chrome-remote-desktop-host
brew cask install clamxav
brew cask install cyberduck
brew cask install disk-inventory-x
brew cask install docker
brew cask install dropbox
brew cask install etcher
brew cask install firefox
brew cask install go2shell
brew cask install google-chrome
brew cask install google-drive
brew cask install google-hangouts
brew cask install grandperspective
brew cask install hammerspoon
brew cask install handbrake
brew cask install iconjar
brew cask install iterm2
brew cask install jadengeller-helium
brew cask install kaleidoscope
brew cask install karabiner
brew cask install keyboardcleantool
brew cask install launchcontrol
brew cask install launchrocket
brew cask install libreoffice
brew cask install macdown
brew cask install numi
brew cask install nvalt
brew cask install robomongo
brew cask install rstudio
brew cask install seil
brew cask install sequel-pro
brew cask install sketch
brew cask install slate
brew cask install spotify
brew cask install sublime-text3
brew cask install the-unarchiver
brew cask install transmission
brew cask install unetbootin
brew cask install vagrant
brew cask install veracrypt
brew cask install virtualbox
brew cask install visual-studio-code
brew cask install vlc
brew cask install xmind
brew cask install xquartz

brew cask install betterzipql
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
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



# Install Vagrant Hostsupdater Plugin
# https://github.com/cogitatio/vagrant-hostsupdater
# banner "Install Vagrant Hostsupdater Plugin"
# vagrant plugin install vagrant-hostsupdater

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

# Move Chrome to ~/Applications for 1Password.
banner "Moving Chrome to ~/Applications"
rm -rf "$HOME/Applications/Google Chrome.app"
mv "/opt/homebrew-cask/Caskroom/google-chrome/latest/Google Chrome.app/" "/Applications/Google Chrome.app/"

################################################################################
# Composer Packages
################################################################################

banner "Installing Composer Packages"

composer global require friendsofphp/php-cs-fixer
composer global require hirak/prestissimo
composer global require jakub-onderka/php-parallel-lint
composer global require laravel/installer
composer global require laravel/lumen-installer
composer global require mayflower/php-codebrowser
composer global require pdepend/pdepend
composer global require phploc/phploc
composer global require phpmd/phpmd
composer global require phpunit/phpunit
composer global require sebastian/phpcpd
composer global require squizlabs/php_codesniffer
composer global require theseer/phpdox

################################################################################
# NPM Packages
################################################################################

banner "Installing NPM Packages"

npm install -g browser-sync
npm install -g csslint
npm install -g duo
npm install -g electron-prebuilt
npm install -g eslint
npm install -g eslint-config-standard
npm install -g eslint-plugin-html
npm install -g eslint-plugin-promise
npm install -g eslint-plugin-standard
npm install -g express-generator
npm install -g forever
npm install -g foundation-cli
npm install -g grunt-cli
npm install -g gulp
npm install -g htmlhint
npm install -g http-server
npm install -g imageoptim-cli
npm install -g iron-node
npm install -g jade
npm install -g jsdoc
npm install -g karma-cli
npm install -g less
npm install -g modernizr
npm install -g nativefier
npm install -g nodal
npm install -g node-inspector
npm install -g node-sass
npm install -g nodemon
npm install -g npm-check
npm install -g phantomjs
npm install -g plop
npm install -g pm2
npm install -g psi
npm install -g rollup
npm install -g sloc
npm install -g stylestats
npm install -g svgo
npm install -g textract
npm install -g torrentflix
npm install -g typescript
npm install -g vmd
npm install -g vue-cli
npm install -g yo

################################################################################
# Ruby, RVM, and Gems
################################################################################

# Install RVM if not installed
if test ! $(which rvm); then
    banner "Installing RVM"
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    curl -sSL https://get.rvm.io | bash -s stable --autolibs=homebrew --ignore-dotfiles
fi

source "$HOME/.rvm/scripts/rvm"

banner "Installing Ruby 2.2.3"
rvm use 2.2.3 --default --install
rvm requirements

echo "gem: --no-ri --no-rdoc" > ~/.gemrc

banner "Installing Ruby Gems"

gem install bundler
gem install compass
gem install github-pages
gem install gollum
gem install jekyll
gem install sass
gem install scss_lint
gem install tmuxinator
gem install travis

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

# npm
npm update -g

# rvm and gems
rvm requirements
rvm cleanup all
sudo gem update --system
gem update `gem list | cut -d ' ' -f 1`
gem cleanup

# python
pip install --upgrade pip
pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
