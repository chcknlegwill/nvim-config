-- lua/plugins/harpoon.lua
-- ThePrimeagen's file pinning tool — pin up to 4 files and jump between them instantly
-- This is harpoon v2 (the rewritten version), API is different from v1

return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",   -- IMPORTANT: must specify the v2 branch
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim", -- optional, for the telescope picker
    },
    config = function()
      local harpoon = require("harpoon")

      -- Required v2 setup call
      harpoon:setup({
        settings = {
          save_on_toggle = false, -- save list when toggling the menu
          sync_on_ui_close = false,
        },
      })

      -- ─── Keymaps ──────────────────────────────────────────────────────────────

      -- Add current file to harpoon list
      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():add()
        vim.notify("Harpoon: file added", vim.log.levels.INFO)
      end, { desc = "Harpoon: add file" })

      -- Toggle the harpoon quick menu (shows all pinned files)
      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = "Harpoon: toggle menu" })

      -- Jump to pinned file 1–4
      -- Tip: use <C-1> through <C-4> for the fastest possible switching
      vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end, { desc = "Harpoon: file 1" })
      vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end, { desc = "Harpoon: file 2" })
      vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end, { desc = "Harpoon: file 3" })
      vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end, { desc = "Harpoon: file 4" })

      -- Cycle through pinned files (useful if you have more than 4)
      vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon: prev file" })
      vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon: next file" })

      -- ─── Optional: Telescope integration ──────────────────────────────────────
      -- Opens harpoon list inside telescope for fuzzy finding your pinned files
      -- Only active if telescope is loaded
      local ok, telescope = pcall(require, "telescope")
      if ok then
        telescope.load_extension("harpoon")
        vim.keymap.set("n", "<leader>fh", "<cmd>Telescope harpoon marks<cr>", { desc = "Telescope: harpoon marks" })
      end
    end,
  },
}
