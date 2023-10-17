# switch php version
function phpv {
    brew list --formula | grep php | xargs -L1 brew unlink
    brew link --force --overwrite "php@$1"
}

# ag search in vendor folder
function vag {
    ag $1 vendor
}

# ag search in vendor/laravel folder
function lag {
    ag $1 vendor/laravel
}
