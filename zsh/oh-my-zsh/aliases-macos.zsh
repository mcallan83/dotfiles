################################################################################
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# MacOS aliases for ZSH.
################################################################################

# copy to clipboard
alias -g C='| pbcopy'

# speed up osx terminal by removing log files
alias cleanlog="sudo rm -rf /private/var/log/asl/*.asl"

# empty all trashes and clear system logs
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash;"

# flush dns
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;sleep 2"

# hide hidden files
alias hide="defaults write com.apple.finder AppleShowAllFiles NO && killAll Finder"

# switch php versions
alias php71="phpv php@7.1"
alias php72="phpv php@7.2"
alias php73="phpv php@7.3"

# capture screen
alias sc="screencapture -c -W"

# show hidden files
alias show="defaults write com.apple.finder AppleShowAllFiles YES && killAll Finder"

# zip docs volume
alias zipdocs="zip -r docs.zip /Volumes/docs -x '*.git*'"
