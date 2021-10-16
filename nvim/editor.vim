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
" Clipboard
set clipboard+=unnamedplus

" Tab == 4 spaces after enter
set smartindent
set tabstop=2 
set shiftwidth=2 
set expandtab
set lazyredraw
set synmaxcol=128
syntax sync minlines=256
