alias gj="git checkout -"
alias gsub="git submodule update --recursive --remote"
alias gt="cd \$(git rev-parse --show-toplevel)"

alias ghb="gh repo view --web"
alias ghi="gh issue list --search \"sort:created-desc\""
alias ghis="gh issue status"
alias ghiv="gh issue view"
alias ghpr="gh pr create"

git-rename-diff() {
  git diff -M -z --name-status --diff-filter=R HEAD | \
  while IFS= read -r -d '' _ && IFS= read -r -d '' old && IFS= read -r -d '' new; do
    git --no-pager diff --no-index --color-words=. --unified=0 \
      <(echo "$old") <(echo "$new") | tail -n +5 | tr -d '\n'
    echo
  done
}
