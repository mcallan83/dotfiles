set nocompatible
filetype off


" ***************
" * Load Vundle *
" ***************
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

" 3rd party plugins here
Bundle 'altercation/vim-colors-solarized'


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

