export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""
ZSH_CUSTOM=$HOME/.dotfiles/zsh/oh-my-zsh/custom

plugins=(
    brew
    composer
    git
    k
    sublime
    sudo
    web-search
    zshmarks
    zsh-syntax-highlighting
)

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# hack to get pure theme working properly
fpath=( "$HOME/.dotfiles/zsh/pure/" $fpath )
autoload -U promptinit && promptinit

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR='vim'
export ARCHFLAGS="-arch x86_64"
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

###########
# Aliases #
###########

#web-search 
alias amazon='web_search duckduckgo \!az'

# edit configs
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias hammer="vim ~/.hammerspoon/init.lua"

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

# k
alias ka="k -a"

# mkdir and cd to it in one command
function mkcd
{
    dir="$*";
    mkdir -p "$dir" && cd "$dir";
}


[[ -r ~/.local.zshrc ]] && . ~/.local.zshrc
