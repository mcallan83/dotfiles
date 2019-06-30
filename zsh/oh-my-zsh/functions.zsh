################################################################################
# Filename: zsh/oh-my-zsh/functions.zsh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Functions for ZSH.
################################################################################

# search all aliases
function als() {
    alias | grep $1
}

# create backup copy of file, appending .bak extension to end
function bak() {
    cp "${1}"{,.bak}
}

# decrypt file
# http://flux242.blogspot.com/2011/03/encrypting-with-openssl-in-bash.html
function decrypt {
  if [ -t 0 ]; then
    # interactive
    local fname="$1"
    shift
    openssl aes-256-cbc -d -in "$fname" -out "${fname%\.*}" $@
  else
    perl -e 'use IO::Select; $ready=IO::Select->new(STDIN)->can_read();'
    openssl aes-256-cbc -d $@
  fi
}

# encrypt file
# http://flux242.blogspot.com/2011/03/encrypting-with-openssl-in-bash.html
function encrypt {
  if [ -t 0 ]; then
    # interactive
    local fname="$1"
    shift
    openssl aes-256-cbc -salt -in "$fname" -out "${fname}.enc" $@
  else
    # piped
    perl -e 'use IO::Select; $ready=IO::Select->new(STDIN)->can_read();'
    openssl aes-256-cbc -salt $@
  fi
}

# init a git repo
function gitinit {
    touch readme.md
    git init
    git add --all
    git commit -m 'initial commit'
}

# use for knockd port knocking
# example: knock 127.0.0.1 80 90 100
function knock {
    HOST=$1
    shift
    for ARG in "$@"
    do
        nmap -Pn --host-timeout 100 --max-retries 0 -p $ARG $HOST
    done
}

# mkdir and cd to it
function mkcd {
    dir="$*";
    mkdir -p "$dir" && cd "$dir";
}

# run a web server from current folder (python)
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}
