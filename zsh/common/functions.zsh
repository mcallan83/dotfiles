# search aliases
function als() {
    alias | grep $1
}

# create backup copy of file, appending the `.bak` extension to the end of
# the file
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

# fancy tree
function ftree() {
  tree -aC -I '.git|node_modules|vendor' --dirsfirst "$@" | less -FRNX
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
