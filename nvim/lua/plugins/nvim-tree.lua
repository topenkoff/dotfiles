local nvim_tree = require'nvim-tree'

nvim_tree.setup{
  open_on_tab         = true,
  open_on_setup       = true,
  view = {
    width = 35,
    side = 'left',
    auto_resize = true,
  }
}
