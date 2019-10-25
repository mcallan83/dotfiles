################################################################################
# Filename: zsh/oh-my-zsh/aliases-macos.zsh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# MacOS aliases for ZSH.
################################################################################

# copy to clipboard
alias -g C='| pbcopy'

# copy current path
alias cpwd="pwd | tr -d '\n' | pbcopy"

# empty all trashes and clear system logs
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

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
