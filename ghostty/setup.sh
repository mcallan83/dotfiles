#!/usr/bin/env bash
set -euo pipefail

GHOSTTY_CONFIG_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_PATH="$GHOSTTY_CONFIG_DIR/config.ghostty"
DESTINATION_DIR="$HOME/Library/Application Support/com.mitchellh.ghostty"
DESTINATION_PATH="$DESTINATION_DIR/config.ghostty"

if [[ ! -f "$SOURCE_PATH" ]]; then
    echo "Ghostty: Missing config at $SOURCE_PATH" >&2
    exit 1
fi

mkdir -p "$DESTINATION_DIR"

if [[ -L "$DESTINATION_PATH" && "$(readlink "$DESTINATION_PATH")" == "$SOURCE_PATH" ]]; then
    echo "Ghostty: Settings already linked"
    exit 0
fi

# Back up any existing config, including a dangling symlink.
if [[ -e "$DESTINATION_PATH" || -L "$DESTINATION_PATH" ]]; then
    echo "Ghostty: Backing Up Config"
    mv "$DESTINATION_PATH" "$DESTINATION_PATH.$(date +%F_%T).bak"
fi

ln -s "$SOURCE_PATH" "$DESTINATION_PATH"
echo "Ghostty: Linked settings to $SOURCE_PATH"
