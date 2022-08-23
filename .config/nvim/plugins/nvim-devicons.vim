:lua << EOF
require'nvim-web-devicons'.setup {
 override = {
  py = {
    icon = "",
    color = "#3572A5",
    name = "py",
  },
  lock = {
    icon = "",
    color = "#596c72",
    name = "lock",
  },
  Dockerfile = {
    icon = "",
    color = "#4965AB",
    name = "Dockerfile",
  },
  yml = {
    icon = "",
    color = "#1489E9",
    name = "yml",
  },
  yaml = {
    icon = "",
    color = "#1489E9",
    name = "yaml",
  },
  proto = {
    icon = "",
    color = "#cccc00",
    name = "proto" 
  },
  Makefile = {
    icon = "",
    name = "Makefile" 
  },
 },
}
EOF
