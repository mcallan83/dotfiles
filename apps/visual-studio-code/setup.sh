#!/usr/bin/env bash

DESTINATION_PATH="$HOME/Library/Application Support/Code/User"

# create directories
mkdir -p "$DESTINATION_PATH"

# backup existing settings
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

ln -s "$DOTFILES/apps/visual-studio-code/config/snippets" "$DESTINATION_PATH/snippets"
ln -s "$DOTFILES/apps/visual-studio-code/config/keybindings.json" "$DESTINATION_PATH/keybindings.json"
ln -s "$DOTFILES/apps/visual-studio-code/config/settings.json" "$DESTINATION_PATH/settings.json"

# install extensions
echo "Code: Installing Extensions"

cat "$DOTFILES/apps/visual-studio-code/config/extensions.txt" | while read line
do
    code --install-extension $line
done

echo "Code: Done"
