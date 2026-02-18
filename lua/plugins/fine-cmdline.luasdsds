return {
  "VonHeikemen/fine-cmdline.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  event = "CmdlineEnter", -- Lazy-load when entering command mode
  keys = {
    { ":", "<cmd>FineCmdline<CR>", desc = "Open fine-cmdline" },
  },
  config = function()
    require("fine-cmdline").setup({
      cmdline = {
        enable_keymaps = true,
        smart_history = true,
        prompt = ": ",
      },
      popup = {
        position = {
          row = "50%",
          col = "50%",
        },
        size = {
          width = "75%",
        },
        border = {
          style = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" }, 
          --rounded is the only default option from what I could find
          --this should make it sharp

        },
        win_options = {
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
          signcolumn = "no", -- Disable sign" column to avoid visual clutter
        },
      },
    })
  end,
}
