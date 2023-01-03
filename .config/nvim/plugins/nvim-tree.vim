:lua << EOF
require("nvim-tree").setup({
  open_on_tab = true,
  open_on_setup = false,
  view = {
    width = 35,
    side = 'left',
  }
})
EOF
