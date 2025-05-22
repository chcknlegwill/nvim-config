return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    { "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc= "Git blame" },
    { "<leader>gd", "<cmd>Gitsigns diffthis<CR>", desc= "Git diff" },
    { "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", desc= "Stage hunk" },
  },
  condig = function()
    require("gitsigns").setup()
  end,
}
