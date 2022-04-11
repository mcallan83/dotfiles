#!/usr/bin/env bash
#
# Simple Backup
#
# Backup a folder with encryption and versioning using Duplicity and a
# passphrase stored in the MacOS keychain.
#
# Usage: simple_backup "$HOME/.ssh" "$HOME/backups/ssh"

function simple_backup () {
    local keychain_service_name="${SIMPLE_BACKUP_KEYCHAIN_NAME:-simple-backup}"
    local passphrase=$(security find-generic-password -w -s "${keychain_service_name}")  > /dev/null 2>&1

    if [ -z "$passphrase" ]; then
        error "Backup passphrase not set in keychain."
        printf "Run the following command to set the passphrase:\n"
        printf "security add-generic-password -s \"${keychain_service_name}\" -a 'backup' -w <passphrase>\n\n"
        exit 1
    fi

    local source=$1
    local destination=$2

    if [[ -z "$source" || ! -d "$source" ]]; then
        error "Invalid source path."
        exit 1
    fi

    if [[ -z "$destination" ]]; then
        error "Missing destination path."
        exit 1
    fi

    local backend="file://${destination}"

    if [[ $destination =~ ^[-A-Za-z0-9]*:// ]]; then
        backend=$destination
    fi

    ulimit -n 1024

    title "Backing Up: $source"
    PASSPHRASE=${passphrase} duplicity "${source}" "${backend}"
    # title "Verifying: $source"
    # PASSPHRASE=${passphrase} duplicity verify "${backend}" "${source}"
    printf "\n\n"
}

function error () {
    printf "\033[0;31mError: ${1}\033[0m\n"
}

function title () {
    printf "\033[0;34m${1}\033[0m\n"
}
