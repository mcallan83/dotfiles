################################################################################
# Filename: zsh/oh-my-zsh/functions-macos.zsh
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# MacOS functions for ZSH.
################################################################################

# export git repo as zip file to desktop
function gitzip {
    TIMESTAMP=$(date +%s)
    BRANCH="master"
    vared -p "Branch [master]:" -c $BRANCH
    OUTPUT="$HOME/Desktop/$TIMESTAMP-archive.zip"
    git archive --format zip --output $OUTPUT $BRANCH
}

# open man pages in preview.app
pman() {
    man -t "${1}" | open -f -a /Applications/Preview.app/
}

# speed up osx terminal by removing log files
termspeed() {
    sudo rm -rf /private/var/log/asl/*.asl
}

# exclude `node_modules` and `vendor` folders from time machine
tm_exclude_vendors() {
    find `pwd` -maxdepth 3 -type d -name 'node_modules' | xargs -n 1 tmutil addexclusion
    find `pwd` -maxdepth 3 -type d -name 'vendor' | xargs -n 1 tmutil addexclusion
}

# list excluded time machine files
tm_list_excluded() {
    sudo mdfind "com_apple_backup_excludeItem = 'com.apple.backupd'"
}
