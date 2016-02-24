# mkdir and cd to it
function mkcd {
    dir="$*";
    mkdir -p "$dir" && cd "$dir";
}

# displays terminal color palette
# http://askubuntu.com/questions/27314/script-to-display-all-terminal-colors
function colortest {
    for x in 0 1 4 5 7 8; do for i in `seq 30 37`; do for a in `seq 40 47`; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo "";
}

# run adminer as web server if installed
function adminer {
    if [ -d /usr/local/share/adminer ] ; then
        open http://localhost:8888
        php -S localhost:8888 -t /usr/local/share/adminer > /dev/null
    fi
}

# run a web server from current folder (python)
function server() {
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}


# search all alises
function als() {
    alias | grep $1
}

# create backup copy of file with .bak extension appended on end
function bak() {
    cp "${1}"{,.bak}
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

# google feeling lucky search
luck() {
    url=$(echo "http://www.google.com/search?hl=en&q=$@&btnI=I%27m+Feeling+Lucky" | sed 's/ /+/g');
    open $url;
}
