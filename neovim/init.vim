filetype on
filetype plugin indent on

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
set backspace=2     " make backspace work like most other programs
" set autoindent    " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).

set laststatus=2    " Always display the status line
set noshowmode      " Hide the default mode (INSERT, NORMAL, etc)

" Search facilities
set hlsearch
nnoremap <esc><esc> :silent! nohls<cr>

let mapleader = ","
" use F5 to get rid of trailing spaces
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" Disable arrow keys
map <up>    <nop>
map <down>  <nop>
map <left>  <nop>
map <right> <nop>

" Vim-plug
" Make sure you use single quotes
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

  " Colors
Plug 'NLKNguyen/papercolor-theme'
Plug 'kien/rainbow_parentheses.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/vim-emoji'

" Vim Airline and Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NerdTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" GIT
" Fugitive
Plug 'tpope/vim-fugitive'

" Mercurial
" Mercenari - Like Fugitive for Mercurial
Plug 'phleet/vim-mercenary'

" Search
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" Enables autochdir when entering insert mode ( relative path completion )
autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)

" Colors
set background=dark
colors PaperColor

" NERDTree
" map Ctrl+n to Toggle
map <Leader>n :NERDTreeToggle<CR>
" ignore files
let NERDTreeIgnore = ['\.pyc$']

" Vim Airline
" Enable smarter tab line
let g:airline#extensions#tabline#enabled = 1
" Path formatter for tab line
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Theme
let g:airline_theme='luna'
