#!/bin/zsh

set -euo pipefail

APP_NAME="Starship"
CONFIG_FILE_PATH="${0:A:h}/starship.toml"
DESTINATION_DIR="$HOME/.config"
DESTINATION_PATH="$DESTINATION_DIR/starship.toml"

mkdir -p "$DESTINATION_DIR"

if [[ -L "$DESTINATION_PATH" && "$(readlink "$DESTINATION_PATH")" == "$CONFIG_FILE_PATH" ]]; then
    echo "$APP_NAME: Config File Already Linked"
    exit 0
fi

if [[ -e "$DESTINATION_PATH" || -L "$DESTINATION_PATH" ]]; then
    echo "$APP_NAME: Backing Up Config File"
    mv "$DESTINATION_PATH" "$DESTINATION_PATH.$(date +%F_%T).bak"
fi

ln -s "$CONFIG_FILE_PATH" "$DESTINATION_PATH"
echo "$APP_NAME: Linked Settings"
