DISABLE_AUTO_UPDATE=true

export DOTFILES="${DOTFILES:-$HOME/.dotfiles}"
export ZSH="$DOTFILES/vendor/zsh/oh-my-zsh"

ZSH_CUSTOM=$DOTFILES/zsh/env/default/custom

typeset -U path

source "$DOTFILES/zsh/common/exports.zsh"

# homebrew
if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"

if [[ -d "$PNPM_HOME/bin" ]]; then
    path=("$PNPM_HOME/bin" $path)
fi

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
    macos-custom
    node-custom
    php-homebrew-custom
    sublime
    vi-mode
    z
    fzf-custom
    zsh-syntax-highlighting
)

if [[ -f "$ZSH/oh-my-zsh.sh" ]]; then
    source "$ZSH/oh-my-zsh.sh"
fi

# mise
if command -v mise >/dev/null 2>&1; then
    eval "$(mise activate zsh)"
fi

for file in $DOTFILES/zsh/env/default/includes/*.zsh; do
    test -e "$file" && source "$file"
done

# ignored autocomplete patterns
zstyle ':completion:*:*:git*:*' ignored-patterns '*ORIG_HEAD'
