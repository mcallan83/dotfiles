DISABLE_AUTO_UPDATE=true

plugins=(
    git
    extract
    vi-mode
)

export ZSH="$DOTFILES_DIR/vendor/zsh/oh-my-zsh"

if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
    source "$ZSH/oh-my-zsh.sh"
fi
