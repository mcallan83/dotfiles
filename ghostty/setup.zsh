#!/bin/zsh

set -euo pipefail

GHOSTTY_CONFIG_DIR="${0:A:h}"
SOURCE_PATH="$GHOSTTY_CONFIG_DIR/config.ghostty"
DESTINATION_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
DESTINATION_PATH="$DESTINATION_DIR/config.ghostty"

mkdir -p "$DESTINATION_DIR"

if [[ -L "$DESTINATION_PATH" && "$(readlink "$DESTINATION_PATH")" == "$SOURCE_PATH" ]]; then
    echo "Ghostty: Settings Already Linked"
    exit 0
fi

if [[ -e "$DESTINATION_PATH" || -L "$DESTINATION_PATH" ]]; then
    echo "Ghostty: Backing Up Config"
    mv "$DESTINATION_PATH" "$DESTINATION_PATH.$(date +%F_%T).bak"
fi

ln -s "$SOURCE_PATH" "$DESTINATION_PATH"
echo "Ghostty: Linked settings to $SOURCE_PATH"
