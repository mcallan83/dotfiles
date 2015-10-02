#!/bin/sh

CONFIG="$HOME/Library/Application Support/Karabiner"
CLI="/Applications/Karabiner.app/Contents/Library/bin/karabiner"

# create config directory
mkdir -p "$CONFIG"

# backup existing private.xml
if [ -f "$CONFIG/private.xml" ]; then
    echo "Karabiner: Backing up private.xml"
    mv "$CONFIG/private.xml" "$CONFIG/private.xml.$(date +%F-%T).bak"
fi

# copy current private.xml to config directory
cp private.xml "$CONFIG/private.xml"

# initialize settings
echo "Karabiner: Initializing Settings"

$CLI reloadxml
$CLI set remap.fnletter_to_ctrlletter2 1
$CLI set remap.com_jasonrudolph_simultaneouskeypresses_vimode_sd 1
$CLI set private.double_lshift_to_caps 1
$CLI set private.f19_escape_or_control 1

echo "Karabiner: Done"
