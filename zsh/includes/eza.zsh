
if command -v eza >/dev/null 2>&1; then
	alias la='eza -a --icons=auto --group-directories-first'
	alias ll='eza -lah --icons=auto --group-directories-first --git'
	alias ls='eza --icons=auto --group-directories-first'
	alias lt='eza --tree --icons=auto'
    alias lt2='eza --tree --level=2 --icons=auto'
    alias lt3='eza --tree --level=3 --icons=auto'
    alias lt4='eza --tree --level=4 --icons=auto'
fi
