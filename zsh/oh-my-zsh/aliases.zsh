################################################################################
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Aliases for ZSH.
################################################################################


# edit config files in editor
alias hosts="sudo $EDITOR /etc/hosts"
alias sshconfig="$EDITOR ~/.ssh/config"

# ansible
alias ap="ansible-playbook"
alias avd="ansible-vault decrypt"
alias ave="ansible-vault encrypt"

# cd back
alias cdb="cd -"

# colortest
alias colortest="colortest | sed -n '1!p'"

# ctags - generate index
alias tags="ctags -R"

# docker
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"

# git
alias gi="git init"
alias gj="git checkout -"
alias gsub="git submodule foreach git pull origin master"
alias ggpff='git push origin "$(git_current_branch)" --force'
alias gt="cd \$(git rev-parse --show-toplevel)"

# grep
alias -g G='| grep'

# hub
alias hb="hub browse" # open up github repo in browser
alias hpr="hub pull-request" # create pull request on github

# json pretty print
alias -g J='| python -m json.tool'

# edit known_hosts file in editor
alias known="$EDITOR ~/.ssh/known_hosts"

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
alias mux="tmuxinator"

# vagrant
alias vc="vagrant ssh -c"
alias vh="vagrant halt"
alias vr="vagrant reload"
alias vs="vagrant ssh"
alias vu="vagrant up"

# vim
alias v="vim"

# yarn
alias yw="yarn watch"

# weather forecast
alias weather="curl http://wttr.in/naperville,il"

################################################################################
# CLI Tools Run Via Docker
################################################################################

# docker clean
alias dccl="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock zzrot/docker-clean"

# docker garbage collection
alias dcgc="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock spotify/docker-gc"

# terminal based docker manager
alias dry="docker run -it -v /var/run/docker.sock:/var/run/docker.sock moncho/dry"

# generate password hashes via mkpasswd
alias mkpasswd="docker run -it --rm egray/mkpasswd"

# web based docker manager
alias portainer="docker run -v /var/run/docker.sock:/var/run/docker.sock -d -p 9000:9000 portainer/portainer --no-auth"

# wordpress security tool
alias wpscan="docker run -it --rm wpscanteam/wpscan"
