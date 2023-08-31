#!/usr/bin/env bash

################################################################################
# Due to a bug, this will generate a certificate required for Barrier server.
#
# If barrier is running sluggish, running `sudo ifconfig awdl0 down` to shut
# down the AWDL interface may speed things up.
#
################################################################################

mkdir -p "$HOME/Library/Application Support/barrier/SSL"
cd "$HOME/Library/Application Support/barrier/SSL"

openssl req \
    -x509 \
    -nodes \
    -days 365 \
    -subj /CN=Barrier \
    -newkey rsa:4096 \
    -keyout Barrier.pem \
    -out Barrier.pem

cd -
