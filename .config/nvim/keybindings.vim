map <F3> :LuaTreeToggle<CR>
map <F2> :Vista!!<CR>
map <F7> :<C-U>call MySpellLang()<CR>
nnoremap <C-p> :NvimTreeToggle<CR>
nnoremap <C-[> :NvimTreeRefresh<CR>

nnoremap <leader>q :bp<cr>:bd #<cr>
nnoremap <leader>Q <cr>:CloseHiddenBuffers <cr>
set pastetoggle=<F5>
nnoremap <leader># <cmd>noh <CR>

nnoremap <C-A-k> 5k <CR>
nnoremap <C-A-j> 5j <CR>
inoremap <C-A-j><Esc> 5j <CR>
inoremap <C-A-k><Esc> 5k <CR>

"nnoremap <A-Left> :tabp<CR>
"nnoremap <A-Right> :tabn<CR>
"inoremap <A-Left> <Esc>:tabp<CR>
"noremap <A-Right> <Esc>:tabn<CR>
"nnoremap <A-Up> :bp<CR>
"nnoremap <A-Down> :bn<CR>
"inoremap <A-Left> <Esc>:bp<CR>
"inoremap <A-Right> <Esc>:bn<CR>

nnoremap <A-C-Right>  :wincmd l<CR>
nnoremap <A-C-Up>     :wincmd k<CR>
nnoremap <A-C-Down>   :wincmd j<CR>

inoremap <A-C-Right>  <Esc> :wincmd l<CR>
inoremap <A-C-Left>   <Esc> :wincmd h<CR>
inoremap <A-C-Up>     <Esc> :wincmd k<CR>
inoremap <A-C-Down>   <Esc> :wincmd j<CR>

nnoremap <A-h> :bp!<CR>
nnoremap <A-l> :bn!<CR>
nnoremap <A-k> :bp<CR>
nnoremap <A-j> :bn<CR>

inoremap <A-k> <Esc>:bp<CR>
inoremap <A-j> <Esc>:bn<CR>
inoremap <A-h> <Esc>:bp!<CR>
inoremap <A-l> <Esc>:bn!<CR>

nnoremap <C-l> :wincmd l<CR>
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-j> :wincmd j<CR>

inoremap <C-l> <Esc>:wincmd l<CR>
inoremap <C-h> <Esc>:wincmd h<CR>
inoremap <C-k> <Esc>:wincmd k<CR>
inoremap <C-j> <Esc>:wincmd j<CR>

" LSP key bindings
nnoremap <silent> <leader>g   <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>d   <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K           <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>I   <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>s   <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>G   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr          <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>r   <cmd>lua vim.lsp.buf.rename()<Cr>
nnoremap <silent> <leader>f   <cmd>lua vim.lsp.buf.format{async = true}<Cr>

" Diagnostic
nnoremap <leader> d           <cmd>lua vim.lsp.diagnostic.setloclist()<Cr>
nnoremap <silent> P           <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> {           <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> }           <cmd>lua vim.diagnostic.goto_prev()<CR>

" Inline type hints
nnoremap <leader> t           <cmd>lua require'lsp_extensions'.inlay_hints()<CR>
nnoremap <leader> h           <cmd>lua require'lsp_extensions'.inlay_hints{ only_current_line = true }<CR>
nnoremap <leader> H           <cmd>call ToggleInlayHints(1)<CR>
nnoremap <silent> <leader> me  <cmd>:RAExpandMacro<CR>
