return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({
        open_on_tab = true,
        view = {
          width = 35,
          side = 'left',
        },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require('bufferline').setup({
        options = {
          show_buffer_close_icons = false,
          separator_style = 'thin',
          numbers = function(opts)
            return string.format('%s', opts.raise(opts.id))
          end,
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              highlight = "Directory",
            },
          },
        }
      })
    end,
  },
  {
    "vim-airline/vim-airline",
    config = function() end,
  },
  {
    "sainnhe/edge",
    config = function() end,
  },
  {
    "airblade/vim-gitgutter",
    config = function() end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
  },
  -- {
  --   'saecki/crates.nvim',
  --   tag = 'stable',
  --   config = function()
  --     require('crates').setup()
  --   end,
  -- }
}
