################################################################################
# Filename: zsh/oh-my-zsh/fzf.zsh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Fzf config (a command-line fuzzy finder, config).
# https://github.com/junegunn/fzf
################################################################################


# use fzf with z
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --reverse --inline-info +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}

# use fzf with ssh (and bind to ctrl+s)
# https://gist.github.com/dohq/1dc702cc0b46eb62884515ea52330d60
function zs () {
  local selected_host=$(grep "Host " ~/.ssh/config | grep -v '*' | cut -b 6- | fzf --query "$LBUFFER")

  if [ -n "$selected_host" ]; then
    BUFFER="ssh ${selected_host}"
    zle accept-line
  fi
  zle reset-prompt
}

zle -N zs
bindkey '^s' zs


# use fzf with npm scripts
function znpm () {
    cat package.json | \
      jq -r '.scripts | keys[]' | \
      fzf --height 30% --reverse -1 -0 -d ',' --with-nth=1 --header 'Select npm script to run' | \
      xargs npm run
}
