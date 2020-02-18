" Enable syntax highlighting
syntax enable

" Customise tab handling
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Enable mouse
set mouse=a

" Disable soft tabs when editing make files
autocmd FileType make setlocal noexpandtab
