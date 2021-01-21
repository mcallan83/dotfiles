# laravel sail
# https://laravel.com/docs/8.x/sail
function sail() {
    BASE_PATH="$(git rev-parse --show-toplevel)" 2> /dev/null || BASE_PATH="."
    ${BASE_PATH}/vendor/bin/sail $@
}

alias sart="sail artisan"
alias shh="sail shell"
alias sd="sail down"
alias smf="sail artisan migrate:fresh --seed"
alias spw="sail artisan migrate:fresh --env=testing && \
    sail php vendor/bin/phpunit-watcher watch"
alias su="sail up -d"
