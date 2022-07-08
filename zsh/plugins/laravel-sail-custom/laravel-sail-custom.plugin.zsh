function sail() {
    BASE_PATH="$(git rev-parse --show-toplevel)" 2> /dev/null || BASE_PATH="."
    ${BASE_PATH}/vendor/bin/sail $@
}

alias sart="sail artisan"
alias sb="sail bin"
alias sc="sail composer"
alias sci="sail composer install"
alias scr="sail composer require"
alias scu="sail composer update"
alias sd="sail down"
alias smfs="sail artisan migrate:fresh --seed"
alias spe="sail bin pest"
alias spea="sail bin pest --group=a"
alias sre="sail down --timeout 1 && sail up -d"
alias sti="sail tinker"
alias sub="sail up -d --build"
alias sup="sail up -d"
alias sy="sail yarn"
alias syb="sail yarn build"
alias syd="sail yarn dev"
alias syi="sail yarn install"
alias syu="sail yarn upgrade"
