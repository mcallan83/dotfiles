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
if [ -d /usr/local/share/adminer ] ; then
    function adminer {
        open http://localhost:8888
        php -S localhost:8888 -t /usr/local/share/adminer > /dev/null
    }
fi

# search all alises
function als() {
    alias | grep $1
}

# osx only

pman() {
    man -t "${1}" | open -f -a /Applications/Preview.app/
}

# fix permissions for homebrew
brewfix() {
    sudo chown $(whoami):admin /usr/local && sudo chown -R $(whoami):admin /usr/local
}

# Updates global packages installed with the following package managers:
# - Homebrew
# - Composer
# - NPM
# - Ruby Gems
# - PIP
update() {

    # homebrew
    sudo chown $(whoami):admin /usr/local
    sudo chown -R $(whoami):admin /usr/local
    brew update
    brew upgrade --all
    brew cleanup
    brew cask cleanup
    brew prune

    # composer
    composer self-update
    composer global update

    # npm
    npm update -g

    # rvm and gems
    rvm requirements
    rvm cleanup all
    sudo gem update --system;
    gem update `gem list | cut -d ' ' -f 1`
    gem cleanup;

    # python
    pip install --upgrade pip
    pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
}
