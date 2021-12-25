:lua << EOF
require'nvim-web-devicons'.setup {
 override = {
  ["py"] = {
    icon = "",
    color = "#3572A5",
    cterm_color = "61",
    name = "Py",
  },
  ["lock"] = {
    icon = "",
    color = "#596c72",
    cterm_color = "66",
    name = "Lock",
  },
  ["dockerfile"] = {
    icon = "",
    color = "#4965AB",
    cterm_color = "59",
    name = "Dockerfile",
  },
 };
 default = true;
}
EOF
