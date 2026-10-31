#!/bin/bash
set -e

ZIP_FILE_URL="https://gitflic.ru/project/magnolia1234/bpc_uploads/blob/raw?file=bypass-paywalls-chrome-clean-master.zip"
TARGET_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
UNPACKED_DIR="$TARGET_DIR/unpacked"
BACKUP_DIR="$TARGET_DIR/unpacked.bak"
ARCHIVE="$TARGET_DIR/bypass-paywalls.zip"

curl -L --fail -o "$ARCHIVE" "$ZIP_FILE_URL"

if [[ -e "$BACKUP_DIR" ]]; then
	echo "Backup already exists: $BACKUP_DIR" >&2
	exit 1
fi

if [[ -e "$UNPACKED_DIR" ]]; then
	mv "$UNPACKED_DIR" "$BACKUP_DIR"
fi
mkdir -p "$UNPACKED_DIR"
if unzip -q "$ARCHIVE" -d "$UNPACKED_DIR"; then
	rm -rf "$BACKUP_DIR"
	rm -f "$ARCHIVE"
else
	rm -rf "$UNPACKED_DIR"
	if [[ -e "$BACKUP_DIR" ]]; then
		mv "$BACKUP_DIR" "$UNPACKED_DIR"
	fi
	rm -f "$ARCHIVE"
	echo "Could not extract downloaded archive; restored previous installation if present" >&2
	exit 1
fi
