# global aliases
alias -g G='| grep'
alias -g L='| less'

# cd to previous directory
alias cdp="cd -"

# disk space report
alias diskspace="df -P -kHl"

# edit hosts file
alias hosts="sudo $EDITOR /etc/hosts"

# list open ports
alias ports='sudo nmap -sT -O localhost'

# ps
alias psa="ps aux"

# sublime
alias ss="stt"

# tail
alias t="tail -f"
