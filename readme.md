# Mike Callan's Dotfiles

My dotfile setup for ZSH, Vim, Tmux, Sublime, Atom, and more. Optimized for OSX and Ubuntu. Work in progress. Documentation below doesn't cover everything; it is mainly a reference for myself :)

## Shortcuts\Aliases

### ZSH

##### Composer

<table>
    <tr><td><kbd>c</kbd></td><td>composer</td></tr>
    <tr><td><kbd>cdu</kbd></td><td>composer dump-autoload</td></tr>
    <tr><td><kbd>cgr</kbd></td><td>composer global require</td></tr>
    <tr><td><kbd>cgu</kbd></td><td>composer global update</td></tr>
    <tr><td><kbd>ci</kbd></td><td>composer install</td></tr>
    <tr><td><kbd>cr</kbd></td><td>composer require</td></tr>
    <tr><td><kbd>csu</kbd></td><td>composer self-update</td></tr>
    <tr><td><kbd>cu</kbd></td><td>composer update</td></tr>
</table>

##### Git

<table>
    <tr><td><kbd>gaa</kbd></td><td>git add -all</td></tr>
    <tr><td><kbd>gb</kbd></td><td>git branch</td></tr>
    <tr><td><kbd>gbr</kbd></td><td>git branch --remote</td></tr>
    <tr><td><kbd>gcm</kbd></td><td>git checkout master</td></tr>
    <tr><td><kbd>gco</kbd></td><td>git checkout</td></tr>
    <tr><td><kbd>gd</kbd></td><td>git diff</td></tr>
    <tr><td><kbd>gf</kbd></td><td>git fetch</td></tr>
    <tr><td><kbd>ggpull</kbd></td><td>git pull origin [current_branch]</td></tr>
    <tr><td><kbd>ggpush</kbd></td><td>git push origin [current_branch]</td></tr>
    <tr><td><kbd>gp</kbd></td><td>git pull</td></tr>
    <tr><td><kbd>gs</kbd></td><td>git status</td></tr>
</table>

##### Homebrew

<table>
    <tr><td><kbd>brews</kbd></td><td>brew list -1</td></tr>
    <tr><td><kbd>bubc</kbd></td><td>brew upgrade && brew cleanup</td></tr>
    <tr><td><kbd>bubo</kbd></td><td>brew update && brew outdated</td></tr>
</table>

##### K

<table>
    <tr><td><kbd>k</kbd></td><td>list directories with <a href="https://github.com/rimraf/k">k</a></td></tr>
    <tr><td><kbd>ka</kbd></td><td>k with hidden files</td></tr>
    <tr><td><kbd>kd</kbd></td><td>k with directories only</td></tr>
</table>

##### Misc

<table>
    <tr><td><kbd>G</kbd></td><td>append with "| grep"</td></tr>
    <tr><td><kbd>L</kbd></td><td>append with "| less"</td></tr>
    <tr><td><kbd>als $</kbd></td><td>search all defined aliases for $</td></tr>
</table>

##### Vagrant

<table>
    <tr><td><kbd>vh</kbd></td><td>vagrant halt</td></tr>
    <tr><td><kbd>vs</kbd></td><td>vagrant ssh</td></tr>
    <tr><td><kbd>vu</kbd></td><td>vagrant up</td></tr>
</table>

##### Z

<table>
    <tr><td><kbd>z</kbd></td><td>just to "frecent" directory with <a href="https://github.com/rupa/z">z</a></td></tr>
    <tr><td><kbd>zc</kbd></td><td>z in current directory</td></tr>
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
