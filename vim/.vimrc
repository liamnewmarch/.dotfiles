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

" Enable shared clipboard
"set clipboard=unnamed

" Add shortcut to focus NERDTree
map <silent> <C-t> :NERDTreeFocus<CR>

" Disable soft tabs when editing make files
autocmd FileType make setlocal noexpandtab

" Auto open NERDTree
" au VimEnter *  NERDTree
