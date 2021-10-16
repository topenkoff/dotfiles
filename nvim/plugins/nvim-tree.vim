let g:nvim_tree_ignore = [
    \'.git', 'node_modules', '.cache', '.idea',
    \'.DS_Store', '.venv', '__pycache__', '.mypy_cache',
    \'.pytest_cache', 'htmlcov', 'reports', '.hypothesis',
    \'.coverage', 'coverage.xml',
\]
let g:lua_tree_indent_markers = 0
let g:lua_tree_icons = {
    \ 'default': '',
    \ }
    " \ 'symlink': '',
    " \ 'git': {
    " \   'unstaged': "✗",
    " \   'staged': "✓",
    " \   'unmerged': "",
    " \   'renamed': "➜",
    " \   'untracked': "★"
    " \   },
    " \ 'folder': {
    " \   'default': "",
    " \   'open': ""
    " \   }
    " \ }

let g:lua_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }

lua require('plugins.nvim-tree')
