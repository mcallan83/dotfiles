################################################################################
# Filename: zsh/oh-my-zsh/platform.zsh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# Determines current platform.
################################################################################

PLATFORM=''
if [[ $(uname) == 'Linux' ]]; then
    export PLATFORM='LINUX'
elif [[ $(uname) == 'Darwin' ]]; then
    export PLATFORM='OSX'
fi
