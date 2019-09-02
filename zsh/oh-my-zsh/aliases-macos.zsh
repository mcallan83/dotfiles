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

# flish dns
alias flushdns="sudo killall -HUP mDNSResponder;sleep 2;"

# capture screen
alias sc="screencapture -c -W"

# hide\show hidden files
alias hide="defaults write com.apple.finder AppleShowAllFiles NO && killAll Finder"
alias show="defaults write com.apple.finder AppleShowAllFiles YES && killAll Finder"

# zip docs volume
alias zipdocs="zip -r docs.zip /Volumes/docs -x '*.git*'"
