DISABLE_AUTO_UPDATE=true
ZSH_CUSTOM=$DOTFILES/zsh/env/default/custom

plugins=(
    brew
    composer-custom
    diff-so-fancy-custom
    docker-custom
    extract
    git
    git-custom
    laravel-sail-custom
    laravel5
    node-custom
    nvm-custom
    sublime
    vi-mode
    z
    zsh-syntax-highlighting
    fzf-custom
    ansible-homebrew-custom
    php-homebrew-custom
    macos-custom
)

source $ZSH/oh-my-zsh.sh

for file in $DOTFILES/zsh/env/default/includes/*.zsh; do
    test -e "$file" && source "$file"
done
