return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
       "williamboman/mason.nvim",
       "neovim/nvim-lspconfig",
     },
     opts = {
       ensure_installed = { "powershell_es" },
     },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("powershell_es", {
        -- Uncomment if you don't have PowerShell 7 (`pwsh`) and use Windows PowerShell:
        -- shell = "powershell.exe",
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc })
          end
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gr", vim.lsp.buf.references, "References")
          map("K", vim.lsp.buf.hover, "Hover")
          map("<leader>rn", vim.lsp.buf.rename, "Rename")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
          map("]d", vim.diagnostic.goto_next, "Next diagnostic")
        end,
      })
    end,
  },
}
