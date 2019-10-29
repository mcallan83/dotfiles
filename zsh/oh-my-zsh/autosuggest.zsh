################################################################################
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Enables ZSH autosuggestions.
################################################################################

zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

bindkey '^f' vi-forward-word
bindkey '^x' vi-end-of-line
