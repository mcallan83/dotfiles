PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

//open file in quicklook
alias ql='qlmanage -p 2>/dev/null'

//bashmarks
source ~/.dotfiles/bin/bashmarks/bashmarks.sh
