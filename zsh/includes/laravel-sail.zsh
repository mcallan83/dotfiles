# run laravel sail anywhere in repo
function sail() {
    local base_path sail_script
    base_path="$(git rev-parse --show-toplevel 2> /dev/null)" || base_path="."
    sail_script="${base_path}/vendor/bin/sail"

    if [[ ! -e "$sail_script" ]]; then
        print -u2 "Laravel Sail was not found."
        return 127
    fi

    "$sail_script" "$@"
}
