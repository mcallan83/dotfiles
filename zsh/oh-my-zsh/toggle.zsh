################################################################################
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Use ^Z to toggle between foreground app and commandline.
################################################################################

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
