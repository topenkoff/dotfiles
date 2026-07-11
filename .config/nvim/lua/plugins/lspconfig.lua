return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      vim.lsp.config('clangd', {
        capabilities = capabilities,
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        -- root_dir = function(fname)
        --   local filename = nvim_lsp.util.path.is_absolute(fname) and fname
        --       or nvim_lsp.util.path.join(vim.loop.cwd(), fname)
        --   local root_pattern = nvim_lsp.util.root_pattern(
        --     'compile_commands.json',
        --     'compile_flags.txt',
        --     '.git'
        --   )
        --   return root_pattern(filename) -- or nvim_lsp.util.dirname(filename)
        -- end,
      })
      vim.lsp.enable('clangd')

      ------------------------------------------

      vim.lsp.config("gopls", {
        capabilities = capabilities,
      })
      vim.lsp.enable("gopls")

      ------------------------------------------

      vim.lsp.config("pylsp",{
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              jedi = {
                extra_paths = { io.popen("python -c \"import os; import glob; base = os.path.join(os.getcwd(), '.venv'); env = next(iter(glob.glob('.venv/lib/*/site-packages')), None); print(os.path.join(os.getcwd(), env) if base and env is not None else '')\"", "r"):read() },
              }
            }
          }
        }
      })
      vim.lsp.enable("pylsp")

      ------------------------------------------

      vim.lsp.config("rust_analyzer",{
          capabilities = capabilities
      })
      vim.lsp.enable("rust_analyzer")

      ------------------------------------------

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })
      vim.lsp.enable("lua_ls")

      ------------------------------------------
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "qf",
        callback = function()
          vim.keymap.set("n", "<CR>", "<CR>:cclose<CR>", { buffer = true })
        end,
      })
    end,
  },
}
