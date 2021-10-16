local nvim_lsp = require'lspconfig'
local lsp_status = require('lsp-status')

lsp_status.register_progress()

local on_attach_vim = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  require'completion'.on_attach(client, bufnr)
  -- lsp_status.on_attach(client, bufnr)
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = lsp_status.capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.rust_analyzer.setup{
    capabilities = capabilities,
    on_attach = on_attach_vim, 
    settings = {
        ['rust-analyzer'] = {
	          procMacro = {
                enable = true
            },
            cargo = {
                allFeatures = true,
		            loadOutDirsFromCheck = true,
            },
        },
    }
}

nvim_lsp.gopls.setup{
    capabilities = capabilities,
    on_attach = on_attach_vim,
    cmd = {"gopls", "serve"},
    settings = {
	      gopls = {
	          analyses = {
          	    unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

nvim_lsp.clangd.setup{
    handlers = lsp_status.extensions.clangd.setup(),
    capabilities = capabilities,
    on_attach = on_attach_vim,
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = function(fname)
        local nvim_lsp = require'lspconfig';
		      local filename = nvim_lsp.util.path.is_absolute(fname) and fname
		      	or nvim_lsp.util.path.join(vim.loop.cwd(), fname)
		      local root_pattern = nvim_lsp.util.root_pattern(
            'compile_commands.json',
            'compile_flags.txt',
            '.git'
          )
	return root_pattern(filename) or nvim_lsp.util.dirname(filename)
        end;


    --root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git")
}

nvim_lsp.pylsp.setup{
    capabilities = capabilities,
    on_attach=on_attach_vim, 
    cmd = {'pylsp'},
    settings = {
        pylsp = {
            configurationSources = { "mypy" },
            plugins = {
                jedi = {
                    extra_paths = { 
		        io.popen("python -c \"import sys; print(next((p for p in sys.path if 'site-packages' in p), ''))\"", "r"):read() 
		    },
                },
            },
            pydocstyle = { 
                enabled = true,
            },
        }
    },
    root_dir = function(fname)
        local nvim_lsp = require'lspconfig';
	local filename = nvim_lsp.util.path.is_absolute(fname) and fname
	    or nvim_lsp.util.path.join(vim.loop.cwd(), fname)
	local root_pattern = nvim_lsp.util.root_pattern(
	    'pyproject.toml',
	    'setup.py', 
	    'setup.cfg', 
	    'requirements.txt', 
	    'mypy.ini', 
	    '.pylintrc', 
	    '.flake8rc', 
	    '.git', 
	    '.gitignore'
        )
	return root_pattern(filename) or nvim_lsp.util.dirname(filename)
    end;
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = false,
    update_in_insert = false,
    virtual_text = true,
  }
)
