# copy to clipboard
alias -g C='| pbcopy'

# open path in finder
alias ff="open ."

# flush dns
alias flushdns='sudo killall -HUP mDNSResponder'

# hide hidden files
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool NO && killall Finder"

# show hidden files
alias show="defaults write com.apple.finder AppleShowAllFiles -bool YES && killall Finder"
