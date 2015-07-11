export ZSH=$HOME/.oh-my-zsh

DOTFILES=$HOME/.dotfiles
ZSH_THEME=""
ZSH_CUSTOM=$DOTFILES/zsh/oh-my-zsh/custom

plugins=(
    brew
    composer
    extract
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

source $DOTFILES/zsh/oh-my-zsh/path.zsh
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR='vim'
export ARCHFLAGS="-arch x86_64"
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# remove duplicates in path
typeset -U PATH

# load local zshrc
[[ -r ~/.local.zshrc ]] && . ~/.local.zshrc
