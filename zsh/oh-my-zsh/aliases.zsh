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

# tmuxinator
alias mux="tmuxinator"

# atom
alias aa="atom ."
alias aab="apm list --installed --bare > $DOTFILES/osx/atom/config/packages.txt"

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
alias dcub="docker-compose up --build"
alias dcl="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock spotify/docker-gc"
alias portainer="docker run -v \"/var/run/docker.sock:/var/run/docker.sock\" -d -p 9000:9000 portainer/portainer --no-auth"
alias dclean="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock zzrot/docker-clean"
alias dry="docker run -it -v /var/run/docker.sock:/var/run/docker.sock moncho/dry"

# ethe price
alias ethe="curl -s https://api.coinbase.com/v2/prices/ETH-USD/spot | python -c \"import json, sys; print(json.load(sys.stdin)['data']['amount'])\""

# git
alias gi="git init"
alias gj="git checkout -"
alias gsub="git submodule foreach git pull origin master"
alias gpb="ggpush && hb"

# grep
alias -g G='| grep'

# hub
alias hb="hub browse" # open up github repo in browser
alias hpr="hub pull-request" # create pull request on github

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

# ps
alias psa="ps aux"

# spotify
alias sp="spotify"
alias spn="spotify next"
alias sps="spotify status"

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
alias hide="defaults write com.apple.finder AppleShowAllFiles NO && killAll Finder"
alias show="defaults write com.apple.finder AppleShowAllFiles YES && killAll Finder"


alias mkpasswd="docker run -it --rm egray/mkpasswd"
alias wpscan="docker run -it --rm wpscanteam/wpscan"
