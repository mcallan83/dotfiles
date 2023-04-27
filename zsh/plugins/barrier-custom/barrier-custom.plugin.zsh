# https://github.com/debauchee/barrier

# Generate a key for barrier servers so clients can connect. This is missing
# by default.
function barrier-ssl {
    cd "$HOME/Library/Application Support/barrier/SSL"
    openssl req -x509 -nodes -days 365 -subj /CN=Barrier -newkey rsa:4096 -keyout Barrier.pem -out Barrier.pem
    cd -
}

# Disables Apple Wireless Direct Link to speed up choppy mouse movements on clients.
function barrier-fix {
    sudo ifconfig awdl0 down
}

# Enables Apple Wireless Direct Link.
function barrier-unfix {
    sudo ifconfig awdl0 up
}
