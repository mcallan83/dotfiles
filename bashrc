#Paths
export PATH=~/bin:/usr/local/bin:$PATH

#Make VIM default editor
export EDITOR="vim"

#Enable color in bash prompt
export CLICOLOR=1

#Enable vi bindings in bash
set -o vi

#Enable SSH autocomplete
complete -W "$(echo $(grep '^ssh ' .bash_history | sort -u | sed 's/^ssh //'))" ssh

# Directory bookmarking
if [ ! -f ~/.dirs ]; then
    touch ~/.dirs
else
    source ~/.dirs
fi
alias L='cat ~/.dirs'
G () { cd ${1:-$(pwd)} ; }
S () {
    sed "/$@/d" ~/.dirs > ~/.dirs1;
    \mv ~/.dirs1 ~/.dirs;
    echo "$@"=\"`pwd`\" >> ~/.dirs;
    source ~/.dirs ;
}
R () {
    sed "/$@/d" ~/.dirs > ~/.dirs1;
    \mv ~/.dirs1 ~/.dirs;
}
alias U='source ~/.dirs'
shopt -s cdable_vars
