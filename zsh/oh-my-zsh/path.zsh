# clean out preloaded path on OSX
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    echo $PATH
    eval `/usr/libexec/path_helper -s`
fi

if [ -d $HOME/.rvm/bin ] ; then
    PATH="$HOME/.rvm/bin"
fi

if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

if [ -d "$HOME/.composer/vendor/bin" ] ; then
    PATH="$PATH:$HOME/.composer/vendor/bin"
fi

export PATH
