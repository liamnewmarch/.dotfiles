""" General settings

" File handling
set noswapfile
set updatetime=300

" Relative line numbers
set number
set relativenumber
set numberwidth=6

" Indentation
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Hidden characters
set list

" Line length guides
set colorcolumn=80,100,120

" Mouse support
set mouse=a


""" Plugin settings

" Ctrl+p
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore='\v[\/](\.(DS_Store|git)|node_modules)$'

" Vim Better Whitespace
let g:strip_only_modified_lines=1
let g:strip_whitelines_at_eof=1
let g:strip_whitespace_confirm=0
let g:strip_whitespace_on_save=1


""" File-specific overrides

" Disable soft tabs when editing Make files
autocmd FileType make setlocal noexpandtab

" Disable indentLine for JSON files due to incompatibility
autocmd Filetype json let g:indentLine_enabled=0


""" Colors

" GitGutter colors
highlight! link SignColumn LineNr
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1

" Line numbers
highlight LineNrAbove ctermfg=238
highlight LineNr      ctermfg=248
highlight LineNrBelow ctermfg=238

" Line length guides
highlight ColorColumn ctermbg=236
