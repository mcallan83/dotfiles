################################################################################
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# MacOS functions for ZSH.
################################################################################

# export list of installed vscode extentions to config folder for syncing
function codebak {
    code --list-extensions --show-versions > "$DOTFILES/osx/code/config/extensions.txt"
}

# recursively remove .DS_Store files
function dsclean {
    find "${@:-.}" -type f -name .DS_Store -delete
}

# export git repo as zip file to desktop
function gitzip {
    TIMESTAMP=$(date +%s)
    BRANCH="master"
    vared -p "Branch [master]:" -c $BRANCH
    OUTPUT="$HOME/Desktop/$TIMESTAMP-archive.zip"
    git archive --format zip --output $OUTPUT $BRANCH
}

# switch php version
function phpv {
    brew list | grep php | xargs -L1 brew unlink
    brew link --force --overwrite "php@$1"
}

# open man pages in preview.app
function pman {
    man -t "${1}" | open -f -a /Applications/Preview.app/
}

# exclude `node_modules` and `vendor` folders from time machine
function tmexcludevendors {
    find `pwd` -maxdepth 3 -type d -name 'node_modules' | xargs -n 1 tmutil addexclusion
    find `pwd` -maxdepth 3 -type d -name 'vendor' | xargs -n 1 tmutil addexclusion
}

# list excluded time machine files
function tmlistexcluded {
    sudo mdfind "com_apple_backup_excludeItem = 'com.apple.backupd'"
}

# open google chrome with bypass paywalls extension loaded
function chromebypass {
    osascript -e 'tell application "Google Chrome" to quit'
    sleep 1s
    open -a '/Applications/Google Chrome.app' --args --load-extension=/$DOTFILES/vendor/chrome/bypass-paywalls
}
