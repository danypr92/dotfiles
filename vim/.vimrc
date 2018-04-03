" Pathogen load
filetype off

execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
