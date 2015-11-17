# clean out preloaded path on OSX
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# rvm
if [ -d $HOME/.rvm/bin ] ; then
    PATH="$HOME/.rvm/bin:$PATH"
fi

# personal bin folder
if [ -d "$HOME/.bin" ] ; then
    PATH="$PATH:$HOME/.bin"
fi

# homebrew php
if [ -d "/usr/local/opt/php56/bin" ] ; then
    PATH="$PATH:/usr/local/opt/php56/bin"
fi

# composer
if [ -d "$HOME/.composer/vendor/bin" ] ; then
    PATH="$PATH:$HOME/.composer/vendor/bin"
fi

# remove duplicates
typeset -U PATH

export PATH
