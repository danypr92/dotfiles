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
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" Enable highlighting of the current line
set cursorline
