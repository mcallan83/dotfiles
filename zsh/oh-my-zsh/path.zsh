# clean out preloaded path on OSX
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# remove duplicates
typeset -U PATH

# dotfiles bin folder
if [ -d "$DOTFILES/zsh/oh-my-zsh/bin" ] ; then
    PATH="$PATH:$DOTFILES/zsh/oh-my-zsh/bin"
fi

# rvm - complains if not first
if [ -d $HOME/.rvm/bin ] ; then
    PATH="$HOME/.rvm/bin:$PATH"
fi

export PATH
