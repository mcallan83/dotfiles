export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""
ZSH_CUSTOM=$HOME/.dotfiles/zsh/oh-my-zsh/custom

plugins=(git brew sudo k sublime composer zshmarks web-search zsh-syntax-highlighting)

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# hack to get pure theme working properly
fpath=( "$HOME/.dotfiles/zsh/pure/" $fpath )
autoload -U promptinit && promptinit
prompt pure

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
