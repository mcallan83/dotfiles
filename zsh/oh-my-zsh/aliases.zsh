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
alias dots="cd $DOTFILES && $EDITOR"

# atom
alias aa="atom ."

# cd back
alias cdb="cd -"

# colortest
alias colortest="colortest | sed -n '1!p'"

# clear screen
alias cl="clear"

# ctags - generate index
alias tags="ctags -R"

# docker
alias dcu="docker-compose up"

# git
alias gi="git init"
alias gj="git checkout -"
alias gs="gst"
alias gsub="git submodule foreach git pull origin master"
alias gpb="ggpush && hb"

# grep
alias -g G='| grep'

# hub
alias hb="hub browse" # open up github repo in browser

# json pretty print
alias -g J='| python -m json.tool'

# k
# https://github.com/rimraf/k
alias ka="clear;k -a" # with hidden files
alias kd="clear;k -d" # with directories only

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

# portainer
alias portainer="docker run -v \"/var/run/docker.sock:/var/run/docker.sock\" -d -p 9000:9000 portainer/portainer --no-auth"

# ps
alias psa="ps aux"

# spotify
alias sp="spotify"
alias next="spotify next"
alias song="spotify status"

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
alias laradoc='web_search duckduckgo \!laravel'

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

# hide\show hidden files
alias hide="defaults write com.apple.finder AppleShowAllFiles YES && killAll Finder"
alias show="defaults write com.apple.finder AppleShowAllFiles NO && killAll Finder"
