if command -v fzf >/dev/null 2>&1; then
    eval "$(fzf --zsh)"

    # checkout local or remote git branch
    # https://github.com/wellle/dotfiles/blob/577d9ee28f772b2f57e44c00a3d392c3238660eb/fzf.zsh#L110
    unalias br 2> /dev/null
    br() {
        git fetch
        local branches branch
        branches=$(git branch --all | grep -v HEAD | grep -v dependabot) &&
        branch=$(echo "$branches" | fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
        git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
    }

    # list and connect to configured ssh servers (bound to ^s)
    # https://gist.github.com/dohq/1dc702cc0b46eb62884515ea52330d60
    function fzf-ssh-widget() {
        local selected_host
        selected_host=$(
            awk '
                /^[[:space:]]*#/ { next }
                tolower($1) == "host" {
                    for (i = 2; i <= NF; i++) {
                        if ($i ~ /^#/) break
                        if ($i !~ /[*?!]/) print $i
                    }
                }
            ' ~/.ssh/config 2>/dev/null |
                sort -u |
                fzf --query "$LBUFFER" \
                    --preview "ssh -G {1} 2>/dev/null | awk '\$1 == \"hostname\" || \$1 == \"user\" || \$1 == \"port\" || \$1 == \"identityfile\" || \$1 == \"proxyjump\" || \$1 == \"proxycommand\" { label = \$1; sub(/^[^[:space:]]+[[:space:]]+/, \"\"); print label \": \" \$0 }'" \
                    --preview-window 'right,45%,wrap'
        )
        if [[ -n "$selected_host" ]]; then
            BUFFER="ssh ${selected_host}"
            zle accept-line
        fi
        zle reset-prompt
    }

    zle -N fzf-ssh-widget
    bindkey '^s' fzf-ssh-widget
fi
