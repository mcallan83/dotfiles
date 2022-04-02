################################################################################
# Author: Mike Callan
# URL: http://github.com/mcallan83/dotfiles
#
# MacOS functions for ZSH.
################################################################################

# recursively remove .DS_Store files
function dsclean {
    find "${@:-.}" -type f -name .DS_Store -delete
}

# open man pages in preview.app
function pman {
    man -t "${1}" | open -f -a /System/Applications/Preview.app/
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
