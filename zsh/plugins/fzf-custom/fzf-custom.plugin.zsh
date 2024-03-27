# This plugin must be loaded after the "z" plugin.

eval "$(fzf --zsh)"

# checkout local or remote git branch
# https://github.com/wellle/dotfiles/blob/577d9ee28f772b2f57e44c00a3d392c3238660eb/fzf.zsh#L110
br() {
  git fetch
  local branches branch
  branches=$(git branch --all | grep -v HEAD | grep -v dependabot) &&
  branch=$(echo "$branches" | fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# list and connect to configured ssh servers (bound to ^s)
# https://gist.github.com/dohq/1dc702cc0b46eb62884515ea52330d60
function fzf-ssh-widget() {
  local selected_host=$(grep "Host " ~/.ssh/config | grep -v '*' | cut -b 6- | sort -r | fzf --query "$LBUFFER")
  if [ -n "$selected_host" ]; then
    BUFFER="ssh ${selected_host}"
    zle accept-line
  fi
  zle reset-prompt
}

zle -N fzf-ssh-widget
bindkey '^s' fzf-ssh-widget

# integrate with z
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/z
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && zshz "$*" && return
  cd "$(zshz -l 2>&1 | fzf --height 40% --reverse --inline-info +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}
