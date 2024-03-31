" RefreshPage: {{{
function! s:RefreshPage()
  :NvimTreeRefresh
  :GitGutterToggle
  :GitGutterToggle
endfunction

command! RefreshPage call s:RefreshPage()
" }}}

" CloseHiddenBuffers: {{{
function! s:CloseHiddenBuffers()
  let open_buffers = []

  for i in range(tabpagenr('$'))
    call extend(open_buffers, tabpagebuflist(i + 1))
  endfor

  for num in range(1, bufnr("$") + 1)
    if buflisted(num) && index(open_buffers, num) == -1
      exec "bdelete ".num
    endif
  endfor
endfunction

command! CloseHiddenBuffers call s:CloseHiddenBuffers()
" }}}

" rust-analyzer/expandMacro: {{{
:lua << EOF
  local function handler(_, result)
    if result == nil then
      vim.api.nvim_out_write("No macro under cursor!\n")
      return
    end

    local contents = {}

    local name = result.name
    local text = "// Recursive expansion of the `" .. name .. "` macro"
    table.insert(contents, text)
    table.insert(contents, "")

    local expansion = result.expansion
    for string in string.gmatch(expansion, "([^\n]+)") do
      table.insert(contents, string)
    end

    vim.lsp.util.open_floating_preview(contents, "rust")
  end

  function expandMacro()
    local params = vim.lsp.util.make_position_params()
    return vim.lsp.buf_request(0, "rust-analyzer/expandMacro", params, handler)
  end
EOF

command! RAExpandMacro call s:RAExpandMacro()
function! s:RAExpandMacro()
  :lua expandMacro()
endfunction
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
