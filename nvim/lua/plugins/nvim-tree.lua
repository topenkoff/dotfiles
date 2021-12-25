local nvim_tree = require'nvim-tree'

nvim_tree.setup{
  open_on_tab         = true,
  open_on_setup       = true,
  auto_close          = true,
  view = {
    width = 35,
    side = 'left',
    auto_resize = true,
  },
  filters = {
    custom = { 
      '.git', 
      'node_modules', 
      '.cache',
      '.idea',
      '.DS_Store',
      '.venv',
      '__pycache__', 
      '.mypy_cache',
      '.pytest_cache',
      'htmlcov',
      'reports',
      '.hypothesis',
      '.coverage',
      'coverage.xml',
    }
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 100,
  }
}
