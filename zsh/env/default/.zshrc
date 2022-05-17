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
    vagrant-custom
    vi-mode
    z
    zsh-syntax-highlighting
    fzf-custom
)

if [[ $(uname -s) == 'Darwin' ]]; then
    plugins+=(
        ansible-homebrew-custom
        php-homebrew-custom
        macos-custom
    )
    PATH="$DOTFILES/macos/bin:/usr/local/sbin:$PATH"
fi

source $ZSH/oh-my-zsh.sh

setopt complete_aliases

for file in $DOTFILES/zsh/env/default/includes/*.zsh; do
    test -e "$file" && source "$file"
done
