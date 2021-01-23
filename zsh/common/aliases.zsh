# global aliases
alias -g G='| grep'
alias -g L='| less'

# open various config files in editor
alias hosts="sudo $EDITOR /etc/hosts"
alias sshc="$EDITOR ~/.ssh/config"
alias sshk="$EDITOR ~/.ssh/known_hosts"

# cd to previous directory
alias cdp="cd -"

# disk space report
alias diskspace="df -P -kHl"

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
