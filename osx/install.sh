#!/usr/bin/env bash

################################################################################
# Filename: osx/install.sh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Installs HomeBrew packages, Homebrew Casks (GUI apps, Quicklook plugins,
# fonts), Composer packages, NPM packages, Ruby gems, Python packages,
# on a fresh install of OSX. Tested on OSX 10.11.
#
# TODO:
#
# - configure vagrant to have nfs access without requiring password
# - pretty echos during install
################################################################################

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

################################################################################
# homebrew
################################################################################

if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update

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

brew install --HEAD neovim
brew install bash-completion
brew install boot2docker
brew install brew-cask
brew install coreutils
brew install ctags
brew install dark-mode
brew install ddrescue
brew install dnsmasq
brew install docker
brew install docker-compose
brew install gcc
brew install getmail
brew install git
brew install gitsh
brew install gpg
brew install htop-osx
brew install hub
brew install jq
brew install macvim --override-system-vim
brew install mongodb
brew install mysql
brew install node
brew install pandoc
brew install python
brew install r
brew install reattach-to-user-namespace
brew install speedtest_cli
brew install ssh-copy-id
brew install sshrc
brew install testdisk
brew install the_silver_searcher
brew install theharvester
brew install tig
brew install tmux
brew install tree
brew install vim --override-system-vi
brew install wget --with-iri
brew install zsh

# php56 with custom settings
brew install homebrew/php/php56
echo "date.timezone = America/Chicago" >> /usr/local/etc/php/5.6/php.ini
echo "phar.readonly = Off" >> /usr/local/etc/php/5.6/php.ini

brew install homebrew/php/adminer
brew install homebrew/php/composer
brew install homebrew/php/php-code-sniffer
brew install homebrew/php/php-cs-fixer
brew install homebrew/php/php56-intl
brew install homebrew/php/php56-mcrypt
brew install homebrew/php/php56-mongo
brew install homebrew/php/phploc
brew install homebrew/php/phpmd

# casks
brew cask

# cask gui apps
brew cask install adium
brew cask install aerial
brew cask install alfred
brew cask install anybar
brew cask install appcleaner
brew cask install arq
brew cask install atom
brew cask install bettertouchtool
brew cask install cakebrew
brew cask install ccleaner
brew cask install chrome-remote-desktop-host
brew cask install cyberduck
brew cask install dropbox
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
brew cask install teamviewer
brew cask install the-unarchiver
brew cask install transmission
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc
brew cask install xmind
brew cask install xquartz

# cask quicklook plugins
brew cask install betterzipql
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quicklook-csv
brew cask install quicklook-json
brew cask install webpquicklook

# cask fonts
brew cask install font-open-sans
brew cask install font-source-code-pro

# allow vagrant to mount NFS without password
# TMP=$(mktemp -t vagrant_sudoers)
# cat /etc/sudoers > $TMP
# cat >> $TMP <<EOF
# Cmnd_Alias VAGRANT_EXPORTS_ADD = /usr/bin/tee -a /etc/exports
# Cmnd_Alias VAGRANT_NFSD = /sbin/nfsd restart
# Cmnd_Alias VAGRANT_EXPORTS_REMOVE = /usr/bin/sed -E -e /*/ d -ibak /etc/exports
# %admin ALL=(root) NOPASSWD: VAGRANT_EXPORTS_ADD, VAGRANT_NFSD, VAGRANT_EXPORTS_REMOVE
# EOF
# visudo -c -f $TMP
# if [ $? -eq 0 ]; then
#   cat $TMP > /etc/sudoers
# fi
# rm -f $TMP

# move google chrome to ~/Applications for 1Password
rm -rf "$HOME/Applications/Google Chrome.app"
mv "/opt/homebrew-cask/Caskroom/google-chrome/latest/Google Chrome.app/" "$HOME/Applications/Google Chrome.app/"

# cleanup
brew update
brew upgrade --all
brew cleanup
brew cask cleanup
brew prune

################################################################################
# composer packages
################################################################################

composer global require "jakub-onderka/php-parallel-lint=0.*"
composer global require "laravel/homestead=~2.0"
composer global require "laravel/installer=~1.1"
composer global require "laravel/lumen-installer=~1.0"
composer global require "phpunit/phpunit=4.8.*"

################################################################################
# npm packages
################################################################################

npm install -g bower
npm install -g browser-sync
npm install -g csslint
npm install -g electron-prebuilt
npm install -g grunt-cli
npm install -g gulp
npm install -g htmlhint
npm install -g jshint
npm install -g less
npm install -g modernizr
npm install -g node-inspector
npm install -g npm-check
npm install -g phantomjs
npm install -g svgo
npm install -g torrentflix
npm install -g vmd
npm install -g vtop
npm install -g webpack
npm install -g yo

################################################################################
# ruby, rvm, and gems
################################################################################

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --autolibs=homebrew

source "$HOME/.rvm/scripts/rvm"

rvm use 2.1.1 --default --install

gem install bundler
gem install compass
gem install github-pages
gem install jekyll
gem install sass
gem install scss-lint
gem install tmuxinator

################################################################################
# python packages
################################################################################

pip install gsutil
pip install httpie
pip install ohmu
pip install pygments

################################################################################
# install dotfiles
################################################################################

git clone http://github.com/mcallan83/dotfiles ~/.dotfiles --recursive

################################################################################
# install oh my zsh
################################################################################

# # backup existing zshrc
# if [ -f "$HOME/.zshrc" ]; then
#     mv "$HOME/.zshrc" "$HOME/.zshrc.$(date +%s).bak"
# fi

# # symlink zshrc
# cd ~
# ln -s "$HOME/.dotfiles/zsh/oh-my-zsh/zshrc" ".zshrc"

# if [ -d "$HOME/.oh-my-zsh" ]; then
#     rm -rf "$HOME/.oh-my-zsh"
# fi
