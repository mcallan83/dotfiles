#!/usr/bin/env bash

################################################################################
# Generate certificate for barrier server.
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
