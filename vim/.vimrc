" Enable Pathogen (plugin loader)
call pathogen#infect()

" Enable syntax highlighting
syntax enable

" Customise tab handling 
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Enable mouse
set mouse=a

" Add shortcut to focus NERDTree
map <silent> <C-t> :NERDTreeFocus<CR>

" Auto open NERDTree
" au VimEnter *  NERDTree
