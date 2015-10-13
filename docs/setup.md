## Installation

### OSX

1.) Run the [installer script](osx/01_install.sh):

`source <(curl -s http://git.io/vC0xZ)`

- Installs:
    - Homebrew
    - Homebrew Packages
    - Homebrew Casks (GUI Apps, Fonts, Quicklook Plugins)
    - Composer Packages
    - NPM Packages
    - RVM, Ruby, and Gems
    - Python Packages
- Clones this repo to `~/.dotfiles`
- Backs up existing `~/.zshrc` @todo
- Symlinks [zshrc](zsh/oh-my-zsh) into $HOME @todo
- Installs Oh My ZSH @todo



2.) Run the [OSX Defaults Script](osx/02_defaults.sh), which sets up default OSX settings and is based on: @todo

- [osx-for-hackers.sh](https://gist.github.com/brandonb927/3195465)
- [.osx](https://github.com/mathiasbynens/dotfiles/blob/master/.osx)

3.) Run the [App Config Script](osx/03_app_config.sh), which sets up the following apps by symlinking or copying settings to the proper places: @todo

- Atom
- Better Touch Tool
- Git
- Hammerspoon
- iTerm
- Karabiner
- Seil
- Slate
- Sublime

In all cases, existing settings are backed up by appending `.bak` to directories and files before symlinking or copying from this repo. There are manual steps needed to configure certain application, and the script will pause while they are completed.

### Ubuntu

@todo
