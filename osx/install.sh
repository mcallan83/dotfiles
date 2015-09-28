sudo -v

# brew taps
brew tap caskroom/cask
brew tap caskroom/versions
brew tap homebrew/bundle
brew tap homebrew/dupes
brew tap homebrew/php
brew tap homebrew/science
brew tap homebrew/services
brew tap homebrew/versions
brew tap thoughtbot/formulae

# install brews
brew install bash-completion
brew install boot2docker
brew install caskroom/cask/brew-cask
brew install coreutils
brew install ctags
brew install dnsmasq
brew install docker
brew install docker-compose
brew install gcc
brew install git
brew install gitsh
brew install htop-osx
brew install jq
brew install node
brew install python
brew install r
brew install reattach-to-user-namespace
brew install the_silver_searcher
brew install theharvester
brew install tig
brew install tmux
brew install tree
brew install vim --override-system-vi
brew install wget --with-iri
brew install zsh

# install php
brew install homebrew/php/php56
echo "date.timezone = America/Chicago" >> /usr/local/etc/php/5.6/php.ini
echo "phar.readonly = Off" >> /usr/local/etc/php/5.6/php.ini
brew install homebrew/php/adminer
brew install homebrew/php/composer
brew install homebrew/php/php-code-sniffer
brew install homebrew/php/php-cs-fixer
brew install homebrew/php/php56-intl
brew install homebrew/php/php56-mcrypt
brew install homebrew/php/phploc
brew install homebrew/php/phpmd

# install brew casks
sudo brew cask
brew cask install adium
brew cask install alfred
brew cask install appcleaner
brew cask install atom
brew cask install cakebrew
brew cask install ccleaner
brew cask install chrome-remote-desktop-host
brew cask install cyberduck
brew cask install dropbox
brew cask install firefox
brew cask install font-open-sans
brew cask install font-source-code-pro
brew cask install forklift
brew cask install google-chrome # move app to /Applications for 1Password
brew cask install google-drive
brew cask install google-hangouts
brew cask install hammerspoon
brew cask install handbrake
brew cask install iterm2
brew cask install kaleidoscope
brew cask install keyboardcleantool
brew cask install launchcontrol
brew cask install launchrocket
brew cask install libreoffice
brew cask install numi
brew cask install qlcolorcode
brew cask install sequel-pro
brew cask install slate
brew cask install sublime-text3
brew cask install the-unarchiver
brew cask install transmission
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc
brew cask install xquartz

# brew cleanup
brew cleanup
brew upgrade
brew cleanup
brew update
brew outdated
brew prune
brew cask cleanup

# install composer globals
composer global require "jakub-onderka/php-parallel-lint=0.*"
composer global require "laravel/homestead=~2.0"
composer global require "laravel/installer=~1.1"
composer global require "phpunit/phpunit=4.8.*"

# install npm globals
npm install -g browser-sync
npm install -g grunt-cli
npm install -g gulp
npm install -g jshint
npm install -g less
npm install -g phantomjs
npm install -g yo
