" vim
set nocompatible

" vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" vundle - bundles
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-sleuth'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-fugitive'
Plugin 'elixir-lang/vim-elixir'
Plugin 'derekwyatt/vim-scala'
Plugin 'sjl/splice.vim'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'
Plugin 'lambdatoast/elm.vim'

Plugin 'unicode.vim'

" gist
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'bling/vim-airline'
Plugin 'slim-template/vim-slim.git'
Plugin 'Valloric/YouCompleteMe'

Plugin 'ledger/vim-ledger'

" gruv
Plugin 'morhetz/gruvbox'

call vundle#end()


filetype plugin indent on

set t_Co=256
syntax on
filetype indent plugin on

let g:gruvbox_italic=0
colorscheme gruvbox

set autoindent
set backspace=indent,eol,start

set backup
set backupdir=~/.vim/backup

set bg=dark
set cc=+1

set cpoptions=aABceFqs "might want to check out the actual options here

set directory=~/.vim/tmp

set expandtab

set formatoptions+=ro

set history=100

set hlsearch
set ignorecase
set incsearch
set infercase
set history=100

set hlsearch
set ignorecase
set incsearch
set infercase

set laststatus=2
set lazyredraw
set magic
set matchpairs=(:),{:},[:],<:>
set matchtime=2
set number
set report=0
set ruler
set scrolloff=5
set shiftwidth=2
set showbreak=
set showcmd
set showmatch
set showmode
set smartcase
set smartindent
set smarttab
set softtabstop=2
set splitright
set startofline

set relativenumber

set cursorline
set cursorcolumn

set textwidth=80

" hightlight word
nnoremap <C-K> :call HighlightNearCursor()<CR>

function HighlightNearCursor()
  if !exists("s:highlightcursor")
    match Label /\k*\%#\k*/
    let s:highlightcursor=1
  else
    match None
    unlet s:highlightcursor
  endif
endfunction

call HighlightNearCursor()

" experimental escape from escape
imap jj <Esc>

" Remove search highlighting with F3
nnoremap <F3> :noh<cr>

" Powerline
"let g:Powerline_symbols = 'fancy'

" Ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc' "r,c = nearest vc root, current dir
let g:ctrlp_custom_ignore = '\v[\/](node_modules|dist|.sass_cache|.idea|.tmp|target)$'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1

" gist-vim
let g:gist_post_private = 1

" Leader
let mapleader=" "

" Moving lines
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==

" Makefiles needs tabs
autocmd FileType make set noexpandtab

" Markdown MD
au BufRead,BufNewFile *.md set filetype=markdown

" Show invisibles
nmap <leader>l :set list!<CR>

let g:airline_powerline_fonts = 1
