# laravel sail
# https://laravel.com/docs/8.x/sail

function sail() {
    BASE_PATH="$(git rev-parse --show-toplevel)" 2> /dev/null || BASE_PATH="."
    ${BASE_PATH}/vendor/bin/sail $@
}

alias sart="sail artisan"
alias sc="sail composer"
alias scu="sail composer update"
alias sd="sail down"
alias shh="sail shell"
alias smfs="sail artisan migrate:fresh --seed"
alias sti="sail tinker"
alias sub="sail up -d --build"
alias sup="sail up -d"
alias sy="sail yarn"
alias syw="sail yarn watch"
