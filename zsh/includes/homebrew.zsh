export HOMEBREW_BUNDLE_DUMP_NO_NPM=1
export HOMEBREW_BUNDLE_DUMP_NO_VSCODE=1
export HOMEBREW_BUNDLE_NO_DESCRIBE=1
export HOMEBREW_NO_ENV_HINTS=1

if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

_brewfile_bundle() {
    local action="$1"
    local brewfiles_dir="$ZSH_ENV_DIR/../macos/homebrew"
    local selected_brewfile=''
    local -a brewfiles

    brewfiles=("$brewfiles_dir"/*Brewfile*(N.))
    if (( ${#brewfiles[@]} == 0 )); then
        print -u2 "No Brewfiles found in $brewfiles_dir"
        return 1
    fi

    selected_brewfile=$(gum choose --header "Select a Brewfile to ${action}:" "${brewfiles[@]:t}") || return $?
    selected_brewfile="$brewfiles_dir/$selected_brewfile"

    [[ -n "$selected_brewfile" ]] || return 0
    gum confirm "Run brew bundle ${action} for ${selected_brewfile:t}?" || return 0

    if [[ "$action" == dump ]]; then
        brew bundle dump --force --file="$selected_brewfile"
    else
        brew bundle install --file="$selected_brewfile"
    fi
}

# force update the selected brewfile
bbd() {
    _brewfile_bundle dump
}

# install from the selected brewfile
bbi() {
    _brewfile_bundle install
}
