# clean out preloaded path on OSX
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# remove duplicates
typeset -U PATH

# php
if [ -d "/usr/local/opt/php@$DOTFILES_PHP_VERSION" ] ; then
    PATH="/usr/local/opt/php@$DOTFILES_PHP_VERSION/bin:/usr/local/opt/php@$DOTFILES_PHP_VERSION/sbin:$PATH"
fi

# dotfiles bin folder
if [ -d "$DOTFILES/zsh/oh-my-zsh/bin" ] ; then
    PATH="$PATH:$DOTFILES/zsh/oh-my-zsh/bin"
fi

# composer
if [ -d "$HOME/.composer/vendor/bin" ] ; then
    PATH="$PATH:$HOME/.composer/vendor/bin"
fi

# rvm - complains if not first
if [ -d $HOME/.rvm/bin ] ; then
    PATH="$HOME/.rvm/bin:$PATH"
fi

export PATH
