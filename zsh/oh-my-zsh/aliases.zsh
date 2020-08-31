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

# cd back
alias cdb="cd -"

# composer update with no memory limits
alias cr="composer require"
alias cu="composer update"

# docker compose
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"

# git
alias gj="git checkout -"
alias gsub="git submodule foreach git pull origin master"
alias gt="cd \$(git rev-parse --show-toplevel)"

# github
alias ghb="gh repo view --web"
alias ghpr="gh pr create"

# ps
alias psa="ps aux"

# reload shell
alias reload!='exec "$SHELL" -l'

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

################################################################################
# CLI Tools Run Via Docker
################################################################################

# ansible 2.8
alias ansible-playbook="docker run \
    --rm \
    -it \
    -v \"$(pwd)\":/ansible \
    -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
    --workdir=/ansible \
    willhallonline/ansible:2.8-alpine \
    ansible-playbook"

alias ansible-vault="docker run \
    --rm \
    -it \
    -v \"$(pwd)\":/ansible \
    -v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
    --workdir=/ansible \
    willhallonline/ansible:2.8-alpine \
    ansible-vault"

# docker clean
alias dccl="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock zzrot/docker-clean"

# docker garbage collection
alias dcgc="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock spotify/docker-gc"

# gtop
alias gtop="docker run --rm -it --name gtop --net=host --pid=host aksakalli/gtop"

# generate password hashes via mkpasswd
alias mkpasswd="docker run -it --rm egray/mkpasswd"

# web based docker manager
alias portainer="docker run -v /var/run/docker.sock:/var/run/docker.sock -d -p 9000:9000 portainer/portainer --no-auth"

# wordpress security tool
alias wpscan="docker run -it --rm wpscanteam/wpscan"
