################################################################################
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Aliases for ZSH.
################################################################################

# open config files in editor
alias hosts="sudo $EDITOR /etc/hosts"
alias sshc="$EDITOR ~/.ssh/config"
alias sshk="$EDITOR ~/.ssh/known_hosts"

# global aliases
alias -g G='| grep'
alias -g L='| less'

# ansible
alias ap="ansible-playbook"
alias avd="ansible-vault decrypt"
alias ave="ansible-vault encrypt"

# cd to previous directory
alias cdp="cd -"

# composer
alias cr="composer require"
alias cu="composer update"

# git
alias gj="git checkout -"
alias gsub="git submodule foreach git pull origin master"
alias gt="cd \$(git rev-parse --show-toplevel)"

# github
alias ghb="gh repo view --web"
alias ghpr="gh pr create"

# ps
alias psa="ps aux"

# sublime
alias ss="stt"

# tail
alias t="tail -f"

# vagrant
alias vc="vagrant ssh -c"
alias vh="vagrant halt"
alias vr="vagrant reload"
alias vs="vagrant ssh"
alias vu="vagrant up"

# yarn
alias yw="yarn watch"
