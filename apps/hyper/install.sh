#!/usr/bin/env bash

DESTINATION_PATH="$HOME"

# backup existing config
if [ -f "$DESTINATION_PATH/.hyper.js" ]; then
    echo "Hyper: Backing Up Config"
    mv "$DESTINATION_PATH/.hyper.js" "$DESTINATION_PATH/.hyper.js.$(date +%F-%T).bak"
fi

# symlink settings
echo "Hyper: Symlinking Settings"
ln -s "$DOTFILES/apps/hyper/hyper.js" "$DESTINATION_PATH/.hyper.js"
