#!/bin/zsh

set -e

ZIP_FILE_URL="https://gitflic.ru/project/magnolia1234/bpc_uploads/blob/raw?file=bypass-paywalls-chrome-clean-master.zip"

BASE_DIR="${0:A:h}"
UNPACKED_DIR="$BASE_DIR/unpacked"
BACKUP_DIR="$BASE_DIR/unpacked.$(date +%F_%T).bak"
TEMP_DIR="$(mktemp -d "/tmp/bypass-paywalls.XXXXXX")"
NEW_UNPACKED_DIR="$TEMP_DIR/bypass-paywalls-chrome-clean-master"
ARCHIVE="$TEMP_DIR/bypass-paywalls.zip"
FIRST_INSTALL=false

curl -L --fail -o "$ARCHIVE" "$ZIP_FILE_URL"
unzip -q "$ARCHIVE" -d "$TEMP_DIR"

if [[ -e "$UNPACKED_DIR" ]]; then
	mv "$UNPACKED_DIR" "$BACKUP_DIR"
else
	FIRST_INSTALL=true
fi

if ! mv "$NEW_UNPACKED_DIR" "$UNPACKED_DIR"; then
	rm -rf "$UNPACKED_DIR"
	if [[ -e "$BACKUP_DIR" ]]; then
		mv "$BACKUP_DIR" "$UNPACKED_DIR"
	fi
	print -u2 'Could not install the new version; restored the previous installation if present'
	exit 1
fi

if [[ -e "$BACKUP_DIR" ]]; then
	rm -rf "$BACKUP_DIR"
fi

print 'Add the extension to Chrome manually using "Load unpacked".'
print "Install directory: $UNPACKED_DIR"

if [[ "$FIRST_INSTALL" == true ]]; then
	open "$BASE_DIR"
fi
