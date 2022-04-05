#!/usr/bin/env bash

# https://github.com/mathiasbynens/dotfiles/blob/main/.macos

################################################################################
# General
################################################################################

# disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# save to disk (not to icloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# disable the “are you sure you want to open this application?” dialog
# defaults write com.apple.LaunchServices LSQuarantine -bool false

################################################################################
# Keyboard\Mouse\Trackpad
################################################################################

# trackpad: enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# keyboard: enable full access for all controls
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# keyboard: disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# keyboard: set repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10
# defaults write NSGlobalDomain KeyRepeat -int 6
# defaults write NSGlobalDomain InitialKeyRepeat -int 25

################################################################################
# Finder
################################################################################

# disable window animations animations
defaults write com.apple.finder DisableAllAnimations -bool true

# show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# show path bar
defaults write com.apple.finder ShowPathbar -bool true

# disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# avoid creating ".DS_Store" files on network or usb volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# use list view by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

################################################################################
# Dock
################################################################################

# set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# wipe all app icons from the Dock
# defaults write com.apple.dock persistent-apps -array

################################################################################
# Safari
################################################################################

# show the full URL in the address bar
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# enable debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# enable the develop menu and the web inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

################################################################################
# Activity Monitor
################################################################################

# show the main window when launching
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# visualize cpu usage in the dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort results by cpu usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

################################################################################
# App Store
################################################################################

# enable automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# check for software updates daily
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Allow rebooting machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

################################################################################
# Chrome
################################################################################

# disable backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

################################################################################
# Visual Studio Code
################################################################################

defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

echo "Done. Some changes need a restart to take effect."
