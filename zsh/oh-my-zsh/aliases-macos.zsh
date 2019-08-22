################################################################################
# Filename: zsh/oh-my-zsh/aliases-macos.zsh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# MAcOS aliases for ZSH.
################################################################################

# copy to clipboard
alias -g C='| pbcopy'

# flish dns
alias dnsflush="sudo killall -HUP mDNSResponder;sleep 2;"

# capture screen
alias sc="screencapture -c -W"

# hide\show hidden files
alias hide="defaults write com.apple.finder AppleShowAllFiles NO && killAll Finder"
alias show="defaults write com.apple.finder AppleShowAllFiles YES && killAll Finder"
