syntax on
filetype off

call plug#begin('~/.vim/plugged')
"Imported ones
Plug 'bronson/vim-trailing-whitespace'
Plug 'erickzanardo/vim-xclip'
Plug 'scrooloose/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-unimpaired'
Plug 'isRuslan/vim-es6'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
call plug#end()


" Status bar plugin (vim-airline)
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" fzf stays in the screen instead of in a floating window
"let g:fzf_layout = { 'down': '~40%' }

filetype plugin indent on    " required

" coc.vim config
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
autocmd CursorHold * silent call CocActionAsync('highlight')
" end coc.vim config

" Few configurations:
set hlsearch " Highlight search results
set encoding=UTF-8
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
set clipboard=unnamed,unnamedplus

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
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


" Short cuts:
let mapleader=","
map ; :Files<CR>
map <C-]> :NvimTreeToggle<CR>
map <F5> :e!<CR>                    " force reload current file
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
map <leader>t :CtrlPTag<cr>
nmap <silent> k :call CocAction('doHover')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

set t_Co=256

if exists('$TMUX')
  " Colors in tmux
  let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif

"set background=dark
let g:airline_theme='onedark'

"Onedark theme
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
let g:onedark_hide_endofbuffer=1
let g:onedark_color_overrides = {
      \ "purple": { "gui": "#56B6C2", "cterm": "170", "cterm16": "5" }
      \}
syntax enable
colorscheme onedark
"This is set on iTerm2
"set guifont=FiraCode_Nerd_Font:h11
let g:airline_powerline_fonts = 1

if (has("termguicolors"))
 set termguicolors
endif


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

