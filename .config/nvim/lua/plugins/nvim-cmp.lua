return {
  { "hrsh7th/cmp-path" },
  {
    "hrsh7th/nvim-cmp",
    -- event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "hrsh7th/vim-vsnip-integ",
    },
    config = function()
      local cmp = require('cmp')

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
    end,
  },
}
