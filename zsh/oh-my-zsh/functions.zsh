################################################################################
# Filename: zsh/oh-my-zsh/function.zsh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Functions for ZSH.
################################################################################

# mkdir and cd to it
function mkcd {
    dir="$*";
    mkdir -p "$dir" && cd "$dir";
}

# displays terminal color palette
# http://askubuntu.com/questions/27314/script-to-display-all-terminal-colors
# function colortest {
#     for x in 0 1 4 5 7 8; do for i in `seq 30 37`; do for a in `seq 40 47`; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo "";
# }

# run adminer as web server if installed
function adminer {
    if [ -d /usr/local/share/adminer ] ; then
        open http://localhost:8888
        php -S localhost:8888 -t /usr/local/share/adminer > /dev/null
    fi
}

# laravel homestead helper
# https://laravel.com/docs/5.2/homestead
# https://murze.be/2016/01/some-laravel-homestead-tips/
#
# commands:
#     - homestead init (initialize homestead)
#     - homestead edit (edit homestead yaml file)
#     - homestead halt
#     - homestead provision
#     - homestead ssh
#     - homestead up

function homestead() {
    cd "$DOTFILES/vendor/vagrant/homestead"
    command="$1"
    if [ "$command" = "edit" ]; then
        $EDITOR ~/.homestead/homestead.yaml
    elif [ "$command" = "init" ]; then
        bash init.sh
    else
        if [ -z "$command" ]; then
            command="ssh"
        fi
        eval "vagrant ${command}"
    fi
    cd -
}

# run a web server from current folder (python)
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}


# search all aliases
function als() {
    alias | grep $1
}

# Save installed Atom packages list to dotfiles repo.
function apmbak() {

    if ! type "apm" > /dev/null; then
        echo "Error: Could not find apm."
        return
    fi

    local PACKAGES="$DOTFILES/osx/atom/config/packages.txt"

    apm list --installed --bare > $PACKAGES
    sed -i '' '/^$/d' $PACKAGES

    echo "APM: Saving Atom Package List To:"
    echo $PACKAGES
    echo ""
    cat $PACKAGES
}

# Install Atom packages from list saved in dotfiles repo.
function apmi() {
    if ! type "apm" > /dev/null; then
        echo "Error: Could not find apm."
        return
    fi
    echo "APM: Installing:"
    apm install --packages-file "$DOTFILES/osx/atom/config/packages.txt"
}

# create backup copy of file with .bak extension appended on end
function bak() {
    cp "${1}"{,.bak}
}

# run a command inside vagrant box via ssh
function vc() {
    vagrant ssh -c $*
}

# osx only

pman() {
    man -t "${1}" | open -f -a /Applications/Preview.app/
}

# fix permissions for homebrew
brewfix() {
    sudo chown $(whoami):admin /usr/local
    sudo chown -R $(whoami):admin /usr/local
}

# speed up osx terminal by removing log files
termspeed() {
    sudo rm -rf /private/var/log/asl/*.asl
}

# Scrape a single webpage with all assets
function scrape() {
    wget --adjust-extension --convert-links --page-requisites --span-hosts --no-host-directories "$1"
}

# google feeling lucky search
luck() {
    url=$(echo "http://www.google.com/search?hl=en&q=$@&btnI=I%27m+Feeling+Lucky" | sed 's/ /+/g');
    open $url;
}

# Create alias from previous command and place in aliases.zsh file.
new-alias() {
  local last_command=$(echo `history |tail -n2 |head -n1` | sed 's/[0-9]* //')
  echo "" >> "$DOTFILES/zsh/oh-my-zsh/aliases.zsh"
  echo "# added by new-alias()" >> "$DOTFILES/zsh/oh-my-zsh/aliases.zsh"
  echo alias $1="'""$last_command""'" >> "$DOTFILES/zsh/oh-my-zsh/aliases.zsh"
  . "$DOTFILES/zsh/oh-my-zsh/aliases.zsh"
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


# export git repo as zip to desktop
function gexp {
    TIMESTAMP=$(date +%s)

    BRANCH="master"
    vared -p "Branch [master]:" -c $BRANCH

    OUTPUT="$HOME/Desktop/$TIMESTAMP-archive.zip"

    git archive --format zip --output $OUTPUT $BRANCH
}

# use fzf with z
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --reverse --inline-info +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}
