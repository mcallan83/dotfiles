#!/bin/bash
set -e

REPO_URL="https://gitflic.ru/project/magnolia1234/bpc_uploads/blob/raw?file=bypass-paywalls-chrome-clean-master.zip"
TARGET_DIR="$DOTFILES/chrome/bypass-paywalls-clean"
EXT_DIR="$TARGET_DIR/unpacked"

mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

curl -L --fail -o bypass-paywalls.zip "$REPO_URL"

rm -rf "$EXT_DIR"
mkdir -p "$EXT_DIR"
unzip -q bypass-paywalls.zip -d temp-unzip

mv temp-unzip/*/* "$EXT_DIR"
rm -rf temp-unzip bypass-paywalls.zip
