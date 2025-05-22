return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  keys = {
  { "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", desc = "Go to definition" },
  { "<leader>gr", "<cmd>Telescope lsp_references<CR>", desc = "Find references" },
  },
  config = function()

    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })

  end
}

