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

# disk space report
alias diskspace="df -P -kHl"

# global aliases
alias -g G='| grep'
alias -g L='| less'

# cd to previous directory
alias cdp="cd -"

# list open ports
alias ports='sudo nmap -sT -O localhost'

# ps
alias psa="ps aux"

# sublime
alias ss="stt"

# tail
alias t="tail -f"

# yarn
alias yw="yarn watch"
