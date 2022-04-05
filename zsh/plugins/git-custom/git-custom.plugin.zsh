################################################################################
# Git Plugin
#
# Register custom aliases and functions for git and gh.
################################################################################

alias gj="git checkout -"
alias gsub="git submodule update --recursive --remote"
alias gt="cd \$(git rev-parse --show-toplevel)"

alias ghb="gh repo view --web"
alias ghpr="gh pr create"

# init a git repo
function gitinit {
    touch readme.md
    git init
    git add --all
    git commit -m 'Initial commit'
}
