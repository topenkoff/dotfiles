:lua << EOF
require'bufferline'.setup{
  options = {
    show_buffer_close_icons = false,
    separator_style = 'thin',
    numbers = function(opts)
      return string.format('%s', opts.raise(opts.id))
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
      },
    },
  }
}
EOF
