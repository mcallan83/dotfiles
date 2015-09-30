#!/bin/sh

echo "Karabiner: Installing"

SUPPORT="$HOME/Library/Application Support/Karabiner"
CLI="/Applications/Karabiner.app/Contents/Library/bin/karabiner"

# copy private.xml to application support
mkdir -p "$SUPPORT"
cp private.xml "$SUPPORT/private.xml"

# initialize settings

$CLI reloadxml
$CLI set remap.fnletter_to_ctrlletter2 1
$CLI set remap.com_jasonrudolph_simultaneouskeypresses_vimode_sd 1
$CLI set private.double_lshift_to_caps 1
$CLI set private.f19_escape_or_control 1

echo "Karabiner: Done"
