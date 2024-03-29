function! LspStatus() abort
  let status = luaeval('require("lsp-status").status()')
  return trim(status)
endfunction
call airline#parts#define_function('lsp_status', 'LspStatus')
call airline#parts#define_condition('lsp_status', 'luaeval("#vim.lsp.buf_get_clients() > 0")')

let g:airline_powerline_fonts = 1
let g:airline#extensions#nvimlsp#enabled = 0
let g:airline#extensions#branch#use_vcscommand = 1

let g:airline_section_warning = airline#section#create_right(['lsp_status'])
set showtabline=2
