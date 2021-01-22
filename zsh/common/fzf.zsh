################################################################################
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Fzf (a command-line fuzzy finder) config.
# https://github.com/junegunn/fzf
################################################################################

# use with z
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/z
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --reverse --inline-info +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}

# list and connect to configured servers via ssh (bound to ^s)
# https://gist.github.com/dohq/1dc702cc0b46eb62884515ea52330d60
function fssh () {
  local selected_host=$(grep "Host " ~/.ssh/config | grep -v '*' | cut -b 6- | fzf --query "$LBUFFER")

  if [ -n "$selected_host" ]; then
    BUFFER="ssh ${selected_host}"
    zle accept-line
  fi
  zle reset-prompt
}

zle -N fssh
bindkey '^s' fssh
