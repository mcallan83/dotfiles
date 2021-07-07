#!/usr/bin/env bash

SOURCE_PATH="$DOTFILES/visual-studio-code"
DESTINATION_PATH="$HOME/Library/Application Support/Code/User"

mkdir -p "$DESTINATION_PATH"

echo "Code: Backing Up Existing Settings"

if [ -L "$DESTINATION_PATH/snippets" ]; then
    mv "$DESTINATION_PATH/snippets" "$DESTINATION_PATH/snippets.$(date +%s).bak"
fi

if [ -L "$DESTINATION_PATH/keybindings.json" ]; then
    mv "$DESTINATION_PATH/keybindings.json" "$DESTINATION_PATH/keybindings.json.$(date +%s).bak"
fi

if [ -L "$DESTINATION_PATH/settings.json" ]; then
    mv "$DESTINATION_PATH/settings.json" "$DESTINATION_PATH/settings.json.$(date +%s).bak"
fi

# symlink settings
echo "Code: Symlinking Settings"

ln -s "$SOURCE_PATH/snippets" "$DESTINATION_PATH/snippets"
ln -s "$SOURCE_PATH/keybindings.json" "$DESTINATION_PATH/keybindings.json"
ln -s "$SOURCE_PATH/settings.json" "$DESTINATION_PATH/settings.json"

echo "Code: Done"
