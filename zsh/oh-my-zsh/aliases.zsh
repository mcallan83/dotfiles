# edit configs
alias zshrc="$EDITOR ~/.zshrc"
alias vimrc="$EDITOR ~/.vimrc"

# atom
alias aa="atom ."

# cd
alias cdb="cd -"

# clear screen
alias cl="clear"

# git
alias gi="git init"
alias gs="gst"
alias gsub="git submodule foreach git pull origin master"

# grep
alias -g G='| grep'

# json pretty print
alias -g J='| python -m json.tool'

# hosts file
alias hosts="sudo $EDITOR /etc/hosts"

# k
alias ka="clear;k -a" # k with hidden files
alias kd="clear;k -d" # k with directories only

# laravel
alias la5m="la5 migrate"
alias la5mb="la5 migrate:rollback"
alias la5mr="la5 migrate:refresh --seed"
alias la5r="la5 route:list"
alias la5vc="la5 view:clear"

# less
alias -g L='| less'

# npm
alias n="npm"
alias ni="npm install"
alias nr="npm run"
alias nu="npm update"

# ps
alias psa="ps aux"

# sublime
alias ss="stt"

# tail
alias t="tail -f"

# tmux
alias tb="tmux show-buffer"

# vagrant
alias vh="vagrant halt"
alias vr="vagrant reload"
alias vs="vagrant ssh"
alias vu="vagrant up"

# vim
alias v="vim"
alias vl="vim -N -u NONE" #vim with no plugins

#web-search
alias amazon='web_search duckduckgo \!az'

# z
alias zc="z -c" # z in current folder only

# zshmarks
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias l="showmarks"

# osx only

# capture screen
alias sc="screencapture -c -W"
