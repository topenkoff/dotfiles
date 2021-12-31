" Wildmenu
set wildoptions=pum
set pumblend=20

filetype plugin indent on

" Hybrid relative line number
set number relativenumber
set foldmethod=manual

" Always show sign column
set signcolumn=yes

" Language
let g:myLang = 0
let g:myLangList = ['nospell', 'en_us,ru_yo']

" Show current cursor line
set cursorline

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType lua setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
" Clipboard
set clipboard+=unnamedplus

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
" set lazyredraw
" set synmaxcol=128
" syntax sync minlines=256
