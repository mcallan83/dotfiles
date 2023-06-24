# turn off the AWDL interface
alias awdl-off="sudo ifconfig awdl0 down"

# turn off the AWDL interface
alias awdl-on="sudo ifconfig awdl0 up"

# airport wifi utility
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"

# copy to clipboard
alias -g C='| pbcopy'

# speed up osx terminal by removing log files
alias cleanlog="sudo rm -rf /private/var/log/asl/*.asl"

# open in finder
alias ff="open ."

# flush dns
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;sleep 2"

# hide hidden files
alias hide="defaults write com.apple.finder AppleShowAllFiles NO && killAll Finder"

# clean up launch services to remove duplicates in the “open with” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister \
    -kill -r -domain local -domain system -domain user && killall Finder"

# show hidden files
alias show="defaults write com.apple.finder AppleShowAllFiles YES && killAll Finder"

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
    find `pwd` -maxdepth 5 -type d -name 'node_modules' | xargs -n 1 tmutil addexclusion
    find `pwd` -maxdepth 5 -type d -name 'vendor' | xargs -n 1 tmutil addexclusion
}

# list excluded time machine files
function tmlistexcluded {
    sudo mdfind "com_apple_backup_excludeItem = 'com.apple.backupd'"
}
