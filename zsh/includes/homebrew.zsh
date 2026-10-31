if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# force update brew file
alias bbd='brew bundle dump --force --file="$ZSH_ENV_DIR/../macos/Brewfile"'
