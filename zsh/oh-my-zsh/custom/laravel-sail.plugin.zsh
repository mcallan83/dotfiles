# laravel sail
# https://laravel.com/docs/8.x/sail
function sail() {
    "$(git rev-parse --show-toplevel)"/vendor/bin/sail $@
}

alias saa="sail artisan"
alias sab="sail build --no-cache"
alias sac="sail composer"
alias sad="sail down"
alias sam="sail artisan migrate:fresh --seed"
alias san="sail npm"
alias sanx="sail npx"
alias sapw="sail artisan migrate:fresh --env=testing && \
    sail php vendor/bin/phpunit-watcher watch"
alias sat="sail tinker"
alias sau="sail up -d"
alias say="sail yarn"
