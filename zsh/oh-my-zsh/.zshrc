export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""
ZSH_CUSTOM=$HOME/.dotfiles/zsh/oh-my-zsh/custom

plugins=(
    brew
    composer
    git
    k
    laravel5
    pure
    sublime
    tmux
    sudo
    web-search
    z
    zshmarks
    zsh-syntax-highlighting
)

if [ -d $HOME/.rvm/bin ] ; then
    PATH="$HOME/.rvm/bin"
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

if [ -d "$HOME/.composer/vendor/bin" ] ; then
    PATH="$PATH:$HOME/.composer/vendor/bin"
fi

export PATH

# pure theme 
#fpath=( "$HOME/.dotfiles/zsh/pure/" $fpath )
#autoload -U promptinit && promptinit

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
alias tmuxconf="vim ~/.tmux.conf"
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

# http://askubuntu.com/questions/27314/script-to-display-all-terminal-colors
function colortest
{
  for x in 0 1 4 5 7 8; do for i in `seq 30 37`; do for a in `seq 40 47`; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo "";

}

# remove duplicates in path
typeset -U PATH

# load local zshrc
[[ -r ~/.local.zshrc ]] && . ~/.local.zshrc
