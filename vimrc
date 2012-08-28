set nocompatible
filetype off


" ***************
" * Load Vundle *
" ***************
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" 3rd party plugins
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'


" ************
" * Settings *
" ************

filetype plugin indent on
syntax on

" Color Scheme
"let g:solarized_visibility="high" 
"let g:solarized_diffmode="high"
"let g:solarized_menu=0
set t_Co=256
set background=dark
colorscheme solarized

" *******************
" * Plugin Settings *
" *******************
"
" Powerline
let g:Powerline_symbols = 'fancy'
