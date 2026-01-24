return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config('clangd', {
        capabilities = capabilities,
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
      })
      vim.lsp.enable('clangd')

      vim.lsp.config('pylsp', {
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              jedi = {
                extra_paths = { io.popen("python -c \"import os; import glob; base = os.path.join(os.getcwd(), '.venv'); env = next(iter(glob.glob('.venv/lib/*/site-packages')), None); print(os.path.join(os.getcwd(), env) if base and env is not None else '')\"", "r"):read() },
              },
              autopep8 = {
                enabled = false
              },
              flake8 = {
                enabled = false,
                ignore = {
                  "E501",
                },
              },
              pylint = {
                enabled = false,
              },
              pyflakes = {
                enabled = false,
              },
              yapf = {
                enabled = false,
              },
            },
          }
        },
      })
      vim.lsp.enable('pylsp')

      vim.lsp.config('gopls', {
        capabilities = capabilities,
      })
      vim.lsp.enable('gopls')

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "qf",
        callback = function()
          vim.keymap.set("n", "<CR>", "<CR>:cclose<CR>", { buffer = true })
        end,
      })
    end,
  },
}
