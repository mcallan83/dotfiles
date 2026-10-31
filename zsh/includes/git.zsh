alias gj="git checkout -"
alias gsub="git submodule update --recursive --remote"
alias ghb="gh repo view --web"

# cd to root of the current git repo
gt() {
	local repo_root
	repo_root=$(git rev-parse --show-toplevel) || return
	cd -- "$repo_root"
}
