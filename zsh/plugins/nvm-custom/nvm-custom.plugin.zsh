export NVM_DIR="$HOME/.nvm"

default_packages=(
    http-server
    yarn
)

# install if not installed
if [[ ! -d "$NVM_DIR" ]]; then
    banner "Install Node Version Manager"
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    cd -
    printf "%s\n" "${default_packages[@]}" > "$NVM_DIR/default-packages"
    source "$NVM_DIR/nvm.sh"
    nvm install --lts
    nvm use --lts
fi

# load
if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
    source "$NVM_DIR/bash_completion"
    # automatically change node versions when .nvmrc found
    autoload -U add-zsh-hook
    load-nvmrc() {
        local nvmrc_path="$(nvm_find_nvmrc)"
        local node_version="$(nvm version)"
        if [ -n "$nvmrc_path" ]; then
            local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
            if [ "$nvmrc_node_version" = "N/A" ]; then
                 nvm install
            elif [ "$nvmrc_node_version" != "$node_version" ]; then
                 nvm use
            fi
        elif [ "$node_version" != "$(nvm version default)" ]; then
            nvm use default
        fi
    }
    add-zsh-hook chpwd load-nvmrc
    load-nvmrc
fi
