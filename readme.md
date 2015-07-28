<!-- left off at painless tmux page 39 -->

# Mike Callan's Dotfiles

My dotfile setup for ZSH, Vim, Tmux, Sublime, Atom, and more. Optimized for OSX and Ubuntu. Work in progress. Documentation doesn't cover everything; it is mainly a reference for myself :)

There is no magic install script that bootstraps my entire envirnment. Instead, each piece can be manually enabled depending on need.

## ZSH

- [oh my zsh](http://ohmyz.sh/)
- [k is the new l, yo](https://github.com/rimraf/k)
- [z is the new j, yo](https://github.com/rupa/z)
- [https://github.com/zanshin/dotfiles](https://github.com/zanshin/dotfiles)

### Composer

```
c                       composer
cdu                     composer dump-autoload
cgr                     composer global require
cgu                     composer global update
ci                      composer install
cr                      composer require
csu                     composer self-update
cu                      composer update
```

### Git

```
gaa                     git add -all
gb                      git branch
gbr                     git branch --remote
gcm                     git checkout master
gco                     git checkout
gd                      git diff
gf                      git fetch
ggpull                  git pull origin [current_branch]
ggpush                  git push origin [current_branch]
gp                      git pull
gs                      git status
```

### Homebrew

```
brews                   brew list -1
bubc                    brew upgrade && brew cleanup
bubo                    brew update && brew outdated
```

### K

```
k                       list directories with k
ka                      k with hidden files
kd                      k with directories only
```

### Laravel

```
la5                     php artisan
```

### Misc

```
G                       append command with "| grep"
L                       append command with "| less"
als $                   search all defined aliases for $
pman $                  open man pages in preview (osx)
```

### Vagrant

```
vh                      vagrant halt
vs                      vagrant ssh
vu                      vagrant up
```

### Vim

```
viml                    run naked vim without plugin or config
```

### Web Search

Search in browser...

```
amazon $                amazon
bing $                  bing
github $                github
google $                google
image $                 google images
map $                   google maps
news $                  goole news
wiki $                  wikipedia
yahoo $                 yahoo
youtube $               youtube
```

### Z

```
z                       jump to "frecent" directory with z
zc                      z in current directory
```

## Vim

## Tmux

- [Painless Tmux](https://leanpub.com/painless_tmux)
- [A tmux Crash Course](https://robots.thoughtbot.com/a-tmux-crash-course)

```
# install
cd ~ && ln -s .dotfiles/tmux/tmux.conf .tmux.conf
```

### Prefix

```
<ctrl> a                <prefix>
```

### Panes

```
<prefix> -              split pane horizontally
<prefix> |              split pane vertically

<prefix> H              increase pane width by 3 columns
<prefix> J              decrease pane height by 3 rows
<prefix> K              increase pane height by 3 rows
<prefix> L              decrease pane width by 3 columns

<prefix> x              kill pane
<prefix> z              zoom pane
<prefix> q              show pane numbers
<prefix> !              move pane to new window

<prefix> {              swap current pane with previous pane
<prefix> }              swap current pane with next pane

<prefix><ctrl> o        rotate panes
<prefix><space>         rotate though default layouts
```

### Windows

```
<prefix> &              kill window
<prefix> ,              name window
<prefix> 0-9            move to window number
<prefix> c              new window
<prefix> n              next window
<prefix> p              previous window
<prefix> w              choose window from menu
```

## Slate

Now using HammerSpoon.

## HammerSpoon

- [http://www.hammerspoon.org/](http://www.hammerspoon.org/)

```
<cmd><shift> H          Move window to left half of screen
<cmd><shift> L          Move window to right half of screen
<cmd><shift><return>    Maximize window
<cmd><shift> .          Toggle window hints
```
