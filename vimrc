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
" =========
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'airblade/vim-gitgutter'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" }}}
" Basic Settings {{{

filetype plugin indent on "detect filetype
set encoding=utf-8
syntax on
set t_Co=256
set background=light
colorscheme solarized
set number
set laststatus=2
set noshowmode
set updatetime=750
highlight clear SignColumn " fix sign column bg color issue


" set leader
" ==========
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" remap jj to <Esc> in insert mode
" ================================
inoremap jj <Esc>

" }}}
" Advanced Settings {{{

" disable automatic comment insertion
" ===================================
augroup comments
	au!
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" }}}
" {{{ Plugin Config

" solarized
" =========
let g:solarized_visibility="high"
let g:solarized_diffmode="high"
let g:solarized_menu=0

" vim-expand-region
" =================
vmap v <Plug>(expand_region_expand)

" vim-easy-motion
" ===============
let g:EasyMotion_smartcase = 1
nmap <leader><leader> <Plug>(easymotion-s2)

" vim-airline
" ===========
"let g:airline_theme="solarized"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_detect_paste=1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" nerdtree
" ========
map <leader>[ :NERDTreeToggle<cr>

" ctrl+p
" ======
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
map <leader>b :CtrlPBuffer<CR> "buffer mode

" use silversearcher if installed
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
endif

" git-gutter
" ==========
let g:gitgutter_sign_column_always = 1

" }}}




" {{{ TODO

NeoBundle 'majutsushi/tagbar'

" tagbar
" let g:tagbar_autofocus = 1
" nnoremap <leader>] :TagbarOpenAutoClose<cr>
" nnoremap <leader>} :TagbarToggle<cr>


" hashrocket in insert mode
" imap <c-h> <space>=><space>


" copy and paste to system clipboard
" vmap <Leader>y "+y
"vmap <Leader>d "+d
"nmap <Leader>p "+p
"nmap <Leader>P "+P
"vmap <Leader>p "+p
"vmap <Leader>P "+P



" jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" select pasted text
" noremap gV `[v`]



" }}}
