if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh --no-cmd)"

    z() {
        __zoxide_zi "$@"
    }

    zi() {
        __zoxide_z "$@"
    }
fi
