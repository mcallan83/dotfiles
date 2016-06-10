################################################################################
# Filename: zsh/oh-my-zsh/local.zsh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Source ".zshrc.local" if it exists when the current working directory
# changes.
################################################################################

function source_zshrc_local() {
    ZSHRC_LOCAL="$PWD/.zshrc.local"
    if [ -f $ZSHRC_LOCAL ]; then source $ZSHRC_LOCAL; fi
}

function chpwd() { source_zshrc_local; }
