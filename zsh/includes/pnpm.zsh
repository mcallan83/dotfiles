export PNPM_HOME="$HOME/Library/pnpm"

if [[ -d "$PNPM_HOME/bin" ]]; then
    path=("$PNPM_HOME/bin" $path)
fi
