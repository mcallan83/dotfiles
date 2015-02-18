" vim:fdm=marker

" NeoBundle Start {{{

if has('vim_starting')
	set nocompatible
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
let vundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(vundle_readme)
	echo "Installing NeoBundle..."
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" packages 
NeoBundle 'altercation/vim-colors-solarized'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" }}}
" Basic Settings {{{

syntax on
set t_Co=256
set background=light
colorscheme solarized
set number

" }}}
" {{{ Plugin Config

" solarized
let g:solarized_visibility="high"
let g:solarized_diffmode="high"
let g:solarized_menu=0
highlight clear SignColumn " fix sign column bg color issue

" }}}
