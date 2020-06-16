" These settings are designed to extend vim-sensible which enables most of
" Vim’s smart features. To install run:
"
"   git clone ~/.vim/pack/default/start/sensible

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

" Disable soft tabs when editing Make files
autocmd FileType make setlocal noexpandtab

" Enable mouse support
set mouse=a

