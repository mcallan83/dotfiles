# clean out preloaded path on OSX
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

# rvm
if [ -d $HOME/.rvm/bin ] ; then
    PATH="$HOME/.rvm/bin:$PATH"
fi

# personal bin folder
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi

# homebrew php
if [ -d "/usr/local/opt/php56/bin" ] ; then
    PATH="/usr/local/opt/php56/bin:$PATH"
fi

PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# composer
if [ -d "$HOME/.composer/vendor/bin" ] ; then
    PATH="$PATH:$HOME/.composer/vendor/bin"
fi

export PATH

# remove duplicates in path
typeset -U PATH
