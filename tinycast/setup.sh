#!/usr/bin/env bash
set -euo pipefail

TINYCAST_CONFIG_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_PATH="$TINYCAST_CONFIG_DIR/settings.json"
DESTINATION_DIR="$HOME/.config/tinycast"
DESTINATION_PATH="$DESTINATION_DIR/settings.json"

if [[ ! -f "$SOURCE_PATH" ]]; then
    echo "Tinycast: Missing config at $SOURCE_PATH" >&2
    exit 1
fi

mkdir -p "$DESTINATION_DIR"

if [[ -L "$DESTINATION_PATH" && "$(readlink "$DESTINATION_PATH")" == "$SOURCE_PATH" ]]; then
    echo "Tinycast: Settings already linked"
    exit 0
fi

if [[ -e "$DESTINATION_PATH" || -L "$DESTINATION_PATH" ]]; then
    echo "Tinycast: Backing Up Config"
    mv "$DESTINATION_PATH" "$DESTINATION_PATH.$(date +%F_%T).bak"
fi

ln -s "$SOURCE_PATH" "$DESTINATION_PATH"
echo "Tinycast: Linked settings to $SOURCE_PATH"
