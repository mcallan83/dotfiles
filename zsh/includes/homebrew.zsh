export HOMEBREW_BUNDLE_DUMP_NO_NPM=1
export HOMEBREW_BUNDLE_DUMP_NO_VSCODE=1
export HOMEBREW_BUNDLE_NO_DESCRIBE=1
export HOMEBREW_NO_ENV_HINTS=1

if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# force update brew file
alias bbd='brew bundle dump --force --file="$ZSH_ENV_DIR/../macos/Brewfile"'
