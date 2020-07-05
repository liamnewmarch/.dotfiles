" Enable auto-relative line numbers
set number
set relativenumber
set numberwidth=6
highlight LineNr ctermfg=240

" Customise tab handling
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Show hidden characters
set list

" Disable soft tabs when editing Make files
autocmd FileType make setlocal noexpandtab

" Enable mouse support
set mouse=a

" Vim Better Whitespace plugin
let g:strip_only_modified_lines=1
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_confirm=0
let g:strip_whitespace_on_save=1
