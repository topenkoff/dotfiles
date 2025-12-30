" Wildmenu
set wildoptions=pum
set pumblend=20

filetype plugin indent on

" Hybrid relative line number
set number relativenumber
set foldmethod=manual

" Always show sign column
set signcolumn=yes

let g:git_messenger_always_into_popup = 1

" Show current cursor line
set cursorline

autocmd FileType yaml       setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml        setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType lua        setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType vim        setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType go         setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType Makefile   setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType gitmodules setlocal ts=4 sts=4 sw=4 noexpandtab

" Clipboard
set clipboard+=unnamedplus

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
