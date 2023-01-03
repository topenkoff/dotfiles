:lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "c",
    "go",
    "rust",
    "python",
  },
  auto_install = false,

  highlight = {
    enable = false,
  },
  indent = {
    enable = true
  }
}
EOF
