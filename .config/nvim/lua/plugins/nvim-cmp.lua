local nvim_lsp = require('lspconfig')
local lsp_status = require('lsp-status')
local cmp = require('cmp')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- cmp setup: {{{
-- icons: {{{
local kind_icons = {
  Text = "",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰇽",
  Variable = "󰂡",
  Class = "󰠱",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "󰈙",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "",
  Constant = "󰏿",
  Struct = "",
  Event = "",
  Operator = "󰆕",
  TypeParameter = "󰅲",
  Version = "",
  Feature = "",
}
-- }}}

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = "crates" },
    { name = 'buffer' },
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s  %s', kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
      })[entry.source.name]
      return vim_item
    end
  },
  completion = {
    completeopt = 'noinsert,menuone,noselect'
  },
  mapping = {
     ['<S-k>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
     ['<S-j>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
  --   ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
  --   ['<C-y>'] = cmp.config.disable,
  --   ['<C-e>'] = cmp.mapping({
  --     i = cmp.mapping.abort(),
  --     c = cmp.mapping.close(),
  --   }),
     ['<CR>'] = cmp.mapping.confirm({
       behavior = cmp.ConfirmBehavior.Insert,
       select = true
     }),
     ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
     ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
  },
})
-- }}}

-- rust: {{{
nvim_lsp.rust_analyzer.setup{
  capabilities = capabilities,
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
-- }}}

-- golang: {{{
nvim_lsp.gopls.setup{
  capabilities = capabilities,
  -- cmd = {"gopls", "serve"},
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
  root_dir = function(fname)
      local filename = nvim_lsp.util.path.is_absolute(fname) and fname
        or nvim_lsp.util.path.join(vim.loop.cwd(), fname)
      local root_pattern = nvim_lsp.util.root_pattern(
        'go.mod',
        'go.sum',
        '.git'
      )
      return root_pattern(filename) or nvim_lsp.util.dirname(filename)
    end;
}
-- }}}

-- c: {{{
nvim_lsp.clangd.setup{
  handlers = lsp_status.extensions.clangd.setup(),
  capabilities = capabilities,
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "h", "cpp", "hpp" },
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


    -- root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git")
}
-- }}}

-- python: {{{
nvim_lsp.pylsp.setup{
  capabilities = capabilities,
  cmd = {'pylsp'},
  settings = {
    pylsp = {
      configurationSources = { "mypy" },
      plugins = {
        jedi = {
          extra_paths = { io.popen("python -c \"import os; import glob; base = os.path.join(os.getcwd(), '.venv'); env = next(iter(glob.glob('.venv/lib/*/site-packages')), None); print(os.path.join(os.getcwd(), env) if base and env is not None else '')\"", "r"):read() },
        },
        -- pyls_mypy = {
        --   enabled = true,
        --   live_mode = true,
        -- },
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
        '.pylintrc',
        '.flake8rc',
        '.git',
        '.gitignore'
      )
      return root_pattern(filename) or nvim_lsp.util.dirname(filename)
    end;
}
-- }}}

-- after: {{{
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = false,
    update_in_insert = false,
    virtual_text = true,
  }
)
-- }}}

-- vim: set sw=2 ts=2 sts=2 et tw=80 ft=lua fdm=marker fmr={{{,}}}:
