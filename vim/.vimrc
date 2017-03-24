set nocompatible
syntax on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'bling/vim-airline'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'erickzanardo/vim-xclip'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-unimpaired'
Plugin 'rust-lang/rust.vim'
Plugin 'isRuslan/vim-es6'

call plug#begin('~/.vim/plugged')

Plug 'pangloss/vim-javascript'
Plug 'ajh17/VimCompletesMe'
Plug 'othree/yajs.vim', {'for': 'javascript'}
Plug 'othree/es.next.syntax.vim', {'for': 'javascript'}

call plug#end()

" Status bar plugin (vim-airline)
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" neocomplcache
let g:neocomplcache_enable_at_startup = 1
" vim javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

call vundle#end()            " required
filetype plugin indent on    " required

call pathogen#infect()

" Few configurations:
set hlsearch " Highlight search results
set encoding=utf8
set background=dark
set ffs=unix,dos,mac
set modeline
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set backspace=indent,eol,start
set laststatus=2
set cpoptions+=n
set number
set vb
set smartindent
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=235 gui=NONE guifg=NONE guibg=NONE

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
" ============ you complete me ==========
let g:ycm_autoclose_preview_window_after_completion=1

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" CtrlP to ignore
set wildignore+=*.swp,*.pyc
let g:ctrlp_show_hidden = 1

" NerdTree show hidden files
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swp$', '\.pyc$']

" Short cuts:
let mapleader=","
map <C-]> :NERDTreeToggle<CR>
map <C-F> :NERDTreeFind<CR>         " Open NERDTree and focus on current file
map <F5> :e!<CR>                    " force reload current file
map <F6> :CtrlPClearAllCaches<CR>   " clear all CtrlP cache
map <leader>W :w<CR>
map <leader>w :wincmd k<CR>        " go window up
map <leader>s :wincmd j<CR>        " go window down
map <leader>a :wincmd h<CR>        " go window left
map <leader>d :wincmd l<CR>        " go window right
map <leader>v :vertical :new<CR>   " open new vertical window
map <leader>h :new<CR>             " open a new horizontal window
map <leader>q :q<CR>               " it quit current vim buffer
map <leader>Q :q!<CR>              " it force quit current vim buffer
map <leader>n :tabnew<CR>          " create a new tab
map <leader>z :tabprevious<CR>     " move to previous tab
map <leader>x :tabnext<CR>         " move to next tab
map <leader>y :call system('xclip -selection clipboard', @0)<CR>  " move last yank selection to xclip
map <leader>b :CtrlPBuffer<cr>
map <leader>t :CtrlPTag<cr>

colorscheme malokai
