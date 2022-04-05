################################################################################
# NVM Plugin
#
# - Set NVM directory
# - Load NVM and completions
# - Watch for .nvmrc and automatically install required version
################################################################################

export NVM_DIR="$HOME/.nvm"

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
