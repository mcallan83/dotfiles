# switch php version
function phpv {
    brew list --formula | grep php | xargs -L1 brew unlink
    brew link --force --overwrite "php@$1"
}