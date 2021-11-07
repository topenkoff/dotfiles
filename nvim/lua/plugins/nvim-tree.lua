require'nvim-tree'.setup {
  open_on_setup = true,
  view = {
    width = 30,
    side = 'left',
    auto_resize = true,  
  },
  filters = {
    custom = { 
      '.git', 
      'node_modules', 
      '.nvimlog', 
      '.idea', 
      '__pycache__', 
      '.venv' 
    }
  }
}

