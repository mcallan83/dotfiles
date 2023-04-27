DISABLE_AUTO_UPDATE=true
ZSH_CUSTOM=$DOTFILES/zsh/env/default/custom

plugins=(
    ansible-homebrew-custom
    barrier-custom
    brew
    composer-custom
    diff-so-fancy-custom
    docker-custom
    extract
    git
    git-custom
    laravel-sail-custom
    laravel5
    macos-custom
    node-custom
    nvm-custom
    php-homebrew-custom
    sublime
    vi-mode
    z
    zsh-syntax-highlighting
    fzf-custom
)

source $ZSH/oh-my-zsh.sh

for file in $DOTFILES/zsh/env/default/includes/*.zsh; do
    test -e "$file" && source "$file"
done
