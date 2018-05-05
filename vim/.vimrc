" Pathogen load
execute pathogen#infect()

filetype on
filetype plugin indent on

" Solarized ColorScheme - https://github.com/altercation/vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set cursorline      " Enable highlighting of the current line
set number          " Show line numbers.
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
set wildmenu

" Set Proper Tabs
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).

set laststatus=2     " Always display the status line
set statusline=%<\ %t\ %m%r%y%w%=Col:\ \%c\ Lin:\ \%l\/\%L\

" NERDTree
let NERDTreeWinPos = "left"      " left
let NERDTreeMouseMode = 3        " single click
let NERDTreeMinimalUI = 1        " without ? nor bookmarks

" Minibuffer Explorer Settings
let g:miniBufExplorerMoreThanOne = 1   " Open only when having more than one buffer
let g:miniBufExplUseSingleClick = 1    " Use single click
let g:miniBufExplCheckDupeBufs = 0     " Disable duplicated names feature
let g:miniBufExplShowBufNumbers = 1    " Omit buffer number
let g:miniBufExplModSelTarget = 1

let mapleader = ","
" use F5 to get rid of trailing spaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>
" Disable arrow keys
map <up>    <nop>
map <down>  <nop>
map <left>  <nop>
map <right> <nop>
