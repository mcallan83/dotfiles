# Mike Callan's Dotfiles

My dotfile setup for ZSH, Vim, Tmux, Sublime, Atom, and more. Optimized for OSX and Ubuntu. Work inprogress.

## Shortcuts\Aliases

### ZSH

##### Git

`gaa` git add -all
`gco` git checkout
`gd` git diff
`gf` git fetch
`ggpull` git pull origin [current_branch]
`ggpush` git push origin [current_branch]
`gp` git pull
`gs` git status

##### K

`k` list directories with [k](https://github.com/rimraf/k)
`ka` k with hidden files
`kd` k with directories only

##### Vagrant

`vh` vagrant halt
`vs` vagrant ssh
`vu` vagrant up

### Vim

### Tmux

##### Installation

    cd ~
    ln -s .dotfiles/tmux/tmux.conf .tmux.conf

##### Prefix

<table style="display: table; width: 100%">
    <tr>
        <td><kbd>Ctrl + a</kbd></td>
        <td>&lt;prefix&gt;</td>
    </tr>
</table>

##### Panes

<table style="display: table; width: 100%">
    <tr>
        <td><kbd>&lt;prefix&gt; + x</kbd></td>
        <td>kill pane</td>
    </tr>
</table>


##### Windows

<table>
    <tr>
        <td><kbd>&lt;prefix&gt; + c</kbd></td>
        <td>create new window</td>
    </tr>
    <tr>
        <td><kbd>&lt;prefix&gt; + 0-9</kbd></td>
        <td>move to window based on index</td>
    </tr>
    <tr>
        <td><kbd>&lt;prefix&gt; + ,</kbd></td>
        <td>rename window</td>
    </tr>
    <tr>
        <td><kbd>&lt;prefix&gt; + |</kbd></td>
        <td>split window horizontally</td>
    </tr>
    <tr>
        <td><kbd>&lt;prefix&gt; + -</kbd></td>
        <td>split window vertically</td>
    </tr>
</table>

### Slate

### HammerSpoon

- OSX Window Manager
- [http://www.hammerspoon.org/](http://www.hammerspoon.org/)

<table>
    <tr>
        <td width="40%">
            <kbd>Cmd + Shift + H</kbd>
        </td>
        <td>
            Move window to left half of screen
        </td>
    </tr>
    <tr>
        <td>
            <kbd>Cmd + Shift + L</kbd>
        </td>
        <td>
            Move window to right half of screen
        </td>
    </tr>
    <tr>
        <td>
            <kbd>Cmd + Shift + RETURN</kbd>
        </td>
        <td>
            Maximize window
        </td>
    </tr>
    <tr>
        <td>
            <kbd>Cmd + Shift + . </kbd>
        </td>
        <td>
            Toggle window hints
        </td>
    </tr>
</table>

## Reference

- [https://github.com/zanshin/dotfiles](https://github.com/zanshin/dotfiles)
