function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })             " Package manager

  " Editor and theme
  call packager#add('nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'})       " Syntax parser and highliter
  call packager#add('sainnhe/edge')                                               " Edge theme
  call packager#add('vim-airline/vim-airline')                                    " Statusline
  call packager#add('kyazdani42/nvim-tree.lua')                                   " File explorer
  call packager#add('kyazdani42/nvim-web-devicons')                               " Neovim Icons

  " LSP
  call packager#add('neovim/nvim-lspconfig')                                      " LSP configuration defaults
  "remove(archived), but first add the inline function based on rust-analyzer/inlayHints
  call packager#add('nvim-lua/lsp_extensions.nvim')                               " LSP extensions

  call packager#add('nvim-lua/lsp-status.nvim')                                   " LSP Statusline info
  call packager#add('hrsh7th/nvim-cmp')                                           " LSP completion
  call packager#add('hrsh7th/vim-vsnip')                                          " Snippet plugin for LSP
  call packager#add('hrsh7th/vim-vsnip-integ')                                    " vim-vsnip integrations to other plugins
  call packager#add('hrsh7th/cmp-vsnip')                                          " nvim-cmp source for vim-vsnip 
  call packager#add('hrsh7th/cmp-nvim-lsp')                                       " nvim-cmp source for neovim builtin LSP client
  call packager#add('hrsh7th/cmp-buffer')                                         " nvim-cmp source for buffer words

  " Helpers
  call packager#add('airblade/vim-gitgutter')                                     " Git sign
  call packager#add('rhysd/git-messenger.vim')                                    " Git history
  call packager#add('akinsho/nvim-bufferline.lua')                                " Buffer line implementation
  call packager#add('jiangmiao/auto-pairs')                                       " Autospell pairs
  call packager#add('tpope/vim-surround')                                         " Insert or delete brackets, parens, quotes in pair.
  call packager#add('nvim-lua/popup.nvim')                                        " Popup API
  call packager#add('nvim-lua/plenary.nvim')                                      " Neovim helpers
  call packager#add('nvim-telescope/telescope.nvim')                              " Finder

  " Language
  call packager#add('ekalinin/Dockerfile.vim')                                    " Dockerfile helper
  call packager#add('saecki/crates.nvim', {'requires': 'nvim-lua/plenary.nvim'})  " crates.io helper
  call packager#add('rust-lang/rust.vim')                                         " cmp source rust
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

"Load plugins only for specific filetype
"Note that this should not be done for plugins that handle their loading using ftplugin file.
"More info in :help pack-add
augroup packager_filetype
  " autocmd!
  " autocmd FileType javascript packadd vim-js-file-import
  " autocmd FileType go packadd vim-go
  " autocmd FileType toml lua require('cmp').setup.buffer { sources = { { name = 'crates' } } }
augroup END
