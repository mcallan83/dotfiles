################################################################################
# Filename: zsh/oh-my-zsh/function.zsh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Enable direnv ZSH hooks, if installed.
################################################################################

if type "direnv" > /dev/null; then
    eval "$(direnv hook zsh)"
fi
