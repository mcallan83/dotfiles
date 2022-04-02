# checkout local or remote git branch
# https://github.com/wellle/dotfiles/blob/577d9ee28f772b2f57e44c00a3d392c3238660eb/fzf.zsh#L110
fbr() {
  git fetch
  local branches branch
  branches=$(git branch --all | grep -v HEAD | grep -v dependabot) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# search chrome history
# https://sourabhbajaj.com/mac-setup/iTerm/fzf.html
fch() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# list and connect to configured ssh servers (bound to ^s)
# https://gist.github.com/dohq/1dc702cc0b46eb62884515ea52330d60
function fssh () {
  local selected_host=$(grep "Host " ~/.ssh/config | grep -v '*' | cut -b 6- | sort -r | fzf --query "$LBUFFER")

  if [ -n "$selected_host" ]; then
    BUFFER="ssh ${selected_host}"
    zle accept-line
  fi
  zle reset-prompt
}

zle -N fssh
bindkey '^s' fssh

# integrate with z
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/z
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --reverse --inline-info +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}
