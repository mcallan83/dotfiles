# clean out preloaded path on OSX
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# remove duplicates
typeset -U PATH

# php 7.1
if [ -d "/usr/local/opt/php@7.1" ] ; then
    PATH="/usr/local/opt/php@7.1/bin:/usr/local/opt/php@7.1/sbin:$PATH"
fi

# rvm
if [ -d $HOME/.rvm/bin ] ; then
    PATH="$HOME/.rvm/bin:$PATH"
fi

# dotfiles bin folder
if [ -d "$DOTFILES/zsh/oh-my-zsh/bin" ] ; then
    PATH="$PATH:$DOTFILES/zsh/oh-my-zsh/bin"
fi

# personal bin folder
if [ -d "$HOME/.bin" ] ; then
    PATH="$PATH:$HOME/.bin"
fi

# composer
if [ -d "$HOME/.composer/vendor/bin" ] ; then
    PATH="$PATH:$HOME/.composer/vendor/bin"
fi

# yarn
if test $(which yarn); then
    PATH="$PATH:$(yarn global bin)"
fi

export PATH
