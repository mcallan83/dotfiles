################################################################################
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# MacOS aliases for ZSH.
################################################################################

# airport wifi utility
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"

# copy to clipboard
alias -g C='| pbcopy'

# from http://apple.stackexchange.com/questions/110343/copy-last-command-in-terminal
alias ccmd='fc -ln -1 | awk '\''{$1=$1}1'\'' ORS='\'''\'' | pbcopy'

# speed up osx terminal by removing log files
alias cleanlog="sudo rm -rf /private/var/log/asl/*.asl"

# flush dns
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;sleep 2"

# hide hidden files
alias hide="defaults write com.apple.finder AppleShowAllFiles NO && killAll Finder"

# show hidden files
alias show="defaults write com.apple.finder AppleShowAllFiles YES && killAll Finder"
