# Mike Callan's Dotfiles

My dotfile setup for ZSH, Vim, Tmux, Sublime, Atom, and more. Optimized for OSX and Ubuntu. Work in progress.

## Shortcuts\Aliases

### ZSH

##### Composer

<table>
    <tr><td>`c`</td><td>composer</td></tr>
    <tr><td>`cdu`</td><td>composer dump-autoload</td></tr>
    <tr><td>`cgr`</td><td>composer global require</td></tr>
    <tr><td>`cgu`</td><td>composer global update</td></tr>
    <tr><td>`ci`</td><td>composer install</td></tr>
    <tr><td>`cr`</td><td>composer require</td></tr>
    <tr><td>`csu`</td><td>composer self-update</td></tr>
    <tr><td>`cu`</td><td>composer update</td></tr>
</table>

##### Git

<table>
    <tr><td>`gaa`</td><td>git add -all</td></tr>
    <tr><td>`gb`</td><td>git branch</td></tr>
    <tr><td>`gbr`</td><td>git branch --remote</td></tr>
    <tr><td>`gcm`</td><td>git checkout master</td></tr>
    <tr><td>`gco`</td><td>git checkout</td></tr>
    <tr><td>`gd`</td><td>git diff</td></tr>
    <tr><td>`gf`</td><td>git fetch</td></tr>
    <tr><td>`ggpull`</td><td>git pull origin [current_branch]</td></tr>
    <tr><td>`ggpush`</td><td>git push origin [current_branch]</td></tr>
    <tr><td>`gp`</td><td>git pull</td></tr>
    <tr><td>`gs`</td><td>git status</td></tr>
</table>

##### Homebrew

<table>
    <tr><td>`brews`</td><td>brew list -1</td></tr>
    <tr><td>`bubc`</td><td>brew upgrade && brew cleanup</td></tr>
    <tr><td>`bubo`</td><td>brew update && brew outdated</td></tr>
</table>

##### K

<table>
    <tr><td>`k`</td><td>list directories with [k](https://github.com/rimraf/k)</td></tr>
    <tr><td>`ka`</td><td>k with hidden files</td></tr>
    <tr><td>`kd`</td><td>k with directories only</td></tr>
</table>

##### Misc

<table>
    <tr><td>`G`</td><td>append with "| grep"</td></tr>
    <tr><td>`L`</td><td>append with "| less"</td></tr>
    <tr><td>`als $`</td><td>search all defined aliases for $</td></tr>
</table>

##### Vagrant

<table>
    <tr><td>`vh`</td><td>vagrant halt</td></tr>
    <tr><td>`vs`</td><td>vagrant ssh</td></tr>
    <tr><td>`vu`</td><td>vagrant up</td></tr>
</table>

##### Z

<table>
    <tr><td>`z`</td><td>just to "frecent" directory with [z](https://github.com/rupa/z)</td></tr>
    <tr><td>`zc`</td><td>z in current directory</td></tr>
</table>

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
