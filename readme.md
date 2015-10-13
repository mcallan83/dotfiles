# Mike Callan's Dotfiles

My dotfile setup for ZSH, Vim, Tmux, Sublime, Atom, and more. Optimized for OSX and Ubuntu. Always a work in progress.

Follow the [setup guide](docs/setup.md) to install.

## Reference

- [ZSH Aliases](docs/reference/zsh.md)


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
