################################################################################
# Filename: zsh/oh-my-zsh/aliases.zsh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Aliases for ZSH.
################################################################################

# edit config files
alias hosts="sudo $EDITOR /etc/hosts"
alias vimrc="$EDITOR ~/.vimrc"
alias zshrc="$EDITOR ~/.zshrc"
alias dots="cd ~/.dotfiles && $EDITOR"

# atom
alias aa="atom ."

# cd back
alias cdb="cd -"

# clear screen
alias cl="clear"

# ctags
alias tags="ctags -R" # generate ctags index

# dedv
# https://github.com/cortesi/devd
alias dv="devd -ol ."

# git
alias gi="git init"
alias gj="git checkout -"
alias gs="gst"
alias gsub="git submodule foreach git pull origin master"

# grep
alias -g G='| grep'

# hub
alias hb="hub browse" # open up github repo in browser

# json pretty print
alias -g J='| python -m json.tool'

# k
# https://github.com/rimraf/k
alias ka="clear;k -a" # k with hidden files
alias kd="clear;k -d" # k with directories only

# laravel artisan
alias la5m="la5 migrate"
alias la5mb="la5 migrate:rollback"
alias la5mr="la5 migrate:refresh --seed"
alias la5r="la5 route:list"
alias la5s="la5 serve"
alias la5vc="la5 view:clear"

# less
alias -g L='| less'

# npm
alias n="npm"
alias ni="npm install"
alias nig="npm install -g"
alias niy="npm init -y"
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

# web-search
alias amazon='web_search duckduckgo \!az'
alias kickass='web_search duckduckgo \!kick'
alias laradoc='web_search duckduckgo \!laravel'
alias tz='web_search duckduckgo \!trz'
alias we='web_search duckduckgo \!weatherunderground 60564'

# youtube-dl
alias ytd="youtube-dl"

# z
# https://github.com/rupa/z
alias zc="z -c" # z in current folder only

# zshmarks
# https://github.com/jocelynmallon/zshmarks
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias l="showmarks"

# osx only

# capture screen
alias sc="screencapture -c -W"
