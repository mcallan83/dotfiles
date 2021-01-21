################################################################################
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Load NVM and automatically change Node versions when changing into a diretory
# that contains an .nvmrc file.
################################################################################
#
if [ -s "$NVM_DIR/nvm.sh" ]; then

  source "$NVM_DIR/nvm.sh"

  # automatically change node versions when .nvmrc found
  autoload -U add-zsh-hook
  load-nvmrc() {
    local node_version="$(nvm version)"
    local nvmrc_path="$(nvm_find_nvmrc)"

    if [ -n "$nvmrc_path" ]; then
      local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

      if [ "$nvmrc_node_version" = "N/A" ]; then
        nvm install
      elif [ "$nvmrc_node_version" != "$node_version" ]; then
        nvm use
      fi
    elif [ "$node_version" != "$(nvm version default)" ]; then
      echo "Reverting to default NVM version"
      nvm use default
    fi
  }
  add-zsh-hook chpwd load-nvmrc
  load-nvmrc
fi
