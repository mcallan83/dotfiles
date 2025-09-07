#!/bin/bash
set -e

# === Settings ===
REPO_URL="https://gitflic.ru/project/magnolia1234/bpc_uploads/blob/raw?file=bypass-paywalls-chrome-clean-master.zip"
TARGET_DIR="$DOTFILES/chrome/bypass-paywalls-clean"
EXT_DIR="$TARGET_DIR/unpacked"

# === Download ===
echo "Downloading repository from GitFlic..."
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

curl -L --fail -o bypass-paywalls.zip "$REPO_URL"

# Check if we really got a zip file
FILETYPE=$(file --mime-type -b bypass-paywalls.zip)
if [[ "$FILETYPE" != "application/zip" ]]; then
  echo "❌ Downloaded file is not a valid ZIP (got $FILETYPE)."
  echo "Check the URL or try downloading manually in a browser."
  exit 1
fi

# === Unzip ===
echo "Unzipping..."
rm -rf "$EXT_DIR"
mkdir -p "$EXT_DIR"
unzip -q bypass-paywalls.zip -d temp-unzip

# Move contents of the extracted folder into "unpacked"
mv temp-unzip/*/* "$EXT_DIR"
rm -rf temp-unzip bypass-paywalls.zip

echo "✅ Extension unpacked to: $EXT_DIR"

cat <<EOF

Now complete these steps in Chrome:
1. Open: chrome://extensions
2. Enable "Developer mode".
3. Click "Load unpacked".
4. Select the folder:
   $EXT_DIR

EOF
