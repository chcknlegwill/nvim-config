return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "gopls" }, -- & other LSP's e.g. Rust (Bacon) 
      automatic_installation = true,
      handlers = {
        function(server_name)
          local lspconfig = require("lspconfig")
          if server_name == "lua_ls" then
            lspconfig.lua_ls.setup({
              settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } }, -- Recognize Neovim's `vim` global
                  workspace = { checkThirdParty = false }, -- Avoid Lua workspace prompts
                },
              },
            })
          else
            lspconfig[server_name].setup({})
          end
        end,
      },
    })
  end,
}
