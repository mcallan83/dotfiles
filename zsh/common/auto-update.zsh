#!/bin/bash

LAST_RUN_FILE="$DOTFILES/LAST_AUTO_UPDATE"

if [[ -f "$LAST_RUN_FILE" ]]; then
    LAST_RUN_TIME=$(cat "$LAST_RUN_FILE")
else
    LAST_RUN_TIME=0
fi

NOW=$(date +%s)

if (( $((NOW - LAST_RUN_TIME)) > $((7 * 24 * 60 * 60)) )); then
    # Download Bypass Paywals Chrome Clean
    # https://github.com/bpc-clone?tab=repositories
    # https://github.com/bpc-clone/bypass-paywalls-chrome-clean
    URL="https://github.com/bpc-clone/bpc_updates/releases/latest/download/bypass-paywalls-chrome-clean-master.zip"

    TEMP_DIR=$(mktemp -d);
    DEST_DIR="$DOTFILES/vendor/chrome/bypass-paywalls-chrome-clean"

    curl -L $URL -o "$TEMP_DIR/file.zip"
    unzip -o "$TEMP_DIR/file.zip" -d "$TEMP_DIR"
    rm -rf $DEST_DIR
    mkdir -p $DEST_DIR
    mv "$TEMP_DIR"/bypass-paywalls-chrome-clean-master/* "$DEST_DIR"
    rm -rf "$TEMP_DIR"

    echo $NOW > $LAST_RUN_FILE
fi
