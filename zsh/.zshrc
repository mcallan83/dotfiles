ZSH_ENV_DIR="${${(%):-%x}:A:h}"
INCLUDES_DIR="$ZSH_ENV_DIR/includes"
DOTFILES_DIR="${ZSH_ENV_DIR:h}"

typeset -U path

shell_includes=(
    homebrew
    pnpm
    mise
    composer
    oh-my-zsh
    orbstack
    docker
    eza
    fzf
    git
    laravel-sail
    macos
    nmap
    npx
    vscode
    yt-dlp
    zoxide
    aliases
    functions
    starship
)

for include in "${shell_includes[@]}"; do
    source "$INCLUDES_DIR/${include}.zsh"
done

# additional paths
path+=("$HOME/.local/bin")

# ignored autocomplete patterns
zstyle ':completion:*:*:git*:*' ignored-patterns '*ORIG_HEAD'

# machine-specific overrides
if [[ -f "$HOME/.zshrc.local" ]]; then
    source "$HOME/.zshrc.local"
fi

# zsh syntax highlighting
if [[ -f "$DOTFILES_DIR/vendor/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$DOTFILES_DIR/vendor/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
