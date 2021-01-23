if [ -x "$(command -v starship)" ]
then
    eval "$(starship init zsh)"
else
    fpath+=$DOTFILES/vendor/zsh/pure
    autoload -U promptinit; promptinit
    prompt pure
    zstyle :prompt:pure:git:branch color yellow
    zstyle :prompt:pure:git:dirty color 196
    zstyle :prompt:pure:prompt:error color 196
fi
