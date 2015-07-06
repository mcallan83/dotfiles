export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pure"
ZSH_CUSTOM=$HOME/.dotfiles/zsh/oh-my-zsh/custom

plugins=(git brew sudo k sublime zshmarks web-search composer zsh-syntax-highlighting)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR='vim'
export ARCHFLAGS="-arch x86_64"
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

###########
# Aliases #
###########

# zsh
alias zshrc="vim ~/.zshrc"

# zshmarks
alias g="jump"
alias s="bookmark"
alias d="deletemark"
alias l="showmarks"

# sublime
alias ss="stt"

# git
alias gs="gst"

# composer
alias cdu="composer dump-autoload"
