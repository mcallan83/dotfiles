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
