nnoremap <C-p>                :NvimTreeToggle<CR>
nnoremap <C-[>                :RefreshPage<CR>

nnoremap <leader>q            :bp<CR>:bd #<CR>
nnoremap <leader>Q            <CR>:CloseHiddenBuffers <cr>
nnoremap <leader>#            <cmd>noh <CR>
" nnoremap <A-Left>             :tabp<CR>
" nnoremap <A-Right>            :tabn<CR>
" inoremap <A-Left> <Esc>       :tabp<CR>
" noremap <A-Right> <Esc>       :tabn<CR>
" nnoremap <A-Up>               :bp<CR>
" nnoremap <A-Down>             :bn<CR>
" inoremap <A-Left> <Esc>       :bp<CR>
" inoremap <A-Right> <Esc>      :bn<CR>

nnoremap <A-C-Right>          :wincmd l<CR>
nnoremap <A-C-Up>             :wincmd k<CR>
nnoremap <A-C-Down>           :wincmd j<CR>

inoremap <A-C-Right> <Esc>    :wincmd l<CR>
inoremap <A-C-Left> <Esc>     :wincmd h<CR>
inoremap <A-C-Up> <Esc>       :wincmd k<CR>
inoremap <A-C-Down> <Esc>     :wincmd j<CR>

nnoremap <A-h>                :bp!<CR>
nnoremap <A-l>                :bn!<CR>
nnoremap <A-k>                :bp<CR>
nnoremap <A-j>                :bn<CR>

inoremap <A-k> <Esc>          :bp<CR>
inoremap <A-j> <Esc>          :bn<CR>
inoremap <A-h> <Esc>          :bp!<CR>
inoremap <A-l> <Esc>          :bn!<CR>

nnoremap <C-l>                :wincmd l<CR>
nnoremap <C-h>                :wincmd h<CR>
nnoremap <C-k>                :wincmd k<CR>
nnoremap <C-j>                :wincmd j<CR>

inoremap <C-l> <Esc>          :wincmd l<CR>
inoremap <C-h> <Esc>          :wincmd h<CR>
inoremap <C-k> <Esc>          :wincmd k<CR>
inoremap <C-j> <Esc>          :wincmd j<CR>

" LSP key bindings
nnoremap <silent> <leader>g   <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <leader>d   <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> K           <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>I   <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <leader>s   <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>G   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr          <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>r   <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>f   <cmd>lua vim.lsp.buf.format{async = true}<CR>

" Diagnostic
nnoremap <leader> d           <cmd>lua vim.lsp.diagnostic.setloclist()<CR>
nnoremap <silent> P           <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> {           <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> }           <cmd>lua vim.diagnostic.goto_prev()<CR>

nnoremap <silent> <leader> me <cmd>:RAExpandMacro<CR>
nnoremap <leader>sv           :source $MYVIMRC<CR>

vnoremap <S-j>                :m'>+<CR>gv=gv
vnoremap <S-k>                :m-2<CR>gv=gv
