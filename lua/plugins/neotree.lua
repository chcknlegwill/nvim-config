return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended for icons
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          visible = true, -- shows hidden files by default
          hide_dotfiles = false,
        },
      },
    })

    -- Bind <leader>le to toggle the left-side explorer panel
    vim.keymap.set("n", "<leader>le", "<cmd>Neotree toggle<CR>", { desc = "Toggle Left Explorer" })
  end,
}
