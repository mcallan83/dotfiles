# clean out preloaded path on OSX
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# remove duplicates
typeset -U PATH

# node 10
if [ -d "/usr/local/opt/node@10" ] ; then
    PATH="/usr/local/opt/node@10/bin:$PATH"
fi

# php 7.2
if [ -d "/usr/local/opt/php@7.2" ] ; then
    PATH="/usr/local/opt/php@7.2/bin:/usr/local/opt/php@7.2/sbin:$PATH"
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

# icu4c
if [ -d "/usr/local/opt/icu4c" ] ; then
    PATH="/usr/local/opt/icu4c/bin:$PATH"
fi

# rvm - compains if not first
if [ -d $HOME/.rvm/bin ] ; then
    PATH="$HOME/.rvm/bin:$PATH"
fi

export PATH
