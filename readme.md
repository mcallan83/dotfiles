# Mike Callan's Dotfiles

My dotfile setup for ZSH, Vim, Tmux, Sublime, Atom, and more. Optimized for OSX and Ubuntu. Work in progress. Documentation doesn't cover everything; it is mainly a reference for myself.

## Installation

### OSX

1.) Run the [installer script](osx/install.sh), which installs the following:

    - Homebrew
    - Homebrew Packages
    - Homebrew Casks (GUI Apps, Fonts, Quicklook Plugins)
    - Composer Packages
    - NPM Packages
    - RVM, Ruby, and Gems
    - Python Packages
    - Clones this repo to ~/.dotfiles

`source <(curl -s https://raw.githubusercontent.com/mcallan83/dotfiles/master/osx/install.sh)`

### Ubuntu

## ZSH

- [oh my zsh](http://ohmyz.sh/)
- [k is the new l, yo](https://github.com/rimraf/k)
- [z is the new j, yo](https://github.com/rupa/z)
- [https://github.com/zanshin/dotfiles](https://github.com/zanshin/dotfiles)

##### Composer

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

##### Git

```
gaa                     git add -all
gb                      git branch
gbr                     git branch --remote
gcm                     git checkout master
gco                     git checkout
gd                      git diff
gdw                     git diff --word-diff
gf                      git fetch
ggpull                  git pull origin [current_branch]
ggpush                  git push origin [current_branch]
gp                      git pull
gs                      git status
gss                     git status -s
```

##### Homebrew

```
brewfix                 fix permissions on /usr/local
brews                   brew list -1
bubc                    brew upgrade && brew cleanup
bubo                    brew update && brew outdated
```

##### K

```
k                       list directories with k
ka                      k with hidden files
kd                      k with directories only
```

##### Laravel

```
la5                     php artisan
```

##### Misc

```
G                       append command with "| grep"
L                       append command with "| less"
als $                   search all defined aliases for $
pman $                  open man pages in preview (osx)
```

##### Tmux

```
mux                     tmuxinator
ta $                    tmux attach -t $
tb                      tmux show-buffer
tkss $                  tmux kill-session -t
tksv                    tmux kill-server
tl                      tmux list-sessions
ts $                    tmux new-session -s
```

##### Vagrant

```
vh                      vagrant halt
vr                      vagrant reload
vs                      vagrant ssh
vu                      vagrant up
```

##### Vim

```
v                       vim
vl                      vim without plugins or config
```

##### Web Search

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

##### Z

```
z                       jump to "frecent" directory with z
zc                      z in current directory
```

## Vim

## Tmux

- [Painless Tmux](https://leanpub.com/painless_tmux)
- [A tmux Crash Course](https://robots.thoughtbot.com/a-tmux-crash-course)
- [tmux Copy & Paste on OS X: A Better Future](https://robots.thoughtbot.com/tmux-copy-paste-on-os-x-a-better-future)
- [https://github.com/PogiNate/dots/blob/master/home/.tmux.conf](https://github.com/PogiNate/dots/blob/master/home/.tmux.conf)

```
cd ~ && ln -s .dotfiles/tmux/tmux.conf .tmux.conf
```

##### General

```
<ctrl> a                <prefix>
<prefix> :              enter command mode
```

##### Panes

```
<prefix> -              split pane horizontally
<prefix> |              split pane vertically

<prefix> h              move left a pane
<prefix> j              move down a pane
<prefix> k              move up a pane
<prefix> l              move right a pane

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

##### Windows

```
<prefix> &              kill window
<prefix> ,              name window
<prefix> 0-9            move to window number
<prefix> c              new window
<prefix> n              next window
<prefix> p              previous window
<prefix> w              choose window from menu
```

##### Sessions

```
<prefix> $              rename session
<prefix> (              previous session
<prefix> )              next session
<prefix> d              detach from current session
<prefix> s              choose session from menu
```

##### Copy Mode

```
<enter>                 exit copy mode, copy selection to buffer (in copy mode)
<prefix> =              chose buffer from menu
<prefix> [              enter copy mode
<prefix> ]              paste current buffer
<prefix><ctrl> c        choose buffer from menu and paste
<prefix><ctrl> s        save copy of current buffer to ~/buffer.txt
<space>                 start selection (in copy mode)
```

##### Mouse Mode

- enabled by default
- while in mouse mode, hold `<shift>` while selecting text to copy into tmux buffer
- in iTerm, hold `<option>` for native text selecting

```
<prefix> m              enable mouse mode
<prefix> M              disable mouse mode
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
