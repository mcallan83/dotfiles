" vim:fdm=marker

" NeoBundle {{{

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
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'scrooloose/nerdtree'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" }}}
" Basic Settings {{{

filetype plugin indent on "detect filetype
set encoding=utf-8 "duh!
syntax on
set t_Co=256
set background=light
colorscheme solarized
set number
set laststatus=2

" set leader
let mapleader = "\<Space>"

" }}}
" Advanced Settings {{{

" disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" }}}
" {{{ Plugin Config

" solarized
let g:solarized_visibility="high"
let g:solarized_diffmode="high"
let g:solarized_menu=0
highlight clear SignColumn " fix sign column bg color issue

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" vim-easy-motion
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" vim-airline
let g:airline_theme='solarized'
let g:airline_left_sep = ""
let g:airline_right_sep = ""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" nerdtree
map <leader>nn :NERDTreeToggle<cr>

" }}}
