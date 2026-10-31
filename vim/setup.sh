#!/usr/bin/env bash
set -euo pipefail

VIM_CONFIG_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_PATH="$VIM_CONFIG_DIR/vimrc"
DESTINATION_PATH="$HOME/.vimrc"

if [[ -L "$DESTINATION_PATH" && "$(readlink "$DESTINATION_PATH")" == "$SOURCE_PATH" ]]; then
    echo "Vim: Settings already linked"
    exit 0
fi

if [[ -e "$DESTINATION_PATH" || -L "$DESTINATION_PATH" ]]; then
    echo "Vim: Backing Up Config"
    mv "$DESTINATION_PATH" "$DESTINATION_PATH.$(date +%F_%T).bak"
fi

ln -s "$SOURCE_PATH" "$DESTINATION_PATH"
echo "Vim: Linked settings to $SOURCE_PATH"
