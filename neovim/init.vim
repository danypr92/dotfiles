filetype on
filetype plugin indent on

" Easier split navigations
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

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
set autoindent      " Copy indent from current line when starting a new line
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

" Paste Mode
nnoremap <C-P> :set invpaste<CR>

" Disable arrow keys
map <up>    <nop>
map <down>  <nop>
map <left>  <nop>
map <right> <nop>

" Vim-plug
" Enable completion where available.
" This setting must be set before ALE is loaded.
let g:ale_completion_enabled = 1

" Make sure you use single quotes
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

  " Colors
Plug 'NLKNguyen/papercolor-theme'
Plug 'bronson/vim-trailing-whitespace'

" Vim Airline and Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Navegation
" NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Buffers
Plug 'jeetsukumaran/vim-buffergator'

" GIT
" Fugitive
Plug 'tpope/vim-fugitive'

" Search
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" linting
Plug 'w0rp/ale'

" Jedi VIM to work with Python
" Pyenv in VIM
Plug 'davidhalter/jedi-vim' | Plug 'lambdalisue/vim-pyenv' , { 'for': 'python' }

" Tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" Goyo - Distraction-free writing in Vim.
Plug 'junegunn/goyo.vim'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"
" Index in markdown
Plug 'mzlogin/vim-markdown-toc'


" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

Plug 'jpalardy/vim-slime'
call plug#end()

" Enables autochdir when entering insert mode ( relative path completion )
autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)

" Colors
set background=dark
colors PaperColor

" NERDTree
" map Ctrl+n to Toggle
map <Leader>m :NERDTreeToggle<CR>
" ignore files
let NERDTreeIgnore = ['\.pyc$']

" Vim Airline
" Enable smarter tab line
let g:airline#extensions#tabline#enabled = 1
" Path formatter for tab line
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Theme
let g:airline_theme='luna'

" FZF vim
let $FZF_DEFAULT_OPTS .= ' --inline-info'

" Buffergator configuration
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_split_size = 5

" Hide statusline of terminal buffer
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>L :Lines<CR>

" PYTHON
" Python support
let g:python_host_prog  = '/home/daniel/.pyenv/versions/pyneovim/bin/python'
let g:python3_host_prog = '/home/daniel/.pyenv/versions/py3neovim/bin/python'

" ALE Linter
" In ~/.vim/vimrc, or somewhere similar.
let g:ale_linters = {
\   'python': ['flake8'],
\   'ansible': ['ansible-lint, yaml-lint'],
\}

" PyEnv with Jedi
" https://github.com/lambdalisue/vim-pyenv#using-vim-pyenv-with-jedi-vim
if jedi#init_python()
  function! s:jedi_auto_force_py_version() abort
    let g:jedi#force_py_version = pyenv#python#get_internal_major_version()
  endfunction
  augroup vim-pyenv-custom-augroup
    autocmd! *
    autocmd User vim-pyenv-activate-post   call s:jedi_auto_force_py_version()
    autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
  augroup END
endif

" Vim Slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}

" Shortcuts
nnoremap <C-X> :! python setup.py test<CR>

