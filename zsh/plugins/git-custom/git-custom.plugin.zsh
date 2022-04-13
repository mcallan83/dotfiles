alias gj="git checkout -"
alias gsub="git submodule update --recursive --remote"
alias gt="cd \$(git rev-parse --show-toplevel)"

alias ghb="gh repo view --web"
alias ghi="gh issue list --search \"sort:created-desc\""
alias ghim="gh issue list --assignee \"@me\""
alias ghpr="gh pr create"

# init a git repo
function gitinit {
    touch readme.md
    git init
    git add --all
    git commit -m 'Initial commit'
}
