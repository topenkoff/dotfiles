:lua << EOF
require'bufferline'.setup{
    options = {
	show_buffer_close_icons = false,
	separator_style = 'thin',
	numbers = "buffer_id",
    }
}
EOF
