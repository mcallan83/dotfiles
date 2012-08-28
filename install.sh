#!/bin/bash

# Clone dotfiles from GitHub into ~/.dotfiles
git clone https://github.com/mcallan83/dotfiles.git ~/.dotfiles

# Create symbolic links to dotfiles in ~/.dotfiles
ln -s ~/.dotfiles/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/bash_aliases ~/.bash_aliases
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/gvimrc ~/.gvimrc

# Install Vundle for VIM
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
