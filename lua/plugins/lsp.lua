return {
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim", dependencies = { "williamboman/mason.nvim" } },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "bashls", "gopls", "clangd", "html", "cssls", "ts_ls" },
      })

      local servers = { "bashls", "gopls", "clangd", "html", "cssls", "ts_ls" }
      for _, server in ipairs(servers) do
        vim.lsp.enable(server)
      end
    end,
  },
}
