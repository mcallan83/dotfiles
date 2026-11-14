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
    local answer

    brewfiles=("$brewfiles_dir"/*Brewfile*(N.))
    if (( ${#brewfiles[@]} == 0 )); then
        print -u2 "No Brewfiles found in $brewfiles_dir"
        return 1
    fi

    if [[ "$action" == dump ]] && (( ${#brewfiles[@]} == 1 )); then
        selected_brewfile="${brewfiles[1]}"
    else
        local PS3="Select a Brewfile to ${action}: "
        select selected_brewfile in "${brewfiles[@]:t}"; do
            [[ -n "$selected_brewfile" ]] && break
        done
        [[ -n "$selected_brewfile" ]] || return 0
        selected_brewfile="$brewfiles_dir/$selected_brewfile"
    fi

    if ! read -r "answer?Run brew bundle ${action} for ${selected_brewfile:t}? [y/N] " ||
        [[ "${answer:l}" != y && "${answer:l}" != yes ]]; then
        return 0
    fi

    if [[ "$action" == dump ]]; then
        brew bundle dump --force --file="$selected_brewfile" || return $?
        local exclusions="$brewfiles_dir/dump-excludes"
        if [[ -f "$exclusions" ]]; then
            local filtered
            filtered=$(mktemp "${selected_brewfile}.XXXXXX") || return $?
            # Match the entry type and quoted name, ignoring trailing options.
            if awk '
                FILENAME == ARGV[1] {
                    if (match($0, /^[[:space:]]*[[:alpha:]_]+[[:space:]]+"[^"]+"/)) {
                        key = substr($0, RSTART, RLENGTH)
                        gsub(/^[[:space:]]+/, "", key)
                        gsub(/[[:space:]]+"/, "\"", key)
                        excluded[key] = 1
                    }
                    next
                }
                {
                    key = ""
                    if (match($0, /^[[:space:]]*[[:alpha:]_]+[[:space:]]+"[^"]+"/)) {
                        key = substr($0, RSTART, RLENGTH)
                        gsub(/^[[:space:]]+/, "", key)
                        gsub(/[[:space:]]+"/, "\"", key)
                    }
                    if (!(key in excluded)) print
                }
            ' "$exclusions" "$selected_brewfile" > "$filtered"; then
                cat "$filtered" > "$selected_brewfile"
                local result=$?
                command rm -f "$filtered"
                return "$result"
            else
                command rm -f "$filtered"
                return 1
            fi
        fi
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
