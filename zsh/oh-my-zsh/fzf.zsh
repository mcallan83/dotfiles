################################################################################
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Fzf (a command-line fuzzy finder) config.
# https://github.com/junegunn/fzf
################################################################################

# Use fzf with z.
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/z

unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --reverse --inline-info +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}

# Use fzf with SSH (and bind to ctrl+s)
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

# Use fzf to list all composer and npm scripts at the same time, and then
# execute which ever script is seleced.

function pks () {
    COMPOSER_SCRIPTS=$(cat composer.json | \jq -r '.scripts | keys[]' | sed -e '/^post/d;s/^/[composer] /')
    NPM_SCRIPTS=$(cat package.json | jq -r '.scripts | keys[]' | sed -e 's/^/[npm] /')

    echo "${COMPOSER_SCRIPTS}\n${NPM_SCRIPTS}" | sort | fzf --reverse -1 -0 -d ',' --with-nth=1 --header 'Run Script:' | sed -e 's/\[composer\] /composer /;s/\[npm\] /npm run /' | xargs -L 1 -I {} sh -c "{}"
}

# List all Ansible Playbooks and run which ever is selected.

function ap () {
    ls -1 | grep .yml$ | sed -e '/requirements/d;s/\.yml$//' | sort | fzf --reverse -1 -0 -d ',' --with-nth=1 --header 'Select Playbook:' | sed -e 's/^/ansible-playbook /;s/$/\.yml/' | xargs -L 1 -I {} sh -c "{}"
}
