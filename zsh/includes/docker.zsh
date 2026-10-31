# switch docker contexts interactively
function dctx() {
	local current_context contexts selected_context

	current_context=$(docker context show) || return
	contexts=$(docker context ls --format '{{.Name}}' | grep -vx 'default') || return

	selected_context=$(
		print -r -- "$contexts" |
			fzf --header="Current context: $current_context" --prompt='Docker context> ' --height=40% --reverse
	) || return

	[[ -n "$selected_context" ]] || return
	docker context use "$selected_context"
}

# run temporary tor browser
alias torb="docker run --platform linux/amd64 --rm -p 5800:5800 domistyle/tor-browser"
